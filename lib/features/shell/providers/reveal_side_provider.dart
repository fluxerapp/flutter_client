import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
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
    ref
      ..listen<bool>(authStateProvider, (_, next) {
        if (!next) {
          _lastAppliedFor = null;
          _resyncAfterReconnect = false;
        }
      })
      ..listen<bool>(gatewayConnectionFailedProvider, (
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
    final String? shellLocation = resolveShellLocation(config);
    final String location = shellLocation ?? resolveTopLocation(config);
    final RevealSide? initial = syncedRevealSideFor(location);
    if (classifyRoute(location) == RouteKind.chat || initial != null) {
      _lastAppliedFor = location;
    }
    if (initial != null) {
      return initial;
    }
    return RevealSide.main;
  }

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
      _rememberChatLocation(location);
      return;
    }
    _lastAppliedFor = location;
    state = desired;
  }

  void forceSyncForRoute(String location) {
    final RevealSide? desired = syncedRevealSideFor(location);
    if (desired == null) {
      _rememberChatLocation(location);
      return;
    }
    _lastAppliedFor = location;
    state = desired;
    ref.read(drawerRevealSyncTriggerProvider.notifier).nudge();
  }

  void _rememberChatLocation(String location) {
    if (classifyRoute(location) == RouteKind.chat) {
      _lastAppliedFor = location;
    }
  }

  // Riverpod notifiers in this app use method-style mutations at call sites.
  // ignore: use_setters_to_change_properties
  void set(RevealSide side) {
    state = side;
  }
}

RevealSide? eagerRevealSideFor(String location) {
  return switch (classifyRoute(location)) {
    RouteKind.chat || RouteKind.discover => RevealSide.main,
    _ => null,
  };
}

RevealSide? syncedRevealSideFor(String location) {
  return switch (classifyRoute(location)) {
    RouteKind.channelsRoot => RevealSide.left,
    _ => null,
  };
}
