import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

const int dmPersonalNotesChannelType = 999;

bool isDmPersonalNotesType(int type) => type == dmPersonalNotesChannelType;

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
    type: const Value(dmPersonalNotesChannelType),
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
  if (channel.type != 1 && channel.type != 3) {
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
    lastMessageId: Value(channel.lastMessageId),
    lastMessageTime: Value(
      channel.lastMessageId != null
          ? dateTimeFromSnowflakeAsLocalOrNow(channel.lastMessageId!)
          : dateTimeFromSnowflakeAsLocalOrNow(channel.id),
    ),
    unreadCount: Value(unreadCount),
  );
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
