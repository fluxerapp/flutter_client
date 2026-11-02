import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/channels/data/read_state_effective.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/data/unread_permission_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show
        isGuildCategoryChannelType,
        isGuildVoiceChannelType,
        isThreadChannelType,
        isThreadOnlyChannelType;
import 'package:fluxer_app/features/forum/domain/forum_channel.dart'
    show forumNewPostsUnreadEnabled;
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

const Duration _oldMessageThreshold = Duration(days: 7);
const Duration _recentVisitThreshold = Duration(days: 3);
int _snowflakeRecencyMs(String? id) => snowflakeTimestampMs(id);

int _contentTimestampMs(String? snowflakeId) {
  if (snowflakeId == null || snowflakeId.isEmpty) {
    return 0;
  }
  final DateTime? utc = dateTimeFromUserSnowflakeOrNull(snowflakeId);
  return utc?.millisecondsSinceEpoch ?? 0;
}

bool _hasGuildUnreadByWebRules({
  required String? channelLastMessageId,
  required String? ackLastMessageId,
  required int fallbackAckMs,
  required int mentionCount,
}) {
  if (mentionCount > 0) {
    return true;
  }
  final String lastSf = channelLastMessageId ?? '';
  final String ackSf = ackLastMessageId ?? '';
  if (lastSf.isNotEmpty && ackSf.isNotEmpty) {
    return compareSnowflakeIds(ackSf, lastSf) < 0;
  }
  final int contentMs = _contentTimestampMs(channelLastMessageId);
  final int ackMs = ackSf.isNotEmpty
      ? _contentTimestampMs(ackLastMessageId)
      : fallbackAckMs;
  if (contentMs == 0 || ackMs == 0) {
    return false;
  }
  return contentMs > ackMs;
}

class UnreadInboxCalculator {
  const UnreadInboxCalculator._();

  static Future<List<UnreadInboxEntry>> compute(
    FluxerDatabase db, {
    required Map<String, bool> collapsedByChannelId,
    String? currentUserId,
    bool unreadBadgeCustomizationEnabled = false,
    ReadStateWriteBatcher? readStateBatcher,
  }) async {
    final int nowMs = DateTime.now().millisecondsSinceEpoch;
    final List<UnreadInboxEntry> entries = <UnreadInboxEntry>[];

    final List<Channel> allChannels = await db.channelDao.getAllChannels(
      includeThreads: true,
    );
    final Map<String, Channel> channelsById = <String, Channel>{
      for (final Channel c in allChannels) c.id: c,
    };
    final Map<String, ThreadMember> joinedThreads = <String, ThreadMember>{
      for (final ThreadMember row in await db.threadDao.getJoinedMembers())
        row.threadId: row,
    };
    final List<ReadState> readStatesList = await db.readStateDao
        .watchReadStates()
        .first;
    final Map<String, ReadState> readStateMap = <String, ReadState>{
      for (final ReadState r in readStatesList) r.channelId: r,
    };
    final ReadStateWriteBatcher? batcher = readStateBatcher;
    if (batcher != null) {
      for (final String channelId in batcher.overlayChannelIds()) {
        final ReadState? row = readStateMap[channelId];
        final effective = batcher.effectiveFields(channelId, row);
        readStateMap[channelId] = ReadState(
          channelId: channelId,
          lastMessageId: effective.lastMessageId,
          mentionCount: effective.mentionCount,
          manual: row?.manual ?? false,
          stickyUnreadMessageId: row?.stickyUnreadMessageId,
          lastPinTimestamp: row?.lastPinTimestamp,
          version: row?.version,
          flags: row?.flags,
        );
      }
    }
    final List<UserGuildSettingsTableData> userGuildRows = await db
        .userGuildSettingsDao
        .getAll();

    final Map<String, int> joinTimeMsByGuildId = <String, int>{};
    Future<int> resolveFallbackAckMs(String guildId, String channelId) async {
      if (joinTimeMsByGuildId.containsKey(guildId)) {
        return joinTimeMsByGuildId[guildId]!;
      }
      int resolved = 0;
      if (currentUserId != null && currentUserId.isNotEmpty) {
        final Member? member = await db.memberDao.getMemberByUserId(
          currentUserId,
          guildId,
        );
        final DateTime? joinedAt = member?.joinedAt;
        if (joinedAt != null) {
          resolved = joinedAt.millisecondsSinceEpoch;
        }
      }
      if (resolved == 0) {
        final DateTime? chTime = dateTimeFromUserSnowflakeOrNull(channelId);
        resolved = chTime?.millisecondsSinceEpoch ?? 0;
      }
      joinTimeMsByGuildId[guildId] = resolved;
      return resolved;
    }

    final Map<String, UserGuildSettingsResponse> guildSettingsByGuild =
        <String, UserGuildSettingsResponse>{};

    for (final UserGuildSettingsTableData row in userGuildRows) {
      final settings = decodeUserGuildSettings(row.data);
      if (settings != null) {
        guildSettingsByGuild[row.guildId] = settings;
      }
    }

    for (final Channel channel in allChannels) {
      if (isGuildCategoryChannelType(channel.type)) {
        continue;
      }
      if (!await canReadChannelForUnread(
        database: db,
        channel: channel,
        currentUserId: currentUserId,
      )) {
        continue;
      }

      final String guildId = channel.guildId;
      final ReadState? readState = readStateMap[channel.id];
      final int mentions = readState?.mentionCount ?? 0;
      final bool isVoice = isGuildVoiceChannelType(channel.type);
      final bool isThread = isThreadChannelType(channel.type);
      final unreadSettings = resolveUnreadSettings(
        channel: channel,
        guildSettings: guildSettingsByGuild[guildId],
        now: DateTime.fromMillisecondsSinceEpoch(nowMs),
        unreadBadgeCustomizationEnabled: unreadBadgeCustomizationEnabled,
      );

      if (isVoice && mentions == 0) {
        continue;
      }

      final bool isMuted =
          unreadSettings.isMuted ||
          (isThread &&
              isThreadMuted(
                threadId: channel.id,
                parent: channelsById[channel.parentId],
                member: joinedThreads[channel.id],
                guildSettings: guildSettingsByGuild[guildId],
                now: DateTime.fromMillisecondsSinceEpoch(nowMs),
              ));
      if (isMuted && mentions == 0) {
        continue;
      }

      final String? channelLastMsg = channel.lastMessageId;
      final String? ackId = readState?.lastMessageId;
      final int lastMsgMsForStale = _contentTimestampMs(channelLastMsg);

      if (lastMsgMsForStale > 0 &&
          lastMsgMsForStale < nowMs - _oldMessageThreshold.inMilliseconds) {
        final int ackMsForStale = ackId != null && ackId.isNotEmpty
            ? _contentTimestampMs(ackId)
            : await resolveFallbackAckMs(guildId, channel.id);
        final bool recentlyVisited =
            ackMsForStale > nowMs - _recentVisitThreshold.inMilliseconds;
        if (!recentlyVisited && mentions == 0) {
          continue;
        }
      }

      final int tsLast = _snowflakeRecencyMs(channelLastMsg);
      final int fallbackAckMs = await resolveFallbackAckMs(guildId, channel.id);
      final bool unreadTracked =
          (!isThread || joinedThreads.containsKey(channel.id)) &&
          (!isThreadOnlyChannelType(channel.type) ||
              forumNewPostsUnreadEnabled(
                guildSettingsByGuild[guildId]
                    ?.channelOverrides?[channel.id]
                    ?.flags,
              ));
      final bool hasUnreadMessage =
          unreadTracked &&
          _hasGuildUnreadByWebRules(
            channelLastMessageId: channelLastMsg,
            ackLastMessageId: ackId,
            fallbackAckMs: fallbackAckMs,
            mentionCount: 0,
          );
      final UserNotificationSettings inboxVisibilityLevel =
          unreadBadgeCustomizationEnabled
          ? (resolveGuildUnreadBadgesLevel(
                  channel: channel,
                  guildSettings: guildSettingsByGuild[guildId],
                  unreadBadgeCustomizationEnabled: true,
                ) ??
                UserNotificationSettings.allMessages)
          : UserNotificationSettings.allMessages;
      final bool allowsMessageUnread =
          inboxVisibilityLevel == UserNotificationSettings.allMessages;
      final bool allowsMentionUnread =
          inboxVisibilityLevel != UserNotificationSettings.noMessages;
      final bool hasUnread =
          (allowsMentionUnread && mentions > 0) ||
          (allowsMessageUnread && !isMuted && hasUnreadMessage);

      if (!hasUnread) {
        continue;
      }

      final int recency = tsLast != 0 ? tsLast : _snowflakeRecencyMs(ackId);

      entries.add(
        UnreadInboxEntry(
          channelId: channel.id,
          guildId: guildId,
          isDm: false,
          mentionCount: mentions,
          isCollapsed: collapsedByChannelId[channel.id] ?? false,
          recencyComparator: recency,
          ackMessageId: ackId,
          lastMessageId: channelLastMsg,
          isThreadOnly: isThreadOnlyChannelType(channel.type),
        ),
      );
    }

    final List<DmChannel> dms = await db.dmChannelDao.getDmChannels();
    final dmLastMessages = await db.messageDao.getLastMessageForChannels(
      dms.map((dm) => dm.id).toList(),
    );
    final dmSettings = guildSettingsByGuild['@me'];
    for (final DmChannel dm in dms) {
      if (isChannelOverrideMuted(
        dmSettings?.channelOverrides?[dm.id],
        now: DateTime.fromMillisecondsSinceEpoch(nowMs),
      )) {
        continue;
      }
      final readState = readStateMap[dm.id];
      final String? dmLastMessageId =
          dm.lastMessageId ?? dmLastMessages[dm.id]?.id;
      final unreadCount = dmUnreadCountFromReadState(
        latestMessageId: dmLastMessageId,
        ackLastMessageId: readState?.lastMessageId,
        fallbackAckMs: snowflakeTimestampMs(dm.id),
        mentionCount: readState?.mentionCount ?? 0,
        cachedUnreadCount: dm.unreadCount,
      );
      if (unreadCount <= 0) {
        continue;
      }
      final int ms =
          dmLastMessages[dm.id]?.timestamp.millisecondsSinceEpoch ??
          dm.lastMessageTime.millisecondsSinceEpoch;
      entries.add(
        UnreadInboxEntry(
          channelId: dm.id,
          guildId: null,
          isDm: true,
          mentionCount: unreadCount,
          isCollapsed: collapsedByChannelId[dm.id] ?? false,
          recencyComparator: ms,
          ackMessageId: readState?.lastMessageId,
          lastMessageId: dmLastMessageId,
        ),
      );
    }

    entries.sort((UnreadInboxEntry a, UnreadInboxEntry b) {
      final int byRecency = b.recencyComparator.compareTo(a.recencyComparator);
      if (byRecency != 0) {
        return byRecency;
      }
      return compareSnowflakeIds(b.channelId, a.channelId);
    });

    return entries;
  }
}

List<UnreadInboxEntry>? inboxEntriesWithAckCursor(
  List<UnreadInboxEntry> entries,
  ReadStateWriteBatcher batcher,
) {
  final Set<String> overlayIds = batcher.overlayChannelIds();
  if (overlayIds.isEmpty) {
    return entries;
  }
  final Map<String, UnreadInboxEntry> byId = <String, UnreadInboxEntry>{
    for (final UnreadInboxEntry entry in entries) entry.channelId: entry,
  };
  final Map<String, ReadStateEffectiveFields> effectiveById =
      <String, ReadStateEffectiveFields>{};
  for (final String channelId in overlayIds) {
    final UnreadInboxEntry? entry = byId[channelId];
    final ReadState? stored = batcher.persistedReadState(channelId);
    final int baselineMentions =
        stored?.mentionCount ??
        (entry == null || entry.isDm ? 0 : entry.mentionCount);
    final ReadStateEffectiveFields effective = batcher.effectiveFields(
      channelId,
      stored ??
          (entry == null
              ? null
              : ReadState(
                  channelId: channelId,
                  lastMessageId: entry.ackMessageId,
                  mentionCount: entry.isDm ? 0 : entry.mentionCount,
                  manual: false,
                )),
    );
    if (effective.mentionCount > baselineMentions) {
      return null;
    }
    if (entry == null && effective.mentionCount > 0) {
      return null;
    }
    effectiveById[channelId] = effective;
  }
  var changed = false;
  final List<UnreadInboxEntry> next = <UnreadInboxEntry>[];
  for (final UnreadInboxEntry entry in entries) {
    final ReadStateEffectiveFields? effective = effectiveById[entry.channelId];
    if (effective == null) {
      next.add(entry);
      continue;
    }
    final int count = entry.isDm
        ? dmUnreadCountFromReadState(
            latestMessageId: entry.lastMessageId,
            ackLastMessageId: effective.lastMessageId,
            fallbackAckMs: snowflakeTimestampMs(entry.channelId),
            mentionCount: effective.mentionCount,
            cachedUnreadCount: 0,
          )
        : effective.mentionCount;
    final bool stillUnread = entry.isDm
        ? count > 0
        : count > 0 ||
              _hasGuildUnreadByWebRules(
                channelLastMessageId: entry.lastMessageId,
                ackLastMessageId: effective.lastMessageId,
                fallbackAckMs: snowflakeTimestampMs(entry.channelId),
                mentionCount: 0,
              );
    if (!stillUnread) {
      changed = true;
      continue;
    }
    if (count == entry.mentionCount &&
        effective.lastMessageId == entry.ackMessageId) {
      next.add(entry);
      continue;
    }
    changed = true;
    next.add(
      UnreadInboxEntry(
        channelId: entry.channelId,
        guildId: entry.guildId,
        isDm: entry.isDm,
        mentionCount: count,
        isCollapsed: entry.isCollapsed,
        recencyComparator: entry.recencyComparator,
        ackMessageId: effective.lastMessageId,
        lastMessageId: entry.lastMessageId,
        isThreadOnly: entry.isThreadOnly,
      ),
    );
  }
  return changed ? next : entries;
}
