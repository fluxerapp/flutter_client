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

Widget _buildSpacerHarness(ProviderContainer container) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: const Scaffold(
        body: MediaQuery(
          data: _mobileMediaQuery,
          child: Column(
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
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
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
  });

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
        height > _homeInset ? height : _homeInset,
      );
    }

    notifier.syncViewInsets(0, safeAreaBottom: 0);
    await tester.pump();
    expect(tester.getSize(find.byType(BottomInputSpacer)).height, 0);

    await tester.pump(const Duration(milliseconds: 500));
  });

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
}
