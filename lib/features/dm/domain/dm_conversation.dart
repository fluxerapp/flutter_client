import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/utils/group_dm_display_name.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';

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
  final String? ownerId;
  final int recipientCount;
  final String lastMessage;
  final String? lastMessageId;
  final int lastMessageType;
  final bool lastMessageHasAttachments;
  final String? lastMessageAuthorId;
  final String? lastMessageAuthorName;
  final String? lastMessageMentionedUserId;
  final String? lastMessageMentionedUserName;
  final DateTime lastMessageTime;
  final int unreadCount;
  final bool isBot;
  final bool isSystem;
  final String? groupStatus;
  final List<GroupMemberInfo> groupMembers;

  /// Per-user nickname overrides for this group DM (from channel.nicks).
  final Map<String, String> channelNicks;

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
    this.lastMessageId,
    this.lastMessageType = 0,
    this.lastMessageHasAttachments = false,
    this.recipientUsername,
    this.recipientDiscriminator,
    this.lastMessageAuthorId,
    this.lastMessageAuthorName,
    this.lastMessageMentionedUserId,
    this.lastMessageMentionedUserName,
    this.name,
    this.icon,
    this.ownerId,
    this.recipientAvatar,
    this.recipientStatus = 'offline',
    this.recipientCount = 2,
    this.unreadCount = 0,
    this.isBot = false,
    this.isSystem = false,
    this.groupStatus,
    this.groupMembers = const [],
    this.channelNicks = const {},
    this.remoteRecipientIds = const [],
  });

  bool get isGroup => isDmGroupType(type);

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

  String displayNameWith(
    String? friendNickname, {
    FluxerLocalizations? l10n,
    String? currentUserId,
    String? currentUserDisplayName,
  }) {
    if (isPersonalNotes) {
      return displayName;
    }
    if (isGroup) {
      if (l10n != null) {
        return resolveGroupDmDisplayName(
          dm: this,
          l10n: l10n,
          currentUserId: currentUserId,
          currentUserDisplayName: currentUserDisplayName,
        );
      }
      return displayName;
    }
    return resolveDisplayName(
      friendNickname: friendNickname,
      username: displayName,
    );
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

  String get lastMessageInlineContent =>
      lastMessage.replaceAll('\n', ' ').trim();

  factory DmConversation.fromRow(
    db.DmChannel row,
    db.User? recipient, {
    db.Message? cachedLastMessage,
    db.User? lastMessageAuthor,
    db.User? lastMessageMentionedUser,
    String? groupStatus,
    List<GroupMemberInfo> groupMembers = const [],
    Map<String, String> channelNicks = const {},
    List<String> remoteRecipientIds = const [],
    int? unreadCount,
    String productName = InstanceConstants.defaultProductName,
  }) {
    final String rawRecipientName =
        recipient?.globalName ?? recipient?.username ?? 'Unknown';
    return DmConversation(
      id: row.id,
      type: row.type,
      recipientId: row.recipientId,
      recipientName: resolveSystemBotDisplayName(
        userId: row.recipientId,
        fallbackName: rawRecipientName,
        productName: productName,
      ),
      recipientUsername: recipient?.username,
      recipientDiscriminator: recipient?.discriminator,
      recipientAvatar: recipient?.avatar,
      recipientStatus: recipient?.status ?? 'offline',
      name: row.name,
      icon: row.icon,
      ownerId: row.ownerId,
      recipientCount: row.recipientCount,
      isBot: recipient?.bot ?? false,
      isSystem: recipient?.system ?? false,
      lastMessage: cachedLastMessage?.content ?? '',
      lastMessageId: cachedLastMessage?.id ?? row.lastMessageId,
      lastMessageType: cachedLastMessage?.type ?? 0,
      lastMessageHasAttachments: _hasAttachments(cachedLastMessage),
      lastMessageAuthorId: cachedLastMessage?.authorId,
      lastMessageAuthorName: lastMessageAuthor == null
          ? null
          : resolveSystemBotDisplayName(
              userId: lastMessageAuthor.id,
              fallbackName:
                  lastMessageAuthor.globalName ?? lastMessageAuthor.username,
              productName: productName,
            ),
      lastMessageMentionedUserId: _firstMentionedUserId(cachedLastMessage),
      lastMessageMentionedUserName:
          lastMessageMentionedUser?.globalName ??
          lastMessageMentionedUser?.username,
      lastMessageTime: row.lastMessageTime,
      unreadCount: unreadCount ?? row.unreadCount,
      groupStatus: groupStatus,
      groupMembers: groupMembers,
      channelNicks: channelNicks,
      remoteRecipientIds: remoteRecipientIds,
    );
  }

  static String? mentionedUserIdFromMessage(db.Message message) {
    return _firstMentionedUserId(message);
  }

  static bool _hasAttachments(db.Message? message) {
    if (message == null) {
      return false;
    }
    final String json = message.attachmentsJson;
    if (json.isEmpty || json == '[]') {
      return false;
    }
    try {
      final List<dynamic> list = jsonDecode(json) as List<dynamic>;
      return list.isNotEmpty;
    } on Object {
      return false;
    }
  }

  static String? _firstMentionedUserId(db.Message? message) {
    if (message == null) {
      return null;
    }
    final String json = message.mentionedUserIdsJson;
    if (json.isEmpty || json == '[]') {
      return null;
    }
    try {
      final List<dynamic> list = jsonDecode(json) as List<dynamic>;
      if (list.isEmpty) {
        return null;
      }
      final String id = list.first.toString();
      return id.isEmpty ? null : id;
    } on Object {
      return null;
    }
  }
}
