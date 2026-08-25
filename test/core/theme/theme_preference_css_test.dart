import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemePreferenceState custom theme css', () {
    test('builds color themes with brand primary override', () {
      const css = ':root { --brand-primary: #ff5500; }';
      final ThemePreferenceState state = ThemePreferenceState(
        customThemeCss: css,
      );
      expect(state.darkColorTheme.brandPrimary, const Color(0xFFFF5500));
      expect(state.lightColorTheme.brandPrimary, const Color(0xFFFF5500));
      expect(state.coalColorTheme.brandPrimary, const Color(0xFFFF5500));
      expect(state.colorTheme.brandPrimary, const Color(0xFFFF5500));
    });

    test('builds color themes with brand primary override in coal mode', () {
      const css = ':root { --brand-primary: #ff5500; }';
      final ThemePreferenceState state = ThemePreferenceState(
        mode: FluxerThemeMode.coal,
        customThemeCss: css,
      );
      expect(state.coalColorTheme.brandPrimary, const Color(0xFFFF5500));
      expect(state.colorTheme.brandPrimary, const Color(0xFFFF5500));
    });

    test('applies brand primary into Material ThemeData extensions', () {
      const css = ':root { --brand-primary: #ff5500; }';
      final ThemePreferenceState state = ThemePreferenceState(
        customThemeCss: css,
      );
      final ThemeData theme = buildFluxerTheme(
        colorTheme: state.colorTheme,
        textTheme: FluxerTextTheme.fromColors(state.colorTheme),
        layoutTheme: state.layoutTheme,
      );
      final FluxerColorTheme? colors = theme.extension<FluxerColorTheme>();
      expect(colors, isNotNull);
      expect(colors!.brandPrimary, const Color(0xFFFF5500));
      expect(theme.colorScheme.primary, const Color(0xFFFF5500));
    });
  });
}
