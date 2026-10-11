import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/themes/coal.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/dark_legacy.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';

void main() {
  final Map<String, FluxerColorTheme> themes = <String, FluxerColorTheme>{
    'dark': buildDarkColorTheme(),
    'coal': buildCoalColorTheme(),
    'darkLegacy': buildDarkLegacyColorTheme(),
    'light': buildLightColorTheme(),
  };

  for (final MapEntry<String, FluxerColorTheme>(:key, :value)
      in themes.entries) {
    test('$key keeps the selected row quieter than pressed and hover', () {
      expect(value.listItemSelectedBg.a, lessThan(value.listItemPressedBg.a));
      expect(
        value.listItemSelectedBg.a,
        lessThan(value.listItemSelectedBorder.a),
      );
      expect(
        value.listItemSelectedBg.a,
        lessThanOrEqualTo(value.backgroundModifierSelected.a),
      );
    });
  }

  test('dark selected row sits near four percent white', () {
    final FluxerColorTheme dark = buildDarkColorTheme();
    expect(dark.listItemSelectedBg.a, closeTo(0.04, 0.005));
    expect(dark.listItemPressedBg.a, closeTo(0.09, 0.005));
    expect(dark.listItemSelectedBg.r, closeTo(1, 0.01));
  });
}
