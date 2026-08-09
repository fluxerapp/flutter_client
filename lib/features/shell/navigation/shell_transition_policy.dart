import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

abstract final class ShellTransitionPolicy {
  static Duration shellEntryDuration(BuildContext context) =>
      context.motion.normal;

  static Duration channelSlideDuration(BuildContext context) =>
      context.motion.panel;

  static Duration rootOverlayFadeDuration(BuildContext context) =>
      context.motion.normal;

  static const double channelOutgoingParallaxFactor = 0.3;
}
