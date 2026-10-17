import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/accessibility/presentation/reduced_motion_scope.dart';
import 'package:fluxer_app/features/shell/foldable/retargeting_scalar.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('snaps to target when motion is reduced', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ReducedMotionScope(
          enabled: true,
          child: RetargetingScalar(
            target: 200,
            builder: (BuildContext context, double value) {
              return Text(value.toStringAsFixed(0));
            },
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('200'), findsOneWidget);
  });
}
