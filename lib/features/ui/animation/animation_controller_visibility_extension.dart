import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

extension VisibilityAwareAnimationController on AnimationController {
  void syncWithVisibility({required bool isVisible}) {
    final AppLifecycleState? lifecycleState =
        SchedulerBinding.instance.lifecycleState;
    final bool isForeground =
        lifecycleState == null || lifecycleState == AppLifecycleState.resumed;
    final bool shouldAnimate = isVisible && isForeground;
    if (shouldAnimate && !isAnimating) {
      unawaited(repeat());
    } else if (!shouldAnimate && isAnimating) {
      stop();
    }
  }
}
