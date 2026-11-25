class VoiceScreenShareFullscreenPrefs {
  const VoiceScreenShareFullscreenPrefs({
    this.userExpanded = false,
    this.blockLandscapeAutoExpand = false,
    this.expandedTileId,
  });

  final bool userExpanded;
  final bool blockLandscapeAutoExpand;
  final String? expandedTileId;

  VoiceScreenShareFullscreenPrefs copyWith({
    bool? userExpanded,
    bool? blockLandscapeAutoExpand,
    String? expandedTileId,
    bool clearExpandedTileId = false,
  }) {
    return VoiceScreenShareFullscreenPrefs(
      userExpanded: userExpanded ?? this.userExpanded,
      blockLandscapeAutoExpand:
          blockLandscapeAutoExpand ?? this.blockLandscapeAutoExpand,
      expandedTileId: clearExpandedTileId
          ? null
          : (expandedTileId ?? this.expandedTileId),
    );
  }
}

bool voiceScreenShareShouldExpand({
  required bool isWatchingScreenShare,
  required bool landscape,
  required VoiceScreenShareFullscreenPrefs prefs,
}) {
  if (prefs.userExpanded) {
    return true;
  }
  if (!isWatchingScreenShare) {
    return false;
  }
  if (landscape && !prefs.blockLandscapeAutoExpand) {
    return true;
  }
  return false;
}
