import 'package:flutter/gestures.dart';

/// How a competing horizontal drag should treat a pointer move relative
/// to a vertical scrollable.
enum HorizontalDragAxisLockDecision {
  /// Not enough evidence yet. Includes both-axes-inside-slop and
  /// horizontal past slop but short of a committed swipe, so a later
  /// vertical move can still become a scroll.
  pending,

  /// Drop out so the list can scroll.
  yieldToVertical,

  /// Committed rightward swipe; drop out so a parent drawer can win.
  yieldToRightward,

  /// Committed leftward swipe; keep competing / accept.
  keepHorizontal,
}

/// Slow path: horizontal must dominate vertical by this ratio.
const double kHorizontalAxisDominanceRatio = 4;

/// Horizontal must travel this many slops before swipe/drawer may claim.
/// Lets jabs, zigzags, and catch-flings turn vertical after a sideways start.
const double kHorizontalCommitSlopMultiplier = 2.5;

/// Fast coalesced flicks (distance >= this many slops) use direction.
const double kFastFlickDistanceSlopMultiplier = 2;

/// Fast flick yields when vertical is at least this fraction of horizontal.
const double kFastFlickMinVerticalRatio = 0.12;

/// Logical px/s. Above this, a short elapsed sample is a flick.
const double kFastFlickVelocity = 600;

/// Elapsed time after which a large move is a slow drag, not a flick.
const Duration kSlowGestureElapsed = Duration(milliseconds: 80);

/// Classifies a drag from its start using [slop] (typically [computeHitSlop]).
///
/// Vertical scroll wins for: slow/fast straight drags, short nudges past
/// slop, arcs, coalesced flicks with any real vertical component, and
/// sideways-then-vertical moves that have not yet reached a committed
/// swipe. Horizontal wins only for a long, nearly flat left/right swipe.
HorizontalDragAxisLockDecision resolveHorizontalDragAxisLock({
  required Offset deltaFromStart,
  required double slop,
  Duration? elapsed,
}) {
  final double dx = deltaFromStart.dx.abs();
  final double dy = deltaFromStart.dy.abs();
  if (dx < slop && dy < slop) {
    return HorizontalDragAxisLockDecision.pending;
  }
  if (_isFastFlickSample(
        deltaFromStart: deltaFromStart,
        slop: slop,
        elapsed: elapsed,
      ) &&
      dy >= dx * kFastFlickMinVerticalRatio) {
    return HorizontalDragAxisLockDecision.yieldToVertical;
  }
  if (dy >= slop || dx < dy * kHorizontalAxisDominanceRatio) {
    return HorizontalDragAxisLockDecision.yieldToVertical;
  }
  if (dx < slop * kHorizontalCommitSlopMultiplier) {
    return HorizontalDragAxisLockDecision.pending;
  }
  if (deltaFromStart.dx > 0) {
    return HorizontalDragAxisLockDecision.yieldToRightward;
  }
  return HorizontalDragAxisLockDecision.keepHorizontal;
}

bool _isFastFlickSample({
  required Offset deltaFromStart,
  required double slop,
  Duration? elapsed,
}) {
  final double distance = deltaFromStart.distance;
  if (distance < slop * kFastFlickDistanceSlopMultiplier) {
    return false;
  }
  if (elapsed == null || elapsed <= Duration.zero) {
    return true;
  }
  if (elapsed >= kSlowGestureElapsed) {
    return false;
  }
  final double seconds = elapsed.inMicroseconds / 1e6;
  if (seconds <= 0) {
    return true;
  }
  return distance / seconds >= kFastFlickVelocity;
}
