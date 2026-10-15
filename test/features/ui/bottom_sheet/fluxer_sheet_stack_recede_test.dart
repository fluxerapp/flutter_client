import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/test_l10n.dart';

const ValueKey<String> _shellKey = ValueKey<String>('shell-page');
const ValueKey<String> _lowerKey = ValueKey<String>('lower-sheet-body');
const ValueKey<String> _upperKey = ValueKey<String>('upper-sheet-body');

class _Stack {
  _Stack(this.tester);

  final WidgetTester tester;
  late BuildContext shellContext;
  late BuildContext lowerContext;
  late BuildContext upperContext;

  Rect get shell => tester.getRect(find.byKey(_shellKey));
  Rect get lower => tester.getRect(find.byKey(_lowerKey));
  Rect get upper => tester.getRect(find.byKey(_upperKey));

  double get upperScrimAlpha {
    final ModalBarrier barrier = tester
        .widgetList<ModalBarrier>(find.byType(ModalBarrier))
        .last;
    return barrier.color?.a ?? 0;
  }

  Future<void> pump({bool reduceMotion = false, bool nested = false}) async {
    tester.view.physicalSize = const Size(402 * 3, 874 * 3);
    tester.view.devicePixelRatio = 3;
    tester.view.padding = const FakeViewPadding(top: 62 * 3);
    tester.view.viewPadding = const FakeViewPadding(top: 62 * 3);
    addTearDown(tester.view.reset);
    final colorTheme = buildDarkColorTheme();
    final Widget shell = FluxerSheetBackdrop(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext c) {
            shellContext = c;
            return const SizedBox.expand(key: _shellKey);
          },
        ),
      ),
    );
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          builder: (BuildContext context, Widget? child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(disableAnimations: reduceMotion),
            child: child!,
          ),
          home: nested
              ? Navigator(
                  onGenerateRoute: (RouteSettings settings) =>
                      MaterialPageRoute<void>(builder: (_) => shell),
                )
              : shell,
        ),
      ),
    );
  }

  Future<void> openLower({double initialChildSize = 0.95}) async {
    unawaited(
      FluxerBottomSheet.showScrollable<void>(
        shellContext,
        title: 'Lower',
        initialChildSize: initialChildSize,
        builder: (BuildContext c, ScrollController controller, _) {
          lowerContext = c;
          return SingleChildScrollView(
            controller: controller,
            child: const SizedBox(
              key: _lowerKey,
              width: double.infinity,
              height: 2000,
            ),
          );
        },
      ),
    );
    await tester.pumpAndSettle();
  }

  void openUpper({bool useRootNavigator = false}) {
    unawaited(
      FluxerBottomSheet.showScrollable<void>(
        lowerContext,
        title: 'Upper',
        useRootNavigator: useRootNavigator,
        builder: (BuildContext c, ScrollController controller, _) {
          upperContext = c;
          return SingleChildScrollView(
            controller: controller,
            child: const SizedBox(
              key: _upperKey,
              width: double.infinity,
              height: 2000,
            ),
          );
        },
      ),
    );
  }
}

void main() {
  testWidgets('a full-height sheet recedes under a stacked sheet', (
    WidgetTester tester,
  ) async {
    final _Stack stack = _Stack(tester);
    await stack.pump();
    final Rect shellAlone = stack.shell;
    await stack.openLower();
    final Rect lowerBefore = stack.lower;
    final Rect shellBefore = stack.shell;
    expect(shellBefore.width, lessThan(shellAlone.width));

    stack.openUpper();
    await tester.pumpAndSettle();

    final Rect lowerAfter = stack.lower;
    final Rect upper = stack.upper;
    expect(lowerAfter.width, lessThan(lowerBefore.width * 0.95));
    expect(lowerAfter.center.dx, moreOrLessEquals(lowerBefore.center.dx));
    expect(lowerAfter.top, lessThan(upper.top));
    expect(stack.shell.width, lessThan(shellBefore.width * 0.95));

    Navigator.of(stack.upperContext).pop();
    double previousWidth = stack.lower.width;
    for (int frame = 0; frame < 30; frame++) {
      await tester.pump(const Duration(milliseconds: 8));
      final double width = stack.lower.width;
      expect(width, greaterThanOrEqualTo(previousWidth - 0.01));
      previousWidth = width;
    }
    await tester.pumpAndSettle();
    expect(stack.lower, rectMoreOrLessEquals(lowerBefore));
    expect(stack.shell, rectMoreOrLessEquals(shellBefore));
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('a sheet at a partial snap only dims under a stacked sheet', (
    WidgetTester tester,
  ) async {
    final _Stack stack = _Stack(tester);
    await stack.pump();
    await stack.openLower(initialChildSize: 0.5);
    final Rect lowerBefore = stack.lower;
    final Rect shellBefore = stack.shell;

    stack.openUpper();
    await tester.pumpAndSettle();

    expect(stack.lower, rectMoreOrLessEquals(lowerBefore));
    expect(stack.shell, rectMoreOrLessEquals(shellBefore));
    expect(stack.upperScrimAlpha, greaterThan(0.2));
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('a root sheet over a nested sheet recedes the nested sheet', (
    WidgetTester tester,
  ) async {
    final _Stack stack = _Stack(tester);
    await stack.pump(nested: true);
    await stack.openLower();
    final Rect lowerBefore = stack.lower;
    final Rect shellBefore = stack.shell;

    stack.openUpper(useRootNavigator: true);
    await tester.pumpAndSettle();

    expect(stack.lower.width, lessThan(lowerBefore.width * 0.95));
    expect(stack.shell.width, lessThan(shellBefore.width * 0.95));
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('a root sheet over a nested half sheet only dims', (
    WidgetTester tester,
  ) async {
    final _Stack stack = _Stack(tester);
    await stack.pump(nested: true);
    await stack.openLower(initialChildSize: 0.5);
    final Rect lowerBefore = stack.lower;
    final Rect shellBefore = stack.shell;

    stack.openUpper(useRootNavigator: true);
    await tester.pumpAndSettle();

    expect(stack.lower, rectMoreOrLessEquals(lowerBefore));
    expect(stack.shell, rectMoreOrLessEquals(shellBefore));
    expect(stack.upperScrimAlpha, greaterThan(0.2));
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('stacked layers shrink one step each from front to back', (
    WidgetTester tester,
  ) async {
    final _Stack stack = _Stack(tester);
    await stack.pump();
    await stack.openLower();
    stack.openUpper();
    await tester.pumpAndSettle();

    final Rect shell = stack.shell;
    final Rect lower = stack.lower;
    final Rect upper = stack.upper;
    expect(shell.width, lessThan(lower.width));
    expect(lower.width, lessThan(upper.width));
    expect(shell.top, lessThan(lower.top));
    expect(lower.top, lessThan(upper.top));
    expect(
      upper.width - lower.width,
      moreOrLessEquals(
        upper.width * (1 - kFluxerSheetBackdropScale),
        epsilon: 1,
      ),
    );
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('the recede follows a drag on the top sheet', (
    WidgetTester tester,
  ) async {
    final _Stack stack = _Stack(tester);
    await stack.pump();
    await stack.openLower();
    final Rect lowerRest = stack.lower;
    final Rect shellRest = stack.shell;
    stack.openUpper();
    await tester.pumpAndSettle();
    final Rect lowerReceded = stack.lower;
    final Rect shellReceded = stack.shell;

    final TestGesture gesture = await tester.startGesture(
      tester.getCenter(find.text('Upper')),
    );
    await gesture.moveBy(const Offset(0, 20));
    await gesture.moveBy(const Offset(0, 180));
    await tester.pump();

    final Rect lowerDragged = stack.lower;
    final Rect shellDragged = stack.shell;
    expect(lowerDragged.width, greaterThan(lowerReceded.width + 1));
    expect(lowerDragged.width, lessThan(lowerRest.width - 1));
    expect(shellDragged.width, greaterThan(shellReceded.width + 1));
    expect(shellDragged.width, lessThan(shellRest.width - 1));

    await gesture.moveBy(const Offset(0, -200));
    await tester.pump();
    expect(stack.lower, rectMoreOrLessEquals(lowerReceded, epsilon: 0.5));

    await gesture.up();
    await tester.pumpAndSettle();
    expect(stack.lower, rectMoreOrLessEquals(lowerReceded, epsilon: 0.5));
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('reduced motion keeps the dim and skips the scale', (
    WidgetTester tester,
  ) async {
    final _Stack stack = _Stack(tester);
    await stack.pump(reduceMotion: true);
    await stack.openLower();
    final Rect lowerBefore = stack.lower;
    final Rect shellBefore = stack.shell;

    stack.openUpper();
    await tester.pumpAndSettle();

    expect(stack.lower, rectMoreOrLessEquals(lowerBefore));
    expect(stack.shell, rectMoreOrLessEquals(shellBefore));
    expect(stack.upperScrimAlpha, greaterThan(0.2));
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('Android keeps every layer still under a stacked sheet', (
    WidgetTester tester,
  ) async {
    final _Stack stack = _Stack(tester);
    await stack.pump();
    final Rect shellAlone = stack.shell;
    await stack.openLower();
    final Rect lowerBefore = stack.lower;

    stack.openUpper();
    await tester.pumpAndSettle();

    expect(stack.lower, rectMoreOrLessEquals(lowerBefore));
    expect(stack.shell, rectMoreOrLessEquals(shellAlone));
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));
}
