import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_state_providers.g.dart';

@immutable
class RouteState {
  final String location;
  final String? activeBranchLocation;
  final int activeBranchIndex;
  final RouteKind kind;
  final String? guildId;
  final String? channelId;

  const RouteState({
    required this.location,
    required this.activeBranchLocation,
    required this.activeBranchIndex,
    required this.kind,
    required this.guildId,
    required this.channelId,
  });

  String? get shellLocation => activeBranchLocation;

  String get effectiveShellLocation => activeBranchLocation ?? location;

  bool get hasRootOverlay =>
      activeBranchLocation != null && activeBranchLocation != location;

  factory RouteState.fromRouter(GoRouter router) {
    final RouteMatchList config = router.routerDelegate.currentConfiguration;
    final String top = resolveTopLocation(config);
    final String? branchLocation = resolveActiveBranchLocation(config);
    final int branchIndex = inferShellBranchIndex(top);
    final String contextLocation = branchLocation ?? top;
    return RouteState(
      location: top,
      activeBranchLocation: branchLocation,
      activeBranchIndex: branchIndex,
      kind: classifyRoute(contextLocation),
      guildId: extractGuildId(contextLocation),
      channelId: extractChannelId(contextLocation),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteState &&
          location == other.location &&
          activeBranchLocation == other.activeBranchLocation &&
          activeBranchIndex == other.activeBranchIndex &&
          kind == other.kind &&
          guildId == other.guildId &&
          channelId == other.channelId);

  @override
  int get hashCode => Object.hash(
    location,
    activeBranchLocation,
    activeBranchIndex,
    kind,
    guildId,
    channelId,
  );
}

@Riverpod(keepAlive: true)
class RouteStateNotifier extends _$RouteStateNotifier {
  @override
  RouteState build() {
    final GoRouter router = ref.watch(fluxerRouterProvider);
    void listener() {
      void applyRouteState() {
        state = RouteState.fromRouter(router);
      }

      final SchedulerPhase phase = SchedulerBinding.instance.schedulerPhase;
      if (phase == SchedulerPhase.idle ||
          phase == SchedulerPhase.postFrameCallbacks) {
        applyRouteState();
        return;
      }
      SchedulerBinding.instance.scheduleFrameCallback((_) {
        applyRouteState();
      });
    }

    router.routerDelegate.addListener(listener);
    ref.onDispose(() => router.routerDelegate.removeListener(listener));
    return RouteState.fromRouter(router);
  }
}

@Riverpod(keepAlive: true)
String currentLocation(Ref ref) {
  return ref.watch(routeStateProvider).location;
}

@Riverpod(keepAlive: true)
String topLocation(Ref ref) {
  return ref.watch(routeStateProvider).location;
}

@Riverpod(keepAlive: true)
String shellLocation(Ref ref) {
  return ref.watch(routeStateProvider).effectiveShellLocation;
}

@Riverpod(keepAlive: true)
String activeBranchLocation(Ref ref) {
  return ref.watch(routeStateProvider).effectiveShellLocation;
}

@Riverpod(keepAlive: true)
int activeShellBranchIndex(Ref ref) {
  return ref.watch(routeStateProvider).activeBranchIndex;
}

@Riverpod(keepAlive: true)
String? activeGuildId(Ref ref) {
  final RouteState state = ref.watch(routeStateProvider);
  return extractGuildId(state.effectiveShellLocation);
}

@Riverpod(keepAlive: true)
String? activeChannelId(Ref ref) {
  final RouteState state = ref.watch(routeStateProvider);
  return extractChannelId(state.effectiveShellLocation);
}

/// Guild context for the active chat view. Uses the route guild ID when
/// present; otherwise resolves from the active channel row in the DB.
@riverpod
String? contextualGuildId(Ref ref) {
  final String? routeGuildId = ref.watch(activeGuildIdProvider);
  if (routeGuildId != null) {
    return routeGuildId;
  }
  final String? channelId = ref.watch(activeChannelIdProvider);
  if (channelId == null || channelId.isEmpty) {
    return null;
  }
  return ref.watch(channelGuildIdProvider(channelId)).value;
}
