import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void _noop() {}

double _maxAnimatedPaddingBottom(WidgetTester tester) {
  double maxBottom = 0;
  for (final Element element in find.byType(AnimatedPadding).evaluate()) {
    final AnimatedPadding padding = element.widget as AnimatedPadding;
    final EdgeInsets resolved = padding.padding.resolve(TextDirection.ltr);
    maxBottom = math.max(maxBottom, resolved.bottom);
  }
  return maxBottom;
}

class _PopCountingObserver extends NavigatorObserver {
  int pops = 0;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pops += 1;
  }
}

Widget buildTestApp(
  Widget child, {
  List<NavigatorObserver> observers = const <NavigatorObserver>[],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      navigatorObservers: observers,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  group('FluxerBottomSheet', () {
    testWidgets('shows bottom sheet with title', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.show(
                      context,
                      title: 'Test Title',
                      builder: (context, close) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Sheet Content'),
                        );
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Sheet Content'), findsOneWidget);
    });

    testWidgets('builder receives working close callback', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.show(
                      context,
                      title: 'Closeable Sheet',
                      builder: (context, close) {
                        return ElevatedButton(
                          onPressed: close,
                          child: const Text('Close Me'),
                        );
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Closeable Sheet'), findsOneWidget);

      await tester.tap(find.text('Close Me'));
      await tester.pumpAndSettle();

      expect(find.text('Closeable Sheet'), findsNothing);
    });

    testWidgets('shows drag handle', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.show(
                      context,
                      builder: (context, close) {
                        return const SizedBox(height: 100);
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.byType(FluxerBottomSheetDragHandle), findsOneWidget);
    });

    testWidgets('drag handle has expanded hit target', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const Material(child: FluxerBottomSheetDragHandle(onDismiss: _noop)),
        ),
      );

      final Size size = tester.getSize(
        find.byType(FluxerBottomSheetDragHandle),
      );
      expect(size.height, greaterThanOrEqualTo(24));
    });

    testWidgets('scrollable sheet drag handle resizes the sheet', (
      tester,
    ) async {
      final DraggableScrollableController sheetController =
          DraggableScrollableController();
      addTearDown(sheetController.dispose);

      await tester.pumpWidget(
        buildTestApp(
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 800,
              child: DraggableScrollableSheet(
                expand: false,
                controller: sheetController,
                initialChildSize: 0.7,
                minChildSize: 0.4,
                maxChildSize: 0.9,
                builder: (context, scrollController) {
                  return Column(
                    children: [
                      FluxerBottomSheetDragHandle(
                        sheetController: sheetController,
                        minChildSize: 0.4,
                        maxChildSize: 0.9,
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: 40,
                          itemBuilder: (context, index) =>
                              ListTile(title: Text('Item $index')),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(sheetController.isAttached, isTrue);
      final double initialSize = sheetController.size;

      await tester.drag(
        find.byType(FluxerBottomSheetDragHandle),
        const Offset(0, 80),
      );
      await tester.pumpAndSettle();

      expect(sheetController.size, lessThan(initialSize));
    });

    testWidgets('scrollable sheet dismisses from handle without double pop', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.showScrollable(
                      context,
                      initialChildSize: 0.7,
                      maxChildSize: 0.9,
                      builder: (context, scrollController, close) {
                        return ListView.builder(
                          controller: scrollController,
                          itemCount: 20,
                          itemBuilder: (context, index) =>
                              ListTile(title: Text('Scroll Item $index')),
                        );
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('Scroll Item 0'), findsOneWidget);

      await tester.drag(
        find.byType(FluxerBottomSheetDragHandle),
        const Offset(0, 300),
      );
      await tester.pumpAndSettle();

      expect(find.text('Scroll Item 0'), findsNothing);
      expect(find.text('Open'), findsOneWidget);
    });

    testWidgets('scrollable sheet with a non-scrollable body closes from the '
        'handle', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.showScrollable(
                      context,
                      initialChildSize: 0.7,
                      maxChildSize: 0.9,
                      // Empty/loading states never attach the controller, so
                      // the handle has no sheet extent to move.
                      builder: (context, scrollController, close) =>
                          const Center(child: Text('Nothing here')),
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('Nothing here'), findsOneWidget);

      await tester.drag(
        find.byType(FluxerBottomSheetDragHandle),
        const Offset(0, 100),
      );
      await tester.pumpAndSettle();

      expect(find.text('Nothing here'), findsNothing);
      expect(find.text('Open'), findsOneWidget);
    });

    testWidgets('scrollable sheet pops exactly once when dragged past its '
        'min extent', (tester) async {
      final _PopCountingObserver observer = _PopCountingObserver();

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.showScrollable(
                      context,
                      initialChildSize: 0.7,
                      maxChildSize: 0.9,
                      builder: (context, scrollController, close) {
                        return ListView.builder(
                          controller: scrollController,
                          itemCount: 20,
                          itemBuilder: (context, index) =>
                              ListTile(title: Text('Scroll Item $index')),
                        );
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
          observers: <NavigatorObserver>[observer],
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('Scroll Item 0'), findsOneWidget);

      // Long enough to cross min extent mid-drag, which also trips the modal
      // route's own min-extent close.
      await tester.drag(
        find.byType(FluxerBottomSheetDragHandle),
        const Offset(0, 500),
      );
      await tester.pumpAndSettle();

      expect(find.text('Scroll Item 0'), findsNothing);
      expect(observer.pops, 1);
      expect(find.text('Open'), findsOneWidget);
    });

    testWidgets('partial handle drag springs the sheet back to its initial '
        'size', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.showScrollable(
                      context,
                      initialChildSize: 0.7,
                      maxChildSize: 0.9,
                      builder: (context, scrollController, close) {
                        return ListView.builder(
                          controller: scrollController,
                          itemCount: 20,
                          itemBuilder: (context, index) =>
                              ListTile(title: Text('Scroll Item $index')),
                        );
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final Finder handle = find.byType(FluxerBottomSheetDragHandle);
      final double restTop = tester.getTopLeft(handle).dy;

      final TestGesture gesture = await tester.startGesture(
        tester.getCenter(handle),
      );
      await gesture.moveBy(const Offset(0, 30));
      await tester.pump();
      expect(tester.getTopLeft(handle).dy, greaterThan(restTop));

      await gesture.up();
      await tester.pumpAndSettle();

      expect(find.text('Scroll Item 0'), findsOneWidget);
      expect(tester.getTopLeft(handle).dy, closeTo(restTop, 0.5));
    });

    testWidgets(
      'scrollable sheet dismisses from handle when scroll controller is unattached',
      (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    unawaited(
                      FluxerBottomSheet.showScrollable(
                        context,
                        title: 'Search',
                        builder: (context, scrollController, close) {
                          return const Column(
                            children: [
                              SizedBox(height: 100, child: Text('Header')),
                              Expanded(
                                child: Center(child: Text('Empty state')),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                  child: const Text('Open'),
                );
              },
            ),
          ),
        );

        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();
        expect(find.text('Search'), findsOneWidget);

        await tester.drag(
          find.byType(FluxerBottomSheetDragHandle),
          const Offset(0, 300),
        );
        await tester.pumpAndSettle();

        expect(find.text('Search'), findsNothing);
        expect(find.text('Open'), findsOneWidget);
      },
    );

    testWidgets('non-scrollable sheet closes when dragging handle down', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.show(
                      context,
                      title: 'Draggable Sheet',
                      builder: (context, close) {
                        return const SizedBox(height: 200);
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Draggable Sheet'), findsOneWidget);

      await tester.drag(
        find.byType(FluxerBottomSheetDragHandle),
        const Offset(0, 80),
      );
      await tester.pumpAndSettle();

      expect(find.text('Draggable Sheet'), findsNothing);
    });

    testWidgets('manageKeyboardInset false skips sheet keyboard padding', (
      tester,
    ) async {
      const double keyboardHeight = 300;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
            viewInsets: EdgeInsets.only(bottom: keyboardHeight),
          ),
          child: buildTestApp(
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    unawaited(
                      FluxerBottomSheet.show(
                        context,
                        manageKeyboardInset: false,
                        builder: (context, close) {
                          return const SizedBox(height: 100);
                        },
                      ),
                    );
                  },
                  child: const Text('Open'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(_maxAnimatedPaddingBottom(tester), 0);
    });

    testWidgets('manageKeyboardInset true pads sheet for viewInsets', (
      tester,
    ) async {
      const double keyboardHeight = 300;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
            viewInsets: EdgeInsets.only(bottom: keyboardHeight),
          ),
          child: buildTestApp(
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    unawaited(
                      FluxerBottomSheet.show(
                        context,
                        builder: (context, close) {
                          return const SizedBox(height: 100);
                        },
                      ),
                    );
                  },
                  child: const Text('Open'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(_maxAnimatedPaddingBottom(tester), keyboardHeight);
    });

    testWidgets('header supports back and trailing actions', (tester) async {
      var backPressed = 0;
      var trailingPressed = 0;

      await tester.pumpWidget(
        buildTestApp(
          Material(
            child: FluxerBottomSheetHeader(
              title: 'Sheet Title',
              subtitle: const Text('Sheet subtitle'),
              onBack: () => backPressed++,
              trailing: IconButton(
                onPressed: () => trailingPressed++,
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Sheet Title'), findsOneWidget);
      expect(find.text('Sheet subtitle'), findsOneWidget);

      await tester.tap(find.byIcon(PhosphorIconsBold.caretLeft));
      await tester.pump();
      expect(backPressed, 1);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(trailingPressed, 1);
    });

    testWidgets('section and footer provide reusable sheet structure', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FluxerBottomSheetSection(
                  title: 'Section title',
                  child: Text('Section content'),
                ),
                FluxerBottomSheetFooter(child: Text('Footer action')),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Section title'), findsOneWidget);
      expect(find.text('Section content'), findsOneWidget);
      expect(find.text('Footer action'), findsOneWidget);
    });

    testWidgets('system back dismisses a default sheet', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.show(
                      context,
                      title: 'Back Dismissible',
                      builder: (context, close) {
                        return const Text('Sheet body');
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('Back Dismissible'), findsOneWidget);

      final bool handled = await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(handled, isTrue);
      expect(find.text('Back Dismissible'), findsNothing);
    });

    testWidgets('system back invokes onBack without dismissing', (
      tester,
    ) async {
      var backPressed = 0;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.show(
                      context,
                      title: 'Intercepted Back',
                      onBack: () => backPressed++,
                      builder: (context, close) {
                        return const Text('Sheet body');
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final bool handled = await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(handled, isTrue);
      expect(backPressed, 1);
      expect(find.text('Intercepted Back'), findsOneWidget);
    });

    testWidgets('system back invokes onBack that pops the sheet', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.show(
                      context,
                      title: 'Pop On Back',
                      onBack: () => Navigator.of(context).pop(),
                      builder: (context, close) {
                        return const Text('Sheet body');
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('Pop On Back'), findsOneWidget);

      final bool handled = await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(handled, isTrue);
      expect(find.text('Pop On Back'), findsNothing);
    });

    testWidgets('system back is blocked when canDismissNotifier is false', (
      tester,
    ) async {
      final ValueNotifier<bool> canDismissNotifier = ValueNotifier<bool>(true);

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerBottomSheet.show(
                      context,
                      title: 'Blocked Back',
                      canDismissNotifier: canDismissNotifier,
                      builder: (context, close) {
                        return const Text('Sheet body');
                      },
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      canDismissNotifier.value = false;
      await tester.pumpAndSettle();

      final bool handled = await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(handled, isTrue);
      expect(find.text('Blocked Back'), findsOneWidget);

      canDismissNotifier.dispose();
    });

    testWidgets('scrollViewPadding merges scope bottom inset', (tester) async {
      double? mergedBottom;

      await tester.pumpWidget(
        MaterialApp(
          home: FluxerBottomSheetScope(
            bottomScrollPadding: 34,
            child: Builder(
              builder: (context) {
                mergedBottom = FluxerBottomSheet.scrollViewPadding(
                  context,
                  padding: const EdgeInsets.only(bottom: 8),
                ).bottom;
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );

      expect(mergedBottom, 42);
    });

    testWidgets('menu sheet exposes system inset via scope', (tester) async {
      const double systemInset = 34;
      double? capturedInset;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
            viewPadding: EdgeInsets.only(bottom: systemInset),
          ),
          child: buildTestApp(
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    unawaited(
                      FluxerBottomSheet.show(
                        context,
                        variant: FluxerBottomSheetVariant.menu,
                        builder: (sheetContext, close) {
                          capturedInset =
                              FluxerBottomSheet.scrollBottomPaddingOf(
                                sheetContext,
                              );
                          return const SizedBox(height: 100);
                        },
                      ),
                    );
                  },
                  child: const Text('Open Menu'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Menu'));
      await tester.pumpAndSettle();

      expect(capturedInset, systemInset);
    });

    testWidgets('showScrollable uses max of system bottom inset sources', (
      tester,
    ) async {
      const double expectedInset = 48;
      double? capturedInset;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
            viewPadding: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(bottom: expectedInset),
            systemGestureInsets: EdgeInsets.only(bottom: 10),
          ),
          child: buildTestApp(
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    unawaited(
                      FluxerBottomSheet.showScrollable(
                        context,
                        builder: (sheetContext, scrollController, close) {
                          capturedInset =
                              FluxerBottomSheet.scrollBottomPaddingOf(
                                sheetContext,
                              );
                          return const SizedBox(height: 100);
                        },
                      ),
                    );
                  },
                  child: const Text('Open Scrollable'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Scrollable'));
      await tester.pumpAndSettle();

      expect(capturedInset, expectedInset);
    });

    testWidgets('system bottom inset is zero while keyboard is open', (
      tester,
    ) async {
      double? capturedInset;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
            viewInsets: EdgeInsets.only(bottom: 300),
            viewPadding: EdgeInsets.only(bottom: 34),
          ),
          child: buildTestApp(
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    unawaited(
                      FluxerBottomSheet.show(
                        context,
                        variant: FluxerBottomSheetVariant.menu,
                        builder: (sheetContext, close) {
                          capturedInset =
                              FluxerBottomSheet.scrollBottomPaddingOf(
                                sheetContext,
                              );
                          return const SizedBox(height: 100);
                        },
                      ),
                    );
                  },
                  child: const Text('Open Keyboard'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Keyboard'));
      await tester.pumpAndSettle();

      expect(capturedInset, 0);
    });
  });
}
