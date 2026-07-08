const double kFluxerBottomSheetDismissDragDistance = 50;
const double kFluxerBottomSheetDismissVelocity = 300;

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
