enum VoiceCallVisualLayout { packedGrid, paginatedGrid, pinnedGrid, focus }

VoiceCallVisualLayout resolveVoiceCallVisualLayout({
  required bool isFocusMode,
  required String? pinnedTileId,
  required int tileCount,
  required int visibleTileCount,
}) {
  if (isFocusMode) {
    return VoiceCallVisualLayout.focus;
  }
  if (pinnedTileId != null) {
    return VoiceCallVisualLayout.pinnedGrid;
  }
  if (tileCount > 0 && visibleTileCount < tileCount) {
    return VoiceCallVisualLayout.paginatedGrid;
  }
  return VoiceCallVisualLayout.packedGrid;
}

bool voiceCallTileIsFocused({
  required bool isFocusMode,
  required String? pinnedTileId,
  required String tileId,
  String? effectiveMainTileId,
}) {
  if (pinnedTileId != null) {
    return pinnedTileId == tileId;
  }
  return isFocusMode && effectiveMainTileId == tileId;
}
