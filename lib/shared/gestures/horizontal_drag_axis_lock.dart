import 'package:flutter/gestures.dart';

/// How a competing horizontal drag should treat a pointer move relative
/// to a vertical scrollable.
enum HorizontalDragAxisLockDecision {
  /// Both axes are still inside [slop], or an almost-flat jump needs
  /// another sample before it can claim horizontal.
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
/// fraction of [dx]. Otherwise it is a fast scroll.
const double kCoalescedJumpMaxVerticalRatio = 0.15;

/// Elapsed time after which a large move is a slow drag, not a jump.
const Duration kSlowGestureElapsed = Duration(milliseconds: 80);

/// Jump threshold after repeated coalesced delivery.
const double kCoalescedSessionJumpSlopMultiplier = 1.6;

/// Tighter almost-flat bar after repeated coalesced delivery.
const double kCoalescedSessionJumpMaxVerticalRatio = 0.10;

/// Lock thresholds.
class AxisLockParams {
  const AxisLockParams({
    this.dominanceRatio = kHorizontalAxisDominanceRatio,
    this.jumpSlopMultiplier = kCoalescedJumpSlopMultiplier,
    this.jumpMaxVerticalRatio = kCoalescedJumpMaxVerticalRatio,
    this.slowElapsed = kSlowGestureElapsed,
  });

  static const AxisLockParams fine = AxisLockParams();

  static const AxisLockParams coalesced = AxisLockParams(
    jumpSlopMultiplier: kCoalescedSessionJumpSlopMultiplier,
    jumpMaxVerticalRatio: kCoalescedSessionJumpMaxVerticalRatio,
  );

  final double dominanceRatio;
  final double jumpSlopMultiplier;
  final double jumpMaxVerticalRatio;
  final Duration slowElapsed;
}

/// Classifies a drag from its start using [slop] (typically [computeHitSlop]).
///
/// Normal samples use the 1.5x slop rule so swipe and the drawer stay
/// easy. A large first jump yields to scroll unless the vector is
/// almost perfectly horizontal. An almost-flat jump with some vertical
/// stays [pending] until [sampleIndex] is past the first MOVE.
HorizontalDragAxisLockDecision resolveHorizontalDragAxisLock({
  required Offset deltaFromStart,
  required double slop,
  Duration? elapsed,
  AxisLockParams params = AxisLockParams.fine,
  int sampleIndex = 0,
}) {
  final double dx = deltaFromStart.dx.abs();
  final double dy = deltaFromStart.dy.abs();
  if (dx < slop && dy < slop) {
    return HorizontalDragAxisLockDecision.pending;
  }
  final bool jump = _isCoalescedJump(
    deltaFromStart: deltaFromStart,
    slop: slop,
    elapsed: elapsed,
    params: params,
  );
  if (jump) {
    if (dy >= dx * params.jumpMaxVerticalRatio) {
      return HorizontalDragAxisLockDecision.yieldToVertical;
    }
    if (sampleIndex == 0 && dy > 0) {
      return HorizontalDragAxisLockDecision.pending;
    }
  }
  if (dx >= slop && dx > dy * params.dominanceRatio) {
    return _horizontalDecision(deltaFromStart);
  }
  return HorizontalDragAxisLockDecision.yieldToVertical;
}

bool isCoalescedJump({
  required Offset deltaFromStart,
  required double slop,
  Duration? elapsed,
  AxisLockParams params = AxisLockParams.fine,
}) {
  return _isCoalescedJump(
    deltaFromStart: deltaFromStart,
    slop: slop,
    elapsed: elapsed,
    params: params,
  );
}

HorizontalDragAxisLockDecision _horizontalDecision(Offset deltaFromStart) {
  if (deltaFromStart.dx > 0) {
    return HorizontalDragAxisLockDecision.yieldToRightward;
  }
  return HorizontalDragAxisLockDecision.keepHorizontal;
}

bool _isCoalescedJump({
  required Offset deltaFromStart,
  required double slop,
  required AxisLockParams params,
  Duration? elapsed,
}) {
  if (deltaFromStart.distance < slop * params.jumpSlopMultiplier) {
    return false;
  }
  if (elapsed == null || elapsed <= Duration.zero) {
    return true;
  }
  return elapsed < params.slowElapsed;
}
