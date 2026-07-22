import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_dart/export.dart';

class ReadStateRepository {
  const ReadStateRepository(this._client, this._db, {AckBatcher? batcher})
    : _batcher = batcher;

  final FluxerClient _client;
  final FluxerDatabase _db;
  final AckBatcher? _batcher;

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

  /// Applies the authoritative read states returned by `/read-states/ack`.
  /// Version-gated: skips a channel whose stored version is newer than the
  /// response's, keeping local ack / mention / version aligned with the server
  /// (mirrors the web's `ReadStates.applyAckResponse`).
  Future<void> applyAckResponse(ReadStateAckResponse response) async {
    for (final rs in response.readStates) {
      final current = await _db.readStateDao.getReadState(rs.id);
      if (current?.version != null &&
          rs.version != null &&
          compareReadStateVersions(rs.version, current!.version) < 0) {
        continue;
      }
      await _db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: Value(rs.id),
          lastMessageId: Value(rs.lastMessageId),
          mentionCount: Value(rs.mentionCount),
          version: Value(rs.version),
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
      return null;
    }

    await applyLocalAck(
      channelId: channelId,
      messageId: messageId,
      mentionCount: 0,
    );
    unawaited(PushNotificationClear.cancelForChannel(channelId));
    return messageId;
  }

  /// Acks up to [messageId] (the newest loaded/visible message). Never
  /// regresses an existing ack. Returns the acked id, or null when a no-op.
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
    unawaited(PushNotificationClear.cancelForChannel(channelId));
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
      unawaited(PushNotificationClear.cancelForChannel(entry.channelId));
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

  Future<void> cleanupStaleReadStates({
    int maxConcurrentHttp = 3,
    int maxConsecutiveFailures = 5,
  }) async {
    final readStates = await _db.readStateDao.getReadStates();
    final staleChannelIds = <String>[];
    for (final readState in readStates) {
      final channel = await _db.channelDao.getChannelById(readState.channelId);
      if (channel != null) {
        continue;
      }
      final dm = await _db.dmChannelDao.getDmChannelById(readState.channelId);
      if (dm == null) {
        staleChannelIds.add(readState.channelId);
      }
    }
    if (staleChannelIds.isEmpty) {
      return;
    }
    staleChannelIds.sort();

    await _db.transaction(() async {
      for (final channelId in staleChannelIds) {
        await _db.readStateDao.deleteReadState(channelId);
      }
    });

    var consecutiveFailures = 0;
    for (var i = 0; i < staleChannelIds.length; i += maxConcurrentHttp) {
      final end = (i + maxConcurrentHttp).clamp(0, staleChannelIds.length);
      final chunk = staleChannelIds.sublist(i, end);
      final results = await Future.wait(
        chunk.map((channelId) async {
          try {
            await _client.channels.clearChannelReadState(channelId: channelId);
            return true;
          } on Exception {
            return false;
          }
        }),
      );
      for (final ok in results) {
        if (ok) {
          consecutiveFailures = 0;
        } else {
          consecutiveFailures++;
          if (consecutiveFailures >= maxConsecutiveFailures) {
            return;
          }
        }
      }
    }
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
    final channelLastMessageId =
        channel?.lastMessageId ??
        (await _db.dmChannelDao.getDmChannelById(channelId))?.lastMessageId;
    final readState = await _db.readStateDao.getReadState(channelId);
    final resolved = await resolveLatestMessageIdForChannel(
      _db,
      channelId,
      channelLastMessageId: channelLastMessageId,
    );
    final latestForUnread = resolveLatestMessageIdForUnread(
      strictLatestMessageId: resolved.id,
      channelLastMessageId: channelLastMessageId,
      ackLastMessageId: readState?.lastMessageId,
      mentionCount: readState?.mentionCount ?? 0,
      channelLastMessageExistsInCache: resolved.existsInCache,
    );
    if (latestForUnread != null && latestForUnread.isNotEmpty) {
      return latestForUnread;
    }
    return readState?.lastMessageId;
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
    // A backfill loads a partial window and can undercount, so keep the larger
    // of stored and recomputed unless the caller is authoritative (a
    // relationship change that must also drop counts).
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

  /// Recomputes mention counts for every unread or mentioned channel after a
  /// relationship change, so blocking a user drops their mentions and
  /// unblocking restores them (mirrors the web's
  /// `ReadStates.handleRelationshipUpdate`). Authoritative (`allowDecrease:
  /// true`) so counts can fall as well as rise.
  Future<void> recomputeMentionsForUnreadOrMentionedChannels({
    required String? currentUserId,
  }) async {
    final readStates = await _db.readStateDao.getReadStates();
    for (final readState in readStates) {
      final bool unreadOrMentioned;
      if (readState.mentionCount > 0) {
        unreadOrMentioned = true;
      } else {
        final dm = await _db.dmChannelDao.getDmChannelById(readState.channelId);
        if (dm != null) {
          unreadOrMentioned = dm.unreadCount > 0;
        } else {
          final channel = await _db.channelDao.getChannelById(
            readState.channelId,
          );
          unreadOrMentioned =
              channel != null &&
              compareSnowflakeIds(
                    readState.lastMessageId,
                    channel.lastMessageId,
                  ) <
                  0;
        }
      }
      if (!unreadOrMentioned) {
        continue;
      }
      await recomputeMentionsAfterBackfill(
        channelId: readState.channelId,
        currentUserId: currentUserId,
        allowDecrease: true,
      );
    }
  }

  /// Reconciles read state after messages are deleted from a channel.
  /// Walks the channel/DM tail back when the deleted message was the tail,
  /// recomputes mention counts from remaining cached messages, and refreshes
  /// the DM unread counter.
  Future<void> reconcileAfterMessageDelete({
    required String channelId,
    required List<String> deletedMessageIds,
    required String? currentUserId,
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

    Message? lastCachedAfterTailWalk;
    if (wasChannelTail || wasDmTail) {
      lastCachedAfterTailWalk = await _db.messageDao.getLastMessage(channelId);
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
    }

    var readState = await _db.readStateDao.getReadState(channelId);
    if (readState != null &&
        !readState.manual &&
        (wasChannelTail || wasDmTail)) {
      final String? ackMessageId = readState.lastMessageId;
      final bool hasRemainingUnreadAfterAck = await _hasRemainingUnreadAfterAck(
        channelId: channelId,
        ackMessageId: ackMessageId,
        deletedSet: deletedSet,
      );
      if (!hasRemainingUnreadAfterAck) {
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
          readState = await _db.readStateDao.getReadState(channelId);
        }
      }
    }

    await recomputeMentionsAfterBackfill(
      channelId: channelId,
      currentUserId: currentUserId,
      allowDecrease: true,
    );

    if (dm != null) {
      readState = await _db.readStateDao.getReadState(channelId);
      final updatedDm = await _db.dmChannelDao.getDmChannelById(channelId);
      final unreadCount = dmUnreadCountFromReadState(
        latestMessageId: updatedDm?.lastMessageId,
        ackLastMessageId: readState?.lastMessageId,
        fallbackAckMs: snowflakeTimestampMs(channelId),
        mentionCount: readState?.mentionCount ?? 0,
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
