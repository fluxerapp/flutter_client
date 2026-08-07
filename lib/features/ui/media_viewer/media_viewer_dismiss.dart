import 'dart:math' as math;

const double kMediaViewerDismissDistanceFraction = 0.18;
const double kMediaViewerDismissVelocity = 700;
const double kMediaViewerDismissMinScale = 0.92;

double mediaViewerDismissProgress({
  required double dragOffset,
  required double viewportHeight,
  double dismissDistanceFraction = kMediaViewerDismissDistanceFraction,
}) {
  if (viewportHeight <= 0) {
    return 0;
  }
  final double dismissDistance = viewportHeight * dismissDistanceFraction;
  if (dismissDistance <= 0) {
    return 0;
  }
  return (dragOffset.abs() / dismissDistance).clamp(0.0, 1.0);
}

double mediaViewerDismissBackdropOpacity({
  required double baseOpacity,
  required double dismissProgress,
}) {
  return (baseOpacity * (1 - dismissProgress)).clamp(0.0, 1.0);
}

double mediaViewerDismissChromeOpacity({required double dismissProgress}) {
  return (1 - dismissProgress).clamp(0.0, 1.0);
}

double mediaViewerDismissContentScale({
  required double dismissProgress,
  double minScale = kMediaViewerDismissMinScale,
}) {
  return 1 - (dismissProgress * (1 - minScale));
}

bool mediaViewerShouldDismissAfterDrag({
  required double dragOffset,
  required double velocity,
  required double viewportHeight,
  double dismissDistanceFraction = kMediaViewerDismissDistanceFraction,
  double dismissVelocity = kMediaViewerDismissVelocity,
}) {
  if (viewportHeight <= 0) {
    return false;
  }
  final double dismissDistance = viewportHeight * dismissDistanceFraction;
  return dragOffset.abs() > dismissDistance || velocity.abs() > dismissVelocity;
}

double mediaViewerDismissExitOffset({
  required double dragOffset,
  required double viewportHeight,
}) {
  if (viewportHeight <= 0) {
    return dragOffset;
  }
  final double direction = dragOffset == 0 ? 1 : dragOffset.sign;
  return direction * math.max(viewportHeight, dragOffset.abs());
}
