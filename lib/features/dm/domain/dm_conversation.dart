import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';

class GroupMemberInfo {
  final String id;
  final String? avatar;
  final String name;

  const GroupMemberInfo({required this.id, required this.name, this.avatar});
}

class DmConversation {
  final String id;
  final int type;
  final String recipientId;
  final String recipientName;
  final String? recipientUsername;
  final String? recipientDiscriminator;
  final String? recipientAvatar;
  final String recipientStatus;
  final String? name;
  final String? icon;
  final int recipientCount;
  final String lastMessage;
  final String? lastMessageAuthorId;
  final String? lastMessageAuthorName;
  final DateTime lastMessageTime;
  final int unreadCount;
  final bool isBot;
  final bool isSystem;
  final String? groupStatus;
  final List<GroupMemberInfo> groupMembers;

  /// Recipients persisted for this DM/channel (excluding the current account at
  /// call time — filter with the current user ID before ringing).
  final List<String> remoteRecipientIds;

  const DmConversation({
    required this.id,
    required this.type,
    required this.recipientId,
    required this.recipientName,
    required this.lastMessage,
    required this.lastMessageTime,
    this.recipientUsername,
    this.recipientDiscriminator,
    this.lastMessageAuthorId,
    this.lastMessageAuthorName,
    this.name,
    this.icon,
    this.recipientAvatar,
    this.recipientStatus = 'offline',
    this.recipientCount = 2,
    this.unreadCount = 0,
    this.isBot = false,
    this.isSystem = false,
    this.groupStatus,
    this.groupMembers = const [],
    this.remoteRecipientIds = const [],
  });

  bool get isGroup => type == 3;

  bool get isPersonalNotes => isDmPersonalNotesType(type);

  String get displayName {
    if (isPersonalNotes) {
      return 'Personal Notes';
    }
    if (isGroup) {
      return name ?? 'Group DM';
    }
    return recipientName;
  }

  String? get recipientTag {
    if (recipientUsername == null || recipientUsername!.isEmpty) {
      return null;
    }
    if (recipientDiscriminator == null || recipientDiscriminator!.isEmpty) {
      return recipientUsername;
    }
    return '$recipientUsername#$recipientDiscriminator';
  }

  int get memberCount => recipientCount;

  factory DmConversation.fromRow(
    db.DmChannel row,
    db.User? recipient, {
    db.Message? cachedLastMessage,
    db.User? lastMessageAuthor,
    String? groupStatus,
    List<GroupMemberInfo> groupMembers = const [],
    List<String> remoteRecipientIds = const [],
    int? unreadCount,
  }) {
    return DmConversation(
      id: row.id,
      type: row.type,
      recipientId: row.recipientId,
      recipientName: recipient?.globalName ?? recipient?.username ?? 'Unknown',
      recipientUsername: recipient?.username,
      recipientDiscriminator: recipient?.discriminator,
      recipientAvatar: recipient?.avatar,
      recipientStatus: recipient?.status ?? 'offline',
      name: row.name,
      icon: row.icon,
      recipientCount: row.recipientCount,
      isBot: recipient?.bot ?? false,
      isSystem: recipient?.system ?? false,
      lastMessage: cachedLastMessage?.content ?? '',
      lastMessageAuthorId: cachedLastMessage?.authorId,
      lastMessageAuthorName:
          lastMessageAuthor?.globalName ?? lastMessageAuthor?.username,
      lastMessageTime: row.lastMessageTime,
      unreadCount: unreadCount ?? row.unreadCount,
      groupStatus: groupStatus,
      groupMembers: groupMembers,
      remoteRecipientIds: remoteRecipientIds,
    );
  }
}
