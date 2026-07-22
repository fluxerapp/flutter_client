import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_bottom_input_slot.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

void main() {
  testWidgets('BottomInputSpacer reserves anchor height when panel is open', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    final colorTheme = buildDarkColorTheme();
    container.read(mobileKeyboardMetricsProvider.notifier)
      ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
      ..syncViewInsets(0, safeAreaBottom: 0);
    container.read(expressionPanelProvider.notifier).open();

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: const Scaffold(
            body: MediaQuery(
              data: MediaQueryData(size: Size(400, 800)),
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
    await tester.pump();
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(BottomInputSpacer), findsOneWidget);
    final Size spacerSize = tester.getSize(
      find.descendant(
        of: find.byType(BottomInputSpacer),
        matching: find.byType(AnimatedContainer),
      ),
    );
    expect(spacerSize.height, greaterThan(200));

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 500));
  });

  testWidgets(
    'BottomInputSpacer uses keyboard slot height when panel is closed',
    (tester) async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      final colorTheme = buildDarkColorTheme();
      container.read(mobileKeyboardMetricsProvider.notifier)
        ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
        ..syncViewInsets(336, safeAreaBottom: 0);
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            localizationsDelegates: FluxerLocalizations.localizationsDelegates,
            supportedLocales: FluxerLocalizations.supportedLocales,
            theme: buildFluxerTheme(
              colorTheme: colorTheme,
              textTheme: FluxerTextTheme.fromColors(colorTheme),
              layoutTheme: FluxerLayoutTheme.scaled(),
            ),
            home: const Scaffold(
              body: MediaQuery(
                data: MediaQueryData(size: Size(400, 800)),
                child: Column(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    BottomInputSpacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();

      final BottomInputSlotState slotState = container.read(
        bottomInputSlotProvider,
      );
      expect(slotState.slotHeight, 336);
      final Size spacerSize = tester.getSize(
        find.descendant(
          of: find.byType(BottomInputSpacer),
          matching: find.byType(AnimatedContainer),
        ),
      );
      expect(spacerSize.height, 336);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(milliseconds: 500));
    },
  );
}
