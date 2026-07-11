import 'dart:math' as math;

const double kInlineExpressionPanelCollapsedHeight = 350;
const double kMobileChannelHeaderHeight = 64;

const double kInlineExpressionPanelMaxScreenFraction = 0.80;

double inlineExpressionPanelBottomOffset({required double keyboardInset}) =>
    keyboardInset;

double inlineExpressionPanelResolveAvailableHeight({
  required double layoutMaxHeight,
  required double screenHeight,
  required double keyboardInset,
  required double viewPaddingTop,
  required double viewPaddingBottom,
}) {
  if (layoutMaxHeight.isFinite) {
    return layoutMaxHeight;
  }
  return math.max(
    0,
    screenHeight - keyboardInset - viewPaddingTop - viewPaddingBottom,
  );
}

double inlineExpressionPanelMaxHeight({
  required double availableHeight,
  required double screenHeight,
  required double keyboardInset,
  required double topPadding,
  required double topMargin,
  required double viewPaddingBottom,
}) {
  final double resolvedAvailable = inlineExpressionPanelResolveAvailableHeight(
    layoutMaxHeight: availableHeight,
    screenHeight: screenHeight,
    keyboardInset: keyboardInset,
    viewPaddingTop: topPadding,
    viewPaddingBottom: viewPaddingBottom,
  );
  final double fractionCap =
      screenHeight * kInlineExpressionPanelMaxScreenFraction;
  final double keyboardSafeHeight =
      screenHeight - keyboardInset - topPadding - topMargin - viewPaddingBottom;
  return math.max(
    0,
    math.min(resolvedAvailable, math.min(keyboardSafeHeight, fractionCap)),
  );
}

double inlineExpressionPanelExpandedHeight({
  required double availableHeight,
  required double screenHeight,
  required double keyboardInset,
  required double topPadding,
  required double topMargin,
  required double viewPaddingBottom,
}) {
  return inlineExpressionPanelMaxHeight(
    availableHeight: availableHeight,
    screenHeight: screenHeight,
    keyboardInset: keyboardInset,
    topPadding: topPadding,
    topMargin: topMargin,
    viewPaddingBottom: viewPaddingBottom,
  );
}
