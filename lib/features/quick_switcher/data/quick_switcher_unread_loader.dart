import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_permission_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_unread_utils.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';
import 'package:fluxer_dart/export.dart';

const int _categoryType = 4;

Future<List<QuickSwitcherUnreadChannel>> loadQuickSwitcherUnreadChannels({
  required FluxerDatabase db,
  required String? currentUserId,
  required List<DmConversation> conversations,
}) async {
  final Map<String, DmConversation> conversationsById = <String, DmConversation>{
    for (final DmConversation convo in conversations) convo.id: convo,
  };
  final List<Channel> guildChannelRows = await db.channelDao.getAllChannels();
  final Map<String, Channel> guildChannelsById = <String, Channel>{
    for (final Channel row in guildChannelRows) row.id: row,
  };
  final List<ReadState> readStates = await db.readStateDao.getReadStates();
  final Map<String, ReadState> readStateByChannelId = <String, ReadState>{
    for (final ReadState state in readStates) state.channelId: state,
  };
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
  final DateTime now = DateTime.now();
  final List<QuickSwitcherUnreadChannel> unread = <QuickSwitcherUnreadChannel>[];
  // Walk read states, not the conversation list. DMs live in dm_channel, not
  // channelDao, so we resolve guild rows first and fall back to conversations.
  for (final ReadState readState in readStates) {
    final String channelId = readState.channelId;
    final Channel? guildRow = guildChannelsById[channelId];
    if (guildRow != null) {
      final QuickSwitcherUnreadChannel? guildUnread =
          await _guildUnreadFromReadState(
            db: db,
            row: guildRow,
            readState: readState,
            currentUserId: currentUserId,
            guildSettingsByGuild: guildSettingsByGuild,
            now: now,
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
    final QuickSwitcherUnreadChannel? dmUnread = await _dmUnreadFromConversation(
      db: db,
      convo: convo,
      readState: readState,
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
    final QuickSwitcherUnreadChannel? dmUnread = await _dmUnreadFromConversation(
      db: db,
      convo: convo,
      readState: readStateByChannelId[convo.id],
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
  required FluxerDatabase db,
  required Channel row,
  required ReadState readState,
  required String? currentUserId,
  required Map<String, UserGuildSettingsResponse> guildSettingsByGuild,
  required DateTime now,
}) async {
  if (row.type == _categoryType) {
    return null;
  }
  if (!await canReadChannelForUnread(
    database: db,
    channel: row,
    currentUserId: currentUserId,
  )) {
    return null;
  }
  final ResolvedUnreadSettings unreadSettings = resolveUnreadSettings(
    channel: row,
    guildSettings: guildSettingsByGuild[row.guildId],
    now: now,
  );
  if (unreadSettings.isMuted) {
    return null;
  }
  final int rawMentions = readState.mentionCount;
  final int mentionCount = unreadSettings.allowsMentionUnread
      ? rawMentions
      : 0;
  if (!unreadSettings.allowsGuildMessageUnread && mentionCount == 0) {
    return null;
  }
  final int fallbackAckMs = await guildChannelFallbackAckMs(
    database: db,
    channel: row,
    currentUserId: currentUserId,
  );
  if (shouldSuppressStaleUnread(
    channelLastMessageId: row.lastMessageId,
    ackLastMessageId: readState.lastMessageId,
    fallbackAckMs: fallbackAckMs,
    mentionCount: mentionCount,
    now: now,
  )) {
    return null;
  }
  final bool hasUnread = isQuickSwitcherChannelUnread(
    channelLastMessageId: row.lastMessageId,
    ackLastMessageId: readState.lastMessageId,
    mentionCount: mentionCount,
    fallbackAckMs: fallbackAckMs,
  );
  if (!hasUnread) {
    return null;
  }
  return QuickSwitcherUnreadChannel(
    channelId: row.id,
    guildId: row.guildId,
    mentionCount: mentionCount,
    lastMessageId: row.lastMessageId,
    hasUnread: true,
  );
}

Future<QuickSwitcherUnreadChannel?> _dmUnreadFromConversation({
  required FluxerDatabase db,
  required DmConversation convo,
  required ReadState? readState,
}) async {
  final String? latestMessageId = await _latestDmMessageId(db, convo.id);
  final int mentionCount = readState?.mentionCount ?? convo.unreadCount;
  final bool hasUnread =
      mentionCount > 0 ||
      convo.unreadCount > 0 ||
      isQuickSwitcherChannelUnread(
        channelLastMessageId: latestMessageId,
        ackLastMessageId: readState?.lastMessageId,
        mentionCount: 0,
        fallbackAckMs: snowflakeTimestampMs(convo.id),
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

Future<String?> _latestDmMessageId(
  FluxerDatabase db,
  String channelId,
) async {
  final row = await db.dmChannelDao.getDmChannelById(channelId);
  if (row?.lastMessageId != null && row!.lastMessageId!.isNotEmpty) {
    return row.lastMessageId;
  }
  final message = await db.messageDao.getLastMessage(channelId);
  return message?.id;
}
