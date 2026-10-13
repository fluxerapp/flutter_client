const double kFluxerBottomSheetDismissHeightFraction = 0.5;
const double kFluxerBottomSheetDismissVelocity = 800;
const double kFluxerBottomSheetHalfSize = 0.5;
const double kFluxerBottomSheetFullSize = 0.95;

const double kFluxerBottomSheetDragMinSize = 0.05;

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
  required double sheetHeight,
}) =>
    dragDistance > sheetHeight * kFluxerBottomSheetDismissHeightFraction ||
    velocity > kFluxerBottomSheetDismissVelocity;

double? fluxerBottomSheetSnapTarget({
  required double size,
  required double halfSize,
  required double fullSize,
  double velocity = 0,
  double availablePixels = 1,
}) {
  if (fullSize - halfSize <= _kSnapEpsilon) {
    final bool closes =
        velocity > kFluxerBottomSheetDismissVelocity ||
        size < fullSize * kFluxerBottomSheetDismissHeightFraction;
    return closes ? null : fullSize;
  }

  final bool atOrBelowHalf = size <= halfSize + _kSnapEpsilon;
  if (atOrBelowHalf &&
      (velocity > kFluxerBottomSheetDismissVelocity ||
          size < halfSize * kFluxerBottomSheetDismissHeightFraction)) {
    return null;
  }
  if (size < halfSize) {
    return halfSize;
  }

  double projected = size;
  if (availablePixels > 0 && velocity.abs() > 0) {
    projected = size - (velocity * _kSnapProjectionSeconds) / availablePixels;
  }
  projected = projected.clamp(halfSize, fullSize);

  final double midpoint = (halfSize + fullSize) / 2;
  return projected < midpoint ? halfSize : fullSize;
}
