import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/system_dynamic_colors.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

void main() {
  const SystemDynamicPalette palette = SystemDynamicPalette(
    accentHue: 140,
    accentChroma: 40,
    neutralHue: 140,
    neutralChroma: 6,
  );

  Hct hct(Color color) => Hct.fromInt(color.withValues(alpha: 1).toARGB32());

  test('returns base theme when no palette is active', () {
    final FluxerColorTheme base = buildDarkColorTheme();
    expect(
      applySystemDynamicColors(base, palette: null, saturationFactor: 1),
      same(base),
    );
  });

  test('fully desaturated theme stays achromatic', () {
    final FluxerColorTheme tinted = applySystemDynamicColors(
      buildDarkColorTheme(saturationFactor: 0),
      palette: palette,
      saturationFactor: 0,
    );
    expect(hct(tinted.brandPrimary).chroma, lessThan(2));
    expect(hct(tinted.backgroundSecondary).chroma, lessThan(2));
  });

  for (final (String name, FluxerColorTheme base)
      in <(String, FluxerColorTheme)>[
        ('dark', buildDarkColorTheme()),
        ('light', buildLightColorTheme()),
      ]) {
    test('$name: retints neutrals and accent while keeping tone', () {
      final FluxerColorTheme tinted = applySystemDynamicColors(
        base,
        palette: palette,
        saturationFactor: 1,
      );
      for (final (Color before, Color after) in <(Color, Color)>[
        (base.backgroundPrimary, tinted.backgroundPrimary),
        (base.backgroundSecondary, tinted.backgroundSecondary),
        (base.brandPrimary, tinted.brandPrimary),
      ]) {
        expect(hct(after).tone, closeTo(hct(before).tone, 1.5));
        expect(hct(after).hue, closeTo(140, 12));
      }
      expect(tinted.backgroundModifierHover.a, base.backgroundModifierHover.a);
      expect(tinted.statusDnd, base.statusDnd);
      expect(tinted.textLink, base.textLink);
    });
  }
}
