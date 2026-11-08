import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/bootstrap/startup_first_frame_gate.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('the limit lets the first frame through if nobody releases', (
    WidgetTester tester,
  ) async {
    StartupFirstFrameGate.hold(limit: const Duration(milliseconds: 1500));
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1499));
    expect(tester.binding.sendFramesToEngine, isFalse);

    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump();

    expect(StartupFirstFrameGate.isHeld, isFalse);
    expect(tester.binding.sendFramesToEngine, isTrue);
  });
}
