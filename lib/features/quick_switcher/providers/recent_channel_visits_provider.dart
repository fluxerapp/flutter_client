import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/providers/channel_frecency_provider.dart';
import 'package:fluxer_app/features/quick_switcher/domain/recent_channel_visit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_channel_visits_provider.g.dart';

@Riverpod(keepAlive: true)
class RecentChannelVisits extends _$RecentChannelVisits {
  @override
  List<RecentChannelVisit> build() {
    ref.watch(currentUserIdProvider);
    return const <RecentChannelVisit>[];
  }

  void recordVisit({
    required String channelId,
    String? guildId,
    bool isThread = false,
  }) {
    ref
        .read(channelFrecencyProvider.notifier)
        .recordSelection(
          guildId: guildId,
          channelId: channelId,
          isThread: isThread,
        );
    final List<RecentChannelVisit> next = <RecentChannelVisit>[
      RecentChannelVisit(channelId: channelId, guildId: guildId),
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
