enum VoiceCallVisualLayout { packedGrid, paginatedGrid, focus }

VoiceCallVisualLayout resolveVoiceCallVisualLayout({
  required bool isFocusMode,
  required String? pinnedTileId,
  required int tileCount,
  required int visibleTileCount,
}) {
  if (isFocusMode || pinnedTileId != null) {
    return VoiceCallVisualLayout.focus;
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
