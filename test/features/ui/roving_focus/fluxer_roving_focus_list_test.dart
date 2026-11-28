import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/roving_focus/fluxer_roving_focus_item.dart';
import 'package:fluxer_app/features/ui/roving_focus/fluxer_roving_focus_list.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

Widget row(String label, {Widget? trailing}) {
  return FluxerRovingFocusItem(
    child: FluxerTappable(
      onTap: () {},
      semanticLabel: label,
      builder: (context, states) => SizedBox(
        height: 32,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            ?trailing,
          ],
        ),
      ),
    ),
  );
}

Widget harness({bool enabled = true}) {
  return Column(
    children: <Widget>[
      FluxerTappable(
        onTap: () {},
        semanticLabel: 'before',
        builder: (context, states) => const SizedBox(height: 32, width: 32),
      ),
      FluxerRovingFocusList(
        enabled: enabled,
        child: Column(
          children: <Widget>[
            row('a'),
            row(
              'b',
              trailing: FluxerTappable(
                onTap: () {},
                semanticLabel: 'b-action',
                builder: (context, states) =>
                    const SizedBox(height: 16, width: 16),
              ),
            ),
            row('c'),
          ],
        ),
      ),
      FluxerTappable(
        onTap: () {},
        semanticLabel: 'after',
        builder: (context, states) => const SizedBox(height: 32, width: 32),
      ),
    ],
  );
}

String? focusedLabel() {
  final BuildContext? focusContext =
      FocusManager.instance.primaryFocus?.context;
  return focusContext
      ?.findAncestorWidgetOfExactType<FluxerTappable>()
      ?.semanticLabel;
}

Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
  await tester.sendKeyEvent(key);
  await tester.pump();
}

Future<void> shiftTab(WidgetTester tester) async {
  await tester.sendKeyDownEvent(LogicalKeyboardKey.shift);
  await press(tester, LogicalKeyboardKey.tab);
  await tester.sendKeyUpEvent(LogicalKeyboardKey.shift);
}

void main() {
  group('FluxerRovingFocusList', () {
    testWidgets('arrows move between items and wrap', (tester) async {
      await tester.pumpWidget(buildTestApp(harness()));
      await press(tester, LogicalKeyboardKey.tab);
      await press(tester, LogicalKeyboardKey.tab);
      expect(focusedLabel(), 'a');

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedLabel(), 'b');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedLabel(), 'c');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedLabel(), 'a');
      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focusedLabel(), 'c');
    });

    testWidgets('Home and End jump to the ends', (tester) async {
      await tester.pumpWidget(buildTestApp(harness()));
      await press(tester, LogicalKeyboardKey.tab);
      await press(tester, LogicalKeyboardKey.tab);

      await press(tester, LogicalKeyboardKey.end);
      expect(focusedLabel(), 'c');
      await press(tester, LogicalKeyboardKey.home);
      expect(focusedLabel(), 'a');
    });

    testWidgets('Tab enters at the last item and leaves the list', (
      tester,
    ) async {
      await tester.pumpWidget(buildTestApp(harness()));
      await press(tester, LogicalKeyboardKey.tab);
      await press(tester, LogicalKeyboardKey.tab);
      await press(tester, LogicalKeyboardKey.end);
      expect(focusedLabel(), 'c');

      await press(tester, LogicalKeyboardKey.tab);
      expect(focusedLabel(), 'after');

      await shiftTab(tester);
      expect(focusedLabel(), 'c');

      await press(tester, LogicalKeyboardKey.home);
      expect(focusedLabel(), 'a');
      await shiftTab(tester);
      expect(focusedLabel(), 'before');
    });

    testWidgets('nested controls in an item stay tabbable', (tester) async {
      await tester.pumpWidget(buildTestApp(harness()));
      await press(tester, LogicalKeyboardKey.tab);
      await press(tester, LogicalKeyboardKey.tab);
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focusedLabel(), 'b');

      await press(tester, LogicalKeyboardKey.tab);
      expect(focusedLabel(), 'b-action');
      await press(tester, LogicalKeyboardKey.tab);
      expect(focusedLabel(), 'after');
    });

    testWidgets('ignores arrows when disabled', (tester) async {
      await tester.pumpWidget(buildTestApp(harness(enabled: false)));
      await press(tester, LogicalKeyboardKey.tab);
      await press(tester, LogicalKeyboardKey.tab);
      expect(focusedLabel(), 'a');

      const KeyEvent event = KeyDownEvent(
        physicalKey: PhysicalKeyboardKey.arrowDown,
        logicalKey: LogicalKeyboardKey.arrowDown,
        timeStamp: Duration.zero,
      );
      expect(FluxerRovingFocusList.claimsKeyEvent(event), isFalse);
    });
  });
}
