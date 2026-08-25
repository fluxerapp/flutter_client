import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../helpers/wide_layout_test_sizes.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

void useWideSurface(WidgetTester tester) {
  tester.view.physicalSize = kWideTestViewportSize;
  tester.view.devicePixelRatio = 1;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

void useMobileSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

void main() {
  group('FluxerActionMenu', () {
    testWidgets('shows menu items when FluxerActionMenu.show is called', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => TextButton(
              onPressed: () {
                unawaited(
                  FluxerActionMenu.show(
                    context,
                    position: const Offset(100, 100),
                    builder: (context, close) => [
                      FluxerMenuItem(label: 'Edit', onPressed: () {}),
                      const FluxerMenuDivider(),
                      FluxerMenuItem(
                        label: 'Delete',
                        onPressed: () {},
                        icon: PhosphorIconsBold.trash,
                        isDanger: true,
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Open Menu'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Menu'));
      await tester.pumpAndSettle();

      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('calls onPressed when menu item is tapped', (tester) async {
      var editPressed = false;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => TextButton(
              onPressed: () {
                unawaited(
                  FluxerActionMenu.show(
                    context,
                    position: const Offset(100, 100),
                    builder: (context, close) => [
                      FluxerMenuItem(
                        label: 'Edit',
                        onPressed: () {
                          editPressed = true;
                          close();
                        },
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Open Menu'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Menu'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(editPressed, isTrue);
    });

    testWidgets('dismisses when tapping outside the menu', (tester) async {
      useWideSurface(tester);

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => TextButton(
              onPressed: () {
                unawaited(
                  FluxerActionMenu.show(
                    context,
                    position: const Offset(100, 100),
                    builder: (context, close) => [
                      FluxerMenuItem(label: 'Edit', onPressed: () {}),
                    ],
                  ),
                );
              },
              child: const Text('Open Menu'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Menu'));
      await tester.pumpAndSettle();
      expect(find.text('Edit'), findsOneWidget);

      // Tap outside the menu area
      await tester.tapAt(const Offset(500, 500));
      await tester.pumpAndSettle();
      expect(find.text('Edit'), findsNothing);
    });

    testWidgets('mobile presentation groups items into titled sections', (
      tester,
    ) async {
      useMobileSurface(tester);

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => TextButton(
              onPressed: () {
                unawaited(
                  FluxerActionMenu.show(
                    context,
                    position: const Offset(100, 100),
                    builder: (context, close) => [
                      const FluxerMenuSectionHeader(label: 'Primary actions'),
                      FluxerMenuItem(
                        label: 'Edit',
                        hint: 'Quick action',
                        onPressed: () {},
                      ),
                      const FluxerMenuDivider(),
                      const FluxerMenuSectionHeader(label: 'Danger zone'),
                      FluxerMenuItem(
                        label: 'Delete',
                        onPressed: () {},
                        isDanger: true,
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Open Menu'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Menu'));
      await tester.pumpAndSettle();

      expect(find.text('Primary actions'), findsOneWidget);
      expect(find.text('Danger zone'), findsOneWidget);
      expect(find.text('Quick action'), findsOneWidget);
      expect(find.byType(FluxerMenuGroup), findsNWidgets(2));
    });

    testWidgets('mobile bottom sheet dismisses on swipe-down over the body', (
      tester,
    ) async {
      // iOS bouncing physics is where the inner list would otherwise always
      // claim the vertical drag and swallow the sheet's drag-to-dismiss.
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      useMobileSurface(tester);

      try {
        await tester.pumpWidget(
          buildTestApp(
            Builder(
              builder: (context) => TextButton(
                onPressed: () {
                  unawaited(
                    FluxerActionMenu.show(
                      context,
                      position: const Offset(100, 100),
                      builder: (context, close) => [
                        FluxerMenuItem(label: 'Edit', onPressed: () {}),
                        FluxerMenuItem(
                          label: 'Delete',
                          onPressed: () {},
                          isDanger: true,
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Open Menu'),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Open Menu'));
        await tester.pumpAndSettle();
        expect(find.text('Edit'), findsOneWidget);

        // Swiping down on a menu item (the body, not the drag handle) must
        // reach the sheet's drag-to-dismiss instead of being eaten by the list.
        await tester.fling(find.text('Edit'), const Offset(0, 400), 1500);
        await tester.pumpAndSettle();

        expect(find.text('Edit'), findsNothing);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    });
  });
}
