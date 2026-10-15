import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/theme_color_editor.dart';
import 'package:fluxer_app/core/theme/theme_variable_mapping.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('theme_color_editor', () {
    test('themeColorToCssHex formats six digit hex', () {
      expect(themeColorToCssHex(const Color(0xFFFF5500)), '#ff5500');
    });
    test('canonical tokens exclude duplicate css aliases per property', () {
      final Map<String, String> canonical =
          buildCanonicalCssVariableByProperty();
      expect(canonical['backgroundPrimary'], '--background-primary');
      expect(canonical['chatBackground'], '--chat-background');
      expect(
        kEditableThemeColorTokens
            .where((t) => t.propertyName == 'backgroundPrimary')
            .length,
        1,
      );
    });

    test(
      'upsertScopedThemeColor overrides root brand primary for dark mode',
      () {
        const wireCss = ':root { --brand-primary: #007fff; }';
        final String next = upsertScopedThemeColor(
          customThemeCss: wireCss,
          editingMode: FluxerThemeMode.dark,
          cssVariable: '--brand-primary',
          hexValue: '#ff5500',
        );
        expect(next, isNotEmpty);
        final Color color = effectiveThemeColorForProperty(
          customThemeCss: next,
          propertyName: 'brandPrimary',
          editingMode: FluxerThemeMode.dark,
        );
        expect(color, const Color(0xFFFF5500));
      },
    );

    test('upsertScopedThemeColor writes scoped block for dark mode', () {
      const css = '.theme-light { --text-primary: #ffffff; }';
      final String next = upsertScopedThemeColor(
        customThemeCss: css,
        editingMode: FluxerThemeMode.dark,
        cssVariable: '--brand-primary',
        hexValue: '#ff5500',
      );
      expect(next, contains('.theme-dark'));
      expect(next, contains('--brand-primary: #ff5500'));
      expect(next, contains('.theme-light'));
    });

    test('clearScopedThemeColor removes override for mode', () {
      const css = '''
.theme-dark {
  --brand-primary: #ff5500;
  --text-primary: #111111;
}
''';
      final String next = clearScopedThemeColor(
        customThemeCss: css,
        editingMode: FluxerThemeMode.dark,
        cssVariable: '--brand-primary',
      );
      expect(next, isNot(contains('--brand-primary')));
      expect(next, contains('--text-primary'));
    });

    test('reset clears a Theme Studio root override for the edited mode', () {
      const css = '''
:root {
  --brand-primary: #007fff;
}
.theme-dark {
  --brand-primary: #ff5500;
}
''';
      expect(
        isThemeColorOverriddenForMode(
          customThemeCss: ':root { --brand-primary: #007fff; }',
          cssVariable: '--brand-primary',
          editingMode: FluxerThemeMode.coal,
        ),
        isTrue,
      );
      final String next = clearScopedThemeColor(
        customThemeCss: css,
        editingMode: FluxerThemeMode.dark,
        cssVariable: '--brand-primary',
      );
      expect(next, isEmpty);
      expect(
        effectiveThemeColorForProperty(
          customThemeCss: next,
          propertyName: 'brandPrimary',
          editingMode: FluxerThemeMode.dark,
        ),
        defaultThemeColorForProperty(
          'brandPrimary',
          mode: FluxerThemeMode.dark,
        ),
      );
    });

    test('reset all clears every scope the edited mode inherits', () {
      const css = '''
:root {
  --brand-primary: #007fff;
}
.theme-dark {
  --text-primary: #111111;
}
.theme-light {
  --text-primary: #eeeeee;
}
''';
      final String next = clearAllScopedThemeColorsForMode(
        customThemeCss: css,
        editingMode: FluxerThemeMode.coal,
      );
      expect(
        hasThemeColorOverridesForMode(
          customThemeCss: next,
          editingMode: FluxerThemeMode.coal,
        ),
        isFalse,
      );
      expect(next, isNot(contains('--brand-primary')));
      expect(next, isNot(contains('#111111')));
      expect(next, contains('.theme-light'));
    });

    test('every editable token reads its own color', () {
      for (final ThemeColorTokenDefinition token in kEditableThemeColorTokens) {
        expect(
          kThemePropertyColorReaders.containsKey(token.propertyName),
          isTrue,
          reason: token.propertyName,
        );
      }
      expect(
        effectiveThemeColorForProperty(
          customThemeCss: '.theme-dark { --chat-background: #0000ff; }',
          propertyName: 'chatBackground',
          editingMode: FluxerThemeMode.dark,
        ),
        const Color(0xFF0000FF),
      );
      expect(
        defaultThemeColorForProperty(
          'markupMentionFill',
          mode: FluxerThemeMode.dark,
        ),
        isNot(
          defaultThemeColorForProperty(
            'textPrimary',
            mode: FluxerThemeMode.dark,
          ),
        ),
      );
    });

    test('effectiveThemeColorForProperty applies scoped override', () {
      const css = '.theme-dark { --brand-primary: #00ff00; }';
      final Color color = effectiveThemeColorForProperty(
        customThemeCss: css,
        propertyName: 'brandPrimary',
        editingMode: FluxerThemeMode.dark,
      );
      expect(color, const Color(0xFF00FF00));
    });

    test('themeColorEditingMode resolves system from platform brightness', () {
      expect(
        themeColorEditingMode(
          FluxerThemeMode.system,
          platformBrightness: Brightness.dark,
        ),
        FluxerThemeMode.dark,
      );
      expect(
        themeColorEditingMode(
          FluxerThemeMode.system,
          platformBrightness: Brightness.light,
        ),
        FluxerThemeMode.light,
      );
    });
  });
}
