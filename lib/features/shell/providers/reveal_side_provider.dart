import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/features/shell/providers/drawer_reveal_sync_trigger_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reveal_side_provider.g.dart';

enum RevealSide { left, main }

@Riverpod(keepAlive: true)
class CurrentRevealSide extends _$CurrentRevealSide {
  String? _lastAppliedFor;
  bool _resyncAfterReconnect = false;

  @override
  RevealSide build() {
    // Logout invalidates the sync guard. Without this, a stale path string
    // from a previous session could match the new initial location string
    // and skip the legitimate post-login sync.
    ref.listen<bool>(authStateProvider, (_, next) {
      if (!next) {
        _lastAppliedFor = null;
        _resyncAfterReconnect = false;
      }
    });
    ref.listen<bool>(gatewayConnectionFailedProvider, (
      bool? previous,
      bool next,
    ) {
      if (next) {
        _resyncAfterReconnect = true;
      }
    });

    final router = ref.read(fluxerRouterProvider);
    final config = router.routerDelegate.currentConfiguration;
    if (config.isEmpty) {
      return RevealSide.main;
    }
    final location = config.last.matchedLocation;
    final initial = syncedRevealSideFor(location) ?? RevealSide.main;
    if (syncedRevealSideFor(location) != null) {
      _lastAppliedFor = location;
    }
    return initial;
  }

  /// Re-derives the drawer side from [location] and applies it.
  ///
  /// No-op when [location] is the same as the last applied location —
  /// preserves a drawer state the user toggled manually (e.g., swiped the
  /// drawer closed) across bottom-nav tab round-trips that bring the same
  /// channels location back to the foreground.
  void syncForRoute(String location) {
    if (_resyncAfterReconnect) {
      _resyncAfterReconnect = false;
      forceSyncForRoute(location);
      return;
    }
    if (location == _lastAppliedFor) {
      return;
    }
    final desired = syncedRevealSideFor(location);
    if (desired == null) {
      return;
    }
    _lastAppliedFor = location;
    state = desired;
  }

  /// Applies the drawer side for [location], bypassing the same-route guard.
  ///
  /// Used after the reconnecting screen when [syncForRoute] would no-op because
  /// the restored path matches the pre-failure location string.
  void forceSyncForRoute(String location) {
    final RevealSide? desired = syncedRevealSideFor(location);
    if (desired == null) {
      return;
    }
    _lastAppliedFor = location;
    state = desired;
    ref.read(drawerRevealSyncTriggerProvider.notifier).nudge();
  }

  // Riverpod notifiers in this app use method-style mutations at call sites.
  // ignore: use_setters_to_change_properties
  void set(RevealSide side) {
    state = side;
  }
}

/// Pre-nav target side for [location].
///
/// Only chat routes pre-set the drawer side (closing it before `context.go`
/// fires), so re-tapping the channel you're already on still closes the
/// drawer — go_router treats unchanged locations as a no-op and the
/// post-nav route listener never fires.
///
/// Root-channels deliberately do NOT pre-set [RevealSide.left]: tapping a
/// guild whose root redirects to a last-channel (see `fluxer_router.dart`
/// guild redirect) would otherwise open the drawer for a frame before the
/// redirect lands and closes it again.
RevealSide? eagerRevealSideFor(String location) {
  return classifyRoute(location) == RouteKind.chat ? RevealSide.main : null;
}

/// Post-nav target side for [location], or null when the route should
/// not affect drawer state (members, dm call, non-channels).
RevealSide? syncedRevealSideFor(String location) {
  return switch (classifyRoute(location)) {
    RouteKind.channelsRoot => RevealSide.left,
    RouteKind.chat => RevealSide.main,
    RouteKind.guildMembers => null,
    RouteKind.dmCall => null,
    RouteKind.nonChannel => null,
  };
}
