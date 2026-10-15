import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/channel_persistence_observer.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/providers/open_communities_to_last_channel_provider.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helpers/open_test_database.dart';

const Key _chatKey = ValueKey<String>('chat');

Page<void> _page(FluxerDatabase db, GoRouterState state) {
  final String path = state.uri.path;
  return MaterialPage<void>(
    name: path,
    arguments: path,
    child: SidebarDrawer(
      revealDuration: Duration.zero,
      snapBackDuration: Duration.zero,
      base: const ColoredBox(color: Colors.blue),
      slider: ColoredBox(
        key: _chatKey,
        color: Colors.red,
        child: Center(child: Text('chat:$path')),
      ),
    ),
  );
}

GoRouter _router(FluxerDatabase db, String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    observers: <NavigatorObserver>[ChannelPersistenceObserver(db)],
    routes: <RouteBase>[
      GoRoute(
        path: '/channels/:guildId',
        redirect: (BuildContext _, GoRouterState state) =>
            resolveGuildRootRedirect(
              guildId: state.pathParameters['guildId'],
              fullPath: state.uri.path,
              db: db,
              currentUserId: null,
            ),
        pageBuilder: (BuildContext _, GoRouterState state) => _page(db, state),
        routes: <RouteBase>[
          GoRoute(
            path: ':channelId',
            pageBuilder: (BuildContext _, GoRouterState state) =>
                _page(db, state),
          ),
        ],
      ),
    ],
  );
}

Future<FluxerDatabase> _seed() async {
  final FluxerDatabase db = openTestDatabase();
  for (final String guildId in <String>['g1', 'g2']) {
    await db.guildDao.upsertServer(
      ServersCompanion.insert(id: guildId, name: guildId),
    );
  }
  Future<void> channel(String id, String guildId, int position) =>
      db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: id,
          guildId: guildId,
          name: id,
          position: Value(position),
        ),
      );
  await channel('g1-general', 'g1', 0);
  await channel('g2-general', 'g2', 0);
  await channel('g2-chat', 'g2', 1);
  return db;
}

ProviderContainer _container(FluxerDatabase db, GoRouter router) {
  final FluxerClient client = FluxerClient(
    Dio(),
    baseUrl: 'https://api.fluxer.app/v1',
  );
  return ProviderContainer(
    overrides: [
      fluxerRouterProvider.overrideWithValue(router),
      fluxerDatabaseProvider.overrideWithValue(db),
      currentUserIdProvider.overrideWithValue(null),
      guildRepositoryProvider.overrideWithValue(GuildRepository(client, db)),
      channelRepositoryProvider.overrideWithValue(
        ChannelRepository(client, Dio(), db),
      ),
    ],
  );
}

Future<void> _settle(WidgetTester tester) async {
  for (int i = 0; i < 5; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 20)),
    );
    await tester.pump();
  }
  await tester.pump(kGuildUnreadPrimeLimit);
  await tester.pumpAndSettle();
}

Future<void> _pumpApp(
  WidgetTester tester,
  ProviderContainer container,
  GoRouter router,
) async {
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp.router(
        routerConfig: router,
        builder: (BuildContext context, Widget? child) => MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    ),
  );
  await _settle(tester);
}

double _chatDx(WidgetTester tester) {
  final Transform transform = tester.widget<Transform>(
    find.ancestor(of: find.byKey(_chatKey), matching: find.byType(Transform)),
  );
  return transform.transform.getTranslation().x;
}

String _path(GoRouter router) => router.routeInformationProvider.value.uri.path;

Future<void> _selectGuild(
  WidgetTester tester,
  ProviderContainer container,
  String guildId,
) async {
  await tester.runAsync(
    () => DrawerNavigationCoordinator.selectGuild(container, guildId),
  );
  await _settle(tester);
}

void main() {
  testWidgets('closing the channel list lands in the remembered channel', (
    WidgetTester tester,
  ) async {
    final FluxerDatabase db = await _seed();
    addTearDown(db.close);
    final GoRouter router = _router(db, '/channels/g2/g2-chat');
    addTearDown(router.dispose);
    final ProviderContainer container = _container(db, router);
    addTearDown(container.dispose);
    await _pumpApp(tester, container, router);

    router.go('/channels/g1/g1-general');
    await _settle(tester);

    await _selectGuild(tester, container, 'g2');

    expect(_path(router), '/channels/g2/g2-chat');
    expect(_chatDx(tester), 400);

    await tester.dragFrom(const Offset(240, 400), const Offset(-260, 0));
    await tester.pumpAndSettle();

    expect(_chatDx(tester), 0);
    expect(find.text('chat:/channels/g2/g2-chat'), findsOneWidget);
  });

  testWidgets('the remembered channel survives an app restart', (
    WidgetTester tester,
  ) async {
    final FluxerDatabase db = await _seed();
    addTearDown(db.close);

    final GoRouter firstRouter = _router(db, '/channels/g2/g2-chat');
    final ProviderContainer firstRun = _container(db, firstRouter);
    await _pumpApp(tester, firstRun, firstRouter);
    await tester.pumpWidget(const SizedBox.shrink());
    firstRun.dispose();
    firstRouter.dispose();

    final GoRouter router = _router(db, '/channels/g1/g1-general');
    addTearDown(router.dispose);
    final ProviderContainer container = _container(db, router);
    addTearDown(container.dispose);
    await _pumpApp(tester, container, router);

    await _selectGuild(tester, container, 'g2');

    expect(_path(router), '/channels/g2/g2-chat');
  });

  testWidgets('a deleted remembered channel falls back to the default', (
    WidgetTester tester,
  ) async {
    final FluxerDatabase db = await _seed();
    addTearDown(db.close);
    final GoRouter router = _router(db, '/channels/g2/g2-chat');
    addTearDown(router.dispose);
    final ProviderContainer container = _container(db, router);
    addTearDown(container.dispose);
    await _pumpApp(tester, container, router);

    router.go('/channels/g1/g1-general');
    await _settle(tester);
    await tester.runAsync(() => db.channelDao.deleteChannel('g2-chat'));

    await _selectGuild(tester, container, 'g2');

    expect(_path(router), '/channels/g2/g2-general');
  });

  group('open communities to your last channel', () {
    Future<(GoRouter, ProviderContainer)> start(
      WidgetTester tester, {
      required bool enabled,
    }) async {
      final FluxerDatabase db = await _seed();
      addTearDown(db.close);
      final GoRouter router = _router(db, '/channels/g2/g2-chat');
      addTearDown(router.dispose);
      final ProviderContainer container = _container(db, router);
      addTearDown(container.dispose);
      SharedPreferences.setMockInitialValues(<String, Object>{
        'open_communities_to_last_channel': enabled,
      });
      await container
          .read(openCommunitiesToLastChannelProvider.notifier)
          .load();
      await _pumpApp(tester, container, router);
      router.go('/channels/g1/g1-general');
      await _settle(tester);
      DrawerNavigationCoordinator.revealDrawer(container);
      await tester.pumpAndSettle();
      expect(_chatDx(tester), 400);
      return (router, container);
    }

    testWidgets('off: tapping a community shows its channel list', (
      WidgetTester tester,
    ) async {
      final (GoRouter router, ProviderContainer container) = await start(
        tester,
        enabled: false,
      );

      await _selectGuild(tester, container, 'g2');

      expect(_path(router), '/channels/g2/g2-chat');
      expect(_chatDx(tester), 400);
    });

    testWidgets('on: tapping a community opens its last channel', (
      WidgetTester tester,
    ) async {
      final (GoRouter router, ProviderContainer container) = await start(
        tester,
        enabled: true,
      );

      await _selectGuild(tester, container, 'g2');

      expect(_path(router), '/channels/g2/g2-chat');
      expect(_chatDx(tester), 0);
      expect(find.text('chat:/channels/g2/g2-chat'), findsOneWidget);

      await tester.dragFrom(const Offset(10, 400), const Offset(260, 0));
      await tester.pumpAndSettle();
      expect(_chatDx(tester), 400);
    });

    testWidgets('on: tapping the selected community shows its channel list', (
      WidgetTester tester,
    ) async {
      final (GoRouter router, ProviderContainer container) = await start(
        tester,
        enabled: true,
      );

      await _selectGuild(tester, container, 'g1');

      expect(_path(router), '/channels/g1/g1-general');
      expect(_chatDx(tester), 400);
    });
  });
}
