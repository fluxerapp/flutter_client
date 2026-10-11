import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

abstract final class ShellTransitionPolicy {
  const ShellTransitionPolicy._();

  static Duration rootOverlayFadeDuration(BuildContext context) =>
      context.motion.normal;
}
