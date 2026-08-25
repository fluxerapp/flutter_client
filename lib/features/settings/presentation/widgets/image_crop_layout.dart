import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:image/image.dart' as img;

const imageCropViewportInset = 24.0;

bool imageCropScaleAllowed(double nextScale, double maxScale) =>
    nextScale <= maxScale;

double imageCropMaxScaleFor(Size imageSize, Size viewportSize) {
  final imageRatio = imageSize.width / imageSize.height;
  final viewportRatio = viewportSize.width / viewportSize.height;
  final double nativeScale;
  final double coverScale;
  if (imageRatio < viewportRatio) {
    nativeScale = imageSize.height / viewportSize.height;
    coverScale = viewportSize.width / (viewportSize.height * imageRatio);
  } else {
    nativeScale = imageSize.width / viewportSize.width;
    coverScale = viewportSize.height * imageRatio / viewportSize.width;
  }
  return max(nativeScale, coverScale);
}

Future<Size?> imageCropDecodeImageSize(Uint8List bytes) {
  return compute(_decodeImageSize, bytes);
}

Size? _decodeImageSize(Uint8List bytes) {
  final decoder = img.findDecoderForData(bytes);
  if (decoder == null) {
    return null;
  }
  final info = decoder.startDecode(bytes);
  if (info == null) {
    return null;
  }
  return Size(info.width.toDouble(), info.height.toDouble());
}

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
