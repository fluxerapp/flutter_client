import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/directional_horizontal_drag_recognizer.dart';

void main() {
  const double slop = 18;

  group('claimsClearHorizontalDrag', () {
    test('claims a flat move in the requested direction', () {
      expect(
        claimsClearHorizontalDrag(
          deltaFromStart: const Offset(-40, 0),
          slop: slop,
          directions: const <HorizontalClaimDirection>{
            HorizontalClaimDirection.left,
          },
        ),
        isTrue,
      );
      expect(
        claimsClearHorizontalDrag(
          deltaFromStart: const Offset(40, 8),
          slop: slop,
          directions: const <HorizontalClaimDirection>{
            HorizontalClaimDirection.right,
          },
        ),
        isTrue,
      );
    });

    test('rejects the opposite direction and a mostly vertical move', () {
      expect(
        claimsClearHorizontalDrag(
          deltaFromStart: const Offset(40, 0),
          slop: slop,
          directions: const <HorizontalClaimDirection>{
            HorizontalClaimDirection.left,
          },
        ),
        isFalse,
      );
      expect(
        claimsClearHorizontalDrag(
          deltaFromStart: const Offset(8, 80),
          slop: slop,
          directions: const <HorizontalClaimDirection>{
            HorizontalClaimDirection.right,
          },
        ),
        isFalse,
      );
      expect(
        claimsClearHorizontalDrag(
          deltaFromStart: const Offset(-20, 16),
          slop: slop,
          directions: const <HorizontalClaimDirection>{
            HorizontalClaimDirection.left,
          },
        ),
        isFalse,
      );
    });
  });

  Future<void> pumpRecognizer(
    WidgetTester tester, {
    required HorizontalClaimDirection direction,
    required ValueChanged<int> onStartCount,
  }) async {
    var started = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: RawGestureDetector(
            behavior: HitTestBehavior.opaque,
            gestures: <Type, GestureRecognizerFactory>{
              VerticalDragGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                    VerticalDragGestureRecognizer
                  >(VerticalDragGestureRecognizer.new, (
                    VerticalDragGestureRecognizer recognizer,
                  ) {
                    recognizer.onStart = (_) {};
                  }),
              DirectionalHorizontalDragRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                    DirectionalHorizontalDragRecognizer
                  >(
                    () => DirectionalHorizontalDragRecognizer(
                      directions: () => <HorizontalClaimDirection>{direction},
                      shouldDefer: (_) => false,
                    ),
                    (DirectionalHorizontalDragRecognizer recognizer) {
                      recognizer.onStart = (_) {
                        started += 1;
                        onStartCount(started);
                      };
                    },
                  ),
            },
            child: const SizedBox.expand(),
          ),
        ),
      ),
    );
  }

  testWidgets('a large vertical move does not start a horizontal drag', (
    tester,
  ) async {
    var started = 0;
    await pumpRecognizer(
      tester,
      direction: HorizontalClaimDirection.left,
      onStartCount: (int count) => started = count,
    );
    final TestGesture gesture = await tester.startGesture(
      const Offset(200, 400),
    );
    await gesture.moveBy(const Offset(8, 80));
    await gesture.up();
    await tester.pump();
    expect(started, 0);
  });

  testWidgets('a clear left move starts on the first sample', (tester) async {
    var started = 0;
    await pumpRecognizer(
      tester,
      direction: HorizontalClaimDirection.left,
      onStartCount: (int count) => started = count,
    );
    final TestGesture gesture = await tester.startGesture(
      const Offset(200, 400),
    );
    await gesture.moveBy(const Offset(-80, 8));
    await tester.pump();
    expect(started, 1);
    await gesture.up();
  });

  testWidgets('a clear right move starts on the first sample', (tester) async {
    var started = 0;
    await pumpRecognizer(
      tester,
      direction: HorizontalClaimDirection.right,
      onStartCount: (int count) => started = count,
    );
    final TestGesture gesture = await tester.startGesture(
      const Offset(200, 400),
    );
    await gesture.moveBy(const Offset(80, 0));
    await tester.pump();
    expect(started, 1);
    await gesture.up();
  });

  testWidgets('directions are read on the move', (tester) async {
    var started = 0;
    var claimLeft = false;
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: RawGestureDetector(
            behavior: HitTestBehavior.opaque,
            gestures: <Type, GestureRecognizerFactory>{
              VerticalDragGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                    VerticalDragGestureRecognizer
                  >(VerticalDragGestureRecognizer.new, (
                    VerticalDragGestureRecognizer recognizer,
                  ) {
                    recognizer.onStart = (_) {};
                  }),
              DirectionalHorizontalDragRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                    DirectionalHorizontalDragRecognizer
                  >(
                    () => DirectionalHorizontalDragRecognizer(
                      directions: () => <HorizontalClaimDirection>{
                        HorizontalClaimDirection.right,
                        if (claimLeft) HorizontalClaimDirection.left,
                      },
                      shouldDefer: (_) => false,
                    ),
                    (DirectionalHorizontalDragRecognizer recognizer) {
                      recognizer.onStart = (_) => started += 1;
                    },
                  ),
            },
            child: const SizedBox.expand(),
          ),
        ),
      ),
    );

    final TestGesture opening = await tester.startGesture(
      const Offset(200, 400),
    );
    await opening.moveBy(const Offset(-80, 0));
    await opening.up();
    await tester.pump();
    expect(started, 0);

    claimLeft = true;
    final TestGesture closing = await tester.startGesture(
      const Offset(200, 400),
    );
    await closing.moveBy(const Offset(-80, 0));
    await tester.pump();
    expect(started, 1);
    await closing.up();
  });

  testWidgets('a deferred pointer does not start a drag', (tester) async {
    var started = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(size: Size(400, 800)),
          child: RawGestureDetector(
            behavior: HitTestBehavior.opaque,
            gestures: <Type, GestureRecognizerFactory>{
              DirectionalHorizontalDragRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                    DirectionalHorizontalDragRecognizer
                  >(
                    () => DirectionalHorizontalDragRecognizer(
                      directions: () => const <HorizontalClaimDirection>{
                        HorizontalClaimDirection.right,
                      },
                      shouldDefer: (_) => true,
                    ),
                    (DirectionalHorizontalDragRecognizer recognizer) {
                      recognizer.onStart = (_) => started += 1;
                    },
                  ),
            },
            child: const SizedBox.expand(),
          ),
        ),
      ),
    );
    final TestGesture gesture = await tester.startGesture(
      const Offset(200, 400),
    );
    await gesture.moveBy(const Offset(80, 0));
    await gesture.up();
    await tester.pump();
    expect(started, 0);
  });

  testWidgets('a right move does not start a left drag', (tester) async {
    var started = 0;
    await pumpRecognizer(
      tester,
      direction: HorizontalClaimDirection.left,
      onStartCount: (int count) => started = count,
    );
    final TestGesture gesture = await tester.startGesture(
      const Offset(200, 400),
    );
    await gesture.moveBy(const Offset(80, 0));
    await gesture.up();
    await tester.pump();
    expect(started, 0);
  });
}
