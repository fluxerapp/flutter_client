class VoiceGridLayoutMetrics {
  const VoiceGridLayoutMetrics({
    required this.columns,
    required this.gap,
    required this.sidePadding,
    required this.verticalPadding,
    required this.availableWidth,
    required this.availableHeight,
    required this.tileWidth,
    required this.tileHeight,
  });

  final int columns;
  final double gap;
  final double sidePadding;
  final double verticalPadding;
  final double availableWidth;
  final double availableHeight;
  final double tileWidth;
  final double tileHeight;
}

class VoiceGridPackedLayoutMetrics {
  const VoiceGridPackedLayoutMetrics({
    required this.metrics,
    required this.visibleTileCount,
  });

  final VoiceGridLayoutMetrics metrics;
  final int visibleTileCount;
}

class VoiceGridMinTileSize {
  const VoiceGridMinTileSize({
    required this.minTileWidth,
    required this.minTileHeight,
  });

  final double minTileWidth;
  final double minTileHeight;
}
