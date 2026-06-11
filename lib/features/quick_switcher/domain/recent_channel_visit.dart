class RecentChannelVisit {
  const RecentChannelVisit({
    required this.channelId,
    required this.visitedAt,
    this.guildId,
  });

  final String channelId;
  final String? guildId;
  final DateTime visitedAt;
}

const int kMaxRecentChannelVisits = 20;
