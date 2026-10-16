import 'dart:ui' show Offset, Rect;

class VoiceScreenShareFullscreenPrefs {
  const VoiceScreenShareFullscreenPrefs({
    this.userExpanded = false,
    this.blockLandscapeAutoExpand = false,
  });

  final bool userExpanded;
  final bool blockLandscapeAutoExpand;

  VoiceScreenShareFullscreenPrefs copyWith({
    bool? userExpanded,
    bool? blockLandscapeAutoExpand,
  }) {
    return VoiceScreenShareFullscreenPrefs(
      userExpanded: userExpanded ?? this.userExpanded,
      blockLandscapeAutoExpand:
          blockLandscapeAutoExpand ?? this.blockLandscapeAutoExpand,
    );
  }
}

bool voiceScreenShareShouldExpand({
  required bool isWatchingScreenShare,
  required bool landscape,
  required VoiceScreenShareFullscreenPrefs prefs,
}) {
  if (!isWatchingScreenShare) {
    return false;
  }
  if (prefs.userExpanded) {
    return true;
  }
  if (landscape && !prefs.blockLandscapeAutoExpand) {
    return true;
  }
  return false;
}

List<Rect> voiceScreenShareFullscreenRects({
  required List<Rect> baseRects,
  required int expandedTileIndex,
  required double width,
  required double height,
  required bool expanded,
}) {
  if (!expanded ||
      expandedTileIndex < 0 ||
      expandedTileIndex >= baseRects.length) {
    return baseRects;
  }
  final List<Rect> rects = List<Rect>.from(baseRects);
  rects[expandedTileIndex] = Rect.fromLTWH(0, 0, width, height);
  for (int i = 0; i < rects.length; i++) {
    if (i == expandedTileIndex) {
      continue;
    }
    final Offset center = baseRects[i].center;
    rects[i] = Rect.fromCenter(center: center, width: 0, height: 0);
  }
  return rects;
}
