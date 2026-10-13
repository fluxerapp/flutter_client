import 'package:flutter/gestures.dart';

enum HorizontalClaimDirection { left, right }

const double _kClearHorizontalDominanceRatio = 2;

bool claimsClearHorizontalDrag({
  required Offset deltaFromStart,
  required double slop,
  required Set<HorizontalClaimDirection> directions,
}) {
  final double dx = deltaFromStart.dx.abs();
  final double dy = deltaFromStart.dy.abs();
  if (dx < slop || dx <= dy * _kClearHorizontalDominanceRatio) {
    return false;
  }
  final HorizontalClaimDirection way = deltaFromStart.dx < 0
      ? HorizontalClaimDirection.left
      : HorizontalClaimDirection.right;
  return directions.contains(way);
}

class DirectionalHorizontalDragRecognizer
    extends HorizontalDragGestureRecognizer {
  DirectionalHorizontalDragRecognizer({
    required this.directions,
    required this.shouldDefer,
  });

  final Set<HorizontalClaimDirection> Function() directions;
  final bool Function(PointerDownEvent event) shouldDefer;

  final Map<int, Offset> _initialPositions = <int, Offset>{};
  final Set<int> _resolved = <int>{};

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
      return;
    }
    _initialPositions[event.pointer] = event.position;
    super.addAllowedPointer(event);
  }

  @override
  void handleEvent(PointerEvent event) {
    if (!_initialPositions.containsKey(event.pointer)) {
      return;
    }
    if (event is PointerMoveEvent && !_resolved.contains(event.pointer)) {
      final Offset delta = event.position - _initialPositions[event.pointer]!;
      final double slop = computeHitSlop(event.kind, gestureSettings);
      final double dx = delta.dx.abs();
      final double dy = delta.dy.abs();
      if (dx >= slop || dy >= slop) {
        if (claimsClearHorizontalDrag(
          deltaFromStart: delta,
          slop: slop,
          directions: directions(),
        )) {
          _resolved.add(event.pointer);
          resolve(GestureDisposition.accepted);
          if (!_initialPositions.containsKey(event.pointer)) {
            return;
          }
        } else {
          resolvePointer(event.pointer, GestureDisposition.rejected);
          return;
        }
      }
    }
    super.handleEvent(event);
  }

  void _clearPointer(int pointer) {
    _initialPositions.remove(pointer);
    _resolved.remove(pointer);
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
