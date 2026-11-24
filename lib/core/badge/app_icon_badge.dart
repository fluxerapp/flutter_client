class AppIconBadgeValue {
  const AppIconBadgeValue({required this.count, this.hasUnread = false});

  final int count;
  final bool hasUnread;
}

AppIconBadgeValue computeAppIconBadge({
  required int guildMentionCount,
  required int dmMentionCount,
  required int pendingFriendRequestCount,
  bool hasUnread = false,
}) {
  final int mentionTotal = guildMentionCount + dmMentionCount;
  final int totalCount = mentionTotal + pendingFriendRequestCount;
  return AppIconBadgeValue(count: totalCount, hasUnread: hasUnread);
}
