import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/media_viewer/media_viewer_dismissible.dart';

void main() {
  Widget buildViewer({
    required ValueChanged<double> onDismissProgress,
    required VoidCallback onClose,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: MediaViewerDismissible(
          onDismissProgress: onDismissProgress,
          onClose: onClose,
          child: const SizedBox.expand(),
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
}
