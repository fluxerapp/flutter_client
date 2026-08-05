import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_scroll_physics.dart';

void main() {
  group('inlineExpressionPanelHomeIndicatorInset', () {
    test('uses viewPadding bottom', () {
      const MediaQueryData mediaQuery = MediaQueryData(
        viewPadding: EdgeInsets.only(bottom: 34),
      );

      expect(inlineExpressionPanelHomeIndicatorInset(mediaQuery), 34);
    });
  });
}
