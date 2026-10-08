import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/coal.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/material_ui.dart';

double _contrast(Color a, Color b) {
  final double x = a.computeLuminance();
  final double y = b.computeLuminance();
  return (math.max(x, y) + 0.05) / (math.min(x, y) + 0.05);
}

void main() {
  for (final (String name, FluxerColorTheme colors, Brightness brightness)
      in <(String, FluxerColorTheme, Brightness)>[
        ('dark', buildDarkColorTheme(), Brightness.dark),
        ('coal', buildCoalColorTheme(), Brightness.dark),
        ('light', buildLightColorTheme(), Brightness.light),
      ]) {
    testWidgets('the unselected ring keeps 3:1 contrast in $name', (
      WidgetTester tester,
    ) async {
      late Color ring;
      await tester.pumpWidget(
        MaterialApp(
          theme: buildFluxerTheme(
            colorTheme: colors,
            textTheme: FluxerTextTheme.fromColors(colors),
            layoutTheme: FluxerLayoutTheme.scaled(),
            brightness: brightness,
          ),
          home: Builder(
            builder: (BuildContext context) {
              ring = fluxerRadioRingColor(context);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
      for (final Color surface in <Color>[
        colors.backgroundPrimary,
        colors.backgroundSecondary,
        colors.backgroundSecondaryAlt,
        colors.backgroundTertiary,
      ]) {
        expect(
          _contrast(Color.alphaBlend(ring, surface), surface),
          greaterThanOrEqualTo(3),
        );
      }
    });
  }
}
