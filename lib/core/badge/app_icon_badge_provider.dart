import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/badge/app_icon_badge.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_icon_badge_provider.g.dart';

@Riverpod(keepAlive: true)
class AppIconBadge extends _$AppIconBadge {
  String? _userId;

  @override
  AppIconBadgeValue? build() {
    final String? userId = ref.watch(currentUserIdProvider);
    final AppIconBadgeValue? previous = userId == _userId ? stateOrNull : null;
    _userId = userId;
    ref.listen<Map<String, GuildReadStateEntry>>(
      guildReadStateProvider,
      (_, _) {},
    );
    final bool ready =
        ref.watch(gatewayReadyProvider) &&
        ref.watch(guildReadStateReadyProvider);
    if (!ready) {
      return previous;
    }
    final int guildMentionCount = ref.watch(
      guildReadStateProvider.select(
        (Map<String, GuildReadStateEntry> states) => states.values.fold<int>(
          0,
          (int sum, GuildReadStateEntry entry) => sum + entry.mentionCount,
        ),
      ),
    );
    final int dmMentionCount = ref.watch(
      unreadDmChannelsProvider.select(
        (UnreadDmState state) =>
            state.channels.fold<int>(0, (int sum, dm) => sum + dm.unreadCount),
      ),
    );
    final int pendingFriends =
        ref.watch(pendingFriendRequestCountProvider).value ?? 0;
    final AppIconBadgeValue next = computeAppIconBadge(
      guildMentionCount: guildMentionCount,
      dmMentionCount: dmMentionCount,
      pendingFriendRequestCount: pendingFriends,
    );
    return previous != null && previous.count == next.count ? previous : next;
  }
}
