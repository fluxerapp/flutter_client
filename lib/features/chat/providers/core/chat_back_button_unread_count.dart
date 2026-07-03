class ChatBackButtonDmUnreadSnapshot {
  const ChatBackButtonDmUnreadSnapshot({
    required this.channelId,
    required this.mentionCount,
    required this.hasUnread,
  });

  final String channelId;
  final int mentionCount;
  final bool hasUnread;
}

int computeOtherDmUnreadCount({
  required Iterable<ChatBackButtonDmUnreadSnapshot> dmChannels,
  required String currentChannelId,
}) {
  var dmCount = 0;
  for (final ChatBackButtonDmUnreadSnapshot dm in dmChannels) {
    if (dm.channelId == currentChannelId) {
      continue;
    }
    if (dm.mentionCount > 0) {
      dmCount += dm.mentionCount;
      continue;
    }
    if (dm.hasUnread) {
      dmCount += 1;
    }
  }
  return dmCount;
}

int computeChatBackButtonUnreadCount({
  required int totalGuildMentionCount,
  required int currentGuildChannelMentionCount,
  required int otherDmUnreadCount,
}) {
  final int guildMentions =
      totalGuildMentionCount - currentGuildChannelMentionCount;
  final int safeGuildMentions = guildMentions < 0 ? 0 : guildMentions;
  return safeGuildMentions + otherDmUnreadCount;
}

int sumGuildMentionCounts(Map<String, int> mentionCountByGuildId) {
  var total = 0;
  for (final int mentionCount in mentionCountByGuildId.values) {
    total += mentionCount;
  }
  return total;
}
