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

    test('claims a flat swipe at slop', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-20, 0),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.keepHorizontal,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(20, 4),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToRightward,
      );
    });

    test('yields to vertical as soon as dy dominates', () {
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

    test('1.5x horizontal with small vertical still swipes at slop', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-24, 8),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.keepHorizontal,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(22, 6),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToRightward,
      );
    });

    test('ambiguous past-slop diagonal yields to vertical', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(20, 16),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });

    test('yields rightward when clearly rightward', () {
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

    test('keeps leftward when clearly leftward', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-80, 0),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.keepHorizontal,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-150, 8),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.keepHorizontal,
      );
    });
  });

  group('coalesced jump vs normal swipe', () {
    test('coalesced first jump with vertical yields to scroll', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(36, 10),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
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

    test('fast almost-flat jump still swipes', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-80, 8),
          slop: slop,
          elapsed: Duration.zero,
        ),
        HorizontalDragAxisLockDecision.keepHorizontal,
      );
    });

    test('slow large swipe is not treated as a coalesced jump', () {
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-80, 16),
          slop: slop,
          elapsed: const Duration(milliseconds: 200),
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
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(0, -40),
          slop: slop,
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
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(8, -90),
          slop: slop,
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
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
      expect(
        resolveHorizontalDragAxisLock(
          deltaFromStart: const Offset(-60, 60),
          slop: slop,
        ),
        HorizontalDragAxisLockDecision.yieldToVertical,
      );
    });
  });
}
