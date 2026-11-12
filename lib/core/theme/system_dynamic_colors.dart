import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/theme_variable_mapping.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

const Set<String> _kAccentProperties = <String>{
  'brandPrimary',
  'brandSecondary',
  'brandPrimaryLight',
  'accentPrimary',
  'serverIconActive',
  'switchThumbCheckedIcon',
  'buttonPrimaryFill',
  'buttonPrimaryActiveFill',
  'interactiveActive',
  'interactiveMuted',
};

const double _kNeutralMinSaturation = 0.02;
const double _kNeutralMaxSaturation = 0.25;

final double _kReferenceAccentChroma = Hct.fromInt(
  const HSLColor.fromAHSL(1, 242, 0.7, 0.55).toColor().toARGB32(),
).chroma;

@immutable
class SystemDynamicPalette {
  const SystemDynamicPalette({
    required this.accentHue,
    required this.accentChroma,
    required this.neutralHue,
    required this.neutralChroma,
  });

  factory SystemDynamicPalette.fromPalettes({
    required TonalPalette accent,
    required TonalPalette neutral,
  }) {
    return SystemDynamicPalette(
      accentHue: accent.hue,
      accentChroma: accent.chroma,
      neutralHue: neutral.hue,
      neutralChroma: neutral.chroma,
    );
  }

  final double accentHue;
  final double accentChroma;
  final double neutralHue;
  final double neutralChroma;

  @override
  bool operator ==(Object other) =>
      other is SystemDynamicPalette &&
      other.accentHue == accentHue &&
      other.accentChroma == accentChroma &&
      other.neutralHue == neutralHue &&
      other.neutralChroma == neutralChroma;

  @override
  int get hashCode =>
      Object.hash(accentHue, accentChroma, neutralHue, neutralChroma);
}

FluxerColorTheme applySystemDynamicColors(
  FluxerColorTheme base, {
  required SystemDynamicPalette? palette,
  required double saturationFactor,
}) {
  if (palette == null) {
    return base;
  }
  final Map<String, Color> overrides = <String, Color>{};
  for (final MapEntry<String, Color Function(FluxerColorTheme)> entry
      in kThemePropertyColorReaders.entries) {
    final Color original = entry.value(base);
    final Color? retinted = _kAccentProperties.contains(entry.key)
        ? _retintAccent(original, palette)
        : _retintNeutral(original, palette, saturationFactor);
    if (retinted != null) {
      overrides[entry.key] = retinted;
    }
  }
  return base.applyPropertyOverrides(overrides);
}

Color _retintAccent(Color original, SystemDynamicPalette palette) {
  final Hct source = Hct.fromInt(original.withValues(alpha: 1).toARGB32());
  final double strength = (source.chroma / _kReferenceAccentChroma).clamp(
    0.0,
    1.0,
  );
  return _toneColor(
    hue: palette.accentHue,
    chroma: palette.accentChroma * strength,
    tone: source.tone,
    alpha: original.a,
  );
}

Color? _retintNeutral(
  Color original,
  SystemDynamicPalette palette,
  double saturationFactor,
) {
  final double saturation = HSLColor.fromColor(original).saturation;
  if (saturation < _kNeutralMinSaturation ||
      saturation > _kNeutralMaxSaturation) {
    return null;
  }
  final Hct source = Hct.fromInt(original.withValues(alpha: 1).toARGB32());
  return _toneColor(
    hue: palette.neutralHue,
    chroma: palette.neutralChroma * saturationFactor,
    tone: source.tone,
    alpha: original.a,
  );
}

Color _toneColor({
  required double hue,
  required double chroma,
  required double tone,
  required double alpha,
}) {
  return Color(Hct.from(hue, chroma, tone).toInt()).withValues(alpha: alpha);
}
