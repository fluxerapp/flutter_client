import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_app/core/push/push_tray_registry.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/data/read_state_decisions.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_dart/export.dart';

const int readStateFlagIsThread = 1 << 1;
const Duration threadReadStateRetention = Duration(days: 30);

bool isThreadReadState(int? flags) =>
    flags != null && (flags & readStateFlagIsThread) != 0;

class ReadStateRepository {
  const ReadStateRepository(
    this._client,
    this._db, {
    this._batcher,
    this._trayRegistry,
  });

  final FluxerClient _client;
  final FluxerDatabase _db;
  final AckBatcher? _batcher;
  final PushTrayRegistry? _trayRegistry;

  Future<void> ackLatest(String channelId) async {
    final prior = await _db.readStateDao.getReadState(channelId);
    final hadMentions = (prior?.mentionCount ?? 0) > 0;
    final messageId = await applyLocalAckLatest(channelId);
    if (messageId == null) {
      return;
    }
    final batcher = _batcher;
    if (batcher != null) {
      batcher.queue(
        channelId: channelId,
        messageId: messageId,
        immediate: false,
        hadMentions: hadMentions,
      );
      return;
    }
    await sendAckHttp(channelId, messageId);
  }

  Future<void> clearSticky(String channelId) =>
      _db.readStateDao.clearStickyUnread(channelId);

  Future<void> applyAckResponse(ReadStateAckResponse response) async {
    for (final rs in response.readStates) {
      final String? messageId = rs.lastMessageId;
      if (messageId == null) {
        continue;
      }
      final current = await _db.readStateDao.getReadState(rs.id);
      final ReadStateServerAckDecision decision =
          resolveReadStateServerAckDecision(
            ReadStateServerAckInput(
              messageId: messageId,
              ackMessageId: current?.lastMessageId,
              serverVersion: current?.version,
              version: rs.version,
              manual: false,
              hasMentionCount: true,
            ),
          );
      if (decision.kind == ReadStateServerAckKind.ignoreStaleVersion ||
          decision.kind == ReadStateServerAckKind.ignoreOlderMessage) {
        continue;
      }
      await _db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: Value(rs.id),
          lastMessageId: Value(messageId),
          mentionCount: Value(rs.mentionCount),
          version: Value(rs.version),
          flags: rs.flags == null ? const Value.absent() : Value(rs.flags),
        ),
      );
      final dm = await _db.dmChannelDao.getDmChannelById(rs.id);
      if (dm != null) {
        await _db.dmChannelDao.updateUnreadCount(rs.id, rs.mentionCount);
      }
    }
  }

  Future<String?> applyLocalAckLatest(String channelId) async {
    final messageId = await latestAckableMessageId(channelId);
    if (messageId == null || messageId.isEmpty) {
      return null;
    }

    final current = await _db.readStateDao.getReadState(channelId);
    if (current?.lastMessageId == messageId &&
        current?.mentionCount == 0 &&
        current?.manual != true) {
      _syncPushTray(channelId, messageId, manual: current?.manual);
      return null;
    }

    await applyLocalAck(
      channelId: channelId,
      messageId: messageId,
      mentionCount: 0,
    );
    _syncPushTray(channelId, messageId);
    return messageId;
  }

  Future<String?> applyLocalAckUpTo(String channelId, String messageId) async {
    final current = await _db.readStateDao.getReadState(channelId);
    final String? currentAck = current?.lastMessageId;
    final int? comparison = currentAck == null
        ? null
        : compareSnowflakeIds(currentAck, messageId);
    if (comparison != null &&
        comparison >= 0 &&
        current?.mentionCount == 0 &&
        current?.manual != true) {
      _syncPushTray(channelId, currentAck, manual: current?.manual);
      return null;
    }
    final String ackId = comparison != null && comparison > 0
        ? currentAck!
        : messageId;
    await applyLocalAck(
      channelId: channelId,
      messageId: ackId,
      mentionCount: 0,
    );
    _syncPushTray(channelId, ackId, manual: current?.manual);
    return ackId;
  }

  Future<void> sendAckHttp(String channelId, String messageId) =>
      _client.channels.acknowledgeMessage(
        channelId: channelId,
        messageId: messageId,
        body: const MessageAckRequest(),
      );

  Future<void> ackLatestBulk(Iterable<String> channelIds) async {
    final entries = <ReadStateAckBulkRequestReadStates>[];
    for (final channelId in channelIds.toSet()) {
      final messageId = await latestAckableMessageId(channelId);
      if (messageId == null || messageId.isEmpty) {
        continue;
      }

      final current = await _db.readStateDao.getReadState(channelId);
      if (current?.lastMessageId == messageId &&
          current?.mentionCount == 0 &&
          current?.manual != true) {
        _syncPushTray(channelId, messageId, manual: current?.manual);
        continue;
      }

      entries.add(
        ReadStateAckBulkRequestReadStates(
          channelId: channelId,
          messageId: messageId,
        ),
      );
    }

    if (entries.isEmpty) {
      return;
    }

    for (final entry in entries) {
      await applyLocalAck(
        channelId: entry.channelId,
        messageId: entry.messageId,
        mentionCount: 0,
      );
      _syncPushTray(entry.channelId, entry.messageId);
    }

    await _client.readStates.ackBulkMessages(
      body: ReadStateAckBulkRequest(readStates: entries),
    );
  }

  Future<void> applyLocalAck({
    required String channelId,
    required String messageId,
    required int mentionCount,
    bool manual = false,
    String? stickyUnreadMessageId,
  }) async {
    await _db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value(messageId),
        mentionCount: Value(mentionCount),
        manual: Value(manual),
        stickyUnreadMessageId: Value(stickyUnreadMessageId),
      ),
    );
    final dm = await _db.dmChannelDao.getDmChannelById(channelId);
    if (dm != null) {
      await _db.dmChannelDao.updateUnreadCount(channelId, mentionCount);
    }
  }

  Future<void> markMessageUnread({
    required String channelId,
    required String messageId,
    required String? currentUserId,
  }) async {
    final ackMessageId = await _previousMessageId(channelId, messageId);
    if (ackMessageId == null || ackMessageId.isEmpty) {
      return;
    }

    final mentionCount = await _computeMentionCountAfterAck(
      channelId: channelId,
      ackMessageId: ackMessageId,
      currentUserId: currentUserId,
    );

    await applyLocalAck(
      channelId: channelId,
      messageId: ackMessageId,
      mentionCount: mentionCount,
      manual: true,
      stickyUnreadMessageId: messageId,
    );
    await _client.channels.acknowledgeMessage(
      channelId: channelId,
      messageId: ackMessageId,
      body: MessageAckRequest(mentionCount: mentionCount, manual: true),
    );
  }

  Future<void> cleanupStaleReadStates({DateTime? now}) async {
    final readStates = await _db.readStateDao.getReadStates();
    if (readStates.isEmpty) {
      return;
    }
    final knownChannelIds = <String>{
      for (final channel in await _db.channelDao.getAllChannels(
        includeThreads: true,
      ))
        channel.id,
      for (final dm in await _db.dmChannelDao.getDmChannels()) dm.id,
    };
    final DateTime clock = now ?? DateTime.now();
    final staleChannelIds = <String>[];
    final missingThreadIds = <String>[];
    final expiredThreadIds = <String>[];
    final foundThreadIds = <String>[];
    for (final readState in readStates) {
      final bool known = knownChannelIds.contains(readState.channelId);
      if (!isThreadReadState(readState.flags)) {
        if (!known) {
          staleChannelIds.add(readState.channelId);
        }
        continue;
      }
      final DateTime? missingSince = readState.missingSince;
      if (known) {
        if (missingSince != null) {
          foundThreadIds.add(readState.channelId);
        }
      } else if (missingSince == null) {
        missingThreadIds.add(readState.channelId);
      } else if (clock.difference(missingSince) >= threadReadStateRetention) {
        expiredThreadIds.add(readState.channelId);
      }
    }
    if (missingThreadIds.isNotEmpty ||
        expiredThreadIds.isNotEmpty ||
        foundThreadIds.isNotEmpty) {
      await _db.transaction(() async {
        await _db.readStateDao.setMissingSince(missingThreadIds, clock);
        await _db.readStateDao.setMissingSince(foundThreadIds, null);
        await _db.readStateDao.deleteReadStatesForChannels(expiredThreadIds);
      });
    }
    if (staleChannelIds.isEmpty) {
      return;
    }

    await _db.transaction(() async {
      for (final channelId in staleChannelIds) {
        await _db.readStateDao.deleteReadState(channelId);
      }
    });
  }

  Future<void> ackPins(String channelId) async {
    final channel = await _db.channelDao.getChannelById(channelId);
    final latestPinTimestamp = channel?.lastPinTimestamp;
    if (latestPinTimestamp == null || latestPinTimestamp.isEmpty) {
      return;
    }

    final current = await _db.readStateDao.getReadState(channelId);
    if (current?.lastPinTimestamp == latestPinTimestamp) {
      return;
    }

    await _client.channels.acknowledgePins(channelId: channelId);
    await _db.readStateDao.updatePinTimestamp(channelId, latestPinTimestamp);
  }

  Future<String?> latestAckableMessageId(String channelId) async {
    final channel = await _db.channelDao.getChannelById(channelId);
    final String? channelLastMessageId =
        channel?.lastMessageId ??
        (await _db.dmChannelDao.getDmChannelById(channelId))?.lastMessageId;
    final String? cachedLastMessageId = (await _db.messageDao.getLastMessage(
      channelId,
    ))?.id;
    final readState = await _db.readStateDao.getReadState(channelId);
    String? latest;
    for (final String? candidate in <String?>[
      channelLastMessageId,
      cachedLastMessageId,
      readState?.lastMessageId,
    ]) {
      if (candidate == null || candidate.isEmpty) {
        continue;
      }
      if (latest == null || compareSnowflakeIds(candidate, latest) > 0) {
        latest = candidate;
      }
    }
    if (latest == null && (readState?.mentionCount ?? 0) > 0) {
      return channelId;
    }
    return latest;
  }

  Future<String?> _previousMessageId(String channelId, String messageId) async {
    final previous = await _db.messageDao.getPreviousMessage(
      channelId,
      messageId,
    );
    if (previous != null) {
      return previous.id;
    }
    final reference = await _db.messageDao.getMessage(messageId);
    if (reference != null) {
      return snowflakeAtPreviousMillisecond(messageId);
    }
    return null;
  }

  Future<void> recomputeMentionsAfterBackfill({
    required String channelId,
    required String? currentUserId,
    bool allowDecrease = false,
  }) async {
    final current = await _db.readStateDao.getReadState(channelId);
    if (current == null) {
      return;
    }
    final ackMessageId = current.lastMessageId;
    if (ackMessageId == null || ackMessageId.isEmpty) {
      return;
    }
    final recomputed = await _computeMentionCountAfterAck(
      channelId: channelId,
      ackMessageId: ackMessageId,
      currentUserId: currentUserId,
    );
    final next = allowDecrease
        ? recomputed
        : (recomputed > current.mentionCount
              ? recomputed
              : current.mentionCount);
    if (next == current.mentionCount) {
      return;
    }
    await _db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value(current.lastMessageId),
        mentionCount: Value(next),
        lastPinTimestamp: Value(current.lastPinTimestamp),
        manual: Value(current.manual),
        stickyUnreadMessageId: Value(current.stickyUnreadMessageId),
      ),
    );
  }

  Future<void> reconcileAfterMessageDelete({
    required String channelId,
    required List<String> deletedMessageIds,
  }) async {
    final channel = await _db.channelDao.getChannelById(channelId);
    final dm = channel == null
        ? await _db.dmChannelDao.getDmChannelById(channelId)
        : null;
    final deletedSet = deletedMessageIds.toSet();

    final bool wasChannelTail =
        channel?.lastMessageId != null &&
        deletedSet.contains(channel!.lastMessageId);
    final bool wasDmTail =
        dm?.lastMessageId != null && deletedSet.contains(dm!.lastMessageId);

    final readState = await _db.readStateDao.getReadState(channelId);
    final int mentionCount = readState?.mentionCount ?? 0;

    if (wasChannelTail || wasDmTail) {
      final String? ackMessageId = readState?.lastMessageId;
      final bool hasRemainingUnreadAfterAck = await _hasRemainingUnreadAfterAck(
        channelId: channelId,
        ackMessageId: ackMessageId,
        deletedSet: deletedSet,
      );
      if (wasDmTail || hasRemainingUnreadAfterAck || mentionCount == 0) {
        final Message? lastCachedAfterTailWalk = await _db.messageDao
            .getLastMessage(channelId);
        if (wasChannelTail) {
          await _db.channelDao.setLastMessageId(
            channelId,
            lastCachedAfterTailWalk?.id,
          );
        }
        if (wasDmTail) {
          await _db.dmChannelDao.setLastMessage(
            channelId: channelId,
            messageId: lastCachedAfterTailWalk?.id,
            message: lastCachedAfterTailWalk?.content,
            authorId: lastCachedAfterTailWalk?.authorId,
            timestamp: lastCachedAfterTailWalk?.timestamp,
          );
        }
        if (readState != null &&
            !readState.manual &&
            mentionCount == 0 &&
            !hasRemainingUnreadAfterAck) {
          final String? effectiveTail = lastCachedAfterTailWalk?.id;
          String? ackTarget;
          if (effectiveTail != null && effectiveTail.isNotEmpty) {
            if (ackMessageId == null ||
                ackMessageId.isEmpty ||
                compareSnowflakeIds(ackMessageId, effectiveTail) < 0) {
              ackTarget = effectiveTail;
            }
          } else {
            for (final deletedId in deletedMessageIds) {
              if (ackMessageId == null ||
                  ackMessageId.isEmpty ||
                  compareSnowflakeIds(ackMessageId, deletedId) < 0) {
                if (ackTarget == null ||
                    compareSnowflakeIds(deletedId, ackTarget) > 0) {
                  ackTarget = deletedId;
                }
              }
            }
          }
          if (ackTarget != null) {
            await applyLocalAck(
              channelId: channelId,
              messageId: ackTarget,
              mentionCount: 0,
            );
          }
        }
      }
    }

    if (dm != null) {
      final ackedReadState = await _db.readStateDao.getReadState(channelId);
      final updatedDm = await _db.dmChannelDao.getDmChannelById(channelId);
      final unreadCount = dmUnreadCountFromReadState(
        latestMessageId: updatedDm?.lastMessageId,
        ackLastMessageId: ackedReadState?.lastMessageId,
        fallbackAckMs: snowflakeTimestampMs(channelId),
        mentionCount: mentionCount,
        cachedUnreadCount: updatedDm?.unreadCount ?? 0,
      );
      await _db.dmChannelDao.updateUnreadCount(channelId, unreadCount);
    }
  }

  Future<bool> _hasRemainingUnreadAfterAck({
    required String channelId,
    required String? ackMessageId,
    required Set<String> deletedSet,
  }) async {
    final List<Message> candidates;
    if (ackMessageId == null || ackMessageId.isEmpty) {
      candidates = await _db.messageDao.getMessages(channelId, limit: 1);
    } else {
      candidates = await _db.messageDao.getMessagesAfter(
        channelId,
        ackMessageId,
        limit: 1,
      );
    }
    return candidates.any(
      (Message message) => !deletedSet.contains(message.id),
    );
  }

  Future<int> _computeMentionCountAfterAck({
    required String channelId,
    required String ackMessageId,
    required String? currentUserId,
  }) async {
    final isDm = await _db.dmChannelDao.getDmChannelById(channelId) != null;
    if (isDm && await _isDmMuted(channelId)) {
      return 0;
    }
    final blockedUserIds = await _db.relationshipDao.getBlockedUserIds();
    final messages = await _db.messageDao.getMessages(channelId, limit: 1000);
    var mentionCount = 0;
    for (final message in messages) {
      if (compareSnowflakeIds(message.id, ackMessageId) <= 0) {
        continue;
      }
      if (blockedUserIds.contains(message.authorId)) {
        continue;
      }
      if (isDm) {
        if (currentUserId == null || message.authorId != currentUserId) {
          mentionCount++;
        }
      } else if (message.isMentioned) {
        mentionCount++;
      }
    }
    return mentionCount;
  }

  void _syncPushTray(String channelId, String? upToMessageId, {bool? manual}) {
    if (upToMessageId == null || upToMessageId.isEmpty) {
      return;
    }
    if (manual ?? false) {
      return;
    }
    unawaited(
      PushNotificationClear.cancelForChannel(
        channelId,
        upToMessageId: upToMessageId,
      ),
    );
    _trayRegistry?.markChannelRead(channelId, upToMessageId);
  }

  Future<bool> _isDmMuted(String channelId) async {
    final settingsRow = await _db.userGuildSettingsDao.getByGuildId('@me');
    final settings = settingsRow == null
        ? null
        : decodeUserGuildSettings(settingsRow.data);
    return isChannelOverrideMuted(
      settings?.channelOverrides?[channelId],
      now: DateTime.now(),
    );
  }
}
