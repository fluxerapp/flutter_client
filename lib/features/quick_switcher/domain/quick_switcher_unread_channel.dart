class QuickSwitcherUnreadChannel {
  const QuickSwitcherUnreadChannel({
    required this.channelId,
    this.guildId,
    this.mentionCount = 0,
    this.lastMessageId,
    this.lastMessageTime,
    this.hasUnread = true,
  });

  final String channelId;
  final String? guildId;
  final int mentionCount;
  final String? lastMessageId;
  final DateTime? lastMessageTime;
  final bool hasUnread;
}
