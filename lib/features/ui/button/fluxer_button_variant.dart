import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';

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

  Color? borderColor(FluxerColorTheme colors) => switch (this) {
    invertedOutline => colors.buttonOutlineBorder,
    _ => null,
  };
}
