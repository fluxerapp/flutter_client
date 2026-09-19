import 'package:flutter/gestures.dart';
import 'package:fluxer_app/shared/gestures/horizontal_drag_axis_lock.dart';
import 'package:fluxer_app/shared/gestures/pointer_delivery_profiler.dart';

/// [HorizontalDragGestureRecognizer] that leaves the arena on [shouldReject]
/// (typically not clearly horizontal, and for swipe-to-reply also rightward).
///
/// Accepts only after [resolveHorizontalDragAxisLock] commits, not at the
/// raw horizontal slop. Once committed, later moves are not re-classified
/// so a vertical arc cannot freeze an in-progress swipe. Once yielded,
/// later moves are ignored so leftover dx cannot claim the pointer.
/// A coalesced jump that is still pending at pointer up is rejected.
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
  final Map<int, int> _sampleCounts = <int, int>{};
  final Set<int> _resolved = <int>{};
  final Set<int> _yielded = <int>{};
  final Set<int> _pendingJump = <int>{};

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
    _sampleCounts[event.pointer] = 0;
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
        final int sampleIndex = _sampleCounts[event.pointer] ?? 0;
        _sampleCounts[event.pointer] = sampleIndex + 1;
        final Duration downTime = _downTimes[event.pointer] ?? event.timeStamp;
        final Offset delta = event.position - start;
        final double slop = computeHitSlop(event.kind, gestureSettings);
        final Duration elapsed = event.timeStamp - downTime;
        final AxisLockParams params = PointerDeliveryProfiler.instance.params;
        final HorizontalDragAxisLockDecision decision =
            resolveHorizontalDragAxisLock(
              deltaFromStart: delta,
              slop: slop,
              elapsed: elapsed,
              params: params,
              sampleIndex: sampleIndex,
            );
        if (decision == HorizontalDragAxisLockDecision.pending &&
            isCoalescedJump(
              deltaFromStart: delta,
              slop: slop,
              elapsed: elapsed,
              params: params,
            )) {
          _pendingJump.add(event.pointer);
        }
        if (shouldReject(decision)) {
          _yielded.add(event.pointer);
          _pendingJump.remove(event.pointer);
          resolve(GestureDisposition.rejected);
          return;
        }
        if (decision != HorizontalDragAxisLockDecision.pending) {
          _resolved.add(event.pointer);
          _pendingJump.remove(event.pointer);
          resolve(GestureDisposition.accepted);
        }
      }
    } else if ((event is PointerUpEvent || event is PointerCancelEvent) &&
        !_resolved.contains(event.pointer) &&
        _pendingJump.contains(event.pointer)) {
      _yielded.add(event.pointer);
      _pendingJump.remove(event.pointer);
      resolve(GestureDisposition.rejected);
      return;
    }
    super.handleEvent(event);
  }

  void _clearPointer(int pointer) {
    _initialPositions.remove(pointer);
    _downTimes.remove(pointer);
    _sampleCounts.remove(pointer);
    _resolved.remove(pointer);
    _yielded.remove(pointer);
    _pendingJump.remove(pointer);
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    _clearPointer(pointer);
    super.didStopTrackingLastPointer(pointer);
  }

  @override
  void rejectGesture(int pointer) {
    _clearPointer(pointer);
    super.rejectGesture(pointer);
  }
}
