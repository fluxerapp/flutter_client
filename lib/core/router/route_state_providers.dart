import 'dart:async' show unawaited;

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
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

  String get effectiveShellLocation => activeBranchLocation ?? location;

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

@immutable
class ChannelJumpTargetConsumption {
  const ChannelJumpTargetConsumption({
    this.consumedKeys = const <String>{},
    this.latestIntentByChannel = const <String, String>{},
  });

  final Set<String> consumedKeys;

  final Map<String, String> latestIntentByChannel;

  static String keyFor({
    required String channelId,
    required String messageId,
  }) => '$channelId/$messageId';

  bool isConsumed({required String channelId, required String messageId}) =>
      consumedKeys.contains(keyFor(channelId: channelId, messageId: messageId));

  bool isSuperseded({required String channelId, required String messageId}) {
    final String? latest = latestIntentByChannel[channelId];
    return latest != null && latest != messageId;
  }
}

@Riverpod(keepAlive: true)
class ChannelJumpTargetLedger extends _$ChannelJumpTargetLedger {
  static const int _maxTrackedTargets = 128;

  @override
  ChannelJumpTargetConsumption build() => const ChannelJumpTargetConsumption();

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

@riverpod
String? contextualGuildId(Ref ref) {
  final String? routeGuildId = ref.watch(activeGuildIdProvider);
  if (routeGuildId != null && routeGuildId.isNotEmpty) {
    return routeGuildId;
  }
  final String? channelId = ref.watch(activeChannelIdProvider);
  if (channelId == null || channelId.isEmpty) {
    return null;
  }
  final channel = findChannelById(
    ref.watch(channelListViewModelProvider),
    channelId,
  );
  if (channel != null && channel.guildId.isNotEmpty) {
    return channel.guildId;
  }
  return ref.watch(channelGuildIdProvider(channelId)).value;
}
