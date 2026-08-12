const double voiceGridTileAspectRatio = 16 / 9;

const double voiceGridDefaultGapPx = 12;
const double voiceGridEdgePaddingPx = 20;
const double voiceGridDefaultSidePaddingPx = voiceGridEdgePaddingPx;
const double voiceGridDefaultVerticalPaddingPx = voiceGridEdgePaddingPx;
const double voiceGridMinTileWidthPx = 220;
const double voiceGridMinTileHeightPx =
    voiceGridMinTileWidthPx / voiceGridTileAspectRatio;
const double voiceGridCompactMinTileWidthPx = 148;
const double voiceGridCompactMinTileHeightPx =
    voiceGridCompactMinTileWidthPx / voiceGridTileAspectRatio;

/// A breakpoint mapping a tile count + container size to a column count.
/// Rules are evaluated in order; the first satisfied rule wins.
class VoiceGridColumnRule {
  const VoiceGridColumnRule({
    required this.columns,
    required this.minTileCount,
    required this.minWidth,
    required this.minHeight,
  });

  final int columns;
  final int minTileCount;
  final double minWidth;
  final double minHeight;
}

const List<VoiceGridColumnRule> voiceGridColumnRules = <VoiceGridColumnRule>[
  VoiceGridColumnRule(
    columns: 4,
    minTileCount: 10,
    minWidth: 1180,
    minHeight: 460,
  ),
  VoiceGridColumnRule(
    columns: 3,
    minTileCount: 5,
    minWidth: 860,
    minHeight: 360,
  ),
  VoiceGridColumnRule(
    columns: 2,
    minTileCount: 2,
    minWidth: 520,
    minHeight: 260,
  ),
];
