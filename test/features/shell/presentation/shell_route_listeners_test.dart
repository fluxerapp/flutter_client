import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_coordinator.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/push/push_notifications_coordinator.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/shell_route_listeners.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  testWidgets('restored guild route loads channels on first shell mount', (
    WidgetTester tester,
  ) async {
    final _RouteStateSource routeStateSource = _RouteStateSource(
      location: '/channels/guild-1/channel-1',
    );
    final _RecordingChannelRepository channelRepository =
        _RecordingChannelRepository();
    final GatewayConnection gatewayConnection = GatewayConnection(
      token: 'test-token',
      dio: Dio(),
    );
    addTearDown(gatewayConnection.dispose);

    final ProviderContainer container = ProviderContainer(
      overrides: [
        routeStateProvider.overrideWith(
          () => _TestRouteStateNotifier(routeStateSource),
        ),
        guildListViewModelProvider.overrideWithValue(
          const GuildListViewState(
            guilds: <Guild>[Guild(id: 'guild-1', name: 'Guild One')],
          ),
        ),
        channelRepositoryProvider.overrideWithValue(channelRepository),
        gatewayConnectionProvider.overrideWithValue(gatewayConnection),
        pushNotificationsCoordinatorProvider.overrideWithValue(false),
        appIconBadgeCoordinatorProvider.overrideWithValue(null),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const Directionality(
          textDirection: TextDirection.ltr,
          child: ShellRouteListeners(child: SizedBox.shrink()),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(channelRepository.watchedGuildIds, <String>['guild-1']);
    expect(container.read(channelListViewModelProvider).guild?.id, 'guild-1');
  });

  testWidgets('active guild route effect loads channels for current guild', (
    WidgetTester tester,
  ) async {
    final _RouteStateSource routeStateSource = _RouteStateSource();
    final _RecordingChannelRepository channelRepository =
        _RecordingChannelRepository();
    final GatewayConnection gatewayConnection = GatewayConnection(
      token: 'test-token',
      dio: Dio(),
    );
    addTearDown(gatewayConnection.dispose);

    final ProviderContainer container = ProviderContainer(
      overrides: [
        routeStateProvider.overrideWith(
          () => _TestRouteStateNotifier(routeStateSource),
        ),
        guildListViewModelProvider.overrideWithValue(
          const GuildListViewState(
            guilds: <Guild>[Guild(id: 'guild-1', name: 'Guild One')],
          ),
        ),
        channelRepositoryProvider.overrideWithValue(channelRepository),
        gatewayConnectionProvider.overrideWithValue(gatewayConnection),
        pushNotificationsCoordinatorProvider.overrideWithValue(false),
        appIconBadgeCoordinatorProvider.overrideWithValue(null),
      ],
    );
    addTearDown(container.dispose);

    // The route update happens after ShellRouteListeners attaches its manual
    // listeners. This covers the deferred effect and its stale-guild guard,
    // but does not claim to reproduce Riverpod's full-app build-flush crash.
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ShellRouteListeners(
            child: _InvalidateRouteStateAfterBuild(routeStateSource),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(channelRepository.watchedGuildIds, <String>['guild-1']);
    expect(container.read(channelListViewModelProvider).guild?.id, 'guild-1');
  });
}

class _InvalidateRouteStateAfterBuild extends ConsumerWidget {
  const _InvalidateRouteStateAfterBuild(this.source);

  final _RouteStateSource source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!source.didInvalidateDuringBuild) {
      source
        ..didInvalidateDuringBuild = true
        ..location = '/channels/guild-1/channel-1';
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.invalidate(routeStateProvider);
      });
    }
    ref.watch(activeGuildIdProvider);
    return const SizedBox.shrink();
  }
}

class _RouteStateSource {
  _RouteStateSource({this.location = '/channels/@me'});

  String location;
  bool didInvalidateDuringBuild = false;

  RouteState get state => RouteState(
    location: location,
    activeBranchLocation: location,
    activeBranchIndex: 0,
    kind: classifyRoute(location),
    guildId: extractGuildId(location),
    channelId: extractChannelId(location),
  );
}

class _TestRouteStateNotifier extends RouteStateNotifier {
  _TestRouteStateNotifier(this.source);

  final _RouteStateSource source;

  @override
  RouteState build() => source.state;
}

class _RecordingChannelRepository implements ChannelRepository {
  final List<String> watchedGuildIds = <String>[];

  @override
  Stream<List<Channel>> watchChannels(String guildId) {
    watchedGuildIds.add(guildId);
    return const Stream<List<Channel>>.empty();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
