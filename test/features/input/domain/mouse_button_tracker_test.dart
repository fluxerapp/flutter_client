import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/domain/mouse_button_tracker.dart';

void main() {
  test('reports side buttons pressed and released as DOM buttons', () {
    final MouseButtonTracker tracker = MouseButtonTracker();

    final MouseButtonChange? down = tracker.track(
      const PointerDownEvent(
        kind: PointerDeviceKind.mouse,
        buttons: kBackMouseButton,
      ),
    );
    expect(down?.pressed, <int>[3]);
    expect(down?.released, isEmpty);

    final MouseButtonChange? up = tracker.track(
      const PointerUpEvent(kind: PointerDeviceKind.mouse),
    );
    expect(up?.pressed, isEmpty);
    expect(up?.released, <int>[3]);
  });

  test('detects a button added while another is held', () {
    final MouseButtonTracker tracker = MouseButtonTracker()
      ..track(const PointerDownEvent(kind: PointerDeviceKind.mouse));

    final MouseButtonChange? move = tracker.track(
      const PointerMoveEvent(
        kind: PointerDeviceKind.mouse,
        buttons: kPrimaryMouseButton | kForwardMouseButton,
      ),
    );
    expect(move?.pressed, <int>[4]);
    expect(move?.released, isEmpty);
  });

  test('ignores touch and unchanged mouse events', () {
    final MouseButtonTracker tracker = MouseButtonTracker();

    expect(
      tracker.track(const PointerDownEvent(buttons: kMiddleMouseButton)),
      isNull,
    );
    expect(
      tracker.track(const PointerHoverEvent(kind: PointerDeviceKind.mouse)),
      isNull,
    );
  });
}
