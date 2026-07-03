/// Stable identity + cache key for a message author's avatar: author id plus
/// avatar hash, never the message id, so the image is cached once per author
/// and survives the optimistic->delivered id swap without re-fetching.
///
/// Guild resolved avatars can use a different hash than the message payload.
String messageAuthorAvatarKey({
  required String authorId,
  required String? avatarHash,
}) => 'msg-avatar-$authorId-${avatarHash ?? ''}';

String messageAuthorAvatarKeyFromDisplay({
  required String authorId,
  required String? displayAvatarHash,
  required String? messageAvatarHash,
}) => messageAuthorAvatarKey(
  authorId: authorId,
  avatarHash: displayAvatarHash ?? messageAvatarHash,
);
