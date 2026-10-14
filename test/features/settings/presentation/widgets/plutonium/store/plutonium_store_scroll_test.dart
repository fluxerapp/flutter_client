import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';

import 'plutonium_store_test_app.dart';

RenderObject _wavesBoundary(WidgetTester tester) {
  final Finder waves = find.byWidgetPredicate(
    (Widget widget) =>
        widget is CustomPaint &&
        widget.painter.runtimeType.toString() == '_PageWavesPainter',
  );
  RenderObject node = tester.renderObject(waves);
  while (!node.isRepaintBoundary) {
    node = node.parent!;
  }
  return node;
}

Future<void> _pumpStore(WidgetTester tester, ScrollController controller) {
  tester.view.physicalSize = const Size(412, 915);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  return tester.pumpWidget(
    plutoniumStoreTestApp(brightness: Brightness.dark, controller: controller),
  );
}

void main() {
  testWidgets('store panels skip the backdrop blur on scroll', (
    WidgetTester tester,
  ) async {
    final ScrollController controller = ScrollController();
    addTearDown(controller.dispose);
    await _pumpStore(tester, controller);
    await tester.pumpAndSettle();

    expect(find.byType(BackdropFilter), findsNothing);
  });

  testWidgets('scrolling moves the waves without repainting them', (
    WidgetTester tester,
  ) async {
    final ScrollController controller = ScrollController();
    addTearDown(controller.dispose);
    await _pumpStore(tester, controller);
    await tester.pumpAndSettle();

    final RenderObject boundary = _wavesBoundary(tester);
    final Layer? picture = boundary.debugLayer!.firstChild;
    final double before = (boundary as RenderBox).localToGlobal(Offset.zero).dy;

    for (int i = 1; i <= 5; i++) {
      controller.jumpTo(i * 60.0);
      await tester.pump();
      expect(_wavesBoundary(tester), same(boundary));
      expect(boundary.debugLayer!.firstChild, same(picture));
    }

    final double after = boundary.localToGlobal(Offset.zero).dy;
    expect(after, closeTo(before - 300 * 0.2, 0.01));
  });
}
