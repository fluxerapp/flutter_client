import 'package:flutter/scheduler.dart';
import 'package:material_ui/material_ui.dart';

extension VisibilityAwareAnimationController on AnimationController {
  /// Repeat while visible/foregrounded; stop otherwise.
  void syncWithVisibility({
    required bool isVisible,
    bool animationsEnabled = true,
  }) {
    final AppLifecycleState? lifecycleState =
        SchedulerBinding.instance.lifecycleState;
    final bool isForeground =
        lifecycleState == null || lifecycleState == AppLifecycleState.resumed;
    final bool shouldAnimate = isVisible && isForeground && animationsEnabled;
    if (shouldAnimate && !isAnimating) {
      repeat();
    } else if (!shouldAnimate && isAnimating) {
      stop();
    }
  }
}
