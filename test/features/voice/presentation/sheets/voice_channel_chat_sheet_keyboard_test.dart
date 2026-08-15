import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_bottom_input_slot.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

const Key _composerKey = Key('composer');
const double _keyboardHeight = 180;
const double _composerHeight = 56;
const double _screenHeight = 800;

double _maxAnimatedPaddingBottom(WidgetTester tester) {
  double maxBottom = 0;
  for (final Element element in find.byType(AnimatedPadding).evaluate()) {
    final AnimatedPadding padding = element.widget as AnimatedPadding;
    final EdgeInsets resolved = padding.padding.resolve(TextDirection.ltr);
    maxBottom = math.max(maxBottom, resolved.bottom);
  }
  return maxBottom;
}

Future<void> _pumpVoiceChatStyleSheet({
  required WidgetTester tester,
  required bool manageKeyboardInset,
}) async {
  final ProviderContainer container = ProviderContainer();
  addTearDown(container.dispose);
  container.read(mobileKeyboardMetricsProvider.notifier)
    ..updateLayout(screenHeight: _screenHeight, isPortrait: true, isIos: true)
    ..syncViewInsets(_keyboardHeight, safeAreaBottom: 0);
  final colorTheme = buildDarkColorTheme();

  await tester.pumpWidget(
    MediaQuery(
      data: const MediaQueryData(
        size: Size(400, _screenHeight),
        viewInsets: EdgeInsets.only(bottom: _keyboardHeight),
      ),
      child: UncontrolledProviderScope(
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
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    unawaited(
                      FluxerBottomSheet.show<void>(
                        context,
                        reserveBottomInset: false,
                        manageKeyboardInset: manageKeyboardInset,
                        maxHeight: 0.92,
                        builder:
                            (BuildContext sheetContext, VoidCallback close) {
                              return const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                    key: _composerKey,
                                    height: _composerHeight,
                                    width: double.infinity,
                                  ),
                                  BottomInputSpacer(),
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
        ),
      ),
    ),
  );

  await tester.tap(find.text('Open'));
  await tester.pump();
  await tester.pumpAndSettle();
}

double _composerBottomGlobalY(WidgetTester tester) {
  final RenderBox composerBox = tester.renderObject<RenderBox>(
    find.byKey(_composerKey),
  );
  return composerBox.localToGlobal(const Offset(0, _composerHeight)).dy;
}

void main() {
  testWidgets(
    'voice chat sheet with manageKeyboardInset false skips sheet keyboard padding',
    (tester) async {
      await _pumpVoiceChatStyleSheet(
        tester: tester,
        manageKeyboardInset: false,
      );

      expect(_maxAnimatedPaddingBottom(tester), 0);
      final Size spacerSize = tester.getSize(
        find.descendant(
          of: find.byType(BottomInputSpacer),
          matching: find.byWidgetPredicate(
            (Widget widget) => widget is SizedBox && widget.height != null,
          ),
        ),
      );
      expect(spacerSize.height, closeTo(_keyboardHeight, 1));
    },
  );

  testWidgets(
    'voice chat sheet with manageKeyboardInset false sits lower than managed sheet',
    (tester) async {
      await _pumpVoiceChatStyleSheet(
        tester: tester,
        manageKeyboardInset: false,
      );
      final double unmanagedComposerBottom = _composerBottomGlobalY(tester);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pumpAndSettle();

      await _pumpVoiceChatStyleSheet(tester: tester, manageKeyboardInset: true);
      final double managedComposerBottom = _composerBottomGlobalY(tester);

      expect(
        managedComposerBottom,
        lessThan(unmanagedComposerBottom),
        reason:
            'sheet keyboard padding plus BottomInputSpacer must not both lift '
            'the composer',
      );
      expect(unmanagedComposerBottom - managedComposerBottom, greaterThan(50));
    },
  );
}
