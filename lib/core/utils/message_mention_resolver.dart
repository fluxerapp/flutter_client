import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadChannelType;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_dart/export.dart';

/// Resolves whether a message mentions the current user, covering direct
/// mentions, `@everyone`, role mentions, per-guild suppression, and blocked
/// authors. Every message persist site uses this so `isMentioned` matches the
/// gateway live-create path.
class MessageMentionContext {
  const MessageMentionContext({
    required this.currentUserId,
    required this.blockedUserIds,
    required this.channelExists,
    required this.suppressEveryone,
    required this.suppressRoles,
    required this.currentUserRoleIds,
    this.threadNonMember = false,
  });

  final String? currentUserId;
  final Set<String> blockedUserIds;
  final bool channelExists;
  final bool suppressEveryone;
  final bool suppressRoles;
  final Set<String> currentUserRoleIds;
  final bool threadNonMember;
}

Future<bool> isThreadNonMember(FluxerDatabase db, Channel channel) async =>
    isThreadChannelType(channel.type) &&
    await db.threadDao.getMember(channel.id) == null;

MessageMentionContext unknownThreadMentionContext(MessageMentionContext ctx) =>
    MessageMentionContext(
      currentUserId: ctx.currentUserId,
      blockedUserIds: ctx.blockedUserIds,
      channelExists: true,
      suppressEveryone: true,
      suppressRoles: true,
      currentUserRoleIds: const <String>{},
      threadNonMember: true,
    );

/// Builds the per-channel context once so a caller can resolve many messages
/// without repeating database reads.
Future<MessageMentionContext> buildMessageMentionContext(
  FluxerDatabase db, {
  required String? currentUserId,
  required String channelId,
}) async {
  final blockedUserIds = await db.relationshipDao.getBlockedUserIds();
  final channel = await db.channelDao.getChannelById(channelId);
  if (channel == null || currentUserId == null) {
    return MessageMentionContext(
      currentUserId: currentUserId,
      blockedUserIds: blockedUserIds,
      channelExists: channel != null,
      suppressEveryone: false,
      suppressRoles: false,
      currentUserRoleIds: const {},
    );
  }
  final settingsRow = await db.userGuildSettingsDao.getByGuildId(
    channel.guildId,
  );
  final settings = settingsRow == null
      ? null
      : UserGuildSettingsResponse.fromJson(
          jsonDecode(settingsRow.data) as Map<String, dynamic>,
        );
  final member = await db.memberDao.getMemberByUserId(
    currentUserId,
    channel.guildId,
  );
  final currentUserRoleIds = member == null
      ? <String>{}
      : (jsonDecode(member.roleIdsJson) as List<dynamic>)
            .map((roleId) => roleId.toString())
            .toSet();
  return MessageMentionContext(
    currentUserId: currentUserId,
    blockedUserIds: blockedUserIds,
    channelExists: true,
    suppressEveryone: settings?.suppressEveryone ?? false,
    suppressRoles: settings?.suppressRoles ?? false,
    currentUserRoleIds: currentUserRoleIds,
    threadNonMember: await isThreadNonMember(db, channel),
  );
}

/// Pure mention rule evaluated against a prebuilt [MessageMentionContext].
bool messageMentionsUser(
  MessageMentionContext ctx, {
  required String authorId,
  required List<String> mentionedUserIds,
  required bool mentionEveryone,
  required List<String> mentionRoleIds,
}) {
  if (ctx.currentUserId == null) {
    return false;
  }
  if (authorId != ctx.currentUserId && ctx.blockedUserIds.contains(authorId)) {
    return false;
  }
  if (mentionedUserIds.contains(ctx.currentUserId)) {
    return true;
  }
  if (!ctx.channelExists) {
    return mentionEveryone;
  }
  final bool everyone = mentionEveryone && !ctx.threadNonMember;
  if (!everyone && mentionRoleIds.isEmpty) {
    return false;
  }
  if (everyone) {
    return !ctx.suppressEveryone;
  }
  if (mentionRoleIds.isEmpty || ctx.suppressRoles) {
    return false;
  }
  return mentionRoleIds.any(ctx.currentUserRoleIds.contains);
}

/// Keeps a resolved mention highlight when [incoming] would drop it.
Message mergeMentionHighlightFlag({
  required Message incoming,
  required String? currentUserId,
  Message? previous,
}) {
  if (incoming.isMentioned) {
    return incoming;
  }
  if (previous?.isMentioned ?? false) {
    return incoming.copyWith(isMentioned: true);
  }
  if (currentUserId != null &&
      incoming.mentionedUserIds.contains(currentUserId)) {
    return incoming.copyWith(isMentioned: true);
  }
  if (currentUserId != null &&
      (previous?.mentionedUserIds.contains(currentUserId) ?? false)) {
    return incoming.copyWith(isMentioned: true);
  }
  return incoming;
}

List<Message> mergeMentionHighlightFlags(
  Iterable<Message> messages, {
  required String? currentUserId,
}) {
  return messages
      .map(
        (Message message) => mergeMentionHighlightFlag(
          incoming: message,
          currentUserId: currentUserId,
        ),
      )
      .toList(growable: false);
}

/// Convenience wrapper that builds the context and resolves a single message.
Future<bool> resolveMessageMentionsUser(
  FluxerDatabase db, {
  required String? currentUserId,
  required String channelId,
  required String authorId,
  required List<String> mentionedUserIds,
  required bool mentionEveryone,
  required List<String> mentionRoleIds,
}) async {
  final ctx = await buildMessageMentionContext(
    db,
    currentUserId: currentUserId,
    channelId: channelId,
  );
  return messageMentionsUser(
    ctx,
    authorId: authorId,
    mentionedUserIds: mentionedUserIds,
    mentionEveryone: mentionEveryone,
    mentionRoleIds: mentionRoleIds,
  );
}
