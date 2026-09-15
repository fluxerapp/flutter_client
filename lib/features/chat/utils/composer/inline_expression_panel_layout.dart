import 'dart:math' as math;

const double kMobileChannelHeaderHeight = 64;
const double kInlineExpressionPanelDragHandleHitHeight = 28;
const double kInlineExpressionPanelDragHandleBottomSpacing = 8;

const double kInlineExpressionPanelMaxScreenFraction = 0.80;

double inlineExpressionPanelDragHandleHeight({
  double topPadding = 0,
  double bottomSpacing = kInlineExpressionPanelDragHandleBottomSpacing,
}) {
  return topPadding + kInlineExpressionPanelDragHandleHitHeight + bottomSpacing;
}

double inlineExpressionPanelDockedContentHeight({
  required double keyboardAnchorNet,
  required double dragHandleHeight,
}) {
  return math.max(0, keyboardAnchorNet - dragHandleHeight);
}

double inlineExpressionPanelDockedTotalHeight({
  required double contentHeight,
  required double dragHandleHeight,
}) {
  return contentHeight + dragHandleHeight;
}

double inlineExpressionPanelDockedReservedBodyHeight({
  required double reservedHeight,
  required double homeIndicatorInset,
}) {
  return math.max(0, reservedHeight - homeIndicatorInset);
}

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
