import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/gestures/horizontal_drag_axis_lock.dart';

void main() {
  group('resolveHorizontalDragAxisLock', () {
    test('stays pending while both axes are inside slop', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(4, 5),
          slop: 8,
        ),
        HorizontalDragAxisLockDecision.pending,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(17, 17),
          slop: 18,
        ),
        HorizontalDragAxisLockDecision.pending,
      );
    });

    test('yields to vertical as soon as dy crosses slop', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(12, 40),
          slop: 8,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-12, 40),
          slop: 8,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(12, -40),
          slop: 18,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('arched and equal-axis moves yield to vertical', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(20, 20),
          slop: 18,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-30, 20),
          slop: 8,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(25, 18),
          slop: 8,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('horizontally noisy first sample yields to vertical', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(36, 10),
          slop: 18,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-40, 12),
          slop: 18,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(40, 12),
          slop: 8,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('yields rightward only when clearly rightward', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(80, 0),
          slop: 18,
        ),
        HorizontalDragAxisLockDecision.yieldToRightward,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(50, 8),
          slop: 18,
        ),
        HorizontalDragAxisLockDecision.yieldToRightward,
      );
    });

    test('keeps leftward only when clearly leftward', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-80, 0),
          slop: 18,
        ),
        HorizontalDragAxisLockDecision.keepHorizontal,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-150, 0),
          slop: 18,
        ),
        HorizontalDragAxisLockDecision.keepHorizontal,
      );
    });
  });
}
