import 'package:flutter/gestures.dart';

/// How a competing horizontal drag should treat a pointer move relative
/// to a vertical scrollable.
enum HorizontalDragAxisLockDecision {
  /// Both axes are still inside [slop].
  pending,

  /// Drop out so the list can scroll.
  yieldToVertical,

  /// Rightward swipe; drop out so a parent drawer can win.
  yieldToRightward,

  /// Leftward swipe; keep competing / accept.
  keepHorizontal,
}

/// Horizontal must exceed vertical by this ratio to claim the pointer.
const double kHorizontalAxisDominanceRatio = 1.5;

/// A first sample at least this many slops is a coalesced jump, not a
/// normal slop-crossing swipe.
const double kCoalescedJumpSlopMultiplier = 2;

/// On a coalesced jump, claim horizontal only if vertical is below this
/// fraction of [dx] (~8 degrees). Otherwise it is a fast scroll.
const double kCoalescedJumpMaxVerticalRatio = 0.15;

/// Elapsed time after which a large move is a slow drag, not a jump.
const Duration kSlowGestureElapsed = Duration(milliseconds: 80);

/// Classifies a drag from its start using [slop] (typically [computeHitSlop]).
///
/// Normal samples use the 1.5x slop rule so swipe and the drawer stay
/// easy. A large first jump yields to scroll unless the vector is
/// almost perfectly horizontal.
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
  if (_isCoalescedJump(
        deltaFromStart: deltaFromStart,
        slop: slop,
        elapsed: elapsed,
      ) &&
      dy >= dx * kCoalescedJumpMaxVerticalRatio) {
    return HorizontalDragAxisLockDecision.yieldToVertical;
  }
  if (dx >= slop && dx > dy * kHorizontalAxisDominanceRatio) {
    if (deltaFromStart.dx > 0) {
      return HorizontalDragAxisLockDecision.yieldToRightward;
    }
    return HorizontalDragAxisLockDecision.keepHorizontal;
  }
  return HorizontalDragAxisLockDecision.yieldToVertical;
}

bool _isCoalescedJump({
  required Offset deltaFromStart,
  required double slop,
  Duration? elapsed,
}) {
  if (deltaFromStart.distance < slop * kCoalescedJumpSlopMultiplier) {
    return false;
  }
  if (elapsed == null || elapsed <= Duration.zero) {
    return true;
  }
  return elapsed < kSlowGestureElapsed;
}
