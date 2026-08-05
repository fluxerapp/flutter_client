import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_app/shared/gestures/nested_horizontal_scrollable.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/gestures/wide_markdown_table_test_helpers.dart';

void main() {
  group('isSidebarDrawerLockedForLocation', () {
    test('locks DM list and guild root without a channel', () {
      expect(isSidebarDrawerLockedForLocation('/channels/@me'), isTrue);
      expect(isSidebarDrawerLockedForLocation('/channels/guild'), isTrue);
      expect(
        isSidebarDrawerLockedForLocation('/channels/guild/channel'),
        isFalse,
      );
    });

    test('locks favorites root without a channel', () {
      expect(isSidebarDrawerLockedForLocation('/channels/@favorites'), isTrue);
      expect(
        isSidebarDrawerLockedForLocation('/channels/@favorites/abc'),
        isFalse,
      );
    });
  });

  group('isCompactWideDrawerPeekMode', () {
    testWidgets('is true only for compact-wide peek reveal', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            shellLocationProvider.overrideWithValue(
              '/channels/guild-1/channel-1',
            ),
            currentRevealSideProvider.overrideWithValue(RevealSide.left),
          ],
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: MediaQuery(
              data: const MediaQueryData(size: Size(744, 1133)),
              child: Builder(
                builder: (BuildContext context) {
                  return Text(
                    isCompactWideDrawerPeekMode(
                          context,
                          shellLocation: '/channels/guild-1/channel-1',
                          revealSide: RevealSide.left,
                        )
                        ? 'yes'
                        : 'no',
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('yes'), findsOneWidget);
    });

    testWidgets('is false when chat is full screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(size: Size(744, 1133)),
            child: Builder(
              builder: (BuildContext context) {
                return Text(
                  isCompactWideDrawerPeekMode(
                        context,
                        shellLocation: '/channels/guild-1/channel-1',
                        revealSide: RevealSide.main,
                      )
                      ? 'yes'
                      : 'no',
                );
              },
            ),
          ),
        ),
      );

      expect(find.text('no'), findsOneWidget);
    });
  });

  group('sidebarDrawerTargetForDrag', () {
    test('uses fling velocity before position threshold', () {
      expect(
        sidebarDrawerTargetForDrag(
          translate: 0,
          width: 400,
          primaryVelocity: 700,
          completionThreshold: 0.4,
        ),
        RevealSide.left,
      );
      expect(
        sidebarDrawerTargetForDrag(
          translate: 400,
          width: 400,
          primaryVelocity: -700,
          completionThreshold: 0.4,
        ),
        RevealSide.main,
      );
    });

    test('falls back to position threshold without a fling', () {
      expect(
        sidebarDrawerTargetForDrag(
          translate: 159,
          width: 400,
          primaryVelocity: 0,
          completionThreshold: 0.4,
        ),
        RevealSide.main,
      );
      expect(
        sidebarDrawerTargetForDrag(
          translate: 160,
          width: 400,
          primaryVelocity: 0,
          completionThreshold: 0.4,
        ),
        RevealSide.left,
      );
    });

    test('uses peek width as the completion basis when provided', () {
      expect(
        sidebarDrawerTargetForDrag(
          translate: 100,
          width: 1000,
          primaryVelocity: 0,
          completionThreshold: 0.4,
          peekWidth: 342,
        ),
        RevealSide.main,
      );
      expect(
        sidebarDrawerTargetForDrag(
          translate: 140,
          width: 1000,
          primaryVelocity: 0,
          completionThreshold: 0.4,
          peekWidth: 342,
        ),
        RevealSide.left,
      );
    });
  });

  testWidgets('tracks opening drags from anywhere on the surface', (
    tester,
  ) async {
    final router = _routerFor('/channels/guild/channel');
    addTearDown(router.dispose);
    final container = _containerFor(router);

    await tester.pumpWidget(
      _buildDrawerApp(container: container, router: router),
    );

    // Mid-screen, not the leading edge, must still capture the drag.
    final gesture = await tester.startGesture(const Offset(200, 400));
    await gesture.moveBy(const Offset(80, 0));
    await tester.pump();

    expect(_sliderDx(tester), 80);

    await gesture.moveBy(const Offset(180, 0));
    await gesture.up();
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), 400);
  });

  testWidgets('blocks closing swipe on guild root without a channel', (
    tester,
  ) async {
    final router = _routerFor('/channels/guild');
    addTearDown(router.dispose);
    final container = _containerFor(router);

    await tester.pumpWidget(
      _buildDrawerApp(container: container, router: router),
    );
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), 400);

    await tester.dragFrom(const Offset(240, 400), const Offset(-260, 0));
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), 400);
  });

  testWidgets('allows closing with a swipe from anywhere when open', (
    tester,
  ) async {
    final router = _routerFor('/channels/guild/channel');
    addTearDown(router.dispose);
    final container = _containerFor(router);

    await tester.pumpWidget(
      _buildDrawerApp(container: container, router: router),
    );
    await tester.pump();

    await tester.dragFrom(const Offset(10, 400), const Offset(260, 0));
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), 400);

    // Closing drag starts mid-screen, not at the edge.
    await tester.dragFrom(const Offset(240, 400), const Offset(-260, 0));
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), 0);
  });

  testWidgets('peeks to channel list width on compact-wide mobile', (
    tester,
  ) async {
    final router = _routerFor('/channels/guild/channel');
    addTearDown(router.dispose);
    final container = _containerFor(router);
    const Size compactWideSize = Size(984, 800);
    const double peekWidth =
        Breakpoints.guildListWidth + Breakpoints.channelSidebarWidth;

    await tester.pumpWidget(
      _buildDrawerApp(
        container: container,
        router: router,
        size: compactWideSize,
      ),
    );
    await tester.pump();

    await tester.dragFrom(const Offset(20, 400), const Offset(400, 0));
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), peekWidth);
    expect(_sliderDx(tester), lessThan(compactWideSize.width));
  });

  testWidgets('fully reveals when drawer is locked on compact-wide', (
    tester,
  ) async {
    final router = _routerFor('/channels/guild');
    addTearDown(router.dispose);
    final container = _containerFor(router);
    const Size compactWideSize = Size(984, 800);

    await tester.pumpWidget(
      _buildDrawerApp(
        container: container,
        router: router,
        size: compactWideSize,
      ),
    );
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), compactWideSize.width);
  });

  testWidgets('keeps open progress when width changes', (tester) async {
    final router = _routerFor('/channels/guild/channel');
    addTearDown(router.dispose);
    final container = _containerFor(router);

    await tester.pumpWidget(
      _buildDrawerApp(container: container, router: router),
    );
    await tester.pump();
    await tester.dragFrom(const Offset(10, 400), const Offset(260, 0));
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), 400);

    await tester.pumpWidget(
      _buildDrawerApp(
        container: container,
        router: router,
        size: const Size(600, 800),
      ),
    );
    await tester.pump();

    expect(_sliderDx(tester), 600);
  });

  testWidgets('open drawer settles to peek after growing into compact-wide', (
    tester,
  ) async {
    final router = _routerFor('/channels/guild/channel');
    addTearDown(router.dispose);
    final container = _containerFor(router);
    const double peekWidth =
        Breakpoints.guildListWidth + Breakpoints.channelSidebarWidth;

    await tester.pumpWidget(
      _buildDrawerApp(container: container, router: router),
    );
    await tester.pump();
    await tester.dragFrom(const Offset(10, 400), const Offset(260, 0));
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), 400);

    await tester.pumpWidget(
      _buildDrawerApp(
        container: container,
        router: router,
        size: const Size(984, 800),
      ),
    );
    await tester.pump();

    expect(_sliderDx(tester), peekWidth);
  });

  testWidgets('ignores horizontal drag while a popup overlay is open', (
    tester,
  ) async {
    final router = _routerFor('/channels/guild/channel');
    addTearDown(router.dispose);
    final container = ProviderContainer(
      overrides: [
        fluxerRouterProvider.overrideWithValue(router),
        shellHasPopupOverlayProvider.overrideWithValue(true),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      _buildDrawerApp(container: container, router: router),
    );
    await tester.pump();

    await tester.dragFrom(const Offset(20, 400), const Offset(200, 0));
    await tester.pump();

    expect(_sliderDx(tester), 0);
  });

  testWidgets('wraps drawer layers in repaint boundaries', (tester) async {
    final router = _routerFor('/channels/guild/channel');
    addTearDown(router.dispose);
    final container = _containerFor(router);

    await tester.pumpWidget(
      _buildDrawerApp(container: container, router: router),
    );

    expect(find.byType(RepaintBoundary), findsAtLeastNWidgets(2));
  });

  testWidgets('rightward drag on wide table scrolls table instead of drawer', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: '/channels/guild/channel',
      routes: [
        GoRoute(
          path: '/channels/:guildId',
          builder: (context, state) => _drawerHarnessWithWideTable(),
          routes: [
            GoRoute(
              path: ':channelId',
              builder: (context, state) => _drawerHarnessWithWideTable(),
            ),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);
    final container = _containerFor(router);

    await tester.pumpWidget(
      _buildDrawerApp(container: container, router: router),
    );
    await tester.pumpAndSettle();
    final ScrollableState scrollable = tableScrollableState(tester);
    expect(scrollable.position.maxScrollExtent, greaterThan(0));
    scrollable.position.jumpTo(scrollable.position.maxScrollExtent / 2);
    await tester.pump();
    final double before = scrollable.position.pixels;
    await tester.dragFrom(tableDragStart(tester), const Offset(120, 0));
    await tester.pumpAndSettle();
    expect(scrollable.position.pixels, lessThan(before));
    expect(_sliderDx(tester), 0);
  });

  testWidgets('ignores horizontal drag on playback seek surface', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: '/channels/guild/channel',
      routes: [
        GoRoute(
          path: '/channels/:guildId',
          builder: (context, state) => _drawerHarnessWithPlaybackSeek(),
          routes: [
            GoRoute(
              path: ':channelId',
              builder: (context, state) => _drawerHarnessWithPlaybackSeek(),
            ),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);
    final container = _containerFor(router);

    await tester.pumpWidget(
      _buildDrawerApp(container: container, router: router),
    );
    await tester.pumpAndSettle();

    final Offset seekCenter = tester.getCenter(
      find.byKey(kPlaybackSeekShellGestureBlockKey),
    );
    await tester.dragFrom(seekCenter, const Offset(200, 0));
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), 0);
  });

  testWidgets('ignores horizontal drag on the expression panel surface', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: '/channels/guild/channel',
      routes: [
        GoRoute(
          path: '/channels/:guildId',
          builder: (context, state) => _drawerHarnessWithExpressionPanel(),
          routes: [
            GoRoute(
              path: ':channelId',
              builder: (context, state) => _drawerHarnessWithExpressionPanel(),
            ),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);
    final container = _containerFor(router);

    await tester.pumpWidget(
      _buildDrawerApp(container: container, router: router),
    );
    await tester.pumpAndSettle();

    final Offset panelCenter = tester.getCenter(
      find.byKey(kExpressionPanelShellGestureBlockKey),
    );
    await tester.dragFrom(panelCenter, const Offset(200, 0));
    await tester.pumpAndSettle();

    expect(_sliderDx(tester), 0);
  });
}

const _sliderKey = ValueKey<String>('slider');

GoRouter _routerFor(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: '/channels/:guildId',
        builder: (context, state) => _drawerHarness(),
        routes: [
          GoRoute(
            path: ':channelId',
            builder: (context, state) => _drawerHarness(),
          ),
        ],
      ),
    ],
  );
}

Widget _drawerHarness() {
  return const SidebarDrawer(
    revealDuration: Duration.zero,
    snapBackDuration: Duration.zero,
    base: ColoredBox(color: Colors.blue),
    slider: ColoredBox(key: _sliderKey, color: Colors.red),
  );
}

Widget _drawerHarnessWithWideTable() {
  return const SidebarDrawer(
    revealDuration: Duration.zero,
    snapBackDuration: Duration.zero,
    base: ColoredBox(color: Colors.blue),
    slider: SizedBox(
      key: _sliderKey,
      width: 400,
      height: 120,
      child: FluxerMarkdown(
        data: kWideMarkdownTable,
        config: kWideTableMarkdownConfig,
      ),
    ),
  );
}

Widget _drawerHarnessWithPlaybackSeek() {
  return const SidebarDrawer(
    revealDuration: Duration.zero,
    snapBackDuration: Duration.zero,
    base: ColoredBox(color: Colors.blue),
    slider: SizedBox(
      key: _sliderKey,
      width: 400,
      height: 600,
      child: Stack(
        children: <Widget>[
          ColoredBox(color: Colors.red),
          Positioned(
            left: 16,
            right: 16,
            top: 200,
            child: SizedBox(
              key: kPlaybackSeekShellGestureBlockKey,
              height: 44,
              child: ColoredBox(color: Colors.orange),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _drawerHarnessWithExpressionPanel() {
  return const SidebarDrawer(
    revealDuration: Duration.zero,
    snapBackDuration: Duration.zero,
    base: ColoredBox(color: Colors.blue),
    slider: SizedBox(
      key: _sliderKey,
      width: 400,
      height: 600,
      child: Stack(
        children: <Widget>[
          ColoredBox(color: Colors.red),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 200,
            child: ColoredBox(
              key: kExpressionPanelShellGestureBlockKey,
              color: Colors.green,
            ),
          ),
        ],
      ),
    ),
  );
}

ProviderContainer _containerFor(GoRouter router) {
  final container = ProviderContainer(
    overrides: [fluxerRouterProvider.overrideWithValue(router)],
  );
  addTearDown(container.dispose);
  return container;
}

Widget _buildDrawerApp({
  required ProviderContainer container,
  required GoRouter router,
  Size size = const Size(400, 800),
}) {
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp.router(
      routerConfig: router,
      builder: (context, child) => MediaQuery(
        data: MediaQueryData(size: size),
        child: child ?? const SizedBox.shrink(),
      ),
    ),
  );
}

double _sliderDx(WidgetTester tester) {
  final transform = tester.widget<Transform>(
    find.ancestor(of: find.byKey(_sliderKey), matching: find.byType(Transform)),
  );
  return transform.transform.getTranslation().x;
}
