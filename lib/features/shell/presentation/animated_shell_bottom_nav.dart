import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

class AnimatedShellBottomNav extends StatelessWidget {
  const AnimatedShellBottomNav({
    required this.visible,
    required this.child,
    super.key,
  });

  final bool visible;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final FluxerMotionTheme motion = context.motion;

    return ClipRect(
      child: AnimatedAlign(
        alignment: Alignment.topCenter,
        heightFactor: visible ? 1 : 0,
        duration: motion.slow,
        curve: motion.emphasizedCurve,
        child: AnimatedSlide(
          duration: motion.slow,
          curve: motion.emphasizedCurve,
          offset: visible ? Offset.zero : const Offset(0, 1),
          child: child,
        ),
      ),
    );
  }
}
