import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/color_picker/fluxer_color_picker_field.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Widget _wrap(Widget child, {Size size = const Size(1200, 800)}) {
  final colorTheme = buildDarkColorTheme();
  return MediaQuery(
    data: MediaQueryData(size: size),
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: Scaffold(
        body: Padding(padding: const EdgeInsets.all(16), child: child),
      ),
    ),
  );
}

void main() {
  group('FluxerColorPickerField input', () {
    testWidgets('valid hex typing notifies onChanged for live preview', (
      tester,
    ) async {
      final values = <int>[];
      await tester.pumpWidget(
        _wrap(
          FluxerColorPickerField(
            value: 0x112233,
            onChanged: values.add,
            label: 'Accent Color',
          ),
        ),
      );

      await tester.enterText(find.byType(EditableText), '#FF0000');
      await tester.pump();

      expect(values, contains(0xFF0000));
    });

    testWidgets('incomplete hex does not notify onChanged', (tester) async {
      final values = <int>[];
      await tester.pumpWidget(
        _wrap(
          FluxerColorPickerField(
            value: 0x112233,
            onChanged: values.add,
            label: 'Accent Color',
          ),
        ),
      );

      await tester.enterText(find.byType(EditableText), '#FF00');
      await tester.pump();

      expect(values, isEmpty);
    });

    testWidgets('opening color swatch dismisses hex keyboard focus', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          FluxerColorPickerField(
            value: 0x112233,
            onChanged: (_) {},
            label: 'Accent Color',
          ),
        ),
      );

      final editableFinder = find.byType(EditableText);
      await tester.tap(editableFinder);
      await tester.pump();
      final editable = tester.widget<EditableText>(editableFinder);
      expect(editable.focusNode.hasFocus, isTrue);

      await tester.tap(find.bySemanticsLabel('Open color picker'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(editable.focusNode.hasFocus, isFalse);
    });
  });
}
