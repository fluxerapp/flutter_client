import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/deep_links/deep_link_handler.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_route.dart';
import 'package:fluxer_app/core/push/push_notification_path_resolver.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_spec.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_gate.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/create_channel_sheet.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_settings_providers.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_icon_button.dart';
import 'package:fluxer_app/features/guilds/utils/guild_settings_actions.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_calculator.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_repository.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_channel_settings_providers.dart';
import 'package:fluxer_app/features/threads/presentation/create_thread_sheet.dart';
import 'package:fluxer_app/features/threads/presentation/thread_header_buttons.dart';
import 'package:fluxer_app/features/threads/presentation/thread_messages.dart';
import 'package:fluxer_app/features/threads/presentation/thread_route_gate.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:go_router/go_router.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../helpers/instance_runtime_config_override.dart';
import '../../helpers/open_test_database.dart';
import '../../helpers/pump_fluxer_app.dart';
import '../../helpers/test_l10n.dart';

const String _guildId = 'g1';
const String _textId = 'c1';
const String _forumId = 'f1';
const String _mediaId = 'm1';
const String _threadId = 't1';
const String _postId = 'p1';

Map<String, Object?> _channelJson(String id, int type, {String? parentId}) =>
    <String, Object?>{
      'id': id,
      'type': type,
      'guild_id': _guildId,
      'name': id,
      'position': 0,
      'parent_id': ?parentId,
    };

final List<Map<String, Object?>> _mixedChannels = <Map<String, Object?>>[
  _channelJson(_textId, 0),
  _channelJson(_forumId, 15),
  _channelJson(_mediaId, 16),
  _channelJson(_threadId, 11, parentId: _textId),
  _channelJson('t10', 10, parentId: _textId),
  _channelJson('t12', 12, parentId: _textId),
];

class _JsonAdapter implements HttpClientAdapter {
  _JsonAdapter(this.body);

  final Object? body;
  final List<String> paths = <String>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    paths.add(options.path);
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Dio _dio(HttpClientAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://api.test'))..httpClientAdapter = adapter;

db.ChannelsCompanion _row(
  String id,
  int type, {
  String? parentId,
  String? lastMessageId,
}) => db.ChannelsCompanion.insert(
  id: id,
  guildId: _guildId,
  name: id,
  type: Value(type),
  parentId: Value(parentId),
  lastMessageId: Value(lastMessageId),
);

Future<void> _seedRows(db.FluxerDatabase database) =>
    database.channelDao.upsertChannels(<db.ChannelsCompanion>[
      _row(_textId, 0),
      _row(_forumId, 15),
      _row(_mediaId, 16),
      _row(_threadId, 11, parentId: _textId),
      _row(_postId, 11, parentId: _forumId),
    ]);

String _recentSnowflake() =>
    ((DateTime.now()
                    .toUtc()
                    .subtract(const Duration(hours: 1))
                    .millisecondsSinceEpoch -
                kSnowflakeEpochMs) <<
            22)
        .toString();

class _RecordingDeepLinks extends DeepLinkHandler {
  final List<String> paths = <String>[];

  @override
  void build() {}

  @override
  void handlePath(String path) => paths.add(path);
}

Channel _channel(String id, ChannelType type, {String? parentId}) => Channel(
  id: id,
  guildId: _guildId,
  name: id,
  type: type,
  parentId: parentId,
);

Future<void> _unmount(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(milliseconds: 1));
}

Widget _themed({required Widget child, List<Override> overrides = const []}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: <Override>[instanceRuntimeConfigOverride(), ...overrides],
    child: child is MaterialApp
        ? child
        : MaterialApp(
            locale: kTestLocale,
            localizationsDelegates: FluxerLocalizations.localizationsDelegates,
            supportedLocales: FluxerLocalizations.supportedLocales,
            theme: buildFluxerTheme(
              colorTheme: colorTheme,
              textTheme: FluxerTextTheme.fromColors(colorTheme),
              layoutTheme: FluxerLayoutTheme.scaled(),
            ),
            home: child,
          ),
  );
}

void main() {
  group('REST ingest', () {
    test(
      'a channel list drops gated types while the guild is inactive',
      () async {
        final db.FluxerDatabase database = openTestDatabase();
        final Dio dio = _dio(_JsonAdapter(_mixedChannels));
        final ThreadsGate gate = ThreadsGate();
        final ChannelRepository repository = ChannelRepository(
          FluxerClient(dio),
          dio,
          database,
          threadsGate: gate,
        );

        await repository.getChannels(_guildId);

        expect(
          (await database.channelDao.getChannels(
            _guildId,
            includeThreads: true,
          )).map((db.Channel c) => c.id),
          <String>[_textId],
        );

        gate.apply(_guildId, active: true);
        await repository.getChannels(_guildId);

        expect(
          await database.channelDao.getChannels(_guildId, includeThreads: true),
          hasLength(_mixedChannels.length),
        );
      },
    );

    test('a repository without a gate never stores gated types', () async {
      final db.FluxerDatabase database = openTestDatabase();
      final Dio dio = _dio(_JsonAdapter(_mixedChannels));

      await ChannelRepository(
        FluxerClient(dio),
        dio,
        database,
      ).getChannels(_guildId);

      expect(
        (await database.channelDao.getChannels(
          _guildId,
          includeThreads: true,
        )).map((db.Channel c) => c.id),
        <String>[_textId],
      );
    });

    test('search results drop gated channel types while inactive', () async {
      final db.FluxerDatabase database = openTestDatabase();
      final ThreadsGate gate = ThreadsGate();
      final MessageSearchRepository repository = MessageSearchRepository(
        FluxerClient(
          _dio(
            _JsonAdapter(<String, Object?>{
              'messages': <Object?>[],
              'channels': _mixedChannels,
              'total': 0,
              'hits_per_page': 25,
              'page': 1,
            }),
          ),
        ),
        database,
        'u1',
        threadsGate: gate,
      );
      final MessageSearchQuery query = MessageSearchQuery.build(
        channelId: _textId,
        guildId: _guildId,
        rawQuery: 'hello',
      );

      await repository.searchMessages(query);

      expect(
        (await database.channelDao.getChannels(
          _guildId,
          includeThreads: true,
        )).map((db.Channel c) => c.id),
        <String>[_textId],
      );

      gate.apply(_guildId, active: true);
      await repository.searchMessages(query);

      expect(
        await database.channelDao.getChannels(_guildId, includeThreads: true),
        hasLength(_mixedChannels.length),
      );
    });
  });

  group('cached rows', () {
    test('quick switcher lists no thread or forum without the gate', () async {
      final db.FluxerDatabase database = openTestDatabase();
      await _seedRows(database);
      final QuickSwitcherRepository repository = QuickSwitcherRepository(
        database,
      );

      expect(
        (await repository.getGuildChannels()).map((Channel c) => c.id),
        <String>[_textId],
      );
      expect(
        (await repository.getGuildChannels(
          threadGuildIds: <String>{'other'},
        )).map((Channel c) => c.id),
        <String>[_textId],
      );
      expect(
        (await repository.getGuildChannels(
          threadGuildIds: <String>{_guildId},
        )).map((Channel c) => c.id).toSet(),
        <String>{_textId, _forumId, _mediaId, _threadId, _postId},
      );
    });

    test('notification settings list no forum without the gate', () async {
      final db.FluxerDatabase database = openTestDatabase();
      await _seedRows(database);

      expect(
        (await getGuildChannelsForSettings(
          db: database,
          guildId: _guildId,
        )).map((c) => c.id),
        <String>[_textId],
      );
      expect(
        (await getGuildChannelsForSettings(
          db: database,
          guildId: _guildId,
          threadsActive: true,
        )).map((c) => c.id).toSet(),
        <String>{_textId, _forumId, _mediaId},
      );
    });

    test('marking a guild read never acks a forum without the gate', () async {
      final db.FluxerDatabase database = openTestDatabase();
      await database.channelDao.upsertChannels(<db.ChannelsCompanion>[
        _row(_textId, 0, lastMessageId: '10'),
        _row(_forumId, 15, lastMessageId: '11'),
        _row(_threadId, 11, parentId: _textId, lastMessageId: '12'),
      ]);
      final List<Object?> bodies = <Object?>[];
      final Dio dio = Dio()
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (RequestOptions options, RequestInterceptorHandler h) {
              bodies.add(options.data);
              h.resolve(
                Response<void>(requestOptions: options, statusCode: 204),
              );
            },
          ),
        );

      await markGuildAsRead(_guildId, database, FluxerClient(dio));
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect(await database.readStateDao.getReadState(_forumId), isNull);
      expect(await database.readStateDao.getReadState(_threadId), isNull);
      expect(jsonEncode(bodies), isNot(contains(_forumId)));
      expect(jsonEncode(bodies), isNot(contains(_threadId)));
      expect(jsonEncode(bodies), contains(_textId));
    });

    test('the unread inbox lists no forum without the gate', () async {
      final db.FluxerDatabase database = openTestDatabase();
      await database.guildDao.upsertServer(
        db.ServersCompanion.insert(id: _guildId, name: 'Guild'),
      );
      await database.channelDao.upsertChannels(<db.ChannelsCompanion>[
        _row(_textId, 0, lastMessageId: _recentSnowflake()),
        _row(_forumId, 15, lastMessageId: _recentSnowflake()),
      ]);
      await database.memberDao.upsertMember(
        db.MembersCompanion.insert(
          userId: 'u1',
          guildId: _guildId,
          joinedAt: Value(DateTime.utc(2020, 1, 15)),
        ),
      );

      final List<UnreadInboxEntry> off = await UnreadInboxCalculator.compute(
        database,
        collapsedByChannelId: <String, bool>{},
        currentUserId: 'u1',
      );
      final List<UnreadInboxEntry> on = await UnreadInboxCalculator.compute(
        database,
        collapsedByChannelId: <String, bool>{},
        currentUserId: 'u1',
        threadGuildIds: <String>{_guildId},
      );

      expect(off.map((UnreadInboxEntry e) => e.channelId), <String>[_textId]);
      expect(on.map((UnreadInboxEntry e) => e.channelId).toSet(), <String>{
        _textId,
        _forumId,
      });
    });

    test('guild channel settings list no forum without the gate', () async {
      final db.FluxerDatabase database = openTestDatabase();
      await _seedRows(database);
      final Dio dio = _dio(_JsonAdapter(<Object?>[_channelJson(_textId, 0)]));
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          channelRepositoryProvider.overrideWithValue(
            ChannelRepository(FluxerClient(dio), dio, database),
          ),
        ],
      );
      addTearDown(container.dispose);

      final ProviderSubscription<AsyncValue<List<Channel>>> off = container
          .listen(guildChannelSettingsChannelsProvider(_guildId), (_, _) {});
      addTearDown(off.close);
      expect(
        (await container.read(
          guildChannelSettingsChannelsProvider(_guildId).future,
        )).map((Channel c) => c.id),
        <String>[_textId],
      );

      container.read(threadsGateProvider).apply(_guildId, active: true);
      expect(
        (await container.read(
          guildChannelSettingsChannelsProvider(_guildId).future,
        )).map((Channel c) => c.id).toSet(),
        <String>{_textId, _forumId, _mediaId},
      );
    });

    test('an inactive guild groups no sidebar threads', () async {
      final db.FluxerDatabase database = openTestDatabase();
      await _seedRows(database);
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          fluxerDatabaseProvider.overrideWithValue(database),
          activeChannelIdProvider.overrideWithValue(_threadId),
        ],
      );
      addTearDown(container.dispose);

      addTearDown(
        container.listen(activeGuildThreadsProvider(_guildId), (_, _) {}).close,
      );
      addTearDown(
        container
            .listen(parentThreadsProvider(_guildId, _textId), (_, _) {})
            .close,
      );

      expect(container.read(sidebarThreadsByParentProvider(_guildId)), isEmpty);
      expect(
        await container.read(activeGuildThreadsProvider(_guildId).future),
        isEmpty,
      );
      expect(
        await container.read(parentThreadsProvider(_guildId, _textId).future),
        isEmpty,
      );
    });
  });

  group('navigation', () {
    test('a gated last channel is not restored once the gate is off', () async {
      final db.FluxerDatabase database = openTestDatabase();
      await _seedRows(database);

      for (final String gated in <String>[_forumId, _mediaId, _threadId]) {
        await database.guildLastChannelDao.setLastChannel(_guildId, gated);

        expect(
          await resolveGuildRootRedirect(
            guildId: _guildId,
            fullPath: RoutePaths.guild(_guildId),
            db: database,
            restoreThreadChannels: false,
          ),
          RoutePaths.guildChannel(_guildId, _textId),
        );
        expect(
          await resolveGuildRootRedirect(
            guildId: _guildId,
            fullPath: RoutePaths.guild(_guildId),
            db: database,
          ),
          RoutePaths.guildChannel(_guildId, gated),
        );
      }
    });

    test('a thread push names its guild and parent', () {
      expect(
        resolvePushNotificationThreadParent(<String, String>{
          'guild_id': _guildId,
          'channel_id': _threadId,
          'parent_id': _textId,
        }),
        (guildId: _guildId, parentId: _textId),
      );
      expect(
        resolvePushNotificationThreadParent(<String, String>{
          'guild_id': _guildId,
          'channel_id': _textId,
        }),
        isNull,
      );
      expect(
        resolvePushNotificationThreadParent(<String, String>{
          'channel_id': 'dm',
          'parent_id': _textId,
        }),
        isNull,
      );
    });

    test('a pending thread push is not a preferred path while inactive', () {
      const PendingPushNotificationRoute pending = PendingPushNotificationRoute(
        path: '/channels/g1/t1',
        threadParent: (guildId: _guildId, parentId: _textId),
      );

      expect(
        currentAccountPendingNavigationPath(
          pending: pending,
          currentUserId: 'u1',
        ),
        isNull,
      );
      expect(
        currentAccountPendingNavigationPath(
          pending: pending,
          currentUserId: 'u1',
          threadsActive: (String guildId) => false,
        ),
        isNull,
      );
      expect(
        currentAccountPendingNavigationPath(
          pending: pending,
          currentUserId: 'u1',
          threadsActive: (String guildId) => guildId == _guildId,
        ),
        '/channels/g1/t1',
      );
    });

    group('push tap', () {
      late db.FluxerDatabase database;
      late _RecordingDeepLinks deepLinks;
      late ProviderContainer container;

      setUp(() async {
        database = openTestDatabase();
        await _seedRows(database);
        deepLinks = _RecordingDeepLinks();
        container = ProviderContainer(
          overrides: <Override>[
            fluxerDatabaseProvider.overrideWithValue(database),
            deepLinkHandlerProvider.overrideWith(() => deepLinks),
          ],
        );
        addTearDown(container.dispose);
        container
            .read(authStateProvider.notifier)
            .setAuthenticated(value: true);
      });

      Future<void> tap(String threadId, String parentId) async {
        container
            .read(pendingPushNotificationPathProvider.notifier)
            .store(
              RoutePaths.guildChannel(_guildId, threadId),
              threadParent: (guildId: _guildId, parentId: parentId),
            );
        container.read(gatewayReadyProvider.notifier).setReady();
        await Future<void>.delayed(const Duration(milliseconds: 20));
      }

      test('falls back to the parent while the guild is inactive', () async {
        await tap(_threadId, _textId);

        expect(deepLinks.paths, <String>[
          RoutePaths.guildChannel(_guildId, _textId),
        ]);
        expect(container.read(pendingPushNotificationPathProvider), isNull);
      });

      test('falls back to the guild when the parent is a forum', () async {
        await tap(_postId, _forumId);

        expect(deepLinks.paths, <String>[RoutePaths.guild(_guildId)]);
      });

      test('falls back to the guild when the parent is unknown', () async {
        await tap(_threadId, 'missing');

        expect(deepLinks.paths, <String>[RoutePaths.guild(_guildId)]);
      });

      test('opens the thread while the guild is active', () async {
        container.read(threadsGateProvider).apply(_guildId, active: true);
        await tap(_threadId, _textId);

        expect(deepLinks.paths, <String>[
          RoutePaths.guildChannel(_guildId, _threadId),
        ]);
      });
    });
  });

  group('UI', () {
    test('permission editors offer no thread bits without the gate', () {
      final Set<String> threadTitles = <String>{
        for (final permission in threadPermissionOrder)
          permissionTitle(testL10n, permission),
      };
      Set<String> titles(List<GuildPermissionCategorySpec> specs) => <String>{
        for (final GuildPermissionCategorySpec spec in specs)
          for (final GuildPermissionEntry entry in spec.permissions)
            entry.title,
      };

      expect(
        titles(
          generateGuildPermissionSpec(testL10n),
        ).intersection(threadTitles),
        isEmpty,
      );
      for (final ChannelType type in ChannelType.values) {
        expect(
          titles(
            generateChannelPermissionSpec(testL10n, type),
          ).intersection(threadTitles),
          isEmpty,
        );
      }
      expect(
        titles(
          generateGuildPermissionSpec(testL10n, threads: true),
        ).intersection(threadTitles),
        threadTitles,
      );
    });

    testWidgets('thread system messages render nothing without the gate', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        pumpFluxerApp(
          child: const Column(
            children: <Widget>[
              ThreadMessageGate(guildId: _guildId, child: Text('created')),
              ThreadMessageGate(guildId: null, child: Text('dm')),
            ],
          ),
        ),
      );

      expect(find.text('created'), findsNothing);
      expect(find.text('dm'), findsNothing);

      ProviderScope.containerOf(
        tester.element(find.byType(Column)),
      ).read(threadsGateProvider).apply(_guildId, active: true);
      await tester.pump();

      expect(find.text('created'), findsOneWidget);
      expect(find.text('dm'), findsNothing);
    });

    testWidgets(
      'messages offer no thread chip or create action without the gate',
      (WidgetTester tester) async {
        final Message message = Message(
          id: _threadId,
          channelId: _textId,
          authorId: 'u2',
          authorName: 'author',
          content: 'hello',
          timestamp: DateTime.utc(2026, 9, 28),
          flags: messageFlagHasThread,
          threadJson: jsonEncode(<String, Object?>{
            'name': 'release plan',
            'message_count': 3,
          }),
        );
        final Message plain = Message(
          id: 'm2',
          channelId: _textId,
          authorId: 'u2',
          authorName: 'author',
          content: 'hello',
          timestamp: DateTime.utc(2026, 9, 28),
        );
        bool? canCreate;
        await tester.pumpWidget(
          pumpFluxerApp(
            overrides: <Override>[
              channelByIdProvider(_textId).overrideWith(
                (ref) => Stream<Channel?>.value(
                  _channel(_textId, ChannelType.guildText),
                ),
              ),
              channelByIdProvider(
                _threadId,
              ).overrideWith((ref) => Stream<Channel?>.value(null)),
              channelGuildIdProvider(
                _textId,
              ).overrideWith((ref) => Stream<String?>.value(_guildId)),
            ],
            child: Scaffold(
              body: Column(
                children: <Widget>[
                  MessageThreadChip(message: message, guildId: _guildId),
                  MessageThreadChip(message: message, guildId: null),
                  ThreadStarterMessage(message: message, guildId: _guildId),
                  ThreadFailedToMentionRolesNote(
                    message: message,
                    guildId: _guildId,
                  ),
                  Consumer(
                    builder: (BuildContext context, WidgetRef ref, _) {
                      canCreate = watchCanCreateThreadFromMessage(ref, plain);
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
        await pumpFluxerFramesQuick(tester);

        expect(find.text('release plan'), findsNothing);
        expect(find.byType(InkWell), findsNothing);
        expect(find.byType(ThreadStarterDeletedNotice), findsNothing);
        expect(canCreate, isFalse);

        ProviderScope.containerOf(
          tester.element(find.byType(Column)),
        ).read(threadsGateProvider).apply(_guildId, active: true);
        await pumpFluxerFramesQuick(tester);

        expect(find.text('release plan'), findsNWidgets(2));
        await _unmount(tester);
      },
    );

    testWidgets(
      'the channel header offers no thread actions without the gate',
      (WidgetTester tester) async {
        final Channel text = _channel(_textId, ChannelType.guildText);
        final Channel thread = _channel(
          _threadId,
          ChannelType.publicThread,
          parentId: _textId,
        );
        await tester.pumpWidget(
          pumpFluxerApp(
            child: Column(
              children: <Widget>[
                ThreadHeaderMobileButton(channel: text),
                ThreadHeaderToolbarButtons(channel: text),
                ThreadHeaderMobileButton(channel: thread),
                ThreadHeaderToolbarButtons(channel: thread),
              ],
            ),
          ),
        );

        expect(find.byType(FluxerButton), findsNothing);
        expect(find.byType(ChannelHeaderIconButton), findsNothing);
      },
    );

    testWidgets(
      'the create channel sheet offers forum and media only when active',
      (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(const Size(1400, 1000));
        addTearDown(() => tester.binding.setSurfaceSize(null));
        late BuildContext host;
        await tester.pumpWidget(
          pumpFluxerApp(
            child: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  host = context;
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        );

        unawaited(CreateChannelSheet.show(host, guildId: _guildId));
        await pumpFluxerFrames(tester);

        expect(find.text(testL10n.guildNavbarLinkChannel), findsOneWidget);
        expect(find.text(testL10n.forumChannelTypeForum), findsNothing);
        expect(find.text(testL10n.forumChannelTypeMedia), findsNothing);

        Navigator.of(host, rootNavigator: true).pop();
        await pumpFluxerFrames(tester);
        ProviderScope.containerOf(
          host,
        ).read(threadsGateProvider).apply(_guildId, active: true);
        unawaited(CreateChannelSheet.show(host, guildId: _guildId));
        await pumpFluxerFrames(tester);

        expect(find.text(testL10n.forumChannelTypeForum), findsOneWidget);
        expect(find.text(testL10n.forumChannelTypeMedia), findsOneWidget);
      },
    );

    testWidgets('channel settings close for a forum without the gate', (
      WidgetTester tester,
    ) async {
      final GoRouter router = GoRouter(
        initialLocation: '/',
        routes: <RouteBase>[
          GoRoute(path: '/', builder: (_, _) => const Text('home')),
          GoRoute(
            path: '/settings',
            builder: (_, _) => ChannelSettingsGate(
              channelId: _forumId,
              builder: (_, _, _, _) => const Text('forum settings'),
            ),
          ),
        ],
      );
      addTearDown(router.dispose);
      final colorTheme = buildDarkColorTheme();
      await tester.pumpWidget(
        _themed(
          overrides: <Override>[
            fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
            channelByIdProvider(_forumId).overrideWith(
              (ref) => Stream<Channel?>.value(
                _channel(_forumId, ChannelType.guildForum),
              ),
            ),
            channelSettingsPermissionBitsProvider(
              _forumId,
            ).overrideWith((ref) => Future<int?>.value(-1)),
          ],
          child: MaterialApp.router(
            routerConfig: router,
            locale: kTestLocale,
            localizationsDelegates: FluxerLocalizations.localizationsDelegates,
            supportedLocales: FluxerLocalizations.supportedLocales,
            theme: buildFluxerTheme(
              colorTheme: colorTheme,
              textTheme: FluxerTextTheme.fromColors(colorTheme),
              layoutTheme: FluxerLayoutTheme.scaled(),
            ),
          ),
        ),
      );
      unawaited(router.push('/settings'));
      await pumpFluxerFramesQuick(tester);
      await pumpFluxerFramesQuick(tester);

      expect(find.text('forum settings'), findsNothing);
      expect(find.text('home'), findsOneWidget);
      await _unmount(tester);
    });

    group('route gate', () {
      late GoRouter router;

      setUp(() {
        router = GoRouter(
          initialLocation: '/start',
          routes: <RouteBase>[
            GoRoute(path: '/start', builder: (_, _) => const Text('start')),
            GoRoute(
              path: '/channels/:guildId',
              builder: (_, _) => const Text('guild root'),
            ),
            GoRoute(
              path: '/channels/:guildId/:channelId',
              builder: (_, GoRouterState state) => ThreadRouteGate(
                guildId: state.pathParameters['guildId']!,
                channelId: state.pathParameters['channelId']!,
                child: Text('view ${state.pathParameters['channelId']}'),
              ),
            ),
          ],
        );
        addTearDown(router.dispose);
      });

      String location() => router.routeInformationProvider.value.uri.path;

      Future<ProviderContainer> open(
        WidgetTester tester,
        String channelId, {
        required bool ready,
        bool active = false,
      }) async {
        await tester.binding.setSurfaceSize(const Size(1400, 1000));
        addTearDown(() => tester.binding.setSurfaceSize(null));
        final Map<String, Channel> rows = <String, Channel>{
          _textId: _channel(_textId, ChannelType.guildText),
          _forumId: _channel(_forumId, ChannelType.guildForum),
          _mediaId: _channel(_mediaId, ChannelType.guildMedia),
          _threadId: _channel(
            _threadId,
            ChannelType.publicThread,
            parentId: _textId,
          ),
          _postId: _channel(
            _postId,
            ChannelType.publicThread,
            parentId: _forumId,
          ),
        };
        final colorTheme = buildDarkColorTheme();
        await tester.pumpWidget(
          _themed(
            overrides: <Override>[
              fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
              fluxerRouterProvider.overrideWithValue(router),
              for (final MapEntry<String, Channel> row in rows.entries)
                channelByIdProvider(
                  row.key,
                ).overrideWith((ref) => Stream<Channel?>.value(row.value)),
            ],
            child: MaterialApp.router(
              routerConfig: router,
              locale: kTestLocale,
              localizationsDelegates:
                  FluxerLocalizations.localizationsDelegates,
              supportedLocales: FluxerLocalizations.supportedLocales,
              theme: buildFluxerTheme(
                colorTheme: colorTheme,
                textTheme: FluxerTextTheme.fromColors(colorTheme),
                layoutTheme: FluxerLayoutTheme.scaled(),
              ),
            ),
          ),
        );
        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.text('start')),
        );
        if (ready) {
          container.read(gatewayReadyProvider.notifier).setReady();
        }
        if (active) {
          container.read(threadsGateProvider).apply(_guildId, active: true);
        }
        router.go(RoutePaths.guildChannel(_guildId, channelId));
        await pumpFluxerFramesQuick(tester);
        await pumpFluxerFramesQuick(tester);
        return container;
      }

      testWidgets('holds a cached forum on the loading shell before READY', (
        WidgetTester tester,
      ) async {
        await open(tester, _forumId, ready: false);

        expect(find.text('view $_forumId'), findsNothing);
        expect(location(), RoutePaths.guildChannel(_guildId, _forumId));
        await _unmount(tester);
      });

      testWidgets('holds a cached thread on the loading shell before READY', (
        WidgetTester tester,
      ) async {
        await open(tester, _threadId, ready: false);

        expect(find.text('view $_threadId'), findsNothing);
        await _unmount(tester);
      });

      testWidgets('sends an inactive forum or media channel to the guild', (
        WidgetTester tester,
      ) async {
        await open(tester, _mediaId, ready: true);

        expect(find.text('view $_mediaId'), findsNothing);
        expect(location(), RoutePaths.guild(_guildId));
        await _unmount(tester);
      });

      testWidgets('sends an inactive thread to its text parent', (
        WidgetTester tester,
      ) async {
        await open(tester, _threadId, ready: true);

        expect(find.text('view $_threadId'), findsNothing);
        expect(location(), RoutePaths.guildChannel(_guildId, _textId));
        expect(find.text('view $_textId'), findsOneWidget);
        await _unmount(tester);
      });

      testWidgets('sends an inactive forum post to the guild', (
        WidgetTester tester,
      ) async {
        await open(tester, _postId, ready: true);

        expect(find.text('view $_postId'), findsNothing);
        expect(location(), RoutePaths.guild(_guildId));
        await _unmount(tester);
      });

      testWidgets('leaves ordinary channels alone', (
        WidgetTester tester,
      ) async {
        await open(tester, _textId, ready: true);

        expect(find.text('view $_textId'), findsOneWidget);
        await _unmount(tester);
      });

      testWidgets('shows forums and threads once the guild is active', (
        WidgetTester tester,
      ) async {
        await open(tester, _forumId, ready: true, active: true);
        expect(find.text('view $_forumId'), findsOneWidget);

        router.go(RoutePaths.guildChannel(_guildId, _threadId));
        await pumpFluxerFramesQuick(tester);
        expect(find.text('view $_threadId'), findsOneWidget);
        await _unmount(tester);
      });

      testWidgets('a mid-session flip moves an open forum to the guild', (
        WidgetTester tester,
      ) async {
        final ProviderContainer container = await open(
          tester,
          _forumId,
          ready: true,
          active: true,
        );
        expect(find.text('view $_forumId'), findsOneWidget);

        container.read(threadsGateProvider).apply(_guildId, active: false);
        await pumpFluxerFramesQuick(tester);
        await pumpFluxerFramesQuick(tester);

        expect(find.text('view $_forumId'), findsNothing);
        expect(location(), RoutePaths.guild(_guildId));
        await _unmount(tester);
      });
    });
  });
}
