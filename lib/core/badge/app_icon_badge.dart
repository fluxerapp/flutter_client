class AppIconBadgeValue {
  const AppIconBadgeValue({required this.count});

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
