import 'dart:math' as math;

import 'package:flutter/widgets.dart';

const double kFluxerSmoothScrollbarMinThumbExtent = 24;
const double kFluxerSmoothScrollbarExtentLerp = 0.15;
const double kFluxerSmoothScrollbarExtentEpsilon = 0.5;

double fluxerSmoothScrollbarTrackLength({
  required double viewportDimension,
  required double topInset,
  required double bottomInset,
}) {
  return math.max(0, viewportDimension - topInset - bottomInset);
}

double fluxerSmoothScrollbarThumbExtent({
  required double trackLength,
  required double viewportDimension,
  required double scrollableExtent,
}) {
  if (trackLength <= 0) {
    return 0;
  }
  final double totalExtent = scrollableExtent + viewportDimension;
  if (totalExtent <= kFluxerSmoothScrollbarExtentEpsilon) {
    return trackLength;
  }
  final double proportional = trackLength * viewportDimension / totalExtent;
  final double minThumb = math.min(
    kFluxerSmoothScrollbarMinThumbExtent,
    trackLength,
  );
  return proportional.clamp(minThumb, trackLength);
}

double fluxerSmoothScrollbarThumbOffset({
  required double fraction,
  required double topInset,
  required double trackLength,
  required double thumbExtent,
}) {
  final double travel = math.max(0, trackLength - thumbExtent);
  return topInset + travel * fraction.clamp(0, 1);
}

double fluxerSmoothScrollbarScrollFraction({
  required double pixels,
  required double minExtent,
  required double maxExtent,
  required bool pinTrailingEdge,
}) {
  if (pinTrailingEdge) {
    return 1;
  }
  final double range = maxExtent - minExtent;
  if (range <= kFluxerSmoothScrollbarExtentEpsilon) {
    return 0;
  }
  return ((pixels - minExtent) / range).clamp(0.0, 1.0);
}

double fluxerSmoothScrollbarLerpExtent({
  required double current,
  required double target,
  required bool snap,
}) {
  if (snap) {
    return target;
  }
  final double next =
      current + (target - current) * kFluxerSmoothScrollbarExtentLerp;
  if ((target - next).abs() <= kFluxerSmoothScrollbarExtentEpsilon) {
    return target;
  }
  return next;
}

FixedScrollMetrics? fluxerSmoothScrollbarPaintMetrics({
  required ScrollMetrics source,
  required double smoothedMinScrollExtent,
  required double smoothedMaxScrollExtent,
  required bool pinTrailingEdge,
}) {
  final double minReal = source.minScrollExtent;
  final double maxReal = source.maxScrollExtent;
  final double pixelsReal = source.pixels;
  final double rangeReal = maxReal - minReal;
  if (rangeReal <= kFluxerSmoothScrollbarExtentEpsilon) {
    return null;
  }

  if (source.outOfRange) {
    return FixedScrollMetrics(
      minScrollExtent: minReal,
      maxScrollExtent: maxReal,
      pixels: pixelsReal,
      viewportDimension: source.viewportDimension,
      axisDirection: source.axisDirection,
      devicePixelRatio: source.devicePixelRatio,
    );
  }

  final double minSmooth = smoothedMinScrollExtent;
  final double maxSmooth = smoothedMaxScrollExtent;
  final double rangeSmooth = maxSmooth - minSmooth;
  if (rangeSmooth <= kFluxerSmoothScrollbarExtentEpsilon) {
    return FixedScrollMetrics(
      minScrollExtent: minReal,
      maxScrollExtent: maxReal,
      pixels: pixelsReal,
      viewportDimension: source.viewportDimension,
      axisDirection: source.axisDirection,
      devicePixelRatio: source.devicePixelRatio,
    );
  }

  if (pinTrailingEdge) {
    return FixedScrollMetrics(
      minScrollExtent: minSmooth,
      maxScrollExtent: maxSmooth,
      pixels: maxSmooth,
      viewportDimension: source.viewportDimension,
      axisDirection: source.axisDirection,
      devicePixelRatio: source.devicePixelRatio,
    );
  }

  final double fraction = ((pixelsReal - minReal) / rangeReal).clamp(0.0, 1.0);
  final double pixelsPaint = minSmooth + fraction * rangeSmooth;
  return FixedScrollMetrics(
    minScrollExtent: minSmooth,
    maxScrollExtent: maxSmooth,
    pixels: pixelsPaint,
    viewportDimension: source.viewportDimension,
    axisDirection: source.axisDirection,
    devicePixelRatio: source.devicePixelRatio,
  );
}

double? fluxerSmoothScrollbarDragScrollDelta({
  required AxisDirection axisDirection,
  required Offset startDragScrollbarAxisOffset,
  required Offset lastDragUpdateOffset,
  required Offset localPosition,
  required double startDragThumbOffset,
  required ScrollbarPainter painter,
  required double currentPixels,
  required double minScrollExtent,
  required double maxScrollExtent,
}) {
  late double primaryDeltaFromDragStart;
  late double primaryDeltaFromLastDragUpdate;
  switch (axisDirection) {
    case AxisDirection.up:
      primaryDeltaFromDragStart =
          startDragScrollbarAxisOffset.dy - localPosition.dy;
      primaryDeltaFromLastDragUpdate =
          lastDragUpdateOffset.dy - localPosition.dy;
    case AxisDirection.right:
      primaryDeltaFromDragStart =
          localPosition.dx - startDragScrollbarAxisOffset.dx;
      primaryDeltaFromLastDragUpdate =
          localPosition.dx - lastDragUpdateOffset.dx;
    case AxisDirection.down:
      primaryDeltaFromDragStart =
          localPosition.dy - startDragScrollbarAxisOffset.dy;
      primaryDeltaFromLastDragUpdate =
          localPosition.dy - lastDragUpdateOffset.dy;
    case AxisDirection.left:
      primaryDeltaFromDragStart =
          startDragScrollbarAxisOffset.dx - localPosition.dx;
      primaryDeltaFromLastDragUpdate =
          lastDragUpdateOffset.dx - localPosition.dx;
  }

  double scrollOffsetGlobal = painter.getTrackToScroll(
    startDragThumbOffset + primaryDeltaFromDragStart,
  );

  if (primaryDeltaFromDragStart > 0 && scrollOffsetGlobal < currentPixels ||
      primaryDeltaFromDragStart < 0 && scrollOffsetGlobal > currentPixels) {
    scrollOffsetGlobal =
        currentPixels +
        painter.getTrackToScroll(primaryDeltaFromLastDragUpdate);
  }
  if (scrollOffsetGlobal == currentPixels) {
    return null;
  }

  final double clamped = scrollOffsetGlobal.clamp(
    minScrollExtent,
    maxScrollExtent,
  );
  final bool isReversed =
      axisDirection == AxisDirection.up || axisDirection == AxisDirection.left;
  return isReversed ? clamped - currentPixels : currentPixels - clamped;
}
