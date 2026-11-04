import 'package:drift/drift.dart' show Value;
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/channels/data/own_guild_unread_permissions.dart';
import 'package:fluxer_app/features/channels/data/read_state_effective.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isGuildTextBasedChannel;
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/guilds/utils/guild_notification_resolution.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_unread_utils.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

Future<List<QuickSwitcherUnreadChannel>> loadQuickSwitcherUnreadChannels({
  required FluxerDatabase db,
  required ReadStateWriteBatcher readStateWriteBatcher,
  required String? currentUserId,
  required List<DmConversation> conversations,
  bool unreadBadgeCustomizationEnabled = false,
}) async {
  final Map<String, DmConversation> conversationsById =
      <String, DmConversation>{
        for (final DmConversation convo in conversations) convo.id: convo,
      };
  final List<Channel> guildChannelRows = await db.channelDao.getAllChannels();
  final Map<String, Channel> guildChannelsById = <String, Channel>{
    for (final Channel row in guildChannelRows) row.id: row,
  };
  final Map<String, ReadState> readStateByChannelId = <String, ReadState>{
    for (final ReadState state in await db.readStateDao.getReadStates())
      state.channelId: state,
  };
  for (final String channelId in readStateWriteBatcher.overlayChannelIds()) {
    final ReadState? row = readStateByChannelId[channelId];
    final ReadStateEffectiveFields effective = readStateWriteBatcher
        .effectiveFields(channelId, row);
    readStateByChannelId[channelId] =
        (row ?? ReadState(channelId: channelId, mentionCount: 0, manual: false))
            .copyWith(
              lastMessageId: Value(effective.lastMessageId),
              mentionCount: effective.mentionCount,
            );
  }
  final List<ReadState> readStates = readStateByChannelId.values.toList();
  final List<UserGuildSettingsTableData> guildSettingsRows = await db
      .userGuildSettingsDao
      .getAll();
  final Map<String, UserGuildSettingsResponse> guildSettingsByGuild =
      <String, UserGuildSettingsResponse>{};
  for (final UserGuildSettingsTableData row in guildSettingsRows) {
    final UserGuildSettingsResponse? settings = decodeUserGuildSettings(
      row.data,
    );
    if (settings != null) {
      guildSettingsByGuild[row.guildId] = settings;
    }
  }
  final List<Server> guildRows = await db.guildDao.getServers();
  final Map<String, GuildNotificationContext> guildNotificationContexts =
      <String, GuildNotificationContext>{
        for (final Server guild in guildRows)
          guild.id: GuildNotificationContext.fromServer(guild),
      };
  final OwnGuildUnreadPermissions permissions = OwnGuildUnreadPermissions(
    db: db,
    currentUserId: currentUserId,
    servers: guildRows,
    channelsById: guildChannelsById,
  );
  final List<Channel> readableGuildChannels = <Channel>[];
  for (final ReadState readState in readStates) {
    final Channel? guildRow = guildChannelsById[readState.channelId];
    if (guildRow != null &&
        isGuildTextBasedChannel(guildRow.type) &&
        await permissions.canRead(guildRow)) {
      readableGuildChannels.add(guildRow);
    }
  }
  final Map<String, ChannelLatestMessageResolution> latestByChannelId =
      await resolveLatestMessageIdsForChannelsBulk(db, readableGuildChannels);
  final Map<String, String?> latestDmMessageIds = await _latestDmMessageIds(
    db,
    conversations,
  );
  final DateTime now = DateTime.now();
  final List<QuickSwitcherUnreadChannel> unread =
      <QuickSwitcherUnreadChannel>[];
  for (final ReadState readState in readStates) {
    final String channelId = readState.channelId;
    final Channel? guildRow = guildChannelsById[channelId];
    if (guildRow != null) {
      final ChannelLatestMessageResolution? latest =
          latestByChannelId[channelId];
      if (latest == null) {
        continue;
      }
      final QuickSwitcherUnreadChannel? guildUnread =
          await _guildUnreadFromReadState(
            row: guildRow,
            readState: readState,
            latest: latest,
            permissions: permissions,
            guildSettingsByGuild: guildSettingsByGuild,
            guildNotificationContexts: guildNotificationContexts,
            now: now,
            unreadBadgeCustomizationEnabled: unreadBadgeCustomizationEnabled,
          );
      if (guildUnread != null) {
        unread.add(guildUnread);
      }
      continue;
    }
    final DmConversation? convo = conversationsById[channelId];
    if (convo == null || convo.isPersonalNotes) {
      continue;
    }
    final QuickSwitcherUnreadChannel? dmUnread = _dmUnreadFromConversation(
      convo: convo,
      readState: readState,
      latestMessageId: latestDmMessageIds[convo.id],
    );
    if (dmUnread != null) {
      unread.add(dmUnread);
    }
  }
  final Set<String> seenChannelIds = unread
      .map((QuickSwitcherUnreadChannel entry) => entry.channelId)
      .toSet();
  for (final DmConversation convo in conversations) {
    if (seenChannelIds.contains(convo.id) || convo.isPersonalNotes) {
      continue;
    }
    final QuickSwitcherUnreadChannel? dmUnread = _dmUnreadFromConversation(
      convo: convo,
      readState: readStateByChannelId[convo.id],
      latestMessageId: latestDmMessageIds[convo.id],
    );
    if (dmUnread == null) {
      continue;
    }
    unread.add(dmUnread);
    seenChannelIds.add(convo.id);
  }
  return unread;
}

Future<QuickSwitcherUnreadChannel?> _guildUnreadFromReadState({
  required Channel row,
  required ReadState readState,
  required ChannelLatestMessageResolution latest,
  required OwnGuildUnreadPermissions permissions,
  required Map<String, UserGuildSettingsResponse> guildSettingsByGuild,
  required Map<String, GuildNotificationContext> guildNotificationContexts,
  required DateTime now,
  bool unreadBadgeCustomizationEnabled = false,
}) async {
  final UserGuildSettingsResponse? guildSettings =
      guildSettingsByGuild[row.guildId];
  final ResolvedUnreadSettings unreadSettings = resolveChannelUnreadSettings(
    channel: row,
    guildSettings: guildSettings,
    now: now,
    unreadBadgeCustomizationEnabled: unreadBadgeCustomizationEnabled,
    guildContext: guildNotificationContexts[row.guildId],
  );
  final int rawMentions = readState.mentionCount;
  final int mentionCount = unreadSettings.allowsMentionUnread ? rawMentions : 0;
  final String? latestMessageId = resolveLatestMessageIdForUnread(
    strictLatestMessageId: latest.id,
    channelLastMessageId: row.lastMessageId,
    ackLastMessageId: readState.lastMessageId,
    mentionCount: rawMentions,
    channelLastMessageExistsInCache: latest.existsInCache,
  );
  final int fallbackAckMs =
      (await permissions.ownMember(
        row.guildId,
      ))?.joinedAt?.millisecondsSinceEpoch ??
      snowflakeTimestampMs(row.id);
  final bool hasUnreadMessage = isQuickSwitcherChannelUnread(
    channelLastMessageId: latestMessageId,
    ackLastMessageId: readState.lastMessageId,
    mentionCount: 0,
    fallbackAckMs: fallbackAckMs,
  );
  final bool hasMentions = mentionCount > 0;
  if (!shouldShowChannelInUnreadInbox(
    channel: row,
    guildSettings: guildSettings,
    hasUnread: hasUnreadMessage,
    hasMentions: hasMentions,
    now: now,
    guildContext: guildNotificationContexts[row.guildId],
  )) {
    return null;
  }
  return QuickSwitcherUnreadChannel(
    channelId: row.id,
    guildId: row.guildId,
    mentionCount: mentionCount,
    lastMessageId: latestMessageId,
  );
}

QuickSwitcherUnreadChannel? _dmUnreadFromConversation({
  required DmConversation convo,
  required ReadState? readState,
  required String? latestMessageId,
}) {
  final int mentionCount = readState?.mentionCount ?? convo.unreadCount;
  final bool hasUnread =
      mentionCount > 0 ||
      convo.unreadCount > 0 ||
      isQuickSwitcherChannelUnread(
        channelLastMessageId: latestMessageId,
        ackLastMessageId: readState?.lastMessageId,
        mentionCount: 0,
        fallbackAckMs: snowflakeTimestampMs(convo.id),
        isGuildChannel: false,
      );
  if (!hasUnread) {
    return null;
  }
  return QuickSwitcherUnreadChannel(
    channelId: convo.id,
    mentionCount: mentionCount,
    lastMessageTime: convo.lastMessageTime,
    lastMessageId: latestMessageId,
  );
}

Future<Map<String, String?>> _latestDmMessageIds(
  FluxerDatabase db,
  List<DmConversation> conversations,
) async {
  final Map<String, DmChannel> rowsById = <String, DmChannel>{
    for (final DmChannel row in await db.dmChannelDao.getDmChannels())
      row.id: row,
  };
  final Map<String, String?> out = <String, String?>{};
  final List<String> uncached = <String>[];
  for (final DmConversation convo in conversations) {
    if (convo.isPersonalNotes) {
      continue;
    }
    final String? pointer = rowsById[convo.id]?.lastMessageId;
    if (pointer != null && pointer.isNotEmpty) {
      out[convo.id] = pointer;
    } else {
      uncached.add(convo.id);
    }
  }
  out.addAll(await db.messageDao.getLastMessageIds(uncached));
  return out;
}
