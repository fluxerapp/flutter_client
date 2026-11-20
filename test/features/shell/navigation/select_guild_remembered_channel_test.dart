import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/guild_last_channel_memory_provider.dart';
import 'package:fluxer_app/core/router/channel_persistence_observer.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/providers/preferences/local_settings_provider.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helpers/open_test_database.dart';

class _RecordingChatViewModel extends ChatViewModel {
  final List<String> switchedTo = <String>[];

  @override
  ChatViewState build() => const ChatViewState(
    channelId: '',
    messages: <Message>[],
    replyingTo: null,
    replyMentioning: false,
    editingMessage: null,
    messageText: '',
    scrollToBottomSignal: 0,
    isLoading: false,
    isSyncingMessages: false,
    isLoadingMore: false,
    isLoadingNewer: false,
    hasMoreMessages: false,
    hasMoreNewerMessages: false,
    errorMessage: null,
  );

  @override
  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {
    switchedTo.add(channelId);
  }
}

class _Harness {
  _Harness(this.db, this.router, this.container, this.chat);

  final FluxerDatabase db;
  final GoRouter router;
  final ProviderContainer container;
  final _RecordingChatViewModel chat;
  final List<String> guildRootRedirects = <String>[];
  final List<String> locations = <String>[];

  String get path => router.routeInformationProvider.value.uri.path;
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

Future<_Harness> _start(WidgetTester tester, {required bool enabled}) async {
  SharedPreferences.setMockInitialValues(<String, Object>{
    'open_communities_to_last_channel': enabled,
  });
  final FluxerDatabase db = await _seed();
  addTearDown(db.close);
  late final _Harness harness;
  Page<void> page(GoRouterState state) => MaterialPage<void>(
    name: state.uri.path,
    arguments: state.uri.path,
    child: Text('chat:${state.uri.path}'),
  );
  final GoRouter router = GoRouter(
    initialLocation: '/channels/g2/g2-chat',
    observers: <NavigatorObserver>[ChannelPersistenceObserver(db)],
    routes: <RouteBase>[
      GoRoute(
        path: '/channels/:guildId',
        redirect: (BuildContext _, GoRouterState state) {
          if (state.uri.path ==
              '/channels/${state.pathParameters['guildId']}') {
            harness.guildRootRedirects.add(state.uri.path);
          }
          return resolveGuildRootRedirect(
            guildId: state.pathParameters['guildId'],
            fullPath: state.uri.path,
            db: db,
            currentUserId: null,
          );
        },
        pageBuilder: (BuildContext _, GoRouterState state) => page(state),
        routes: <RouteBase>[
          GoRoute(
            path: ':channelId',
            pageBuilder: (BuildContext _, GoRouterState state) => page(state),
          ),
        ],
      ),
    ],
  );
  addTearDown(router.dispose);
  final FluxerClient client = FluxerClient(
    Dio(),
    baseUrl: 'https://api.fluxer.app/v1',
  );
  final _RecordingChatViewModel chat = _RecordingChatViewModel();
  final ProviderContainer container = ProviderContainer(
    overrides: [
      fluxerRouterProvider.overrideWithValue(router),
      fluxerDatabaseProvider.overrideWithValue(db),
      currentUserIdProvider.overrideWithValue(null),
      guildRepositoryProvider.overrideWithValue(GuildRepository(client, db)),
      channelRepositoryProvider.overrideWithValue(
        ChannelRepository(client, Dio(), db),
      ),
      chatViewModelProvider.overrideWith(() => chat),
    ],
  );
  addTearDown(container.dispose);
  harness = _Harness(db, router, container, chat);
  await container.read(localSettingsProvider.notifier).load();
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp.router(routerConfig: router),
    ),
  );
  await _settle(tester);
  container.read(channelListViewModelProvider.notifier).loadActiveGuild('g2');
  await _settle(tester);
  router.go('/channels/g1/g1-general');
  await _settle(tester);
  container.read(channelListViewModelProvider.notifier).loadActiveGuild('g1');
  await _settle(tester);
  router.routeInformationProvider.addListener(
    () => harness.locations.add(harness.path),
  );
  harness.guildRootRedirects.clear();
  return harness;
}

Future<void> _expectDirectNavigation(
  WidgetTester tester,
  _Harness harness,
) async {
  expect(peekGuildLastChannelId(harness.container, 'g2'), 'g2-chat');

  final Future<void> selection = DrawerNavigationCoordinator.selectGuild(
    harness.container,
    'g2',
  );

  expect(harness.path, '/channels/g2/g2-chat');
  expect(harness.chat.switchedTo, <String>['g2-chat']);

  await tester.runAsync(() => selection);
  await _settle(tester);

  expect(harness.path, '/channels/g2/g2-chat');
  expect(harness.guildRootRedirects, isEmpty);
  expect(harness.locations, isNot(contains('/channels/g2')));
  expect(harness.locations.toSet(), <String>{'/channels/g2/g2-chat'});
  expect(find.text('chat:/channels/g2/g2-chat'), findsOneWidget);
}

void main() {
  testWidgets(
    'selectGuild navigates once, straight to the remembered channel',
    (WidgetTester tester) async {
      final _Harness harness = await _start(tester, enabled: false);
      await _expectDirectNavigation(tester, harness);
    },
  );

  testWidgets(
    'selectGuild opens the remembered channel directly when enabled',
    (WidgetTester tester) async {
      final _Harness harness = await _start(tester, enabled: true);
      await _expectDirectNavigation(tester, harness);
    },
  );

  testWidgets('selectGuild falls back to the guild root redirect once', (
    WidgetTester tester,
  ) async {
    final _Harness harness = await _start(tester, enabled: false);
    await tester.runAsync(
      () => harness.db.guildLastChannelDao.removeGuild('g2'),
    );
    expect(peekGuildLastChannelId(harness.container, 'g2'), isNull);

    await tester.runAsync(
      () => DrawerNavigationCoordinator.selectGuild(harness.container, 'g2'),
    );
    await _settle(tester);

    expect(harness.path, '/channels/g2/g2-general');
    expect(harness.guildRootRedirects, <String>['/channels/g2']);
    expect(harness.chat.switchedTo, isEmpty);
  });

  test('the last channel memory is seeded from the database', () async {
    final FluxerDatabase db = await _seed();
    addTearDown(db.close);
    await db
        .into(db.guildLastChannels)
        .insert(
          GuildLastChannelsCompanion.insert(
            guildId: 'g2',
            channelId: 'g2-chat',
          ),
        );
    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);
    expect(peekGuildLastChannelId(container, 'g2'), isNull);

    await container.read(guildLastChannelMemoryProvider).seedMemory();

    expect(peekGuildLastChannelId(container, 'g2'), 'g2-chat');
  });
}
