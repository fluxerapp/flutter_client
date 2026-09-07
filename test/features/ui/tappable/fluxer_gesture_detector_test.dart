import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('excludes drag-only detectors from semantics', (tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: FluxerGestureDetector(
          onHorizontalDragUpdate: (_) {},
          child: const SizedBox(width: 40, height: 40),
        ),
      ),
    );

    final GestureDetector detector = tester.widget<GestureDetector>(
      find.byType(GestureDetector),
    );
    expect(detector.excludeFromSemantics, isTrue);
  });

  testWidgets('keeps tap detectors in the semantics tree', (tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: FluxerGestureDetector(
          onTap: () {},
          child: const SizedBox(width: 40, height: 40),
        ),
      ),
    );

    final GestureDetector detector = tester.widget<GestureDetector>(
      find.byType(GestureDetector),
    );
    expect(detector.excludeFromSemantics, isFalse);
  });
}
