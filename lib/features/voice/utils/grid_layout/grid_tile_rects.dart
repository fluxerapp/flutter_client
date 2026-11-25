import 'dart:math' as math;
import 'dart:ui' show Rect;

import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_config.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_metrics.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_resolver.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';

List<Rect> voiceGridTileRects({
  required VoiceGridLayoutMetrics metrics,
  required List<VoiceGridTile> tiles,
}) {
  return fitVoiceGridScreenShareRects(
    tiles: tiles,
    cells: voiceGridCellRects(metrics: metrics, tiles: tiles),
  );
}

List<Rect> voiceGridCellRects({
  required VoiceGridLayoutMetrics metrics,
  required List<VoiceGridTile> tiles,
}) {
  final int count = tiles.length;
  final ({double width, double height}) size = voiceGridPlacedTileSize(
    cellWidth: metrics.tileWidth,
    cellHeight: metrics.tileHeight,
    tileCount: count,
    squareTile: count == 1 && !tiles.first.isScreenShare,
  );
  final double gap = metrics.gap;
  final int columns = math.max(1, metrics.columns);
  final int rows = math.max(1, (count / columns).ceil());
  final double blockHeight = rows * size.height + (rows - 1) * gap;
  final double top =
      metrics.verticalPadding +
      math.max(0, (metrics.availableHeight - blockHeight) / 2);
  return List<Rect>.generate(count, (int index) {
    final int row = index ~/ columns;
    final int itemsInRow = math.min(columns, count - row * columns);
    final double rowWidth = itemsInRow * size.width + (itemsInRow - 1) * gap;
    final double left =
        metrics.sidePadding +
        math.max(0, (metrics.availableWidth - rowWidth) / 2);
    return Rect.fromLTWH(
      left + (index - row * columns) * (size.width + gap),
      top + row * (size.height + gap),
      size.width,
      size.height,
    );
  });
}

List<Rect> fitVoiceGridScreenShareRects({
  required List<VoiceGridTile> tiles,
  required List<Rect> cells,
}) {
  return <Rect>[
    for (int i = 0; i < cells.length; i++)
      if (tiles[i].isScreenShare)
        voiceGridFitAspect(cells[i], voiceGridTileAspectRatio)
      else
        cells[i],
  ];
}
