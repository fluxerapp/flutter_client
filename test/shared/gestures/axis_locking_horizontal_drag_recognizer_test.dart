import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/axis_locking_horizontal_drag_recognizer.dart';
import 'package:fluxer_app/shared/gestures/horizontal_drag_axis_lock.dart';

void main() {
  Future<void> pumpCompetingRecognizers(
    WidgetTester tester, {
    required ValueChanged<int> onHorizontalStart,
  }) async {
    var started = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
          ),
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
              AxisLockingHorizontalDragRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                    AxisLockingHorizontalDragRecognizer
                  >(
                    () => AxisLockingHorizontalDragRecognizer(
                      shouldDefer: (_) => false,
                      shouldReject: (HorizontalDragAxisLockDecision decision) =>
                          decision ==
                              HorizontalDragAxisLockDecision.yieldToVertical ||
                          decision ==
                              HorizontalDragAxisLockDecision.yieldToRightward,
                    ),
                    (AxisLockingHorizontalDragRecognizer recognizer) {
                      recognizer.onStart = (_) {
                        started += 1;
                        onHorizontalStart(started);
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

  testWidgets('up after a pending almost-flat jump does not start a swipe', (
    tester,
  ) async {
    var started = 0;
    await pumpCompetingRecognizers(
      tester,
      onHorizontalStart: (int count) => started = count,
    );
    final TestGesture gesture = await tester.startGesture(
      const Offset(200, 400),
    );
    await gesture.moveBy(const Offset(-80, 8));
    await gesture.up();
    await tester.pump();
    expect(started, 0);
  });

  testWidgets(
    'cancel after a pending almost-flat jump does not start a swipe',
    (tester) async {
      var started = 0;
      await pumpCompetingRecognizers(
        tester,
        onHorizontalStart: (int count) => started = count,
      );
      final TestGesture gesture = await tester.startGesture(
        const Offset(200, 400),
      );
      await gesture.moveBy(const Offset(-80, 8));
      await gesture.cancel();
      await tester.pump();
      expect(started, 0);
    },
  );

  testWidgets('second sample after a pending jump can still swipe', (
    tester,
  ) async {
    var started = 0;
    await pumpCompetingRecognizers(
      tester,
      onHorizontalStart: (int count) => started = count,
    );
    final TestGesture gesture = await tester.startGesture(
      const Offset(200, 400),
    );
    await gesture.moveBy(const Offset(-80, 8));
    expect(started, 0);
    await gesture.moveBy(const Offset(-20, 0));
    await tester.pump();
    expect(started, 1);
    await gesture.up();
  });

  testWidgets('perfectly flat jump still swipes on the first sample', (
    tester,
  ) async {
    var started = 0;
    await pumpCompetingRecognizers(
      tester,
      onHorizontalStart: (int count) => started = count,
    );
    final TestGesture gesture = await tester.startGesture(
      const Offset(200, 400),
    );
    await gesture.moveBy(const Offset(-80, 0));
    await tester.pump();
    expect(started, 1);
    await gesture.up();
  });
}
