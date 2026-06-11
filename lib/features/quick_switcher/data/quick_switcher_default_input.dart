import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_channel_resolver.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';
import 'package:fluxer_app/features/quick_switcher/domain/recent_channel_visit.dart';

class QuickSwitcherDefaultInput {
  const QuickSwitcherDefaultInput({
    required this.resolver,
    required this.recentVisits,
    required this.unreadChannels,
    required this.excludedChannelIds,
  });

  final QuickSwitcherChannelResolver resolver;
  final List<RecentChannelVisit> recentVisits;
  final List<QuickSwitcherUnreadChannel> unreadChannels;
  final Set<String> excludedChannelIds;
}
