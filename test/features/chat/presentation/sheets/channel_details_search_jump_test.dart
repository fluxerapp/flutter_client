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
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

/// The user's report: search a message, tap the result, and the search page
/// closes while the DETAILS sheet stays put, so the message is never reached.
///
/// Search and details attach to the nearest Navigator. A flat harness attaches
/// them to go_router's own Navigator, which `go()` then rebuilds, dismissing
/// them for reasons that have nothing to do with the code under test. The real
/// app opens them inside a shell branch navigator that survives `go()`. This
/// harness reproduces that by nesting a Navigator, so a details sheet that is
/// never popped really does stay on screen.
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
    // Not the navigator that renders this test: the app under test keeps its
    // sheets on a nested navigator, so routing must not tear the tree down.
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

  /// Mounts the app with a NESTED navigator, which is the structural property
  /// that makes the real app differ: sheets attach here, and nothing the
  /// router does removes them.
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
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
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

  // Defends the HAND OFF, not ordering: with no sheet stacked above it there
  // is no ordering to get wrong here, so this cannot fail on a mis-sequenced
  // dismissal. It does fail if the picked message never reaches the opener,
  // which is the contract it exists to pin.
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

    // This path traverses three routes: the action menu, the details sheet,
    // then the navigation. Each must leave the navigator stack before the
    // next step, so every pop targets the route it means to. Note this
    // asserts stack membership, not animation completion: Route.popped
    // resolves on removal from the stack, not when the transition ends.
    await tester.longPress(find.byType(MessagePreviewTile).first);
    await tester.pumpAndSettle();
    final Finder jumpItem = find.text('Jump to Message');
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
