import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
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
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  group('FluxerTappable keyboard activation', () {
    for (final LogicalKeyboardKey key in <LogicalKeyboardKey>[
      LogicalKeyboardKey.enter,
      LogicalKeyboardKey.numpadEnter,
      LogicalKeyboardKey.space,
    ]) {
      testWidgets('activates on ${key.keyLabel}', (tester) async {
        var taps = 0;
        await tester.pumpWidget(
          buildTestApp(
            FluxerTappable(
              onTap: () => taps++,
              builder: (context, states) =>
                  const SizedBox(width: 40, height: 40),
            ),
          ),
        );

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();
        await tester.sendKeyEvent(key);
        await tester.pump();

        expect(taps, 1);
      });
    }

    testWidgets('reports focused state', (tester) async {
      Set<WidgetState> states = <WidgetState>{};
      await tester.pumpWidget(
        buildTestApp(
          FluxerTappable(
            onTap: () {},
            builder: (context, s) {
              states = s;
              return const SizedBox(width: 40, height: 40);
            },
          ),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      expect(states, contains(WidgetState.focused));
    });

    testWidgets('disabled and non-interactive tappables skip focus', (
      tester,
    ) async {
      var taps = 0;
      await tester.pumpWidget(
        buildTestApp(
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FluxerTappable(
                onTap: () => taps++,
                enabled: false,
                builder: (context, states) =>
                    const SizedBox(width: 40, height: 40),
              ),
              FluxerTappable(
                builder: (context, states) =>
                    const SizedBox(width: 40, height: 40),
              ),
            ],
          ),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      expect(taps, 0);
    });
  });
}
