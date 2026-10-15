import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_cache.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_meta.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_view.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_channel_inbox_card.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

UnreadChannelInboxCard _card() {
  return UnreadChannelInboxCard(
    row: UnreadInboxRow(
      entry: const UnreadInboxEntry(
        channelId: 'channel-1',
        guildId: 'guild-1',
        isDm: false,
        mentionCount: 0,
        isCollapsed: true,
        recencyComparator: 1,
        ackMessageId: null,
        lastMessageId: null,
      ),
      data: UnreadInboxCardData(
        cacheKey: 'channel-1',
        meta: UnreadInboxCardMeta.empty(),
        messages: const [],
        hasMoreUnread: false,
      ),
      collapsed: true,
      read: false,
    ),
    onCollapsedChanged: (_) {},
    onDismissed: () {},
  );
}

Future<GoRouter> _pumpInbox(
  WidgetTester tester, {
  required GlobalKey<NavigatorState> rootNavigatorKey,
}) async {
  tester.view.physicalSize = const Size(1179, 2556);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  final FluxerDatabase db = openTestDatabase();
  await db.channelDao.upsertChannel(
    ChannelsCompanion.insert(
      id: 'channel-1',
      guildId: 'guild-1',
      name: 'general',
    ),
  );

  final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: <RouteBase>[
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) =>
            Scaffold(
              body: child,
              bottomNavigationBar: const SizedBox(
                height: 56,
                child: Text('bottom navigation'),
              ),
            ),
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) =>
                Scaffold(body: _card()),
          ),
        ],
      ),
      GoRoute(
        path: '/settings/guild/:guildId',
        builder: (BuildContext context, GoRouterState state) =>
            const Scaffold(body: Text('guild settings route')),
      ),
    ],
  );
  addTearDown(router.dispose);

  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: <Override>[fluxerDatabaseProvider.overrideWithValue(db)],
      child: MaterialApp.router(
        routerConfig: router,
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return router;
}

void main() {
  testWidgets(
    'bell opens channel notification settings without leaving the inbox',
    (WidgetTester tester) async {
      final GlobalKey<NavigatorState> rootNavigatorKey =
          GlobalKey<NavigatorState>();
      final GoRouter router = await _pumpInbox(
        tester,
        rootNavigatorKey: rootNavigatorKey,
      );

      await tester.tap(find.byIcon(PhosphorIconsBold.bellSimple));
      await tester.pumpAndSettle();

      expect(find.text('guild settings route'), findsNothing);
      expect(router.state.uri.toString(), '/');
      expect(find.text('Notification settings'), findsOneWidget);
      expect(find.text('Mute channel'), findsOneWidget);

      await releaseTestWidgetTree(tester);
    },
  );

  testWidgets('bell menu sheet covers the bottom navigation', (
    WidgetTester tester,
  ) async {
    final GlobalKey<NavigatorState> rootNavigatorKey =
        GlobalKey<NavigatorState>();
    await _pumpInbox(tester, rootNavigatorKey: rootNavigatorKey);

    await tester.tap(find.byIcon(PhosphorIconsBold.bellSimple));
    await tester.pumpAndSettle();

    expect(
      Navigator.of(tester.element(find.text('Mute channel'))),
      same(rootNavigatorKey.currentState),
    );

    await releaseTestWidgetTree(tester);
  });
}
