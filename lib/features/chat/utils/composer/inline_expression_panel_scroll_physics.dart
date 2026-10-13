import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';

const double kInlineExpressionPanelScrollTopTolerance = 0.5;

double inlineExpressionPanelHomeIndicatorInset(MediaQueryData mediaQuery) {
  return bottomInputHomeIndicatorInset(mediaQuery);
}

ScrollPhysics inlineExpressionPanelContentScrollPhysics({
  required bool isSheetExpanded,
  required ScrollPhysics parent,
}) {
  if (!isSheetExpanded) {
    return InlineExpressionPanelDockedScrollPhysics(parent: parent);
  }
  return AlwaysScrollableScrollPhysics(parent: parent);
}

class InlineExpressionPanelDockedScrollPhysics extends ScrollPhysics {
  const InlineExpressionPanelDockedScrollPhysics({super.parent});

  @override
  InlineExpressionPanelDockedScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return InlineExpressionPanelDockedScrollPhysics(
      parent: buildParent(ancestor),
    );
  }

  bool _sheetOwnsForwardMotion(ScrollMetrics position) {
    return position.axisDirection == AxisDirection.down &&
        !position.outOfRange &&
        inlineExpressionPanelScrollIsAtTop(position);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (offset < 0 && _sheetOwnsForwardMotion(position)) {
      return 0;
    }
    return super.applyPhysicsToUserOffset(position, offset);
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    if (velocity > 0 && _sheetOwnsForwardMotion(position)) {
      return null;
    }
    return super.createBallisticSimulation(position, velocity);
  }
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
