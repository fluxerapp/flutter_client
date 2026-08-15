import 'package:material_ui/material_ui.dart';

const imageCropViewportInset = 24.0;
const imageCropMaxZoomScale = 5.0;

Rect computeInitialCropRect(
  Rect viewportRect,
  double aspectRatio, {
  double inset = imageCropViewportInset,
}) {
  final availableWidth = viewportRect.width - (inset * 2);
  final availableHeight = viewportRect.height - (inset * 2);

  final double width;
  final double height;
  if (availableWidth / availableHeight > aspectRatio) {
    height = availableHeight;
    width = height * aspectRatio;
  } else {
    width = availableWidth;
    height = width / aspectRatio;
  }

  return Rect.fromCenter(
    center: viewportRect.center,
    width: width,
    height: height,
  );
}
