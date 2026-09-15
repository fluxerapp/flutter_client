import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/color_families.dart';
import 'package:fluxer_app/core/theme/color_generator.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/dark_legacy.dart';

void main() {
  group('dark theme palettes', () {
    test('new dark uses the violet-neutral family from desktop', () {
      final dark = buildDarkColorTheme();
      final expectedPrimary = generateTone(
        hue: FluxerColorFamilies.neutralDark.hue,
        saturation: FluxerColorFamilies.neutralDark.saturation,
        lightness: 5,
      );
      expect(dark.backgroundPrimary, expectedPrimary);
      expect(FluxerColorFamilies.neutralDark.hue, 258);
    });

    test('legacy dark keeps the original gray-neutral family', () {
      final legacy = buildDarkLegacyColorTheme();
      final expectedPrimary = generateTone(
        hue: FluxerColorFamilies.legacyDark.hue,
        saturation: FluxerColorFamilies.legacyDark.saturation,
        lightness: 5,
      );
      expect(legacy.backgroundPrimary, expectedPrimary);
      expect(FluxerColorFamilies.legacyDark.hue, 220);
    });

    test('dark and legacy palettes are distinct', () {
      final dark = buildDarkColorTheme();
      final legacy = buildDarkLegacyColorTheme();
      expect(dark.backgroundPrimary, isNot(legacy.backgroundPrimary));
      expect(dark.backgroundSecondary, isNot(legacy.backgroundSecondary));
      expect(dark.textLink, isNot(legacy.textLink));
    });
  });

  group('FluxerThemeMode api values', () {
    test('maps dark_legacy to the SDK theme id', () {
      expect(FluxerThemeMode.dark.apiValue, 'dark');
      expect(FluxerThemeMode.darkLegacy.apiValue, 'dark_legacy');
      expect(
        FluxerThemeMode.fromApiValue('dark_legacy'),
        FluxerThemeMode.darkLegacy,
      );
      expect(
        FluxerThemeMode.fromApiValue('darkLegacy'),
        FluxerThemeMode.darkLegacy,
      );
    });
  });
}
