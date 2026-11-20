import 'package:fluxer_app/features/voice/utils/pip/pip_featured_selector.dart';

String? resolveVoiceSystemPipTileId({
  required String? expandedTileId,
  required String? pinnedTileId,
  required Set<String> watchedTileIds,
  required List<VoicePipCandidate> candidates,
  String? preferredTileId,
  String? lockedTileId,
  String? featuredTileId,
  Set<String> blockedTileIds = const <String>{},
}) {
  if (candidates.isEmpty) {
    return null;
  }
  final Map<String, VoicePipCandidate> byId = <String, VoicePipCandidate>{
    for (final VoicePipCandidate candidate in candidates)
      candidate.tileId: candidate,
  };
  bool eligible(
    String? tileId, {
    bool screenShareOnly = false,
    bool cameraOnly = false,
  }) {
    if (tileId == null || blockedTileIds.contains(tileId)) {
      return false;
    }
    final VoicePipCandidate? candidate = byId[tileId];
    return candidate != null &&
        candidate.hasVideo &&
        !candidate.isLocal &&
        (!screenShareOnly || candidate.isScreenShare) &&
        (!cameraOnly || !candidate.isScreenShare);
  }

  final List<String> focused = <String>[
    if (eligible(expandedTileId)) expandedTileId!,
    if (eligible(pinnedTileId)) pinnedTileId!,
    for (final String tileId in watchedTileIds)
      if (eligible(tileId, screenShareOnly: true)) tileId,
  ];
  if (focused.isNotEmpty) {
    return focused.contains(preferredTileId) ? preferredTileId : focused.first;
  }
  if (eligible(lockedTileId)) {
    return lockedTileId;
  }
  if (eligible(featuredTileId, cameraOnly: true)) {
    return featuredTileId;
  }
  for (final VoicePipCandidate candidate in candidates) {
    if (eligible(candidate.tileId, cameraOnly: true)) {
      return candidate.tileId;
    }
  }
  return null;
}
