import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show ChannelsCompanion, FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/data/channel_pins_repository.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/members/providers/member_list_subscription_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../../helpers/instance_runtime_config_override.dart';
import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _guildId = 'guild_1';
const String _channelId = 'chan_1';
const String _messageId = '1000000000000000000';
const String _targetPath = '/channels/$_guildId/$_channelId/$_messageId';
const Channel _channel = Channel(
  id: _channelId,
  guildId: _guildId,
  name: 'general',
);

class _FakeAppearance extends AppearancePreferences {
  @override
  AppearancePreferencesState build() =>
      const AppearancePreferencesState(showFavorites: false);
}

class _SeededSearch extends ChannelSearch {
  @override
  ChannelSearchState build(String channelId, String? guildId) {
    return ChannelSearchState(
      query: MessageSearchQuery(
        channelId: channelId,
        guildId: guildId,
        rawQuery: 'hello',
      ),
      hasSearched: true,
      total: 1,
      results: <MessageSearchResultEntry>[
        MessageSearchResultEntry(
          guildId: guildId,
          message: Message(
            id: _messageId,
            channelId: channelId,
            authorId: '1000000000000000009',
            authorName: 'Author',
            content: 'hello there',
            timestamp: DateTime.utc(2024),
          ),
        ),
      ],
    );
  }
}

class _SeededPins extends ChannelPins {
  @override
  Future<ChannelPinsState> build(String channelId) async {
    return ChannelPinsState(
      items: <PinnedMessageEntry>[
        PinnedMessageEntry(
          message: Message(
            id: _messageId,
            channelId: channelId,
            authorId: '1000000000000000009',
            authorName: 'Author',
            content: 'pinned there',
            timestamp: DateTime.utc(2024),
          ),
          pinnedAt: DateTime.utc(2024),
        ),
      ],
      hasMore: false,
    );
  }
}

void main() {
  late FluxerDatabase database;
  late GoRouter router;

  setUp(() async {
    database = openTestDatabase();
    await database.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: _channelId,
        guildId: _guildId,
        name: 'general',
        type: const Value(0),
      ),
    );
    router = GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const SizedBox.shrink(),
        ),
        GoRoute(
          path: '/channels/:guildId/:channelId/:messageId',
          builder: (BuildContext context, GoRouterState state) =>
              const SizedBox.shrink(),
        ),
      ],
    );
    addTearDown(router.dispose);
  });

  ProviderContainer buildContainer() {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerDatabaseProvider.overrideWithValue(database),
        fluxerRouterProvider.overrideWithValue(router),
        activeChannelIdProvider.overrideWithValue(null),
        appearancePreferencesProvider.overrideWith(_FakeAppearance.new),
        memberListDetailsSubscriptionProvider(
          _guildId,
          _channelId,
          true,
        ).overrideWith((ref) {}),
        channelSearchProvider(
          _channelId,
          _guildId,
        ).overrideWith(_SeededSearch.new),
        channelPinsProvider(_channelId).overrideWith(_SeededPins.new),
      ],
    );
    addTearDown(container.dispose);
    container.read(gatewayReadyProvider.notifier).setReady();
    return container;
  }

  Future<BuildContext> pumpNestedHost(
    WidgetTester tester,
    ProviderContainer container,
  ) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    late BuildContext nested;
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: buildDarkColorTheme(),
            textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Navigator(
            onGenerateRoute: (RouteSettings settings) =>
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    nested = context;
                    return const Scaffold(body: Text('home'));
                  },
                ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return nested;
  }

  testWidgets('tapping a search result dismisses both sheets and jumps', (
    tester,
  ) async {
    final ProviderContainer container = buildContainer();

    final BuildContext nestedContext = await pumpNestedHost(tester, container);

    unawaited(
      showChannelDetailsSheetAndJump(
        nestedContext,
        container: container,
        channel: _channel,
        dm: null,
        openSearchImmediately: true,
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.byType(ChannelDetailsSheet, skipOffstage: false),
      findsOneWidget,
    );
    expect(
      find.byType(ChannelSearchPage),
      findsOneWidget,
      reason: 'the search page must be stacked on the details sheet',
    );

    await tester.tap(find.byType(MessagePreviewTile).first);
    await tester.pumpAndSettle();

    expect(
      find.byType(ChannelSearchPage, skipOffstage: false),
      findsNothing,
      reason: 'the search page must be gone',
    );
    expect(
      find.byType(ChannelDetailsSheet, skipOffstage: false),
      findsNothing,
      reason: 'the details sheet must be gone too, not left covering the chat',
    );
    expect(
      router.routeInformationProvider.value.uri.path,
      _targetPath,
      reason: 'and the jump must actually have run',
    );
  });

  testWidgets('tapping a pinned message reports through completeWithResult', (
    tester,
  ) async {
    final ProviderContainer container = buildContainer();
    ChannelDetailsJumpRequest? captured;
    final ScrollController scrollController = ScrollController();
    addTearDown(scrollController.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: buildDarkColorTheme(),
            textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Scaffold(
            body: ChannelDetailsSheet(
              channel: _channel,
              dm: null,
              initialTab: ChannelDetailsInitialTab.pins,
              openSearchImmediately: false,
              scrollController: scrollController,
              close: () {},
              completeWithResult: (ChannelDetailsJumpRequest request) {
                captured = request;
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(MessagePreviewTile).first);
    await tester.pumpAndSettle();

    expect(captured, isNotNull);
    expect(captured!.message.id, _messageId);
  });

  testWidgets('tapping a pinned message hands the jump to its opener', (
    tester,
  ) async {
    final ProviderContainer container = buildContainer();
    final BuildContext nestedContext = await pumpNestedHost(tester, container);

    unawaited(
      showChannelDetailsSheetAndJump(
        nestedContext,
        container: container,
        channel: _channel,
        dm: null,
        initialTab: ChannelDetailsInitialTab.pins,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(ChannelDetailsSheet), findsOneWidget);
    expect(
      find.byType(MessagePreviewTile),
      findsWidgets,
      reason: 'the pins tab must have rendered the seeded pin',
    );

    await tester.tap(find.byType(MessagePreviewTile).first);
    await tester.pumpAndSettle();

    expect(
      find.byType(ChannelDetailsSheet),
      findsNothing,
      reason: 'the details sheet must be gone, not left covering the chat',
    );
    expect(
      router.routeInformationProvider.value.uri.path,
      _targetPath,
      reason: 'and the jump must actually have run',
    );
  });

  testWidgets('long pressing a pin and jumping clears every modal layer', (
    tester,
  ) async {
    final ProviderContainer container = buildContainer();
    final BuildContext nestedContext = await pumpNestedHost(tester, container);

    unawaited(
      showChannelDetailsSheetAndJump(
        nestedContext,
        container: container,
        channel: _channel,
        dm: null,
        initialTab: ChannelDetailsInitialTab.pins,
      ),
    );
    await tester.pumpAndSettle();

    await tester.longPress(find.byType(MessagePreviewTile).first);
    await tester.pumpAndSettle();
    final Finder jumpItem = find.text('Jump to message');
    expect(jumpItem, findsOneWidget, reason: 'the action menu must be open');

    await tester.tap(jumpItem);
    await tester.pumpAndSettle();

    expect(jumpItem, findsNothing, reason: 'the action menu must be gone');
    expect(
      find.byType(ChannelDetailsSheet),
      findsNothing,
      reason: 'the details sheet must be gone too',
    );
    expect(
      router.routeInformationProvider.value.uri.path,
      _targetPath,
      reason: 'and the jump must actually have run',
    );
  });
}
