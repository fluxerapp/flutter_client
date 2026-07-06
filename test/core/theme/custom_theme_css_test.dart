import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/css_color_parser.dart';
import 'package:fluxer_app/core/theme/custom_theme_css.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/themes/coal.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';

void main() {
  group('custom_theme_css', () {
    test('extractThemeVariableOverrides parses css variables', () {
      const css =
          ':root { --background-primary: #112233; --text-primary: rgb(1, 2, 3); }';
      final overrides = extractThemeVariableOverrides(css);
      expect(overrides['--background-primary'], '#112233');
      expect(overrides['--text-primary'], 'rgb(1, 2, 3)');
    });

    test('parseCssColor handles hex and hsl with saturation factor', () {
      expect(
        parseCssColor('#AABBCC', saturationFactor: 1)?.toARGB32(),
        0xFFAABBCC,
      );
      final Color? hslColor = parseCssColor(
        'hsl(210, calc(100% * var(--saturation-factor)), 45%)',
        saturationFactor: 0.5,
      );
      expect(hslColor, isNotNull);
    });

    test('applyCustomThemeCss mirrors brand primary to linked tokens', () {
      const css = ':root { --brand-primary: #ff5500; }';
      final base = buildDarkColorTheme();
      final themed = applyCustomThemeCss(base, css: css, saturationFactor: 1);
      expect(themed.brandPrimary, const Color(0xFFFF5500));
      expect(themed.accentPrimary, const Color(0xFFFF5500));
      expect(themed.serverIconActive, const Color(0xFFFF5500));
      expect(themed.brandPrimaryLight, isNot(const Color(0xFFFF5500)));
    });

    test(
      'applyCustomThemeCss resolves var() references in override values',
      () {
        const css = '''
:root {
  --brand-primary: #ff5500;
  --accent-primary: var(--brand-primary);
}
''';
        final base = buildDarkColorTheme();
        final themed = applyCustomThemeCss(base, css: css, saturationFactor: 1);
        expect(themed.brandPrimary, const Color(0xFFFF5500));
        expect(themed.accentPrimary, const Color(0xFFFF5500));
      },
    );

    test('applyCustomThemeCss propagates text link aliases', () {
      const css = ':root { --text-link: #00aabb; }';
      final base = buildDarkColorTheme();
      final themed = applyCustomThemeCss(base, css: css, saturationFactor: 1);
      expect(themed.textLink, const Color(0xFF00AABB));
      expect(themed.accentInfo, const Color(0xFF00AABB));
      expect(themed.markupMentionText, const Color(0xFF00AABB));
    });

    test('parseCssColor resolves hsl calc saturation expressions', () {
      final Color? color = parseCssColor(
        'hsl(242, calc(70% * var(--saturation-factor)), 55%)',
        saturationFactor: 0.5,
      );
      expect(color, isNotNull);
    });

    test('normalizeCustomThemeCss treats blank values as null', () {
      expect(normalizeCustomThemeCss('   '), isNull);
      expect(normalizeCustomThemeCss(':root { }'), isNotNull);
    });

    test(
      'applyCustomThemeCss applies mode-scoped overrides with root winning',
      () {
        const css = '''
.theme-coal { --brand-primary: #010203; }
:root { --brand-primary: #007fff; }
''';
        final base = buildCoalColorTheme();
        final themed = applyCustomThemeCss(
          base,
          css: css,
          saturationFactor: 1,
          mode: FluxerThemeMode.coal,
        );
        expect(themed.brandPrimary, const Color(0xFF007FFF));
      },
    );

    test('clampSaturationFactor clamps to 0..1', () {
      expect(clampSaturationFactor(-1), 0);
      expect(clampSaturationFactor(2), 1);
      expect(clampSaturationFactor(0.75), 0.75);
    });
  });
}
