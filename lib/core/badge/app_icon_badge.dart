/// OS app-icon badge value derived from unread state
class AppIconBadgeValue {
  const AppIconBadgeValue({required this.count});

  /// `0` clears the badge; `1`+ sets the launcher count.
  final int count;
}

const bool kDefaultUnreadMessageBadgeEnabled = true;

/// Plain-unread dot applies to guild channels only.
/// DM plain unread does not contribute to the dot.
AppIconBadgeValue computeAppIconBadge({
  required int guildMentionCount,
  required int dmMentionCount,
  required int pendingFriendRequestCount,
  required bool guildHasPlainUnread,
  bool unreadMessageBadgeEnabled = kDefaultUnreadMessageBadgeEnabled,
}) {
  final int mentionTotal = guildMentionCount + dmMentionCount;
  final int totalCount = mentionTotal + pendingFriendRequestCount;
  if (totalCount > 0) {
    return AppIconBadgeValue(count: totalCount);
  }
  if (guildHasPlainUnread && unreadMessageBadgeEnabled) {
    return const AppIconBadgeValue(count: 1);
  }
  return const AppIconBadgeValue(count: 0);
}
