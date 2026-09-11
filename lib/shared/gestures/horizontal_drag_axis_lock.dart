import 'package:flutter/gestures.dart';

/// How a competing horizontal drag should treat a pointer move relative
/// to a vertical scrollable.
enum HorizontalDragAxisLockDecision {
  /// Both axes are still inside [slop].
  pending,

  /// Not clearly horizontal; drop out so the list can scroll, including
  /// arched / diagonal flicks.
  yieldToVertical,

  /// Clearly rightward; drop out so a parent drawer can win.
  yieldToRightward,

  /// Clearly leftward; keep competing / accept.
  keepHorizontal,
}

/// Horizontal must be at least this multiple of vertical before swipe or
/// the drawer may claim the pointer. Below that, an arched or diagonal
/// move is treated as a scroll.
const double kHorizontalAxisDominanceRatio = 2;

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
  if (dx < dy * kHorizontalAxisDominanceRatio) {
    return HorizontalDragAxisLockDecision.yieldToVertical;
  }
  if (deltaFromStart.dx > 0) {
    return HorizontalDragAxisLockDecision.yieldToRightward;
  }
  return HorizontalDragAxisLockDecision.keepHorizontal;
}
