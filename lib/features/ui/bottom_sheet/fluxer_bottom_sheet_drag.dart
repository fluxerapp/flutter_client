const double kFluxerBottomSheetDismissDragDistance = 50;
const double kFluxerBottomSheetDismissVelocity = 300;
const double kFluxerBottomSheetHalfSize = 0.5;
const double kFluxerBottomSheetFullSize = 0.95;

const double _kSnapEpsilon = 0.001;
const double _kSnapProjectionSeconds = 0.2;

double fluxerBottomSheetSizeAfterDrag({
  required double currentSize,
  required double deltaDy,
  required double availablePixels,
  required double minChildSize,
  required double maxChildSize,
}) {
  if (currentSize <= 0 || availablePixels <= 0) {
    return currentSize;
  }
  final double deltaSize = deltaDy / availablePixels;
  return (currentSize - deltaSize).clamp(minChildSize, maxChildSize);
}

bool fluxerBottomSheetShouldDismissAfterDrag({
  required double dragDistance,
  required double velocity,
  double dismissDragDistance = kFluxerBottomSheetDismissDragDistance,
  double dismissVelocity = kFluxerBottomSheetDismissVelocity,
}) => dragDistance > dismissDragDistance || velocity > dismissVelocity;

/// Returns the half or full snap size, or `null` when the sheet should close.
///
/// [velocity] is logical pixels per second, positive downward.
double? fluxerBottomSheetSnapTarget({
  required double size,
  required double halfSize,
  required double fullSize,
  double velocity = 0,
  double availablePixels = 1,
}) {
  if (fullSize - halfSize <= _kSnapEpsilon) {
    return fullSize;
  }

  if (size < halfSize - _kSnapEpsilon) {
    return null;
  }

  final bool atHalf = size <= halfSize + _kSnapEpsilon;
  if (atHalf && velocity > kFluxerBottomSheetDismissVelocity) {
    return null;
  }

  double projected = size;
  if (availablePixels > 0 && velocity.abs() > 0) {
    projected = size - (velocity * _kSnapProjectionSeconds) / availablePixels;
  }
  projected = projected.clamp(halfSize, fullSize);

  final double midpoint = (halfSize + fullSize) / 2;
  return projected < midpoint ? halfSize : fullSize;
}
