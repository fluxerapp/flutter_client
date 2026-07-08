import 'dart:async';

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

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
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
  });
}
