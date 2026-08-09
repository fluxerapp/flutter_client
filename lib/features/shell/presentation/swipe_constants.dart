import 'dart:math' as math;

import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

const Curve kHorizontalSwipeCurve = Curves.fastEaseInToSlowEaseOut;

const Duration kHorizontalSwipeRevealDuration = FluxerMotionTheme.slowDuration;

const Duration kHorizontalSwipeSnapBackDuration =
    FluxerMotionTheme.panelDuration;

Duration horizontalSwipeRevealDuration(BuildContext context) =>
    context.motion.slow;

Duration horizontalSwipeSnapBackDuration(BuildContext context) =>
    context.motion.panel;

const double kHorizontalSwipeFlingVelocity = 1;
const double kDrawerSwipeFlingVelocityPxPerSecond = 600;

const double kHorizontalSwipeCompletionThresholdMaterial = 0.4;
const double kHorizontalSwipeCompletionThresholdCupertino = 0.5;

double horizontalSwipeCompletionThreshold() {
  if (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb) {
    return kHorizontalSwipeCompletionThresholdCupertino;
  }
  return kHorizontalSwipeCompletionThresholdMaterial;
}

const double kBackSwipeEdgeMinWidthMaterial = 32;
const double kBackSwipeEdgeMinWidthCupertino = 20;

/// Width from [Directionality] start (including safe area) reserved for
/// shell horizontal back / drawer gestures so inner detectors (e.g.
/// swipe-to-reply) do not win the gesture arena on that strip.
double leadingEdgeHorizontalSwipeReserveWidth(BuildContext context) {
  final EdgeInsets padding = MediaQuery.paddingOf(context);
  final bool isRtl = Directionality.of(context) == TextDirection.rtl;
  final double startEdgePadding = isRtl ? padding.right : padding.left;
  if (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb) {
    return math.max(kBackSwipeEdgeMinWidthCupertino, startEdgePadding);
  }
  return math.max(kBackSwipeEdgeMinWidthMaterial, startEdgePadding);
}
