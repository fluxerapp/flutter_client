import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/look_and_feel_step_slider.dart';
import 'package:fluxer_app/features/ui/slider/fluxer_slider.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

const List<int> _stops = <int>[12, 14, 15, 16, 18, 20, 24];

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(
      body: Center(child: SizedBox(width: 320, child: child)),
    ),
  );
}

class _Harness extends StatefulWidget {
  const _Harness({required this.changes});

  final List<int> changes;

  @override
  State<_Harness> createState() => _HarnessState();
}

class _HarnessState extends State<_Harness> {
  int _value = 16;

  @override
  Widget build(BuildContext context) {
    return LookAndFeelStepSlider(
      label: 'Chat font size',
      stops: _stops,
      value: _value,
      defaultValue: 16,
      labelledStops: const <int>[12, 16, 24],
      formatValue: (int value) => '${value}px',
      semanticValue: (int value) => '$value pixels',
      onChanged: (int next) {
        widget.changes.add(next);
        setState(() => _value = next);
      },
    );
  }
}

SemanticsNode _sliderNode(String label) =>
    find.semantics.byLabel(label).evaluate().single;

void main() {
  testWidgets('shows the label, the current value and only labelled stops', (
    tester,
  ) async {
    await tester.pumpWidget(_app(const _Harness(changes: <int>[])));

    expect(find.text('Chat font size'), findsOneWidget);
    expect(find.text('16px'), findsNWidgets(2));
    expect(find.text('12px'), findsOneWidget);
    expect(find.text('24px'), findsOneWidget);
    expect(find.text('14px'), findsNothing);
    expect(find.text('18px'), findsNothing);
  });

  testWidgets('screen readers get the value in words and can step it', (
    tester,
  ) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    final List<int> changes = <int>[];
    await tester.pumpWidget(_app(_Harness(changes: changes)));

    final SemanticsNode node = _sliderNode('Chat font size');
    expect(node.label, 'Chat font size');
    expect(node.value, '16 pixels');
    expect(node.increasedValue, '18 pixels');
    expect(node.decreasedValue, '15 pixels');

    tester.semantics.performAction(
      find.semantics.byLabel('Chat font size'),
      SemanticsAction.increase,
    );
    await tester.pump();
    expect(changes, <int>[18]);
    expect(_sliderNode('Chat font size').value, '18 pixels');
    expect(find.text('18px'), findsOneWidget);

    tester.semantics.performAction(
      find.semantics.byLabel('Chat font size'),
      SemanticsAction.decrease,
    );
    await tester.pump();
    expect(changes, <int>[18, 16]);
    handle.dispose();
  });

  testWidgets('the ends offer no step past the first or last value', (
    tester,
  ) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(
      _app(
        LookAndFeelStepSlider(
          label: 'Space between message groups',
          stops: const <int>[0, 4, 8, 16, 24],
          value: 24,
          defaultValue: 16,
          labelledStops: const <int>[0, 16, 24],
          formatValue: (int value) => '${value}px',
          semanticValue: (int value) => '$value pixels',
          onChanged: (_) {},
        ),
      ),
    );
    final SemanticsNode node = _sliderNode('Space between message groups');
    expect(node.increasedValue, isEmpty);
    expect(node.decreasedValue, '16 pixels');
    handle.dispose();
  });

  testWidgets('arrow keys, Home and End move between stops', (tester) async {
    final List<int> changes = <int>[];
    await tester.pumpWidget(_app(_Harness(changes: changes)));

    Focus.of(
      tester.element(
        find.descendant(
          of: find.byType(FluxerSlider),
          matching: find.byType(Opacity),
        ),
      ),
    ).requestFocus();
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.end);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.home);
    await tester.pump();

    expect(changes, <int>[18, 16, 24, 12]);
  });

  testWidgets('tapping the track snaps to the nearest stop', (tester) async {
    final List<int> changes = <int>[];
    await tester.pumpWidget(_app(_Harness(changes: changes)));

    final Rect bounds = tester.getRect(find.byType(FluxerSlider));
    await tester.tapAt(Offset(bounds.right - 2, bounds.top + 8));
    await tester.pump();
    expect(changes, <int>[24]);

    await tester.tapAt(Offset(bounds.left + 2, bounds.top + 8));
    await tester.pump();
    expect(changes, <int>[24, 12]);
  });
}
