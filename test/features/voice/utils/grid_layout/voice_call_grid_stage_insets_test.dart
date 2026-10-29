import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/call_grid_stage_insets.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('resolveVoiceStageSystemInsets', () {
    test('duo hosted ui ignores lateral view padding', () {
      const EdgeInsets padding = EdgeInsets.only(bottom: 20);
      const EdgeInsets viewPadding = EdgeInsets.only(right: 84, bottom: 34);

      final EdgeInsets insets = resolveVoiceStageSystemInsets(
        padding: padding,
        viewPadding: viewPadding,
        iphoneDuoHostedUi: true,
      );

      expect(insets.left, 0);
      expect(insets.right, 0);
      expect(insets.bottom, 34);
    });

    test('default layout keeps lateral safe area', () {
      const EdgeInsets padding = EdgeInsets.zero;
      const EdgeInsets viewPadding = EdgeInsets.only(left: 44, right: 44);

      final EdgeInsets insets = resolveVoiceStageSystemInsets(
        padding: padding,
        viewPadding: viewPadding,
        iphoneDuoHostedUi: false,
      );

      expect(insets.left, 44);
      expect(insets.right, 44);
    });
  });

  testWidgets('voiceCallGridStageInsets uses duo rules from context', (
    WidgetTester tester,
  ) async {
    late EdgeInsets insets;
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(
          size: Size(390, 844),
          padding: EdgeInsets.only(bottom: 20),
          viewPadding: EdgeInsets.only(right: 84, bottom: 34),
        ),
        child: Builder(
          builder: (BuildContext context) {
            insets = voiceCallGridStageInsets(
              context,
              screenShareExpanded: false,
              reserveHandheldControls: false,
            );
            return const SizedBox.expand();
          },
        ),
      ),
    );

    expect(insets.right, isNonZero);
  });
}
