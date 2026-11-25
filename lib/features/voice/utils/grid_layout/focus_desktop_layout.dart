import 'dart:math' as math;
import 'dart:ui' show Offset, Rect, Size;

import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_config.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_resolver.dart';

const double voiceFocusControlClearancePx = 72;
const double voiceFocusMembersRowMinHeightPx = 64;
const double voiceFocusMembersRowMaxFraction = 0.4;
const double voiceFocusMembersRowGapPx = 8;
const double voiceFocusMembersRowVerticalPaddingPx = 6;
const double voiceFocusMembersToggleHeightPx = 32;
const double voiceFocusMembersDividerHeightPx = 16;
const double voiceFocusMembersDividerOverlapPx = 4;

class VoiceFocusDesktopLayout {
  const VoiceFocusDesktopLayout({
    required this.mainRect,
    required this.membersRowRect,
    required this.membersRowPadding,
    required this.membersToggleBottom,
    required this.maxMembersRowHeight,
  });

  final Rect mainRect;
  final Rect? membersRowRect;
  final double membersRowPadding;
  final double membersToggleBottom;
  final double maxMembersRowHeight;
}

double voiceFocusMembersRowMaxHeight(double stageHeight) {
  return math.max(
    voiceFocusMembersRowMinHeightPx,
    (stageHeight * voiceFocusMembersRowMaxFraction).floorToDouble(),
  );
}

double voiceFocusMembersRowHeight({
  required double stageHeight,
  required double? preferredHeight,
}) {
  final double preferred =
      preferredHeight ?? (stageHeight * 0.13).clamp(86, 112);
  return preferred.clamp(
    voiceFocusMembersRowMinHeightPx,
    voiceFocusMembersRowMaxHeight(stageHeight),
  );
}

VoiceFocusDesktopLayout resolveVoiceFocusDesktopLayout({
  required Size container,
  required double headerHeight,
  required double controlClearance,
  required bool showMembersRow,
  required double? preferredMembersRowHeight,
}) {
  final double top = showMembersRow ? headerHeight : 0;
  final double stageHeight = math.max(0, container.height - top);
  final double rowHeight = voiceFocusMembersRowHeight(
    stageHeight: stageHeight,
    preferredHeight: preferredMembersRowHeight,
  );
  final double reserved = showMembersRow
      ? controlClearance + rowHeight + voiceFocusMembersRowGapPx
      : 0;
  return VoiceFocusDesktopLayout(
    mainRect: voiceGridFitAspect(
      Offset(0, top) &
          Size(container.width, math.max(0, stageHeight - reserved)),
      voiceGridTileAspectRatio,
    ),
    membersRowRect: showMembersRow
        ? Rect.fromLTWH(
            0,
            container.height - controlClearance - rowHeight,
            container.width,
            rowHeight,
          )
        : null,
    membersRowPadding: (container.width * 0.02).clamp(12, 24),
    membersToggleBottom:
        controlClearance +
        voiceFocusMembersRowGapPx +
        (showMembersRow ? rowHeight : 0),
    maxMembersRowHeight: voiceFocusMembersRowMaxHeight(stageHeight),
  );
}
