import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

void _addUserId(Set<String> userIds, String? userId) {
  if (userId == null || userId.isEmpty) {
    return;
  }
  userIds.add(userId);
}

void _addAuthorUserId(
  Set<String> userIds,
  String? userId,
  String? currentUserId,
) {
  if (userId == null || userId.isEmpty || userId == currentUserId) {
    return;
  }
  userIds.add(userId);
}

void _addSnapshotMentionUserIds(
  Set<String> userIds,
  List<MessageSnapshot> snapshots,
) {
  for (final MessageSnapshot snapshot in snapshots) {
    for (final String userId in snapshot.mentions) {
      _addUserId(userIds, userId);
    }
  }
}

void _addMessageMemberUserIds(
  Set<String> userIds,
  Message message,
  String? currentUserId,
  Set<String> visitedMessageIds,
) {
  if (visitedMessageIds.contains(message.id)) {
    return;
  }
  visitedMessageIds.add(message.id);
  if (!messagePrefersPersistedAuthorDisplay(message)) {
    _addAuthorUserId(userIds, message.authorId, currentUserId);
  }
  for (final String userId in message.mentionedUserIds) {
    _addUserId(userIds, userId);
  }
  for (final String userId in message.supplementalUserIds) {
    _addUserId(userIds, userId);
  }
  _addSnapshotMentionUserIds(userIds, message.messageSnapshots);
}

Set<String> collectMessageMemberUserIds(
  Iterable<Message> messages, {
  String? currentUserId,
  Iterable<Message> embeddedReplyParents = const <Message>[],
}) {
  final Set<String> userIds = <String>{};
  final Set<String> visitedMessageIds = <String>{};
  for (final Message message in messages) {
    _addMessageMemberUserIds(
      userIds,
      message,
      currentUserId,
      visitedMessageIds,
    );
  }
  for (final Message message in embeddedReplyParents) {
    _addMessageMemberUserIds(
      userIds,
      message,
      currentUserId,
      visitedMessageIds,
    );
  }
  return userIds;
}
