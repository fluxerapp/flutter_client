import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/slider/fluxer_slider.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/test_l10n.dart';

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
      body: Center(child: SizedBox(width: 210, child: child)),
    ),
  );
}

String? _sliderValue(WidgetTester tester) {
  return tester
      .widgetList<Semantics>(
        find.descendant(
          of: find.byType(FluxerSlider),
          matching: find.byType(Semantics),
        ),
      )
      .firstWhere((Semantics s) => s.properties.slider ?? false)
      .properties
      .value;
}

void main() {
  testWidgets('controlled slider follows a drag and commits the new value', (
    tester,
  ) async {
    double value = 100;
    final List<double> live = <double>[];
    final List<double> committed = <double>[];
    await tester.pumpWidget(
      _app(
        StatefulBuilder(
          builder: (context, setState) => FluxerSlider(
            value: value,
            defaultValue: value,
            maxValue: 200,
            markers: const <double>[0, 50, 100, 150, 200],
            step: 1,
            asValueChanges: live.add,
            onValueChange: (double next) {
              committed.add(next);
              setState(() => value = next);
            },
          ),
        ),
      ),
    );

    final Finder slider = find.byType(FluxerSlider);
    final Offset start = tester.getCenter(slider);
    final TestGesture gesture = await tester.startGesture(start);
    await gesture.moveBy(const Offset(-30, 0));
    await tester.pump();
    await gesture.moveBy(const Offset(-50, 0));
    await tester.pump();

    expect(double.parse(_sliderValue(tester)!), lessThan(100));

    await gesture.up();
    await tester.pump();

    expect(live, isNotEmpty);
    expect(committed, hasLength(1));
    expect(committed.single, lessThan(100));
    expect(committed.single, live.last);
    expect(value, committed.single);
  });

  testWidgets('controlled slider shows the parent value when idle', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(const FluxerSlider(value: 40, defaultValue: 40, step: 1)),
    );
    expect(_sliderValue(tester), '40.0');
  });
}
