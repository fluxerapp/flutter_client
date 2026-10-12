import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/media_viewer/media_viewer_dismissible.dart';

void main() {
  Widget buildViewer({
    required ValueChanged<double> onDismissProgress,
    required VoidCallback onClose,
    Widget child = const SizedBox.expand(),
  }) {
    return MaterialApp(
      home: Scaffold(
        body: MediaViewerDismissible(
          onDismissProgress: onDismissProgress,
          onClose: onClose,
          child: child,
        ),
      ),
    );
  }

  testWidgets('second drag gesture animates without a ticker error', (
    WidgetTester tester,
  ) async {
    var closed = false;
    await tester.pumpWidget(
      buildViewer(onDismissProgress: (_) {}, onClose: () => closed = true),
    );

    await tester.drag(find.byType(MediaViewerDismissible), const Offset(0, 40));
    await tester.pumpAndSettle();
    expect(closed, isFalse);

    await tester.fling(
      find.byType(MediaViewerDismissible),
      const Offset(0, 400),
      2000,
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(closed, isTrue);
  });
  testWidgets('a second finger stops the dismiss drag from starting', (
    WidgetTester tester,
  ) async {
    final List<double> progress = <double>[];
    await tester.pumpWidget(
      buildViewer(
        onDismissProgress: progress.add,
        onClose: () {},
        child: InteractiveViewer(
          panEnabled: false,
          child: const SizedBox.expand(),
        ),
      ),
    );

    final Offset center = tester.getCenter(find.byType(MediaViewerDismissible));
    final TestGesture first = await tester.startGesture(center, pointer: 1);
    final TestGesture second = await tester.startGesture(
      center + const Offset(0, 40),
      pointer: 2,
    );
    for (int i = 0; i < 10; i++) {
      await second.moveBy(const Offset(0, 10));
      await tester.pump(const Duration(milliseconds: 16));
    }
    await second.up();
    await first.up();
    await tester.pumpAndSettle();

    expect(progress, isEmpty);
  });
}
