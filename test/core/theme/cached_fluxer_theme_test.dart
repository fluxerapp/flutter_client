import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  test('rebuilding the preference state keeps the same color themes', () {
    final ThemePreferenceState first = ThemePreferenceState(
      customThemeCss: ':root { --brand-primary: #123456; }',
    );
    final ThemePreferenceState second = ThemePreferenceState(
      customThemeCss: ':root { --brand-primary: #123456; }',
    );

    expect(identical(first.darkColorTheme, second.darkColorTheme), isTrue);
    expect(identical(first.lightColorTheme, second.lightColorTheme), isTrue);
    expect(identical(first.coalColorTheme, second.coalColorTheme), isTrue);
    expect(
      identical(first.darkLegacyColorTheme, second.darkLegacyColorTheme),
      isTrue,
    );
  });

  test('changing theme inputs produces new color themes', () {
    final ThemePreferenceState base = ThemePreferenceState();
    final ThemePreferenceState desaturated = ThemePreferenceState(
      saturationFactor: 0.5,
    );
    final ThemePreferenceState styled = ThemePreferenceState(
      customThemeCss: ':root { --brand-primary: #654321; }',
    );

    expect(identical(base.darkColorTheme, desaturated.darkColorTheme), isFalse);
    expect(
      identical(desaturated.darkColorTheme, styled.darkColorTheme),
      isFalse,
    );
    expect(styled.saturationFactor, 1.0);
  });

  test(
    'cachedFluxerTheme returns one ThemeData per color theme and brightness',
    () {
      final ThemePreferenceState state = ThemePreferenceState();

      final ThemeData dark = cachedFluxerTheme(
        colorTheme: state.darkColorTheme,
      );
      final ThemeData light = cachedFluxerTheme(
        colorTheme: state.lightColorTheme,
        brightness: Brightness.light,
      );

      expect(
        identical(dark, cachedFluxerTheme(colorTheme: state.darkColorTheme)),
        isTrue,
      );
      expect(
        identical(
          light,
          cachedFluxerTheme(
            colorTheme: state.lightColorTheme,
            brightness: Brightness.light,
          ),
        ),
        isTrue,
      );
      expect(dark.brightness, Brightness.dark);
      expect(light.brightness, Brightness.light);
    },
  );

  test('forColors shares one text theme per color theme', () {
    final ThemePreferenceState state = ThemePreferenceState();

    expect(
      identical(
        FluxerTextTheme.forColors(state.darkColorTheme),
        state.darkTextTheme,
      ),
      isTrue,
    );
    expect(identical(state.darkTextTheme, state.lightTextTheme), isFalse);
  });
}
