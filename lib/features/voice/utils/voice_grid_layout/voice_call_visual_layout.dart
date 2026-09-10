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

String? resolveVoiceCallMainTileId<T>({
  required String? pinnedTileId,
  required List<T> tiles,
  required String Function(T tile) tileId,
  required bool Function(T tile) isScreenShare,
}) {
  if (tiles.isEmpty) {
    return null;
  }
  if (pinnedTileId != null) {
    for (final T tile in tiles) {
      if (tileId(tile) == pinnedTileId) {
        return pinnedTileId;
      }
    }
  }
  for (final T tile in tiles) {
    if (!isScreenShare(tile)) {
      return tileId(tile);
    }
  }
  return tileId(tiles.first);
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
