import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/material_ui.dart';

Offset _place(
  Rect anchor, {
  Size child = const Size(200, 120),
  Size overlay = const Size(800, 600),
  TextDirection direction = TextDirection.ltr,
}) {
  return FluxerDesktopSubmenuLayoutDelegate(
    anchor: anchor,
    textDirection: direction,
  ).getPositionForChild(overlay, child);
}

void main() {
  const Rect trigger = Rect.fromLTWH(100, 100, 220, 32);

  test('opens after the trigger with a 10px side offset', () {
    expect(_place(trigger), const Offset(330, 100));
  });

  test('flips before the trigger when the end edge overflows', () {
    const Rect nearEdge = Rect.fromLTWH(500, 100, 220, 32);
    expect(_place(nearEdge), const Offset(290, 100));
  });

  test('prefers the start side in RTL', () {
    const Rect rtlTrigger = Rect.fromLTWH(400, 100, 220, 32);
    expect(
      _place(rtlTrigger, direction: TextDirection.rtl),
      const Offset(190, 100),
    );
  });

  test('shifts up to stay 12px inside the bottom edge', () {
    const Rect low = Rect.fromLTWH(100, 540, 220, 32);
    expect(_place(low).dy, 600 - 12 - 120);
  });
}
