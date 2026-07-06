import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

const String fluxerBotUserId = '0';

bool messageAuthorShowsUserTag({
  required bool authorIsBot,
  required bool authorIsSystem,
}) => authorIsBot || authorIsSystem;

bool messageAuthorUserTagIsSystem({required bool authorIsSystem}) =>
    authorIsSystem;

bool isSystemDmConversation(DmConversation dm) =>
    !dm.isGroup && dm.recipientId == fluxerBotUserId;

bool isBotOrSystemDmRecipient(DmConversation dm) =>
    !dm.isGroup && (dm.isBot || dm.isSystem);

bool canStartDmCall(DmConversation dm) =>
    !dm.isPersonalNotes && (dm.isGroup || !isBotOrSystemDmRecipient(dm));

bool canCallUser({required bool isBot, required bool isSystem}) =>
    !isBot && !isSystem;

bool shouldShowDmRecipientPresence(DmConversation dm) => !dm.isSystem;

bool isDmChannelType(int type) => type == ChannelType.dm.wireValue;

bool isDmGroupType(int type) => type == ChannelType.groupDm.wireValue;

bool isDmPersonalNotesType(int type) =>
    type == ChannelType.dmPersonalNotes.wireValue;

bool isPersonalNotesChannelRoute({
  required String channelId,
  required String? currentUserId,
}) => currentUserId != null && channelId == currentUserId;

bool isPersonalNotesChannel({
  required int? type,
  required String channelId,
  required String? currentUserId,
}) {
  if (type != null && isDmPersonalNotesType(type)) {
    return true;
  }
  return isPersonalNotesChannelRoute(
    channelId: channelId,
    currentUserId: currentUserId,
  );
}

db.DmChannelsCompanion buildPersonalNotesDmCompanion({
  required String userId,
  String? lastMessageId,
  int unreadCount = 0,
  String? name,
  String? icon,
}) {
  return db.DmChannelsCompanion.insert(
    id: userId,
    recipientId: userId,
    type: Value(ChannelType.dmPersonalNotes.wireValue),
    name: Value(name),
    icon: Value(icon),
    recipientCount: const Value(1),
    recipientIds: Value(jsonEncode(<String>[userId])),
    lastMessageId: Value(lastMessageId),
    lastMessageTime: Value(
      lastMessageId != null
          ? dateTimeFromSnowflakeAsLocalOrNow(lastMessageId)
          : dateTimeFromSnowflakeAsLocalOrNow(userId),
    ),
    unreadCount: Value(unreadCount),
  );
}

db.DmChannelsCompanion? dmChannelCompanionFromChannelResponse(
  ChannelResponse channel, {
  int unreadCount = 0,
}) {
  if (isDmPersonalNotesType(channel.type)) {
    return buildPersonalNotesDmCompanion(
      userId: channel.id,
      lastMessageId: channel.lastMessageId,
      unreadCount: unreadCount,
      name: channel.name,
      icon: channel.icon,
    );
  }
  if (!isDmChannelType(channel.type) && !isDmGroupType(channel.type)) {
    return null;
  }
  final recipients = channel.recipients;
  if (recipients == null || recipients.isEmpty) {
    return null;
  }
  return db.DmChannelsCompanion.insert(
    id: channel.id,
    recipientId: recipients.first.id,
    type: Value(channel.type),
    name: Value(channel.name),
    icon: Value(channel.icon),
    recipientCount: Value(recipients.length + 1),
    recipientIds: Value(jsonEncode(recipients.map((r) => r.id).toList())),
    nicksJson: Value(encodeDmChannelNicksJson(channel.nicks)),
    lastMessageId: Value(channel.lastMessageId),
    lastMessageTime: Value(
      channel.lastMessageId != null
          ? dateTimeFromSnowflakeAsLocalOrNow(channel.lastMessageId!)
          : dateTimeFromSnowflakeAsLocalOrNow(channel.id),
    ),
    unreadCount: Value(unreadCount),
  );
}

String encodeDmChannelNicksJson(Map<String, String>? nicks) {
  if (nicks == null || nicks.isEmpty) {
    return '{}';
  }
  return jsonEncode(nicks);
}

Map<String, String> parseDmChannelNicksJson(String json) {
  if (json.isEmpty || json == '{}') {
    return const <String, String>{};
  }
  try {
    final Map<String, dynamic> raw = jsonDecode(json) as Map<String, dynamic>;
    return <String, String>{
      for (final MapEntry<String, dynamic> entry in raw.entries)
        if (entry.value != null) entry.key: entry.value.toString(),
    };
  } on Object {
    return const <String, String>{};
  }
}

List<UserPartialResponse> dmRecipientUsersFromChannelResponse(
  ChannelResponse channel,
) {
  if (isDmPersonalNotesType(channel.type)) {
    return const [];
  }
  return channel.recipients ?? const [];
}

bool shouldExcludeFromDmConversationList({
  required int type,
  required String channelId,
  String? currentUserId,
}) =>
    isDmPersonalNotesType(type) ||
    isPersonalNotesChannelRoute(
      channelId: channelId,
      currentUserId: currentUserId,
    );
