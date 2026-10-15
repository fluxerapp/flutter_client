import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/open_test_database.dart';

GoRouter _router(String initialLocation) {
  Widget page(GoRouterState state) => Text(state.uri.path);
  return GoRouter(
    initialLocation: initialLocation,
    routes: <RouteBase>[
      GoRoute(
        path: RoutePaths.me,
        builder: (BuildContext _, GoRouterState state) => page(state),
      ),
      GoRoute(
        path: '/channels/:guildId',
        builder: (BuildContext _, GoRouterState state) => page(state),
        routes: <RouteBase>[
          GoRoute(
            path: ':channelId',
            builder: (BuildContext _, GoRouterState state) => page(state),
          ),
        ],
      ),
    ],
  );
}

Future<void> _settleStreams(WidgetTester tester) async {
  for (int i = 0; i < 5; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 20)),
    );
    await tester.pump();
  }
}

void main() {
  testWidgets('GUILD_DELETE for the open community goes Home and drops it', (
    WidgetTester tester,
  ) async {
    final FluxerDatabase db = openTestDatabase();
    addTearDown(db.close);
    await db.guildDao.upsertServer(
      ServersCompanion.insert(id: 'g1', name: 'Doomed'),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(id: 'c1', guildId: 'g1', name: 'general'),
    );
    final GoRouter router = _router('/channels/g1/c1');
    addTearDown(router.dispose);
    final FluxerClient client = FluxerClient(
      Dio(),
      baseUrl: 'https://api.fluxer.app/v1',
    );
    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerRouterProvider.overrideWithValue(router),
        fluxerDatabaseProvider.overrideWithValue(db),
        guildRepositoryProvider.overrideWithValue(GuildRepository(client, db)),
        channelRepositoryProvider.overrideWithValue(
          ChannelRepository(client, Dio(), db),
        ),
      ],
    );
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    container
        .read(channelListViewModelProvider.notifier)
        .loadChannels(
          'g1',
          guild: const Guild(id: 'g1', name: 'Doomed'),
        );
    await _settleStreams(tester);
    expect(container.read(channelListViewModelProvider).categories, isNotEmpty);

    final GatewayEventHandler handler = GatewayEventHandler(
      database: db,
      currentUserId: '100',
      onGuildRemove: (String guildId) =>
          DrawerNavigationCoordinator.leaveDeletedGuild(container, guildId),
    );
    await tester.runAsync(
      () => handler.handle(const GuildDeleteEvent(guildId: 'g1')),
    );
    await _settleStreams(tester);
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, RoutePaths.me);
    final ChannelListState state = container.read(channelListViewModelProvider);
    expect(state.guild, isNull);
    expect(state.categories, isEmpty);
  });

  testWidgets('GUILD_DELETE for another community stays put', (
    WidgetTester tester,
  ) async {
    final GoRouter router = _router('/channels/g2/c2');
    addTearDown(router.dispose);
    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerRouterProvider.overrideWithValue(router)],
    );
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    DrawerNavigationCoordinator.leaveDeletedGuild(container, 'g1');
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, '/channels/g2/c2');
  });

  test('an unavailable guild is not reported as removed', () async {
    final FluxerDatabase db = openTestDatabase();
    addTearDown(db.close);
    final List<String> removed = <String>[];
    final GatewayEventHandler handler = GatewayEventHandler(
      database: db,
      currentUserId: '100',
      onGuildRemove: removed.add,
    );

    await handler.handle(
      const GuildDeleteEvent(guildId: 'g1', unavailable: true),
    );
    await handler.handle(const GuildDeleteEvent(guildId: 'g2'));
    await Future<void>.delayed(const Duration(milliseconds: 50));

    expect(removed, <String>['g2']);
  });
}
