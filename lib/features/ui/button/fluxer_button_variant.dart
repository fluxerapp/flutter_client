import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/material_ui.dart';

enum FluxerButtonVariant {
  primary,
  secondary,
  dangerPrimary,
  dangerSecondary,
  inverted,
  invertedOutline,
  ghost;

  Color fill(FluxerColorTheme colors) => switch (this) {
    primary => colors.brandPrimary,
    secondary => colors.buttonSecondaryFill,
    dangerPrimary => colors.buttonDangerFill,
    dangerSecondary => colors.buttonSecondaryFill,
    inverted => colors.buttonInvertedFill,
    invertedOutline => Colors.transparent,
    ghost => Colors.transparent,
  };

  Color activeFill(FluxerColorTheme colors) => switch (this) {
    primary => colors.brandSecondary,
    secondary => colors.buttonSecondaryActiveFill,
    dangerPrimary => colors.buttonDangerActiveFill,
    dangerSecondary => colors.buttonDangerOutlineActiveFill,
    inverted => colors.buttonInvertedFill,
    invertedOutline => colors.buttonOutlineActiveFill,
    ghost => colors.backgroundModifierHover,
  };

  Color textColor(FluxerColorTheme colors) => switch (this) {
    primary => colors.brandPrimaryFill,
    secondary => colors.buttonSecondaryText,
    dangerPrimary => colors.buttonDangerText,
    dangerSecondary => colors.buttonDangerOutlineText,
    inverted => colors.buttonInvertedText,
    invertedOutline => colors.buttonOutlineText,
    ghost => colors.buttonGhostText,
  };

  Color? borderColor(FluxerColorTheme colors, {bool hovered = false}) =>
      switch (this) {
        primary => Color.lerp(
          Colors.white,
          hovered ? colors.brandSecondary : colors.brandPrimary,
          hovered ? 0.84 : 0.82,
        ),
        secondary || dangerSecondary =>
          hovered
              ? Color.lerp(
                  colors.textTertiary,
                  colors.backgroundModifierAccent,
                  0.88,
                )
              : colors.backgroundModifierAccent,
        invertedOutline => colors.buttonOutlineBorder,
        _ => null,
      };
}
