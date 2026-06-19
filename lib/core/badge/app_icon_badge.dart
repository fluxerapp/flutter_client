/// OS app-icon badge value derived from unread state
class AppIconBadgeValue {
  const AppIconBadgeValue({required this.count});

  /// `0` clears the badge; `1`+ sets the launcher count.
  final int count;
}

AppIconBadgeValue computeAppIconBadge({
  required int guildMentionCount,
  required int dmMentionCount,
  required int pendingFriendRequestCount,
}) {
  final int mentionTotal = guildMentionCount + dmMentionCount;
  final int totalCount = mentionTotal + pendingFriendRequestCount;
  return AppIconBadgeValue(count: totalCount);
}
