import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/test_l10n.dart';

class _PopCountingObserver extends NavigatorObserver {
  int pops = 0;
  int removes = 0;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pops += 1;
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    removes += 1;
  }
}

ThemeData _theme() {
  final colorTheme = buildDarkColorTheme();
  return buildFluxerTheme(
    colorTheme: colorTheme,
    textTheme: FluxerTextTheme.fromColors(colorTheme),
    layoutTheme: FluxerLayoutTheme.scaled(),
  );
}

Widget _app(
  Widget child, {
  List<NavigatorObserver> observers = const <NavigatorObserver>[],
  bool disableAnimations = false,
}) {
  return ProviderScope(
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      navigatorObservers: observers,
      theme: _theme(),
      builder: (BuildContext context, Widget? app) => MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(disableAnimations: disableAnimations),
        child: app!,
      ),
      home: Scaffold(body: child),
    ),
  );
}

Future<void> _openStatic(
  WidgetTester tester,
  BuildContext context, {
  String title = 'Sheet',
  Widget Function(BuildContext context, VoidCallback close)? body,
}) async {
  unawaited(
    FluxerBottomSheet.show<void>(
      context,
      title: title,
      builder: (BuildContext sheetContext, VoidCallback close) =>
          body?.call(sheetContext, close) ??
          const SizedBox(height: 200, child: Text('Body')),
    ),
  );
}

void main() {
  group('sheet input during the open animation', () {
    testWidgets('a scrim tap while the sheet is entering does not close it', (
      WidgetTester tester,
    ) async {
      late BuildContext pageContext;
      await tester.pumpWidget(
        _app(
          Builder(
            builder: (BuildContext context) {
              pageContext = context;
              return const SizedBox.expand();
            },
          ),
        ),
      );

      await _openStatic(tester, pageContext);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 40));
      await tester.tapAt(const Offset(200, 40));
      await tester.pumpAndSettle();

      expect(find.text('Sheet'), findsOneWidget);

      await tester.tapAt(const Offset(200, 40));
      await tester.pumpAndSettle();

      expect(find.text('Sheet'), findsNothing);
    });

    testWidgets('the second tap of a double tap does not hit a sheet item', (
      WidgetTester tester,
    ) async {
      late BuildContext pageContext;
      int itemTaps = 0;
      await tester.pumpWidget(
        _app(
          Builder(
            builder: (BuildContext context) {
              pageContext = context;
              return const SizedBox.expand();
            },
          ),
        ),
      );

      await _openStatic(
        tester,
        pageContext,
        body: (BuildContext context, VoidCallback close) => SizedBox(
          height: 400,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => itemTaps += 1,
            child: const Text('Item'),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 60));
      await tester.tap(find.text('Item'), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(itemTaps, 0);
      expect(find.text('Item'), findsOneWidget);

      await tester.tap(find.text('Item'));
      await tester.pumpAndSettle();

      expect(itemTaps, 1);
    });

    testWidgets('a repeated trigger while the sheet enters presents once', (
      WidgetTester tester,
    ) async {
      final _PopCountingObserver observer = _PopCountingObserver();
      await tester.pumpWidget(
        _app(
          observers: <NavigatorObserver>[observer],
          Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                unawaited(_openStatic(tester, context));
                unawaited(_openStatic(tester, context));
              },
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Sheet'), findsOneWidget);

      await tester.tapAt(const Offset(200, 40));
      await tester.pumpAndSettle();

      expect(find.text('Sheet'), findsNothing);
      expect(find.text('Open'), findsOneWidget);
    });

    testWidgets('reduced motion opens without an input lockout', (
      WidgetTester tester,
    ) async {
      late BuildContext pageContext;
      await tester.pumpWidget(
        _app(
          disableAnimations: true,
          Builder(
            builder: (BuildContext context) {
              pageContext = context;
              return const SizedBox.expand();
            },
          ),
        ),
      );

      await _openStatic(tester, pageContext);
      await tester.pump();
      await tester.pump();
      expect(find.text('Sheet'), findsOneWidget);

      await tester.tapAt(const Offset(200, 40));
      await tester.pump();
      await tester.pump();

      expect(find.text('Sheet'), findsNothing);
    });
  });

  group('programmatic close', () {
    testWidgets('closing twice pops only the sheet', (
      WidgetTester tester,
    ) async {
      final _PopCountingObserver observer = _PopCountingObserver();
      final GlobalKey<NavigatorState> navigatorKey =
          GlobalKey<NavigatorState>();
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            navigatorKey: navigatorKey,
            locale: kTestLocale,
            localizationsDelegates: fluxerLocalizationsDelegates,
            supportedLocales: FluxerLocalizations.supportedLocales,
            navigatorObservers: <NavigatorObserver>[observer],
            theme: _theme(),
            home: const Scaffold(body: Text('Home')),
          ),
        ),
      );
      navigatorKey.currentState!.push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => Scaffold(
            body: Builder(
              builder: (BuildContext context) => ElevatedButton(
                onPressed: () => unawaited(
                  _openStatic(
                    tester,
                    context,
                    body: (BuildContext context, VoidCallback close) =>
                        ElevatedButton(
                          onPressed: () {
                            close();
                            close();
                          },
                          child: const Text('Close twice'),
                        ),
                  ),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      final int popsBefore = observer.pops;

      await tester.tap(find.text('Close twice'));
      await tester.pumpAndSettle();

      expect(observer.pops - popsBefore, 1);
      expect(find.text('Open'), findsOneWidget);
    });

    testWidgets('closing the parent first keeps the child sheet', (
      WidgetTester tester,
    ) async {
      late BuildContext pageContext;
      VoidCallback? closeParent;
      VoidCallback? closeChild;
      await tester.pumpWidget(
        _app(
          Builder(
            builder: (BuildContext context) {
              pageContext = context;
              return const Text('Page');
            },
          ),
        ),
      );

      await _openStatic(
        tester,
        pageContext,
        title: 'Parent',
        body: (BuildContext context, VoidCallback close) {
          closeParent = close;
          return ElevatedButton(
            onPressed: () => unawaited(
              _openStatic(
                tester,
                context,
                title: 'Child',
                body: (BuildContext context, VoidCallback close) {
                  closeChild = close;
                  return const SizedBox(height: 120);
                },
              ),
            ),
            child: const Text('Open child'),
          );
        },
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Open child'));
      await tester.pumpAndSettle();

      closeParent!();
      await tester.pumpAndSettle();

      expect(find.text('Parent'), findsNothing);
      expect(find.text('Child'), findsOneWidget);

      closeChild!();
      await tester.pumpAndSettle();

      expect(find.text('Child'), findsNothing);
      expect(find.text('Page'), findsOneWidget);
    });

    testWidgets('closing a scrollable parent first keeps the child sheet', (
      WidgetTester tester,
    ) async {
      late BuildContext pageContext;
      VoidCallback? closeParent;
      await tester.pumpWidget(
        _app(
          Builder(
            builder: (BuildContext context) {
              pageContext = context;
              return const Text('Page');
            },
          ),
        ),
      );

      unawaited(
        FluxerBottomSheet.showScrollable<void>(
          pageContext,
          title: 'Parent',
          builder:
              (
                BuildContext context,
                ScrollController controller,
                VoidCallback close,
              ) {
                closeParent = close;
                return ListView(
                  controller: controller,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => unawaited(
                        _openStatic(tester, context, title: 'Child'),
                      ),
                      child: const Text('Open child'),
                    ),
                  ],
                );
              },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Open child'));
      await tester.pumpAndSettle();

      closeParent!();
      await tester.pumpAndSettle();

      expect(find.text('Parent'), findsNothing);
      expect(find.text('Child'), findsOneWidget);
    });
  });

  testWidgets('dragging a content sheet down with the keyboard up unfocuses', (
    WidgetTester tester,
  ) async {
    late BuildContext pageContext;
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    await tester.pumpWidget(
      _app(
        Builder(
          builder: (BuildContext context) {
            pageContext = context;
            return const SizedBox.expand();
          },
        ),
      ),
    );

    await _openStatic(
      tester,
      pageContext,
      title: 'Note',
      body: (BuildContext context, VoidCallback close) =>
          TextField(focusNode: focusNode),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byType(TextField));
    tester.view.viewInsets = const FakeViewPadding(bottom: 900);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpAndSettle();
    expect(focusNode.hasFocus, isTrue);

    final TestGesture gesture = await tester.startGesture(
      tester.getCenter(find.text('Note')),
    );
    for (int i = 0; i < 6; i++) {
      await gesture.moveBy(const Offset(0, 10));
      await tester.pump(const Duration(milliseconds: 16));
    }

    expect(focusNode.hasFocus, isFalse);

    await gesture.up();
    await tester.pumpAndSettle();
    expect(find.text('Note'), findsOneWidget);
  });

  testWidgets('a router location change closes an open sheet', (
    WidgetTester tester,
  ) async {
    final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) => Scaffold(
            body: ElevatedButton(
              onPressed: () => unawaited(_openStatic(tester, context)),
              child: const Text('Open'),
            ),
          ),
          routes: <RouteBase>[
            GoRoute(
              path: 'other',
              builder: (BuildContext context, GoRouterState state) =>
                  const Scaffold(body: Text('Other')),
            ),
          ],
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          routerConfig: router,
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: _theme(),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.text('Sheet'), findsOneWidget);

    router.go('/other');
    await tester.pumpAndSettle();
    expect(find.text('Other'), findsOneWidget);

    router.go('/');
    await tester.pumpAndSettle();

    expect(find.text('Sheet'), findsNothing);
    expect(find.text('Open'), findsOneWidget);
  });
  testWidgets('dragging non-scrolling body content closes a content sheet', (
    WidgetTester tester,
  ) async {
    late BuildContext pageContext;
    await tester.pumpWidget(
      _app(
        Builder(
          builder: (BuildContext context) {
            pageContext = context;
            return const SizedBox.expand();
          },
        ),
      ),
    );

    await _openStatic(
      tester,
      pageContext,
      body: (BuildContext context, VoidCallback close) =>
          const SizedBox(height: 300, child: Center(child: Text('Body'))),
    );
    await tester.pumpAndSettle();

    await tester.fling(find.text('Body'), const Offset(0, 300), 1500);
    await tester.pumpAndSettle();

    expect(find.text('Sheet'), findsNothing);
  });

  testWidgets('dragging a fixed header inside a scrollable sheet moves it', (
    WidgetTester tester,
  ) async {
    late BuildContext pageContext;
    await tester.pumpWidget(
      _app(
        Builder(
          builder: (BuildContext context) {
            pageContext = context;
            return const SizedBox.expand();
          },
        ),
      ),
    );

    unawaited(
      FluxerBottomSheet.showScrollable<void>(
        pageContext,
        builder:
            (
              BuildContext context,
              ScrollController controller,
              VoidCallback close,
            ) => Column(
              children: <Widget>[
                const SizedBox(height: 48, child: Text('Search')),
                Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: 80,
                    itemBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 40, child: Text('Row $index')),
                  ),
                ),
              ],
            ),
      ),
    );
    await tester.pumpAndSettle();
    final double topBefore = tester.getTopLeft(find.text('Search')).dy;

    final TestGesture drag = await tester.startGesture(
      tester.getCenter(find.text('Search')),
    );
    for (int move = 0; move < 6; move++) {
      await drag.moveBy(const Offset(0, 20));
      await tester.pump(const Duration(milliseconds: 16));
    }

    expect(tester.getTopLeft(find.text('Search')).dy, greaterThan(topBefore));
    await drag.up();
    await tester.pumpAndSettle();
  });

  testWidgets('a scrollable sheet never rests between its snap points', (
    WidgetTester tester,
  ) async {
    late BuildContext pageContext;
    await tester.pumpWidget(
      _app(
        Builder(
          builder: (BuildContext context) {
            pageContext = context;
            return const SizedBox.expand();
          },
        ),
      ),
    );

    unawaited(
      FluxerBottomSheet.showScrollable<void>(
        pageContext,
        builder:
            (
              BuildContext context,
              ScrollController controller,
              VoidCallback close,
            ) => ListView.builder(
              controller: controller,
              itemCount: 80,
              itemBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 40, child: Text('Row $index')),
            ),
      ),
    );
    await tester.pumpAndSettle();
    final double screenHeight =
        tester.view.physicalSize.height / tester.view.devicePixelRatio;
    final double fullTop = tester.getTopLeft(find.text('Row 0')).dy;

    await tester.drag(find.text('Row 4'), const Offset(0, -200));
    await tester.pumpAndSettle();
    await tester.fling(find.text('Row 8'), const Offset(0, 420), 2400);
    await tester.pumpAndSettle();

    final Finder firstRow = find.text('Row 0');
    if (firstRow.evaluate().isEmpty) {
      return;
    }
    final double top = tester.getTopLeft(firstRow).dy;
    final double halfTop = fullTop + screenHeight * 0.45;
    final bool atFull = (top - fullTop).abs() < 2;
    final bool atHalf = (top - halfTop).abs() < screenHeight * 0.05;
    expect(atFull || atHalf, isTrue);
  });
}
