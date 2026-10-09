class RecentChannelVisit {
  const RecentChannelVisit({required this.channelId, this.guildId});

  final String channelId;
  final String? guildId;
}

const int kMaxRecentChannelVisits = 20;
