import 'package:flutter/gestures.dart';
import 'package:fluxer_app/shared/gestures/horizontal_drag_axis_lock.dart';

/// [HorizontalDragGestureRecognizer] that leaves the arena on [shouldReject]
/// (typically not clearly horizontal, and for swipe-to-reply also rightward).
///
/// Accepts only after [resolveHorizontalDragAxisLock] commits, not at the
/// raw horizontal slop. Once committed, later moves are not re-classified
/// so a vertical arc cannot freeze an in-progress swipe. Once yielded,
/// later moves are ignored so leftover dx cannot claim the pointer.
class AxisLockingHorizontalDragRecognizer
    extends HorizontalDragGestureRecognizer {
  AxisLockingHorizontalDragRecognizer({
    required this.shouldDefer,
    required this.shouldReject,
  });

  final bool Function(PointerDownEvent event) shouldDefer;
  final bool Function(HorizontalDragAxisLockDecision decision) shouldReject;

  final Map<int, Offset> _initialPositions = <int, Offset>{};
  final Map<int, Duration> _downTimes = <int, Duration>{};
  final Set<int> _resolved = <int>{};
  final Set<int> _yielded = <int>{};

  @override
  bool hasSufficientGlobalDistanceToAccept(
    PointerDeviceKind pointerDeviceKind,
    double? deviceTouchSlop,
  ) {
    return false;
  }

  @override
  void addAllowedPointer(PointerDownEvent event) {
    if (shouldDefer(event)) {
      resolve(GestureDisposition.rejected);
      return;
    }
    _initialPositions[event.pointer] = event.position;
    _downTimes[event.pointer] = event.timeStamp;
    super.addAllowedPointer(event);
  }

  @override
  void handleEvent(PointerEvent event) {
    if (_yielded.contains(event.pointer)) {
      if (event is PointerMoveEvent) {
        return;
      }
      super.handleEvent(event);
      return;
    }
    if (event is PointerMoveEvent && !_resolved.contains(event.pointer)) {
      final Offset? start = _initialPositions[event.pointer];
      if (start != null) {
        final Duration downTime = _downTimes[event.pointer] ?? event.timeStamp;
        final HorizontalDragAxisLockDecision decision =
            resolveHorizontalDragAxisLock(
              deltaFromStart: event.position - start,
              slop: computeHitSlop(event.kind, gestureSettings),
              elapsed: event.timeStamp - downTime,
            );
        if (shouldReject(decision)) {
          _yielded.add(event.pointer);
          resolve(GestureDisposition.rejected);
          return;
        }
        if (decision != HorizontalDragAxisLockDecision.pending) {
          _resolved.add(event.pointer);
          resolve(GestureDisposition.accepted);
        }
      }
    }
    super.handleEvent(event);
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    _initialPositions.remove(pointer);
    _downTimes.remove(pointer);
    _resolved.remove(pointer);
    _yielded.remove(pointer);
    super.didStopTrackingLastPointer(pointer);
  }

  @override
  void rejectGesture(int pointer) {
    _initialPositions.remove(pointer);
    _downTimes.remove(pointer);
    _resolved.remove(pointer);
    super.rejectGesture(pointer);
  }
}
