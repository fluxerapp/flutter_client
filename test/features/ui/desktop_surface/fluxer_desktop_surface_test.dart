import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

import '../../../helpers/input_modality_override.dart';
import '../../../helpers/wide_layout_test_sizes.dart';

Widget _app({required bool touch, required WidgetBuilder builder}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [inputModalityOverride(touch: touch)],
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: Center(child: Builder(builder: builder)),
      ),
    ),
  );
}

void _setSize(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

Widget _openButton(
  BuildContext context, {
  FluxerBottomSheetVariant variant = FluxerBottomSheetVariant.content,
  String? title,
}) {
  return TextButton(
    onPressed: () => unawaited(
      FluxerBottomSheet.show<void>(
        context,
        title: title,
        variant: variant,
        builder: (BuildContext sheetContext, VoidCallback close) =>
            FluxerBottomSheetSection(
              title: 'Section',
              child: FluxerMenuGroup(
                children: [
                  FluxerBottomSheetMenuItem(label: 'Row', onTap: close),
                ],
              ),
            ),
      ),
    ),
    child: const Text('Open'),
  );
}

ModalRoute<dynamic> _routeOf(WidgetTester tester, String text) =>
    ModalRoute.of(tester.element(find.text(text)))!;

void main() {
  const Size phone = Size(390, 844);
  const Size tablet = Size(1366, 1024);

  group('usesDesktopPointerUi', () {
    Future<bool> resolve(
      WidgetTester tester, {
      required Size size,
      required bool touch,
    }) async {
      _setSize(tester, size);
      late bool result;
      await tester.pumpWidget(
        _app(
          touch: touch,
          builder: (BuildContext context) {
            result = usesDesktopPointerUi(context);
            return const SizedBox();
          },
        ),
      );
      return result;
    }

    testWidgets('is true for a mouse on a wide layout', (tester) async {
      expect(
        await resolve(tester, size: kWideTestViewportSize, touch: false),
        isTrue,
      );
    });

    testWidgets('is true for a mouse in a small desktop window', (
      tester,
    ) async {
      expect(
        await resolve(tester, size: const Size(900, 560), touch: false),
        isTrue,
      );
    });

    testWidgets('is false for touch on a large tablet', (tester) async {
      expect(await resolve(tester, size: tablet, touch: true), isFalse);
    });

    testWidgets('is false for a mouse on a mobile layout', (tester) async {
      expect(await resolve(tester, size: phone, touch: false), isFalse);
    });
  });

  group('FluxerBottomSheet presentation', () {
    testWidgets('touch on a large tablet keeps the bottom sheet', (
      tester,
    ) async {
      _setSize(tester, tablet);
      await tester.pumpWidget(_app(touch: true, builder: _openButton));
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(_routeOf(tester, 'Row'), isA<FluxerSheetRoute<void>>());
    });

    testWidgets('a mouse opens content sheets as a centered modal', (
      tester,
    ) async {
      _setSize(tester, kWideTestViewportSize);
      await tester.pumpWidget(
        _app(
          touch: false,
          builder: (BuildContext context) =>
              _openButton(context, title: 'Details'),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final route = _routeOf(tester, 'Row') as FluxerDesktopRoute<dynamic>;
      expect(route.surface, FluxerDesktopSurface.modal);
      expect(find.byType(FluxerBottomSheetDragHandle), findsNothing);
      expect(find.bySemanticsLabel('Close'), findsOneWidget);

      final double center = tester.getCenter(find.text('Details')).dy;
      expect(center, lessThan(kWideTestViewportSize.height));
      await tester.tap(find.bySemanticsLabel('Close'));
      await tester.pumpAndSettle();
      expect(find.text('Row'), findsNothing);
    });

    testWidgets('a mouse opens menu sheets as a context menu at the press', (
      tester,
    ) async {
      _setSize(tester, kWideTestViewportSize);
      await tester.pumpWidget(
        _app(
          touch: false,
          builder: (BuildContext context) =>
              _openButton(context, variant: FluxerBottomSheetVariant.menu),
        ),
      );
      final Offset press = tester.getCenter(find.text('Open'));
      final BuildContext appContext = tester.element(find.text('Open'));
      ProviderScope.containerOf(
        appContext,
      ).read(inputModalityProvider.notifier).lastPointerDownPosition = press;
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final route = _routeOf(tester, 'Row') as FluxerDesktopRoute<dynamic>;
      expect(route.surface, FluxerDesktopSurface.menu);
      expect(find.byType(FluxerDesktopMenuPanel), findsOneWidget);
      expect(find.byType(FluxerDesktopMenuRow), findsOneWidget);
      expect(find.text('SECTION'), findsOneWidget);
      expect(
        tester.getTopLeft(find.byType(FluxerDesktopMenuPanel)),
        press + const Offset(0, kFluxerDesktopMenuPointerOffset),
      );
      expect(tester.getSize(find.byType(FluxerDesktopMenuRow)).height, 32);
    });

    testWidgets('escape and clicking away dismiss a desktop menu', (
      tester,
    ) async {
      _setSize(tester, kWideTestViewportSize);
      await tester.pumpWidget(
        _app(
          touch: false,
          builder: (BuildContext context) =>
              _openButton(context, variant: FluxerBottomSheetVariant.menu),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();
      expect(find.text('Row'), findsNothing);

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      await tester.tapAt(const Offset(4, 4));
      await tester.pumpAndSettle();
      expect(find.text('Row'), findsNothing);
    });

    testWidgets('scrollable sheets fit short content in a desktop modal', (
      tester,
    ) async {
      _setSize(tester, kWideTestViewportSize);
      await tester.pumpWidget(
        _app(
          touch: false,
          builder: (BuildContext context) => TextButton(
            onPressed: () => unawaited(
              FluxerBottomSheet.showScrollable<void>(
                context,
                title: 'Scrollable',
                builder: (sheetContext, controller, close) => ListView(
                  controller: controller,
                  children: const [SizedBox(height: 300, child: Text('Body'))],
                ),
              ),
            ),
            child: const Text('Open'),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Body'), findsOneWidget);
      final Size modal = tester.getSize(
        find
            .ancestor(of: find.text('Body'), matching: find.byType(Material))
            .first,
      );
      expect(modal.width, 600);
      expect(modal.height, lessThan(460));
    });
  });

  group('FluxerSelect presentation', () {
    testWidgets('a mouse opens the options as a dropdown under the field', (
      tester,
    ) async {
      _setSize(tester, kWideTestViewportSize);
      await tester.pumpWidget(
        _app(
          touch: false,
          builder: (BuildContext context) => SizedBox(
            width: 320,
            child: FluxerSelect<int>(
              value: 1,
              stretch: true,
              onChanged: (_) {},
              items: const [
                FluxerSelectItem<int>(value: 1, label: 'One'),
                FluxerSelectItem<int>(value: 2, label: 'Two'),
              ],
            ),
          ),
        ),
      );
      final Rect field = tester.getRect(find.byType(FluxerSelect<int>));
      await tester.tap(find.text('One'));
      await tester.pumpAndSettle();

      final Finder panel = find.byType(FluxerDesktopMenuPanel);
      expect(panel, findsOneWidget);
      expect(tester.getSize(panel).width, field.width);
      expect(tester.getTopLeft(panel), field.bottomLeft + const Offset(0, 4));
      expect(tester.getSize(panel).height, lessThan(240));
    });
  });

  group('FluxerBottomSheet.showScrollable menu variant', () {
    testWidgets('uses menu width rather than the modal width', (tester) async {
      _setSize(tester, kWideTestViewportSize);
      await tester.pumpWidget(
        _app(
          touch: false,
          builder: (BuildContext context) => TextButton(
            onPressed: () => unawaited(
              FluxerBottomSheet.showScrollable<void>(
                context,
                desktop: const FluxerDesktopPresentation(
                  surface: FluxerDesktopSurface.menu,
                ),
                builder: (sheetContext, controller, close) => ListView(
                  controller: controller,
                  children: [
                    FluxerBottomSheetMenuItem(label: 'Row', onTap: close),
                  ],
                ),
              ),
            ),
            child: const Text('Open'),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(
        tester.getSize(find.byType(FluxerDesktopMenuPanel)).width,
        kFluxerDesktopMenuDefaultWidth,
      );
    });
  });

  group('FluxerActionMenu presentation', () {
    Widget actionButton(BuildContext context) => TextButton(
      onPressed: () => unawaited(
        FluxerActionMenu.show(
          context,
          position: const Offset(240, 180),
          builder: (BuildContext menuContext, VoidCallback close) => [
            FluxerMenuItem(label: 'Edit', onPressed: close),
            FluxerMenuRadioItem(
              label: 'Radio',
              isSelected: true,
              onPressed: close,
            ),
            FluxerMenuSubmenuItem(label: 'More', onPressed: close),
          ],
        ),
      ),
      child: const Text('Open'),
    );

    testWidgets('touch on a tablet gets a sheet with every row type', (
      tester,
    ) async {
      _setSize(tester, tablet);
      await tester.pumpWidget(_app(touch: true, builder: actionButton));
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(_routeOf(tester, 'Edit'), isA<FluxerSheetRoute<void>>());
      expect(find.text('Radio'), findsOneWidget);
      expect(find.text('More'), findsOneWidget);
    });

    testWidgets('a mouse gets a panel that closes through the callback', (
      tester,
    ) async {
      _setSize(tester, kWideTestViewportSize);
      await tester.pumpWidget(_app(touch: false, builder: actionButton));
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.byType(FluxerDesktopMenuPanel), findsOneWidget);
      expect(
        tester.getTopLeft(find.byType(FluxerDesktopMenuPanel)),
        const Offset(240, 180 + kFluxerDesktopMenuPointerOffset),
      );
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();
      expect(find.text('Edit'), findsNothing);
    });
  });
}
