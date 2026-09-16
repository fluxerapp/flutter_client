import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/gestures/horizontal_drag_axis_lock.dart';
import 'package:fluxer_app/shared/gestures/pointer_delivery_profiler.dart';

void main() {
  late PointerDeliveryProfiler profiler;

  setUp(() {
    profiler = PointerDeliveryProfiler();
  });

  void playGesture({
    required int pointer,
    required List<Offset> moves,
    Duration firstMoveElapsed = const Duration(milliseconds: 8),
  }) {
    profiler.observePointer(
      change: PointerChange.down,
      pointer: pointer,
      logicalPosition: Offset.zero,
      timeStamp: Duration.zero,
    );
    Duration time = firstMoveElapsed;
    Offset position = Offset.zero;
    for (int i = 0; i < moves.length; i++) {
      position = moves[i];
      profiler.observePointer(
        change: PointerChange.move,
        pointer: pointer,
        logicalPosition: position,
        timeStamp: time,
      );
      time += const Duration(milliseconds: 8);
    }
    profiler.observePointer(
      change: PointerChange.up,
      pointer: pointer,
      logicalPosition: position,
      timeStamp: time,
    );
  }

  test('starts on fine params', () {
    expect(profiler.params.jumpSlopMultiplier, kCoalescedJumpSlopMultiplier);
    expect(
      profiler.params.jumpMaxVerticalRatio,
      kCoalescedJumpMaxVerticalRatio,
    );
  });

  test('taps that stay inside slop do not count', () {
    playGesture(pointer: 1, moves: <Offset>[const Offset(4, 3)]);
    expect(profiler.completedGestureCount, 0);
    expect(profiler.emaFirstMoveSlops, isNull);
  });

  test('one coalesced flick does not leave fine params', () {
    playGesture(pointer: 1, moves: <Offset>[const Offset(50, 10)]);
    expect(profiler.completedGestureCount, 1);
    expect(profiler.params.jumpSlopMultiplier, kCoalescedJumpSlopMultiplier);
  });

  test('three coalesced flicks switch to coalesced params', () {
    playGesture(pointer: 1, moves: <Offset>[const Offset(50, 10)]);
    playGesture(pointer: 2, moves: <Offset>[const Offset(60, 8)]);
    playGesture(pointer: 3, moves: <Offset>[const Offset(40, 12)]);
    expect(profiler.completedGestureCount, 3);
    expect(
      profiler.params.jumpSlopMultiplier,
      kCoalescedSessionJumpSlopMultiplier,
    );
    expect(
      profiler.params.jumpMaxVerticalRatio,
      kCoalescedSessionJumpMaxVerticalRatio,
    );
  });

  test('dense samples stay on fine params', () {
    playGesture(
      pointer: 1,
      moves: <Offset>[const Offset(8, 4), const Offset(20, 6)],
    );
    playGesture(
      pointer: 2,
      moves: <Offset>[
        const Offset(6, 5),
        const Offset(18, 8),
        const Offset(22, 10),
      ],
    );
    playGesture(
      pointer: 3,
      moves: <Offset>[const Offset(10, 2), const Offset(19, 4)],
    );
    expect(profiler.completedGestureCount, 3);
    expect(profiler.params.jumpSlopMultiplier, kCoalescedJumpSlopMultiplier);
  });

  test('mixed coalesced and dense holds the previous params', () {
    playGesture(pointer: 1, moves: <Offset>[const Offset(50, 10)]);
    playGesture(pointer: 2, moves: <Offset>[const Offset(55, 8)]);
    playGesture(pointer: 3, moves: <Offset>[const Offset(48, 12)]);
    expect(
      profiler.params.jumpSlopMultiplier,
      kCoalescedSessionJumpSlopMultiplier,
    );
    playGesture(
      pointer: 4,
      moves: <Offset>[const Offset(8, 4), const Offset(20, 6)],
    );
    expect(
      profiler.params.jumpSlopMultiplier,
      kCoalescedSessionJumpSlopMultiplier,
    );
    playGesture(
      pointer: 5,
      moves: <Offset>[const Offset(7, 5), const Offset(19, 7)],
    );
    playGesture(
      pointer: 6,
      moves: <Offset>[const Offset(9, 3), const Offset(21, 5)],
    );
    expect(profiler.params.jumpSlopMultiplier, kCoalescedJumpSlopMultiplier);
  });

  test('slow large first MOVE is not coalesced delivery', () {
    playGesture(
      pointer: 1,
      moves: <Offset>[const Offset(50, 10)],
      firstMoveElapsed: const Duration(milliseconds: 200),
    );
    playGesture(
      pointer: 2,
      moves: <Offset>[const Offset(60, 8)],
      firstMoveElapsed: const Duration(milliseconds: 200),
    );
    playGesture(
      pointer: 3,
      moves: <Offset>[const Offset(40, 12)],
      firstMoveElapsed: const Duration(milliseconds: 200),
    );
    expect(profiler.params.jumpSlopMultiplier, kCoalescedJumpSlopMultiplier);
  });

  test('observePacket ignores mouse', () {
    profiler.observePacket(
      const PointerDataPacket(
        data: <PointerData>[
          PointerData(
            change: PointerChange.down,
            kind: PointerDeviceKind.mouse,
            pointerIdentifier: 1,
          ),
          PointerData(
            change: PointerChange.move,
            kind: PointerDeviceKind.mouse,
            pointerIdentifier: 1,
            physicalX: 80,
            physicalY: 10,
          ),
          PointerData(
            change: PointerChange.up,
            kind: PointerDeviceKind.mouse,
            pointerIdentifier: 1,
            physicalX: 80,
            physicalY: 10,
          ),
        ],
      ),
    );
    expect(profiler.completedGestureCount, 0);
  });

  test('observePacket ignores trackpad and synthesized touch', () {
    profiler.observePacket(
      const PointerDataPacket(
        data: <PointerData>[
          PointerData(
            change: PointerChange.down,
            kind: PointerDeviceKind.trackpad,
            pointerIdentifier: 1,
          ),
          PointerData(
            change: PointerChange.move,
            kind: PointerDeviceKind.trackpad,
            pointerIdentifier: 1,
            physicalX: 150,
            physicalY: 30,
          ),
          PointerData(
            change: PointerChange.up,
            kind: PointerDeviceKind.trackpad,
            pointerIdentifier: 1,
            physicalX: 150,
            physicalY: 30,
          ),
          PointerData(
            change: PointerChange.down,
            pointerIdentifier: 2,
            synthesized: true,
          ),
          PointerData(
            change: PointerChange.move,
            pointerIdentifier: 2,
            physicalX: 150,
            physicalY: 30,
            synthesized: true,
          ),
          PointerData(
            change: PointerChange.up,
            pointerIdentifier: 2,
            physicalX: 150,
            physicalY: 30,
            synthesized: true,
          ),
        ],
      ),
    );
    expect(profiler.completedGestureCount, 0);
  });

  test('cancel still commits a coalesced gesture', () {
    profiler.observePointer(
      change: PointerChange.down,
      pointer: 1,
      logicalPosition: Offset.zero,
      timeStamp: Duration.zero,
    );
    profiler.observePointer(
      change: PointerChange.move,
      pointer: 1,
      logicalPosition: const Offset(50, 10),
      timeStamp: const Duration(milliseconds: 8),
    );
    profiler.observePointer(
      change: PointerChange.cancel,
      pointer: 1,
      logicalPosition: const Offset(50, 10),
      timeStamp: const Duration(milliseconds: 16),
    );
    expect(profiler.completedGestureCount, 1);
  });

  test('observePacket records a touch jump in logical pixels', () {
    profiler.observePacket(
      const PointerDataPacket(
        data: <PointerData>[
          PointerData(
            change: PointerChange.down,
            pointerIdentifier: 9,
          ),
          PointerData(
            change: PointerChange.move,
            pointerIdentifier: 9,
            physicalX: 150,
            physicalY: 30,
            timeStamp: Duration(milliseconds: 8),
          ),
          PointerData(
            change: PointerChange.up,
            pointerIdentifier: 9,
            physicalX: 150,
            physicalY: 30,
            timeStamp: Duration(milliseconds: 16),
          ),
        ],
      ),
    );
    expect(profiler.completedGestureCount, 1);
    expect(profiler.emaFirstMoveSlops, greaterThan(1.6));
  });
}
