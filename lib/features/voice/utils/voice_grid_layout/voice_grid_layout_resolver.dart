import 'dart:math' as math;

import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_grid_layout_config.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_grid_layout_metrics.dart';

int _sanitizeCount(int tileCount) => math.max(0, tileCount);

double _sanitizeDimension(double value) {
  if (!value.isFinite) {
    return 0;
  }
  return math.max(0, value);
}

double _clamp(double value, double min, double max) =>
    math.max(min, math.min(max, value));

int voiceGridRowCount(int tileCount, int columnCount) {
  final int safeColumns = math.max(1, columnCount);
  return math.max(1, (_sanitizeCount(tileCount) / safeColumns).ceil());
}

int voiceGridColumnCount({
  required int tileCount,
  required double containerWidth,
  required double containerHeight,
}) {
  final int count = _sanitizeCount(tileCount);
  final double width = _sanitizeDimension(containerWidth);
  final double height = _sanitizeDimension(containerHeight);
  for (final VoiceGridColumnRule rule in voiceGridColumnRules) {
    if (count >= rule.minTileCount &&
        width >= rule.minWidth &&
        height >= rule.minHeight) {
      return rule.columns;
    }
  }
  return 1;
}

double voiceGridGap({
  required int tileCount,
  required double containerHeight,
  bool compact = false,
}) {
  final int count = _sanitizeCount(tileCount);
  if (count >= 40) {
    return 4;
  }
  if (compact && count >= 24) {
    return 5;
  }
  if (count >= 24) {
    return 6;
  }
  if (compact && count >= 12) {
    return 6;
  }
  if (count >= 12) {
    return 8;
  }
  if (count >= 6) {
    return 10;
  }
  if (compact) {
    return _clamp(_sanitizeDimension(containerHeight) * 0.024, 6, 10);
  }
  return voiceGridDefaultGapPx;
}

({double sidePadding, double verticalPadding}) voiceGridPadding({
  required double containerWidth,
  required double containerHeight,
  bool compact = false,
  bool edgeToEdge = false,
}) {
  if (edgeToEdge) {
    return (sidePadding: 0, verticalPadding: 0);
  }
  // Compact grids pack into thin strips; scale padding down so min tiles fit.
  if (compact) {
    final double height = _sanitizeDimension(containerHeight);
    return (
      sidePadding: _clamp(height * 0.02, 6, 12),
      verticalPadding: _clamp(height * 0.018, 5, 10),
    );
  }
  return (
    sidePadding: voiceGridEdgePaddingPx,
    verticalPadding: voiceGridEdgePaddingPx,
  );
}

VoiceGridMinTileSize voiceGridMinTileSize({bool compact = false}) {
  return compact
      ? const VoiceGridMinTileSize(
          minTileWidth: voiceGridCompactMinTileWidthPx,
          minTileHeight: voiceGridCompactMinTileHeightPx,
        )
      : const VoiceGridMinTileSize(
          minTileWidth: voiceGridMinTileWidthPx,
          minTileHeight: voiceGridMinTileHeightPx,
        );
}

VoiceGridLayoutMetrics _emptyMetrics({
  required int tileCount,
  required double containerWidth,
  required double containerHeight,
  required bool compact,
  required bool edgeToEdge,
}) {
  final int count = _sanitizeCount(tileCount);
  final double width = _sanitizeDimension(containerWidth);
  final double height = _sanitizeDimension(containerHeight);
  final double gap = voiceGridGap(
    tileCount: count,
    compact: compact,
    containerHeight: height,
  );
  final ({double sidePadding, double verticalPadding}) padding =
      voiceGridPadding(
        containerWidth: width,
        containerHeight: height,
        compact: compact,
        edgeToEdge: edgeToEdge,
      );
  final double availableWidth = math.max(0, width - padding.sidePadding * 2);
  final double availableHeight = math.max(
    0,
    height - padding.verticalPadding * 2,
  );
  return VoiceGridLayoutMetrics(
    columns: 1,
    rows: 1,
    gap: gap,
    sidePadding: padding.sidePadding,
    verticalPadding: padding.verticalPadding,
    availableWidth: availableWidth,
    availableHeight: availableHeight,
    tileWidth: 0,
    tileHeight: 0,
    contentWidth: padding.sidePadding * 2,
    contentHeight: padding.verticalPadding * 2,
  );
}

VoiceGridLayoutMetrics _metricsForColumns({
  required int tileCount,
  required double containerWidth,
  required double containerHeight,
  required bool compact,
  required bool edgeToEdge,
  required int columns,
}) {
  final int count = _sanitizeCount(tileCount);
  if (count <= 0) {
    return _emptyMetrics(
      tileCount: count,
      containerWidth: containerWidth,
      containerHeight: containerHeight,
      compact: compact,
      edgeToEdge: edgeToEdge,
    );
  }
  final double width = _sanitizeDimension(containerWidth);
  final double height = _sanitizeDimension(containerHeight);
  final int resolvedColumns = math.max(
    1,
    math.min(math.max(1, count), columns),
  );
  final int rows = voiceGridRowCount(count, resolvedColumns);
  final double gap = voiceGridGap(
    tileCount: count,
    compact: compact,
    containerHeight: height,
  );
  final ({double sidePadding, double verticalPadding}) padding =
      voiceGridPadding(
        containerWidth: width,
        containerHeight: height,
        compact: compact,
        edgeToEdge: edgeToEdge,
      );
  final double availableWidth = math.max(0, width - padding.sidePadding * 2);
  final double availableHeight = math.max(
    0,
    height - padding.verticalPadding * 2,
  );
  final double columnWidth = math.max(
    0,
    (availableWidth - gap * math.max(0, resolvedColumns - 1)) / resolvedColumns,
  );
  final double rowHeight = math.max(
    0,
    (availableHeight - gap * math.max(0, rows - 1)) / rows,
  );
  final double tileWidth = math.min(
    columnWidth,
    rowHeight * voiceGridTileAspectRatio,
  );
  final double tileHeight = tileWidth / voiceGridTileAspectRatio;
  final int columnsInUse = math.min(count, resolvedColumns);
  final double contentWidth =
      padding.sidePadding * 2 +
      tileWidth * columnsInUse +
      gap * math.max(0, columnsInUse - 1);
  final double contentHeight =
      padding.verticalPadding * 2 +
      tileHeight * rows +
      gap * math.max(0, rows - 1);
  return VoiceGridLayoutMetrics(
    columns: resolvedColumns,
    rows: rows,
    gap: gap,
    sidePadding: padding.sidePadding,
    verticalPadding: padding.verticalPadding,
    availableWidth: availableWidth,
    availableHeight: availableHeight,
    tileWidth: tileWidth,
    tileHeight: tileHeight,
    contentWidth: contentWidth,
    contentHeight: contentHeight,
  );
}

VoiceGridLayoutMetrics resolveVoiceGridLayoutMetrics({
  required int tileCount,
  required double containerWidth,
  required double containerHeight,
  bool compact = false,
  bool edgeToEdge = false,
}) {
  final int count = _sanitizeCount(tileCount);
  final double width = _sanitizeDimension(containerWidth);
  final double height = _sanitizeDimension(containerHeight);
  final int columns = voiceGridColumnCount(
    tileCount: count,
    containerWidth: width,
    containerHeight: height,
  );
  return _metricsForColumns(
    tileCount: count,
    containerWidth: width,
    containerHeight: height,
    compact: compact,
    edgeToEdge: edgeToEdge,
    columns: columns,
  );
}

VoiceGridPackedLayoutMetrics resolveVoiceGridPackedLayoutMetrics({
  required int tileCount,
  required double containerWidth,
  required double containerHeight,
  bool compact = false,
  bool edgeToEdge = false,
  double? minTileWidth,
  double? minTileHeight,
}) {
  final int count = _sanitizeCount(tileCount);
  final double width = _sanitizeDimension(containerWidth);
  final double height = _sanitizeDimension(containerHeight);
  if (count <= 0) {
    return VoiceGridPackedLayoutMetrics(
      metrics: _emptyMetrics(
        tileCount: 0,
        containerWidth: width,
        containerHeight: height,
        compact: compact,
        edgeToEdge: edgeToEdge,
      ),
      visibleTileCount: 0,
    );
  }
  final VoiceGridMinTileSize minSize = voiceGridMinTileSize(compact: compact);
  final double effectiveMinWidth = _sanitizeDimension(
    minTileWidth ?? minSize.minTileWidth,
  );
  final double effectiveMinHeight = _sanitizeDimension(
    minTileHeight ?? minSize.minTileHeight,
  );
  for (int visibleCount = count; visibleCount >= 1; visibleCount--) {
    VoiceGridLayoutMetrics? best;
    for (int columns = 1; columns <= visibleCount; columns++) {
      final VoiceGridLayoutMetrics metrics = _metricsForColumns(
        tileCount: visibleCount,
        containerWidth: width,
        containerHeight: height,
        compact: compact,
        edgeToEdge: edgeToEdge,
        columns: columns,
      );
      if (metrics.tileWidth < effectiveMinWidth ||
          metrics.tileHeight < effectiveMinHeight) {
        continue;
      }
      if (best == null ||
          metrics.tileWidth * metrics.tileHeight >
              best.tileWidth * best.tileHeight) {
        best = metrics;
      }
    }
    if (best != null) {
      return VoiceGridPackedLayoutMetrics(
        metrics: best,
        visibleTileCount: visibleCount,
      );
    }
  }
  return VoiceGridPackedLayoutMetrics(
    metrics: _emptyMetrics(
      tileCount: count,
      containerWidth: width,
      containerHeight: height,
      compact: compact,
      edgeToEdge: edgeToEdge,
    ),
    visibleTileCount: 0,
  );
}

int voiceGridVisibleTileCapacity({
  required int tileCount,
  required double containerWidth,
  required double containerHeight,
  bool compact = false,
  bool edgeToEdge = false,
  double? minTileWidth,
  double? minTileHeight,
}) {
  return resolveVoiceGridPackedLayoutMetrics(
    tileCount: tileCount,
    containerWidth: containerWidth,
    containerHeight: containerHeight,
    compact: compact,
    edgeToEdge: edgeToEdge,
    minTileWidth: minTileWidth,
    minTileHeight: minTileHeight,
  ).visibleTileCount;
}
