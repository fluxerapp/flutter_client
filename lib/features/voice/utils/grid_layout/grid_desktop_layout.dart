import 'dart:math' as math;
import 'dart:ui' show Rect, Size;

import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_config.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_resolver.dart';

const double voiceGridDesktopSafePaddingPx = 48;
const double voiceGridDesktopWrapperPaddingPx = 16;
const double voiceGridDesktopSidePaddingPx = 12;
const double voiceGridDesktopVerticalPaddingPx = 14;

class VoiceGridDesktopLayout {
  const VoiceGridDesktopLayout({
    required this.columns,
    required this.tileSize,
    required this.visibleTileCount,
    required this.rects,
  });

  static const VoiceGridDesktopLayout empty = VoiceGridDesktopLayout(
    columns: 1,
    tileSize: Size.zero,
    visibleTileCount: 0,
    rects: <Rect>[],
  );

  final int columns;
  final Size tileSize;
  final int visibleTileCount;
  final List<Rect> rects;
}

({double top, double bottom}) voiceGridDesktopStagePadding({
  required double containerHeight,
  required bool compact,
}) {
  if (compact) {
    return (
      top: (containerHeight * 0.016).clamp(4, 6.4),
      bottom: (containerHeight * 0.02).clamp(5.6, 10.4),
    );
  }
  const double padding =
      voiceGridDesktopSafePaddingPx + voiceGridDesktopWrapperPaddingPx;
  return (top: padding, bottom: padding);
}

({double side, double vertical}) voiceGridDesktopPadding({
  required double containerWidth,
  required double containerHeight,
  required bool compact,
}) {
  if (compact) {
    return (
      side: (containerHeight * 0.02).clamp(6, 12),
      vertical: (containerHeight * 0.018).clamp(5, 10),
    );
  }
  final double side;
  if (containerWidth < 420) {
    side = 6;
  } else if (containerWidth < 760) {
    side = 8;
  } else {
    side = voiceGridDesktopSidePaddingPx;
  }
  final double vertical;
  if (containerHeight < 360) {
    vertical = 8;
  } else if (containerHeight < 520) {
    vertical = 10;
  } else {
    vertical = voiceGridDesktopVerticalPaddingPx;
  }
  return (side: side, vertical: vertical);
}

VoiceGridDesktopLayout resolveVoiceGridDesktopLayout({
  required int tileCount,
  required Size container,
  required bool compact,
}) {
  final double width = math.max(0, container.width);
  final double height = math.max(0, container.height);
  if (tileCount <= 0 || width == 0 || height == 0) {
    return VoiceGridDesktopLayout.empty;
  }
  final ({double side, double vertical}) padding = voiceGridDesktopPadding(
    containerWidth: width,
    containerHeight: height,
    compact: compact,
  );
  final double availableWidth = math.max(0, width - padding.side * 2);
  final double availableHeight = math.max(0, height - padding.vertical * 2);
  final double minTileWidth = compact ? 0 : voiceGridMinTileWidthPx;
  final double minTileHeight = compact ? 0 : voiceGridMinTileHeightPx;
  for (int count = tileCount; count >= 1; count--) {
    final double gap = voiceGridGap(
      tileCount: count,
      containerHeight: height,
      compact: compact,
    );
    int bestColumns = 0;
    double bestWidth = 0;
    for (int columns = 1; columns <= count; columns++) {
      final double tileWidth = _tileWidth(
        columns: columns,
        rows: voiceGridRowCount(count, columns),
        gap: gap,
        availableWidth: availableWidth,
        availableHeight: availableHeight,
      );
      if (tileWidth < minTileWidth ||
          tileWidth / voiceGridTileAspectRatio < minTileHeight) {
        continue;
      }
      if (tileWidth > bestWidth) {
        bestWidth = tileWidth;
        bestColumns = columns;
      }
    }
    if (bestColumns > 0) {
      final Size tileSize = Size(
        bestWidth,
        bestWidth / voiceGridTileAspectRatio,
      );
      return VoiceGridDesktopLayout(
        columns: bestColumns,
        tileSize: tileSize,
        visibleTileCount: count,
        rects: _centeredRects(
          count: count,
          columns: bestColumns,
          tileSize: tileSize,
          gap: gap,
          container: Size(width, height),
        ),
      );
    }
  }
  return VoiceGridDesktopLayout.empty;
}

double _tileWidth({
  required int columns,
  required int rows,
  required double gap,
  required double availableWidth,
  required double availableHeight,
}) {
  final double columnWidth = (availableWidth - gap * (columns - 1)) / columns;
  final double rowHeight = (availableHeight - gap * (rows - 1)) / rows;
  return math.max(
    0,
    math.min(columnWidth, rowHeight * voiceGridTileAspectRatio),
  );
}

List<Rect> _centeredRects({
  required int count,
  required int columns,
  required Size tileSize,
  required double gap,
  required Size container,
}) {
  final int rows = voiceGridRowCount(count, columns);
  final double blockHeight = rows * tileSize.height + (rows - 1) * gap;
  final double top = (container.height - blockHeight) / 2;
  return List<Rect>.generate(count, (int index) {
    final int row = index ~/ columns;
    final int itemsInRow = math.min(columns, count - row * columns);
    final double rowWidth =
        itemsInRow * tileSize.width + (itemsInRow - 1) * gap;
    final double left = (container.width - rowWidth) / 2;
    return Rect.fromLTWH(
      left + (index - row * columns) * (tileSize.width + gap),
      top + row * (tileSize.height + gap),
      tileSize.width,
      tileSize.height,
    );
  });
}
