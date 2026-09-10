import 'package:flutter/gestures.dart';

/// How a competing horizontal drag should treat a pointer move relative
/// to a vertical scrollable.
enum HorizontalDragAxisLockDecision {
  /// Both axes are still inside [slop].
  pending,

  /// Vertical movement is dominant; drop out of the arena.
  yieldToVertical,

  /// Rightward movement is dominant; drop out so a parent drawer can win.
  yieldToRightward,

  /// Leftward movement is dominant; keep competing / accept.
  keepHorizontal,
}

/// Classifies a drag from its start using [slop] (typically [computeHitSlop]).
HorizontalDragAxisLockDecision resolveHorizontalDragAxisLock({
  required Offset deltaFromStart,
  required double slop,
}) {
  final double dx = deltaFromStart.dx.abs();
  final double dy = deltaFromStart.dy.abs();
  if (dx < slop && dy < slop) {
    return HorizontalDragAxisLockDecision.pending;
  }
  if (dy > dx) {
    return HorizontalDragAxisLockDecision.yieldToVertical;
  }
  if (deltaFromStart.dx > 0) {
    return HorizontalDragAxisLockDecision.yieldToRightward;
  }
  return HorizontalDragAxisLockDecision.keepHorizontal;
}
