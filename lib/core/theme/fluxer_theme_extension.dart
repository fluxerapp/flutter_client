import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';

extension FluxerThemeX on BuildContext {
  FluxerColorTheme get colors => Theme.of(this).extension<FluxerColorTheme>()!;
  FluxerTextTheme get textStyles =>
      Theme.of(this).extension<FluxerTextTheme>()!;
  FluxerLayoutTheme get layout =>
      Theme.of(this).extension<FluxerLayoutTheme>()!;

  /// Zeroed when reduced motion is on.
  FluxerMotionTheme get motion {
    if (MediaQuery.disableAnimationsOf(this)) {
      return const FluxerMotionTheme.reduced();
    }
    return Theme.of(this).extension<FluxerMotionTheme>()!;
  }
}
