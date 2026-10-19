import 'dart:math' as math;

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

double fluxerSmoothScrollbarPixelsForTrackY({
  required double localY,
  required double topInset,
  required double trackLength,
  required double thumbExtent,
  required double minScrollExtent,
  required double maxScrollExtent,
}) {
  final double travel = math.max(1, trackLength - thumbExtent);
  final double thumbCenterY = (localY - topInset).clamp(
    thumbExtent / 2,
    trackLength - thumbExtent / 2,
  );
  final double fraction = (thumbCenterY - thumbExtent / 2) / travel;
  return minScrollExtent +
      fraction.clamp(0, 1) * (maxScrollExtent - minScrollExtent);
}
