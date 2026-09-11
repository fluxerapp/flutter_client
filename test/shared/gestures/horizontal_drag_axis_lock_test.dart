import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/gestures/horizontal_drag_axis_lock.dart';

void main() {
  const double slop = 18;

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
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.pending,
      );
    });

    test('sideways past slop stays pending until a committed swipe', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-40, 0),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.pending,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(40, 0),
          slop: slop,
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
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('arched and equal-axis moves yield to vertical', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(20, 20),
          slop: slop,
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
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-40, 12),
          slop: slop,
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
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToRightward,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(80, 4),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToRightward,
      );
    });

    test('fast coalesced arc yields even when dy is under slop', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(80, 16),
          slop: slop,
          elapsed: Duration.zero,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-70, 14),
          slop: slop,
          elapsed: const Duration(milliseconds: 16),
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('slow large horizontal swipe is not treated as a fast flick', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-80, 16),
          slop: slop,
          elapsed: const Duration(milliseconds: 200),
        ),
        HorizontalDragAxisLockDecision.keepHorizontal,
      );
    });

    test('keeps leftward only when clearly leftward', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-80, 0),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.keepHorizontal,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-150, 0),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.keepHorizontal,
      );
    });
  });

  group('vertical scroll modes', () {
    test('slow straight up and down', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(0, 40),
          slop: slop,
          elapsed: const Duration(milliseconds: 200),
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(0, -40),
          slop: slop,
          elapsed: const Duration(milliseconds: 200),
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('short nudge just past slop', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(0, 24),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(4, 24),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('fast coalesced straight vertical', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(0, 80),
          slop: slop,
          elapsed: Duration.zero,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(8, -90),
          slop: slop,
          elapsed: const Duration(milliseconds: 16),
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('near-vertical with small dx both directions', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(12, 80),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-12, -80),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('slow and fast 45 degree arcs', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(30, 40),
          slop: slop,
          elapsed: const Duration(milliseconds: 180),
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-60, 60),
          slop: slop,
          elapsed: const Duration(milliseconds: 16),
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('sideways start can still become a vertical scroll', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-32, 0),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.pending,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-32, 40),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('medium elapsed mixed move still yields once dy crosses slop', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(20, 40),
          slop: slop,
          elapsed: const Duration(milliseconds: 50),
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });
  });
}
