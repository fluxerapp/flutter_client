List<T> voiceGridTilesForDisplay<T>({
  required bool prioritizeSpeakingParticipants,
  required List<T> tiles,
  required List<T> Function(List<T> tiles) orderBySpeaking,
}) {
  if (!prioritizeSpeakingParticipants) {
    return tiles;
  }
  return orderBySpeaking(tiles);
}
