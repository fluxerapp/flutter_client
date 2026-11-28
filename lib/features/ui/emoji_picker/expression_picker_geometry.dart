import 'dart:math' as math;

import 'package:fluxer_app/features/ui/emoji_picker/domain/expression_picker_resize_edge.dart';
import 'package:fluxer_app/material_ui.dart';

const Size kExpressionPickerDefaultSize = Size(592, 690);
const Size kExpressionPickerMinSize = Size(360, 360);
const double kExpressionPickerViewportPadding = 16;
const double kExpressionPickerAnchorGap = 8;
const double kExpressionPickerComposerCrossOffset = 16;
const double kExpressionPickerCategoryRailWidth = 46;
const double kExpressionPickerGridPadding = 8;
const double kExpressionPickerBorderWidth = 1;
const double kExpressionPickerGridTrackWidth = 48;
const int kExpressionPickerMinGridColumns = 5;
const double kExpressionPickerGridChromeWidth =
    kExpressionPickerCategoryRailWidth +
    kExpressionPickerBorderWidth * 2 +
    kExpressionPickerGridPadding * 2;

int expressionPickerGridColumns(double gridWidth) {
  if (!gridWidth.isFinite || gridWidth <= 0) {
    return kExpressionPickerMinGridColumns;
  }
  return math.max(
    kExpressionPickerMinGridColumns,
    (gridWidth / kExpressionPickerGridTrackWidth).floor(),
  );
}

double clampExpressionPickerDimension(
  double value, {
  required double min,
  required double max,
  bool snapWidth = false,
}) {
  final double upper = math.max(1, max.floorToDouble());
  final double lower = math.min(min, upper);
  final double requested = value.isFinite ? value.roundToDouble() : lower;
  final double bounded = requested.clamp(lower, upper);
  if (!snapWidth) {
    return bounded;
  }
  const double offset = kExpressionPickerGridChromeWidth;
  const double step = kExpressionPickerGridTrackWidth;
  final double fitted = offset + ((bounded - offset) / step).floor() * step;
  if (fitted >= lower) {
    return fitted;
  }
  final double raised = fitted + step;
  if (raised <= upper) {
    return raised;
  }
  return fitted > 0 ? fitted : bounded;
}

Size clampExpressionPickerSize(Size size, Size available) => Size(
  clampExpressionPickerDimension(
    size.width,
    min: kExpressionPickerMinSize.width,
    max: available.width,
    snapWidth: true,
  ),
  clampExpressionPickerDimension(
    size.height,
    min: kExpressionPickerMinSize.height,
    max: available.height,
  ),
);

Size expressionPickerAvailableSize(Size viewport) => Size(
  math.max(1, viewport.width - kExpressionPickerViewportPadding * 2),
  math.max(1, viewport.height - kExpressionPickerViewportPadding * 2),
);

double expressionPickerVerticalSpace({
  required Rect anchor,
  required Size viewport,
}) {
  const double pad = kExpressionPickerViewportPadding;
  const double gap = kExpressionPickerAnchorGap;
  final double above = anchor.top - gap - pad;
  final double below = viewport.height - pad - anchor.bottom - gap;
  return math.max(1, math.max(above, below));
}

Rect clampExpressionPickerRect(Rect rect, Size viewport) {
  const double pad = kExpressionPickerViewportPadding;
  final double maxLeft = math.max(pad, viewport.width - pad - rect.width);
  final double maxTop = math.max(pad, viewport.height - pad - rect.height);
  return Rect.fromLTWH(
    rect.left.clamp(pad, maxLeft),
    rect.top.clamp(pad, maxTop),
    rect.width,
    rect.height,
  );
}

Size expressionPickerDragMaxSize({
  required ExpressionPickerResizeEdge edge,
  required Rect startRect,
  required Size viewport,
}) {
  const double pad = kExpressionPickerViewportPadding;
  double width = viewport.width - pad * 2;
  double height = viewport.height - pad * 2;
  if (edge.movesLeft) {
    width = startRect.right - pad;
  } else if (edge.movesRight) {
    width = viewport.width - pad - startRect.left;
  }
  if (edge.movesTop) {
    height = startRect.bottom - pad;
  } else if (edge.movesBottom) {
    height = viewport.height - pad - startRect.top;
  }
  return Size(math.max(1, width), math.max(1, height));
}

Rect resizeExpressionPickerRect({
  required ExpressionPickerResizeEdge edge,
  required Rect startRect,
  required Offset delta,
  required Size viewport,
}) {
  final double requestedWidth = edge.movesRight
      ? startRect.width + delta.dx
      : edge.movesLeft
      ? startRect.width - delta.dx
      : startRect.width;
  final double requestedHeight = edge.movesBottom
      ? startRect.height + delta.dy
      : edge.movesTop
      ? startRect.height - delta.dy
      : startRect.height;
  final Size maxSize = expressionPickerDragMaxSize(
    edge: edge,
    startRect: startRect,
    viewport: viewport,
  );
  final double width = edge.movesLeft || edge.movesRight
      ? clampExpressionPickerDimension(
          requestedWidth,
          min: kExpressionPickerMinSize.width,
          max: maxSize.width,
          snapWidth: true,
        )
      : startRect.width;
  final double height = edge.movesTop || edge.movesBottom
      ? clampExpressionPickerDimension(
          requestedHeight,
          min: kExpressionPickerMinSize.height,
          max: maxSize.height,
        )
      : startRect.height;
  final double left = edge.movesLeft ? startRect.right - width : startRect.left;
  final double top = edge.movesTop ? startRect.bottom - height : startRect.top;
  return Rect.fromLTWH(left, top, width, height);
}
