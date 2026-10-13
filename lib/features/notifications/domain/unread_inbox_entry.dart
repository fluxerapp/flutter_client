class UnreadInboxEntry {
  final String channelId;
  final String? guildId;
  final bool isDm;
  final int mentionCount;
  final bool isCollapsed;
  final int recencyComparator;
  final String? ackMessageId;
  final String? lastMessageId;
  final bool isThreadOnly;

  const UnreadInboxEntry({
    required this.channelId,
    required this.guildId,
    required this.isDm,
    required this.mentionCount,
    required this.isCollapsed,
    required this.recencyComparator,
    required this.ackMessageId,
    required this.lastMessageId,
    this.isThreadOnly = false,
  });
}
