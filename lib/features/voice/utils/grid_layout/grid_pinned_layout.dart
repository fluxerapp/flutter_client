import 'dart:math' as math;
import 'dart:ui' show Offset, Rect, Size;

import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_config.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_metrics.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_resolver.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile_rects.dart';

const double _kPinnedEstimateHeightFraction = 0.52;
const double _kPinnedMaxHeightFraction = 0.65;

class VoiceGridPinnedLayout {
  const VoiceGridPinnedLayout({
    required this.pinnedRect,
    required this.gridTop,
    required this.gridHeight,
    required this.visibleTileCount,
    required this.rects,
  });

  final Rect pinnedRect;
  final double gridTop;
  final double gridHeight;
  final int visibleTileCount;
  final List<Rect> rects;
}

VoiceGridPinnedLayout resolveVoiceGridPinnedLayout({
  required Size container,
  required VoiceGridTile pinned,
  required List<VoiceGridTile> secondary,
  required bool compact,
}) {
  final double gap = voiceGridGap(
    tileCount: secondary.length,
    containerHeight: container.height,
    compact: compact,
  );
  final ({double sidePadding, double verticalPadding}) padding =
      voiceGridPadding(
        containerWidth: container.width,
        containerHeight: container.height,
        compact: compact,
      );
  VoiceGridPackedLayoutMetrics packedBelow(double gridTop) =>
      resolveVoiceGridPackedLayoutMetrics(
        tileCount: secondary.length,
        containerWidth: container.width,
        containerHeight: math.max(0, container.height - gridTop),
        compact: compact,
      );

  final double pinTop = padding.verticalPadding;
  final double estimatedHeight = math.min(
    (container.width - padding.sidePadding * 2) / voiceGridTileAspectRatio,
    container.height * _kPinnedEstimateHeightFraction,
  );
  final Rect anchor = voiceGridCellRects(
    metrics: packedBelow(pinTop + estimatedHeight + gap).metrics,
    tiles: secondary,
  ).first;
  final double pinHeight = math.min(
    anchor.width / voiceGridTileAspectRatio,
    math.max(0, container.height - pinTop - gap) * _kPinnedMaxHeightFraction,
  );
  final double gridTop = pinTop + pinHeight + gap;
  final VoiceGridPackedLayoutMetrics packed = packedBelow(gridTop);
  final List<Rect> cells = voiceGridCellRects(
    metrics: packed.metrics,
    tiles: secondary,
  );
  final Rect pinnedRect = Rect.fromLTWH(
    cells.first.left,
    pinTop,
    cells.first.width,
    pinHeight,
  );
  return VoiceGridPinnedLayout(
    pinnedRect: pinnedRect,
    gridTop: gridTop,
    gridHeight: math.max(0, container.height - gridTop),
    visibleTileCount: packed.visibleTileCount,
    rects: fitVoiceGridScreenShareRects(
      tiles: <VoiceGridTile>[pinned, ...secondary],
      cells: <Rect>[
        pinnedRect,
        for (final Rect cell in cells) cell.shift(Offset(0, gridTop)),
      ],
    ),
  );
}
