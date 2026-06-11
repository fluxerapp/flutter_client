import 'package:fluxer_app/features/quick_switcher/domain/recent_channel_visit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_channel_visits_provider.g.dart';

@Riverpod(keepAlive: true)
class RecentChannelVisits extends _$RecentChannelVisits {
  @override
  List<RecentChannelVisit> build() => const <RecentChannelVisit>[];

  void recordVisit({required String channelId, String? guildId}) {
    final List<RecentChannelVisit> next = <RecentChannelVisit>[
      RecentChannelVisit(
        channelId: channelId,
        guildId: guildId,
        visitedAt: DateTime.now(),
      ),
      ...state.where(
        (RecentChannelVisit visit) => visit.channelId != channelId,
      ),
    ];
    if (next.length > kMaxRecentChannelVisits) {
      state = next.take(kMaxRecentChannelVisits).toList();
      return;
    }
    state = next;
  }
}
