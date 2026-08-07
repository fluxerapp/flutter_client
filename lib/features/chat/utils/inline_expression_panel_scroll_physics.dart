import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';

const double kInlineExpressionPanelScrollTopTolerance = 0.5;

double inlineExpressionPanelHomeIndicatorInset(MediaQueryData mediaQuery) {
  return bottomInputHomeIndicatorInset(mediaQuery);
}

ScrollPhysics inlineExpressionPanelScrollPhysics() {
  final ScrollPhysics parent = switch (defaultTargetPlatform) {
    TargetPlatform.iOS || TargetPlatform.macOS => const BouncingScrollPhysics(),
    _ => const ClampingScrollPhysics(),
  };
  return AlwaysScrollableScrollPhysics(parent: parent);
}

ScrollPhysics inlineExpressionPanelContentScrollPhysics({
  required bool isSheetExpanded,
}) {
  final ScrollPhysics parent = switch (defaultTargetPlatform) {
    TargetPlatform.iOS || TargetPlatform.macOS => const BouncingScrollPhysics(),
    _ => const ClampingScrollPhysics(),
  };
  if (!isSheetExpanded) {
    return parent;
  }
  return AlwaysScrollableScrollPhysics(parent: parent);
}

bool inlineExpressionPanelScrollIsAtTop(ScrollMetrics metrics) {
  return metrics.pixels <=
      metrics.minScrollExtent + kInlineExpressionPanelScrollTopTolerance;
}

bool inlineExpressionPanelControllerIsAtTop(ScrollController controller) {
  if (!controller.hasClients) {
    return true;
  }
  return inlineExpressionPanelScrollIsAtTop(controller.position);
}

bool inlineExpressionPanelShouldHandleTopOverscroll(
  ScrollMetrics metrics,
  double overscroll,
) {
  return overscroll < 0 && inlineExpressionPanelScrollIsAtTop(metrics);
}
