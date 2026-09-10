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

    test('yields to vertical when dy is dominant past slop', () {
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

    test('yields rightward when dx is dominant and positive', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(40, 12),
          slop: 8,
        ),
        HorizontalDragAxisLockDecision.yieldToRightward,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(20, 20),
          slop: 18,
        ),
        HorizontalDragAxisLockDecision.yieldToRightward,
      );
    });

    test('keeps leftward horizontal when dx is dominant and negative', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-40, 12),
          slop: 8,
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
