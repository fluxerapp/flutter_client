import 'package:flutter/gestures.dart';
import 'package:fluxer_app/shared/gestures/horizontal_drag_axis_lock.dart';

/// [HorizontalDragGestureRecognizer] that leaves the arena on [shouldReject]
/// (typically vertical-dominant, and for swipe-to-reply also rightward).
///
/// Once the axis is committed, later moves are not re-classified so a
/// vertical arc cannot freeze an in-progress drag.
class AxisLockingHorizontalDragRecognizer
    extends HorizontalDragGestureRecognizer {
  AxisLockingHorizontalDragRecognizer({
    required this.shouldDefer,
    required this.shouldReject,
  });

  final bool Function(PointerDownEvent event) shouldDefer;
  final bool Function(HorizontalDragAxisLockDecision decision) shouldReject;

  final Map<int, Offset> _initialPositions = <int, Offset>{};
  final Set<int> _resolved = <int>{};

  @override
  void addAllowedPointer(PointerDownEvent event) {
    if (shouldDefer(event)) {
      resolve(GestureDisposition.rejected);
      return;
    }
    _initialPositions[event.pointer] = event.position;
    super.addAllowedPointer(event);
  }

  @override
  void handleEvent(PointerEvent event) {
    if (event is PointerMoveEvent && !_resolved.contains(event.pointer)) {
      final Offset? start = _initialPositions[event.pointer];
      if (start != null) {
        final HorizontalDragAxisLockDecision decision =
            resolveHorizontalDragAxisLock(
              deltaFromStart: event.position - start,
              slop: computeHitSlop(event.kind, gestureSettings),
            );
        if (shouldReject(decision)) {
          _resolved.add(event.pointer);
          resolve(GestureDisposition.rejected);
          return;
        }
        if (decision != HorizontalDragAxisLockDecision.pending) {
          _resolved.add(event.pointer);
        }
      }
    }
    super.handleEvent(event);
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    _initialPositions.remove(pointer);
    _resolved.remove(pointer);
    super.didStopTrackingLastPointer(pointer);
  }

  @override
  void rejectGesture(int pointer) {
    _initialPositions.remove(pointer);
    _resolved.remove(pointer);
    super.rejectGesture(pointer);
  }
}
