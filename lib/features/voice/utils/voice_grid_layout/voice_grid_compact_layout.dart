import 'dart:math' as math;
import 'dart:ui' show Rect;

import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_grid_layout_config.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_grid_layout_resolver.dart';

class VoiceGridCompactLayout {
  const VoiceGridCompactLayout({
    required this.rects,
    required this.contentHeight,
  });

  final List<Rect> rects;
  final double contentHeight;
}

class _CompactMeasure {
  const _CompactMeasure({
    required this.cameraColumns,
    required this.squareSide,
    required this.shareWidth,
    required this.shareHeight,
    required this.blockHeight,
    required this.fits,
  });

  final int cameraColumns;
  final double squareSide;
  final double shareWidth;
  final double shareHeight;
  final double blockHeight;
  final bool fits;
}

double _finite(double value) {
  if (!value.isFinite) {
    return 0;
  }
  return math.max(0, value);
}

double _pixel(double value) => value.roundToDouble();

_CompactMeasure _measureCompact({
  required int cameraCount,
  required int screenShareCount,
  required int cameraColumns,
  required double availableWidth,
  required double availableHeight,
  required double gap,
}) {
  final int columns = cameraCount == 0
      ? 1
      : math.max(1, math.min(cameraColumns, cameraCount));
  final int cameraRows = cameraCount == 0
      ? 0
      : voiceGridRowCount(cameraCount, columns);
  final int rows = cameraRows + screenShareCount;
  final double naturalSide = cameraCount == 0
      ? 0
      : math.max(0, (availableWidth - gap * (columns - 1)) / columns);
  final double naturalShareWidth = availableWidth;
  final double naturalShareHeight =
      naturalShareWidth / voiceGridTileAspectRatio;
  final double naturalBlock =
      cameraRows * naturalSide +
      screenShareCount * naturalShareHeight +
      gap * math.max(0, rows - 1);
  double scale = 1;
  if (naturalBlock > availableHeight && naturalBlock > 0) {
    scale = availableHeight / naturalBlock;
  }
  double side = naturalSide * scale;
  if (cameraCount > 0) {
    final double floorSide = math.min(
      voiceGridCompactMinTileWidthPx,
      naturalSide,
    );
    if (side + 0.01 < floorSide && naturalSide > 0) {
      scale = floorSide / naturalSide;
      side = floorSide;
    }
  } else if (screenShareCount > 0 && naturalShareHeight > 0) {
    final double shareHeight = naturalShareHeight * scale;
    final double floorShareHeight = math.min(
      voiceGridCompactMinTileHeightPx,
      naturalShareHeight,
    );
    if (shareHeight + 0.01 < floorShareHeight) {
      scale = floorShareHeight / naturalShareHeight;
    }
  }
  final double drawnSide = _pixel(side);
  final double shareWidth = _pixel(naturalShareWidth * scale);
  final double shareHeight = _pixel(shareWidth / voiceGridTileAspectRatio);
  final double blockHeight =
      cameraRows * drawnSide +
      screenShareCount * shareHeight +
      gap * math.max(0, rows - 1);
  return _CompactMeasure(
    cameraColumns: columns,
    squareSide: drawnSide,
    shareWidth: shareWidth,
    shareHeight: shareHeight,
    blockHeight: blockHeight,
    fits: blockHeight <= availableHeight + 1,
  );
}

_CompactMeasure _chooseCompactMeasure({
  required int cameraCount,
  required int screenShareCount,
  required double availableWidth,
  required double availableHeight,
  required double gap,
}) {
  _CompactMeasure at(int columns) {
    return _measureCompact(
      cameraCount: cameraCount,
      screenShareCount: screenShareCount,
      cameraColumns: columns,
      availableWidth: availableWidth,
      availableHeight: availableHeight,
      gap: gap,
    );
  }

  if (cameraCount <= 1) {
    return at(1);
  }
  if (screenShareCount == 0) {
    if (cameraCount <= 2) {
      return at(1);
    }
    return at(cameraCount >= 7 ? 3 : 2);
  }
  if (cameraCount == 2) {
    return at(2);
  }
  final _CompactMeasure two = at(2);
  final _CompactMeasure three = at(3);
  if (two.fits && three.fits) {
    return three.squareSide > two.squareSide ? three : two;
  }
  if (three.fits) {
    return three;
  }
  if (two.fits) {
    return two;
  }
  return three.squareSide >= two.squareSide ? three : two;
}

VoiceGridCompactLayout resolveVoiceGridCompactLayout({
  required int cameraCount,
  required int screenShareCount,
  required double containerWidth,
  required double containerHeight,
}) {
  final int cameras = math.max(0, cameraCount);
  final int shares = math.max(0, screenShareCount);
  final int tileCount = cameras + shares;
  final double width = _pixel(_finite(containerWidth));
  final double height = _pixel(_finite(containerHeight));
  if (tileCount == 0 || width == 0 || height == 0) {
    return VoiceGridCompactLayout(
      rects: List<Rect>.filled(tileCount, Rect.zero),
      contentHeight: height,
    );
  }
  final double gap = voiceGridGap(
    tileCount: tileCount,
    containerHeight: height,
    compact: true,
  );
  final ({double sidePadding, double verticalPadding}) padding =
      voiceGridPadding(
        containerWidth: width,
        containerHeight: height,
        compact: true,
      );
  final double availableWidth = math.max(0, width - padding.sidePadding * 2);
  final double availableHeight = math.max(
    0,
    height - padding.verticalPadding * 2,
  );
  final _CompactMeasure measure = _chooseCompactMeasure(
    cameraCount: cameras,
    screenShareCount: shares,
    availableWidth: availableWidth,
    availableHeight: availableHeight,
    gap: gap,
  );
  final bool scrolls = !measure.fits;
  double y = _pixel(
    scrolls
        ? padding.verticalPadding
        : padding.verticalPadding +
              math.max(0, (availableHeight - measure.blockHeight) / 2),
  );
  final List<Rect> rects = List<Rect>.filled(tileCount, Rect.zero);
  final double side = measure.squareSide;
  if (cameras > 0 && side > 0) {
    final int columns = measure.cameraColumns;
    final int rows = voiceGridRowCount(cameras, columns);
    int placed = 0;
    for (int row = 0; row < rows; row++) {
      if (row > 0) {
        y += gap;
      }
      final int items = math.min(columns, cameras - placed);
      final double rowWidth = items * side + gap * math.max(0, items - 1);
      double x = padding.sidePadding + (availableWidth - rowWidth) / 2;
      final double rowTop = _pixel(y);
      for (int col = 0; col < items; col++) {
        rects[placed] = Rect.fromLTWH(_pixel(x), rowTop, side, side);
        x += side + gap;
        placed++;
      }
      y = rowTop + side;
    }
  }
  if (shares > 0 && measure.shareHeight > 0) {
    final double shareLeft =
        padding.sidePadding + (availableWidth - measure.shareWidth) / 2;
    for (int i = 0; i < shares; i++) {
      if (cameras > 0 || i > 0) {
        y += gap;
      }
      final double rowTop = _pixel(y);
      rects[cameras + i] = Rect.fromLTWH(
        _pixel(shareLeft),
        rowTop,
        measure.shareWidth,
        measure.shareHeight,
      );
      y = rowTop + measure.shareHeight;
    }
  }
  final double contentHeight = scrolls
      ? _pixel(y + padding.verticalPadding)
      : height;
  return VoiceGridCompactLayout(rects: rects, contentHeight: contentHeight);
}
