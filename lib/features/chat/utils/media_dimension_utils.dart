import 'dart:math' as math;
import 'dart:ui';

import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';

class FluxerMediaDimensions {
  const FluxerMediaDimensions({
    required this.maxWidth,
    required this.maxHeight,
  });

  final double maxWidth;
  final double maxHeight;
}

const FluxerMediaDimensions compactMediaDimensions = FluxerMediaDimensions(
  maxWidth: 400,
  maxHeight: 300,
);
const FluxerMediaDimensions comfortableMediaDimensions = FluxerMediaDimensions(
  maxWidth: 550,
  maxHeight: 400,
);

FluxerMediaDimensions mediaDimensionsForSize(MediaDimensionSize size) {
  return switch (size) {
    MediaDimensionSize.small => compactMediaDimensions,
    MediaDimensionSize.large => comfortableMediaDimensions,
  };
}

Size? constrainMediaSize({
  required FluxerMediaDimensions dimensions,
  required int? width,
  required int? height,
}) {
  if (width == null || height == null || width <= 0 || height <= 0) {
    return null;
  }

  final sourceWidth = width.toDouble();
  final sourceHeight = height.toDouble();
  final scale = math.min(
    1,
    math.min(
      dimensions.maxWidth / sourceWidth,
      dimensions.maxHeight / sourceHeight,
    ),
  );

  return Size(sourceWidth * scale, sourceHeight * scale);
}

/// Decode-cache size for a `BoxFit.cover` image in a [cellWidth] x [cellHeight]
/// cell. Caps one axis so the decode keeps the source aspect ratio. Passing
/// both axes triggers `ResizeImagePolicy.exact`, which stretches the bitmap to
/// the cell shape.
({int? width, int? height}) coverDecodeCacheSize({
  required double cellWidth,
  required double cellHeight,
  required double devicePixelRatio,
  int? sourceWidth,
  int? sourceHeight,
}) => _decodeCacheSize(
  cellWidth: cellWidth,
  cellHeight: cellHeight,
  devicePixelRatio: devicePixelRatio,
  sourceWidth: sourceWidth,
  sourceHeight: sourceHeight,
  fitsInside: false,
);

/// Decode-cache size for a `BoxFit.contain` image. Like [coverDecodeCacheSize]
/// but caps the opposite (fitting) axis.
({int? width, int? height}) containDecodeCacheSize({
  required double cellWidth,
  required double cellHeight,
  required double devicePixelRatio,
  int? sourceWidth,
  int? sourceHeight,
}) => _decodeCacheSize(
  cellWidth: cellWidth,
  cellHeight: cellHeight,
  devicePixelRatio: devicePixelRatio,
  sourceWidth: sourceWidth,
  sourceHeight: sourceHeight,
  fitsInside: true,
);

({int? width, int? height}) _decodeCacheSize({
  required double cellWidth,
  required double cellHeight,
  required double devicePixelRatio,
  required int? sourceWidth,
  required int? sourceHeight,
  required bool fitsInside,
}) {
  if (!cellWidth.isFinite ||
      !cellHeight.isFinite ||
      cellWidth <= 0 ||
      cellHeight <= 0) {
    return (width: null, height: null);
  }
  final bool capHeight;
  if (sourceWidth != null &&
      sourceHeight != null &&
      sourceWidth > 0 &&
      sourceHeight > 0) {
    final bool sourceWiderThanCell =
        sourceWidth / sourceHeight > cellWidth / cellHeight;
    // cover caps the overflowing axis, contain the fitting one.
    capHeight = fitsInside ? !sourceWiderThanCell : sourceWiderThanCell;
  } else {
    // Unknown ratio: cap the larger cell axis.
    capHeight = cellHeight >= cellWidth;
  }
  if (capHeight) {
    return (width: null, height: (cellHeight * devicePixelRatio).round());
  }
  return (width: (cellWidth * devicePixelRatio).round(), height: null);
}
