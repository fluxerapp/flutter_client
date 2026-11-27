import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/presentation/keybind_recorder.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Widget _buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    home: Scaffold(body: Center(child: child)),
  );
}

Future<List<StoredKeybindCombo>> _pumpRecorder(WidgetTester tester) async {
  final List<StoredKeybindCombo> recorded = <StoredKeybindCombo>[];
  await tester.pumpWidget(
    _buildTestApp(
      KeybindRecorder(
        combo: const StoredKeybindCombo(global: true, enabled: true),
        onChanged: recorded.add,
      ),
    ),
  );
  await tester.tap(find.byType(KeybindRecorder));
  await tester.pump();
  expect(KeybindRecorder.isRecording, isTrue);
  return recorded;
}

void main() {
  testWidgets('records a mouse side button while recording', (tester) async {
    final List<StoredKeybindCombo> recorded = await _pumpRecorder(tester);

    final TestGesture gesture = await tester.startGesture(
      tester.getTopLeft(find.byType(Scaffold)) + const Offset(5, 5),
      kind: PointerDeviceKind.mouse,
      buttons: kBackMouseButton,
    );
    await gesture.up();
    await tester.pump();

    expect(recorded, hasLength(1));
    expect(recorded.single.mouseButton, 3);
    expect(recorded.single.global, isTrue);
    expect(recorded.single.hasTriggerInput, isTrue);
    expect(KeybindRecorder.isRecording, isFalse);
  });

  testWidgets('shows a localized label for a mouse binding', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(
        KeybindRecorder(
          combo: const StoredKeybindCombo(mouseButton: 4),
          onChanged: (_) {},
        ),
      ),
    );

    expect(find.text('Mouse forward button'), findsOneWidget);
  });

  testWidgets('left click does not become a keybind', (tester) async {
    final List<StoredKeybindCombo> recorded = await _pumpRecorder(tester);

    final TestGesture gesture = await tester.startGesture(
      tester.getTopLeft(find.byType(Scaffold)) + const Offset(5, 5),
      kind: PointerDeviceKind.mouse,
    );
    await gesture.up();
    await tester.pump();

    expect(recorded, isEmpty);
  });
}
