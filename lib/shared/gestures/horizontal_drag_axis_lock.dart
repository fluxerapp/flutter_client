import 'package:flutter/gestures.dart';

/// How a competing horizontal drag should treat a pointer move relative
/// to a vertical scrollable.
enum HorizontalDragAxisLockDecision {
  /// Both axes are still inside [slop].
  pending,

  /// Not a committed horizontal swipe; drop out so the list can scroll.
  yieldToVertical,

  /// Clearly rightward; drop out so a parent drawer can win.
  yieldToRightward,

  /// Clearly leftward; keep competing / accept.
  keepHorizontal,
}

/// Horizontal must be at least this multiple of vertical before swipe or
/// the drawer may claim the pointer. Below that, a batched or noisy first
/// sample (common on sparse OEM touch) is treated as a scroll.
const double kHorizontalAxisDominanceRatio = 4;

/// Classifies a drag from its start using [slop] (typically [computeHitSlop]).
///
/// Scroll wins as soon as vertical movement has crossed [slop], even if
/// [dx] is larger. Horizontal claims only while vertical is still inside
/// slop and [dx] dominates by [kHorizontalAxisDominanceRatio].
HorizontalDragAxisLockDecision resolveHorizontalDragAxisLock({
  required Offset deltaFromStart,
  required double slop,
}) {
  final double dx = deltaFromStart.dx.abs();
  final double dy = deltaFromStart.dy.abs();
  if (dx < slop && dy < slop) {
    return HorizontalDragAxisLockDecision.pending;
  }
  if (dy >= slop || dx < dy * kHorizontalAxisDominanceRatio) {
    return HorizontalDragAxisLockDecision.yieldToVertical;
  }
  if (deltaFromStart.dx > 0) {
    return HorizontalDragAxisLockDecision.yieldToRightward;
  }
  return HorizontalDragAxisLockDecision.keepHorizontal;
}
