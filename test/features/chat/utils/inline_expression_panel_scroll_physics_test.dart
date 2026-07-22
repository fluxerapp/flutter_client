import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_scroll_physics.dart';

void main() {
  group('expressionPanelBottomSystemInset', () {
    test('uses the largest reported bottom inset', () {
      const MediaQueryData mediaQuery = MediaQueryData(
        viewPadding: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.only(bottom: 34),
        systemGestureInsets: EdgeInsets.only(bottom: 48),
      );

      expect(expressionPanelBottomSystemInset(mediaQuery), 48);
    });

    test('falls back to viewPadding when other insets are zero', () {
      const MediaQueryData mediaQuery = MediaQueryData(
        viewPadding: EdgeInsets.only(bottom: 34),
      );

      expect(expressionPanelBottomSystemInset(mediaQuery), 34);
      expect(inlineExpressionPanelHomeIndicatorInset(mediaQuery), 34);
    });
  });
}
