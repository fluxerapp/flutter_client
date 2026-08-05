import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_layout.dart';

void main() {
  test('caps panel height to visible area above the keyboard', () {
    expect(
      inlineExpressionPanelMaxHeight(
        availableHeight: 800,
        screenHeight: 800,
        keyboardInset: 320,
        topPadding: 24,
        topMargin: 8,
        viewPaddingBottom: 0,
      ),
      448,
    );
  });

  test('uses parent constraints when the scaffold already resized', () {
    expect(
      inlineExpressionPanelMaxHeight(
        availableHeight: 460,
        screenHeight: 800,
        keyboardInset: 320,
        topPadding: 24,
        topMargin: 8,
        viewPaddingBottom: 0,
      ),
      448,
    );
  });

  test('resolves unbounded layout height from the screen and safe areas', () {
    expect(
      inlineExpressionPanelResolveAvailableHeight(
        layoutMaxHeight: double.infinity,
        screenHeight: 800,
        keyboardInset: 0,
        viewPaddingTop: 24,
        viewPaddingBottom: 34,
      ),
      742,
    );
  });

  test('caps expanded height to 80% of the screen', () {
    expect(
      inlineExpressionPanelExpandedHeight(
        availableHeight: 900,
        screenHeight: 800,
        keyboardInset: 0,
        topPadding: 0,
        topMargin: 8,
        viewPaddingBottom: 0,
      ),
      640,
    );
  });

  test('uses the inset slot height when the host reserves the header', () {
    expect(
      inlineExpressionPanelExpandedHeight(
        availableHeight: 687,
        screenHeight: 844,
        keyboardInset: 0,
        topPadding: 0,
        topMargin: 8,
        viewPaddingBottom: 34,
      ),
      closeTo(675.2, 0.01),
    );
  });

  test(
    'dock content height subtracts the pull bar from the keyboard anchor',
    () {
      const double anchor = 291;
      const double handle = 36;
      expect(
        inlineExpressionPanelDockedContentHeight(
          keyboardAnchorNet: anchor,
          dragHandleHeight: handle,
        ),
        255,
      );
      expect(
        inlineExpressionPanelDockedTotalHeight(
          contentHeight: 255,
          dragHandleHeight: handle,
        ),
        anchor,
      );
    },
  );

  test(
    'docked body keeps home indicator inside the keyboard reserved height',
    () {
      const double reserved = 336;
      const double homeIndicator = 34;
      const double handle = 36;
      final double body = inlineExpressionPanelDockedReservedBodyHeight(
        reservedHeight: reserved,
        homeIndicatorInset: homeIndicator,
      );
      expect(body, 302);
      expect(
        inlineExpressionPanelDockedContentHeight(
          keyboardAnchorNet: body,
          dragHandleHeight: handle,
        ),
        266,
      );
      expect(
        inlineExpressionPanelDockedTotalHeight(
              contentHeight: 266,
              dragHandleHeight: handle,
            ) +
            homeIndicator,
        reserved,
      );
    },
  );
}
