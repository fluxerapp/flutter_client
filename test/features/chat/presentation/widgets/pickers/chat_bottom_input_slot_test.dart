import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_bottom_input_slot.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

const double _homeInset = 34;
const MediaQueryData _mobileMediaQuery = MediaQueryData(
  size: Size(400, 800),
  viewPadding: EdgeInsets.only(bottom: _homeInset),
);

Finder _spacerSizedBoxFinder() {
  return find.descendant(
    of: find.byType(BottomInputSpacer),
    matching: find.byWidgetPredicate(
      (Widget widget) => widget is SizedBox && widget.height != null,
    ),
  );
}

Widget _buildSpacerHarness(
  ProviderContainer container, {
  MediaQueryData mediaQuery = _mobileMediaQuery,
}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: MediaQuery(
          data: mediaQuery,
          child: const Column(
            children: <Widget>[
              Expanded(child: SizedBox()),
              BottomInputSpacer(),
            ],
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('BottomInputSpacer reserves anchor height when panel is open', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(mobileKeyboardMetricsProvider.notifier)
      ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
      ..syncViewInsets(0, safeAreaBottom: 0);
    container.read(expressionPanelProvider.notifier).open();

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
          home: const Scaffold(
            body: MediaQuery(
              data: _mobileMediaQuery,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(child: ColoredBox(color: Color(0xFF111111))),
                    SizedBox(
                      height: 56,
                      child: ColoredBox(color: Color(0xFF222222)),
                    ),
                    BottomInputSpacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(
      tester
          .getSize(
            find.descendant(
              of: find.byType(BottomInputSpacer),
              matching: find.byType(AnimatedContainer),
            ),
          )
          .height,
      greaterThan(200),
    );
  });

  testWidgets('BottomInputSpacer grows from the safe bar when opened at rest', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(mobileKeyboardMetricsProvider.notifier)
      ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
      ..syncViewInsets(0, safeAreaBottom: 0);

    await tester.pumpWidget(_buildSpacerHarness(container));
    await tester.pump();
    expect(tester.getSize(find.byType(BottomInputSpacer)).height, 0);

    container.read(expressionPanelProvider.notifier).open();
    await tester.pump();
    expect(
      tester.getSize(find.byType(BottomInputSpacer)).height,
      _homeInset - kMobileComposerBottomGap,
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    final double midHeight = tester
        .getSize(find.byType(BottomInputSpacer))
        .height;
    expect(midHeight, greaterThan(_homeInset));

    await tester.pumpAndSettle();
    final double settledHeight = tester
        .getSize(find.byType(BottomInputSpacer))
        .height;
    expect(settledHeight, greaterThan(200));
    expect(midHeight, lessThan(settledHeight));
  });

  testWidgets('BottomInputSpacer swaps instantly when opening over keyboard', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(mobileKeyboardMetricsProvider.notifier)
      ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
      ..debugApplyNativeMetrics(
        keyboardHeight: 336,
        isKeyboardVisible: true,
        nativeSafeAreaBottom: 34,
      )
      ..syncViewInsets(336, safeAreaBottom: 0);

    await tester.pumpWidget(_buildSpacerHarness(container));
    await tester.pump();

    container.read(expressionPanelProvider.notifier).open();
    await tester.pump();
    expect(tester.getSize(find.byType(BottomInputSpacer)).height, 336);

    await tester.pump(const Duration(milliseconds: 500));
  });

  testWidgets(
    'BottomInputSpacer matches keyboard slot height when panel is closed',
    (tester) async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(mobileKeyboardMetricsProvider.notifier)
        ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
        ..syncViewInsets(336, safeAreaBottom: 0);

      await tester.pumpWidget(_buildSpacerHarness(container));
      await tester.pump();

      expect(container.read(bottomInputSlotProvider).slotHeight, 336);
      expect(
        find.descendant(
          of: find.byType(BottomInputSpacer),
          matching: find.byType(AnimatedContainer),
        ),
        findsNothing,
      );
      expect(tester.getSize(_spacerSizedBoxFinder()).height, 336);

      await tester.pump(const Duration(milliseconds: 500));
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets('BottomInputSpacer tracks keyboard height without overshoot', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    final MobileKeyboardMetrics notifier = container.read(
      mobileKeyboardMetricsProvider.notifier,
    )..updateLayout(screenHeight: 800, isPortrait: true, isIos: true);

    await tester.pumpWidget(_buildSpacerHarness(container));
    await tester.pump();

    for (final double height in <double>[300, 310, 302]) {
      notifier.syncViewInsets(height, safeAreaBottom: 0);
      await tester.pump();
      expect(tester.getSize(_spacerSizedBoxFinder()).height, height);
    }

    await tester.pump(const Duration(milliseconds: 500));
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets(
    'BottomInputSpacer follows a shrinking inset before the provider syncs',
    (tester) async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(mobileKeyboardMetricsProvider.notifier)
        ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
        ..syncViewInsets(336, safeAreaBottom: 0);

      await tester.pumpWidget(
        _buildSpacerHarness(
          container,
          mediaQuery: _mobileMediaQuery.copyWith(
            viewInsets: const EdgeInsets.only(bottom: 336),
          ),
        ),
      );
      await tester.pump();
      expect(tester.getSize(_spacerSizedBoxFinder()).height, 336);

      await tester.pumpWidget(
        _buildSpacerHarness(
          container,
          mediaQuery: _mobileMediaQuery.copyWith(
            viewInsets: const EdgeInsets.only(bottom: 270),
          ),
        ),
      );
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        336,
      );
      expect(tester.getSize(_spacerSizedBoxFinder()).height, 270);

      await tester.pump(const Duration(milliseconds: 500));
    },
  );

  testWidgets(
    'BottomInputSpacer collapses when viewInsets clear before native',
    (tester) async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      final MobileKeyboardMetrics notifier = container.read(
        mobileKeyboardMetricsProvider.notifier,
      )..updateLayout(screenHeight: 800, isPortrait: true, isIos: true);

      await tester.pumpWidget(_buildSpacerHarness(container));
      await tester.pump();

      notifier
        ..debugApplyNativeMetrics(
          keyboardHeight: 336,
          isKeyboardVisible: true,
          nativeSafeAreaBottom: 34,
        )
        ..syncViewInsets(302, safeAreaBottom: 0);
      await tester.pump();
      expect(tester.getSize(_spacerSizedBoxFinder()).height, 302);

      notifier.syncViewInsets(0, safeAreaBottom: 34);
      await tester.pump();
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        0,
      );
      expect(tester.getSize(find.byType(BottomInputSpacer)).height, 0);

      notifier.debugApplyNativeMetrics(
        keyboardHeight: 0,
        isKeyboardVisible: false,
        nativeSafeAreaBottom: 34,
      );
      await tester.pump();
      expect(tester.getSize(find.byType(BottomInputSpacer)).height, 0);

      await tester.pump(const Duration(milliseconds: 500));
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets('BottomInputSpacer stays collapsed when keyboard is dismissed', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    final MobileKeyboardMetrics notifier = container.read(
      mobileKeyboardMetricsProvider.notifier,
    )..updateLayout(screenHeight: 800, isPortrait: true, isIos: true);

    await tester.pumpWidget(_buildSpacerHarness(container));
    await tester.pump();

    expect(tester.getSize(find.byType(BottomInputSpacer)).height, 0);

    for (final double height in <double>[100, 20]) {
      notifier.syncViewInsets(height, safeAreaBottom: 0);
      await tester.pump();
      expect(
        tester.getSize(_spacerSizedBoxFinder()).height,
        math.max(height, _homeInset - kMobileComposerBottomGap),
      );
    }

    notifier.syncViewInsets(0, safeAreaBottom: 0);
    await tester.pump();
    expect(tester.getSize(find.byType(BottomInputSpacer)).height, 0);

    await tester.pump(const Duration(milliseconds: 500));
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets(
    'BottomInputSpacer reserves height when the attachment panel is open',
    (tester) async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(mobileKeyboardMetricsProvider.notifier)
        ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
        ..syncViewInsets(0, safeAreaBottom: 0);
      container.read(attachmentPanelProvider.notifier).open();

      await tester.pumpWidget(_buildSpacerHarness(container));
      await tester.pumpAndSettle();

      expect(
        container.read(bottomInputSlotProvider).slotHeight,
        greaterThan(200),
      );
      expect(
        tester
            .getSize(
              find.descendant(
                of: find.byType(BottomInputSpacer),
                matching: find.byType(AnimatedContainer),
              ),
            )
            .height,
        greaterThan(200),
      );
    },
  );

  testWidgets(
    'switching from expression panel to attachment panel keeps slot height',
    (tester) async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(mobileKeyboardMetricsProvider.notifier)
        ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
        ..syncViewInsets(0, safeAreaBottom: 0);
      container.read(expressionPanelProvider.notifier).open();

      await tester.pumpWidget(_buildSpacerHarness(container));
      await tester.pumpAndSettle();

      final double expressionHeight = container
          .read(bottomInputSlotProvider)
          .slotHeight;
      expect(expressionHeight, greaterThan(200));

      container.read(attachmentPanelProvider.notifier).open();
      container.read(expressionPanelProvider.notifier).close();
      await tester.pump();

      expect(
        container.read(bottomInputSlotProvider).slotHeight,
        expressionHeight,
      );
      expect(container.read(bottomInputSlotProvider).slotHeight, isNot(0));
    },
  );

  testWidgets(
    'attachment panel uses fallback height when only a shortcut bar is visible',
    (tester) async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(mobileKeyboardMetricsProvider.notifier)
        ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
        ..syncViewInsets(55, safeAreaBottom: 0);
      container.read(attachmentPanelProvider.notifier).open();

      await tester.pumpWidget(_buildSpacerHarness(container));
      await tester.pumpAndSettle();

      expect(
        container.read(mobileKeyboardMetricsProvider).anchoredKeyboardHeight,
        isNull,
      );
      expect(
        container.read(bottomInputSlotProvider).slotHeight,
        kIosFallbackKeyboardHeight,
      );
      expect(
        tester
            .getSize(
              find.descendant(
                of: find.byType(BottomInputSpacer),
                matching: find.byType(AnimatedContainer),
              ),
            )
            .height,
        kIosFallbackKeyboardHeight,
      );
    },
  );

  testWidgets(
    'BottomInputSpacer animates down when a closing panel releases its slot',
    (tester) async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(mobileKeyboardMetricsProvider.notifier)
        ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
        ..syncViewInsets(0, safeAreaBottom: 0);
      container.read(expressionPanelProvider.notifier).open();

      await tester.pumpWidget(_buildSpacerHarness(container));
      await tester.pumpAndSettle();

      final Finder spacer = find.byType(BottomInputSpacer);
      final double openHeight = tester.getSize(spacer).height;
      expect(openHeight, greaterThan(200));

      container.read(bottomInputSlotProvider.notifier)
        ..holdSlotHeight(openHeight)
        ..holdSlotHeight(0);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));

      expect(tester.getSize(spacer).height, greaterThan(openHeight / 2));

      await tester.pumpAndSettle();
      expect(tester.getSize(spacer).height, 0);
    },
  );
}
