import 'dart:async' show unawaited;

import 'package:flutter/foundation.dart';
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
      // GoRouter notifies from restoreState/didChangeDependencies while the
      // tree is still mounting, and schedulerPhase can still be idle then.
      unawaited(
        Future<void>(() {
          if (!ref.mounted) {
            return;
          }
          state = RouteState.fromRouter(router);
        }),
      );
    }

    router.routerDelegate.addListener(listener);
    ref.onDispose(() => router.routerDelegate.removeListener(listener));
    return RouteState.fromRouter(router);
  }
}

/// One-shot ledger for route-carried message jump targets.
///
/// `/channels/<guild>/<channel>/<messageId>` keeps the message id in the
/// location after the jump has landed, so the trigger is DURABLE while a
/// widget's consumption state is not. Recording consumption here, outside the
/// widget tree, means a rebuild or remount cannot forget it and reapply a
/// stale target.
///
/// Consumption is per (channel, message) and keyed to a navigation INTENT:
/// `ChannelJumpTargetLedger.request` re-opens ONLY the target it names, so a
/// deliberate repeat jump to the same message is honoured while every other
/// target keeps its record. A single slot would erase an earlier consumption
/// whenever the user jumps to a second message in the same channel, which is
/// an ordinary follow-up search and would reopen the stale-refetch loop.
///
/// A route target is suppressed once it is either ACKNOWLEDGED or SUPERSEDED.
/// Those are different states and both are needed: interruption is transient,
/// so an unacknowledged target must stay retryable, but a newer jump in the
/// same channel means the user has commanded something else and the older
/// target must never fire again. Without the second rule a pending target that
/// was never acknowledged yanks the user back off the message they just asked
/// for. Note the deliberate consequence: navigating back to `/A` after jumping
/// to B does NOT re-jump to A, which matches acknowledged semantics.
///
/// Otherwise fails OPEN: a target the ledger has never heard of is honoured. A
/// spurious jump costs one fetch, whereas a spurious suppression silently
/// strands the user on the wrong message.
@immutable
class ChannelJumpTargetConsumption {
  const ChannelJumpTargetConsumption({
    this.consumedKeys = const <String>{},
    this.latestIntentByChannel = const <String, String>{},
  });

  /// Targets whose jump the view model has been observed COMMANDING.
  ///
  /// Deliberately not a signal version: `_switchedChannelState` resets
  /// `scrollToMessageSignal` to null on every targeted fetch, so versions
  /// restart at 1 and numeric ordering would never acknowledge a re-tap.
  final Set<String> consumedKeys;

  /// The most recent jump target requested per channel, acknowledged or not.
  final Map<String, String> latestIntentByChannel;

  static String keyFor({
    required String channelId,
    required String messageId,
  }) => '$channelId/$messageId';

  bool isConsumed({required String channelId, required String messageId}) =>
      consumedKeys.contains(keyFor(channelId: channelId, messageId: messageId));

  /// True when a NEWER jump was requested in this channel, so this target is no
  /// longer what the user asked for.
  bool isSuperseded({required String channelId, required String messageId}) {
    final String? latest = latestIntentByChannel[channelId];
    return latest != null && latest != messageId;
  }
}

@Riverpod(keepAlive: true)
class ChannelJumpTargetLedger extends _$ChannelJumpTargetLedger {
  /// Bounds both collections without needing lifecycle hooks. Insertion
  /// ordered, so the oldest record is dropped first; far above any realistic
  /// jump or channel count in a session.
  static const int _maxTrackedTargets = 128;

  @override
  ChannelJumpTargetConsumption build() => const ChannelJumpTargetConsumption();

  /// Opens a fresh jump intent for this target and makes it the latest intent
  /// for its channel.
  ///
  /// Called before the jump can possibly run, so no command for this intent can
  /// precede its registration. Clears ONLY this target's acknowledgement.
  void request({required String channelId, required String messageId}) {
    final String key = ChannelJumpTargetConsumption.keyFor(
      channelId: channelId,
      messageId: messageId,
    );
    final Set<String> nextConsumed = <String>{...state.consumedKeys}
      ..remove(key);
    final Map<String, String> nextLatest = <String, String>{
      ...state.latestIntentByChannel,
      channelId: messageId,
    };
    while (nextLatest.length > _maxTrackedTargets) {
      nextLatest.remove(nextLatest.keys.first);
    }
    state = ChannelJumpTargetConsumption(
      consumedKeys: nextConsumed,
      latestIntentByChannel: nextLatest,
    );
  }

  /// The view model has COMMANDED the jump for this target; the route must not
  /// reapply it.
  void markConsumed({required String channelId, required String messageId}) {
    final String key = ChannelJumpTargetConsumption.keyFor(
      channelId: channelId,
      messageId: messageId,
    );
    if (state.consumedKeys.contains(key)) {
      return;
    }
    final Set<String> next = <String>{...state.consumedKeys, key};
    while (next.length > _maxTrackedTargets) {
      next.remove(next.first);
    }
    state = ChannelJumpTargetConsumption(
      consumedKeys: next,
      latestIntentByChannel: state.latestIntentByChannel,
    );
  }

  bool shouldHonour({required String channelId, required String messageId}) =>
      !state.isConsumed(channelId: channelId, messageId: messageId) &&
      !state.isSuperseded(channelId: channelId, messageId: messageId);
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
