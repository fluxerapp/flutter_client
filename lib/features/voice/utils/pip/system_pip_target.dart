import 'package:fluxer_app/features/voice/utils/pip/pip_featured_selector.dart';

String? resolveVoiceSystemPipTileId({
  required String? expandedTileId,
  required String? pinnedTileId,
  required Set<String> watchedTileIds,
  required List<VoicePipCandidate> candidates,
  String? preferredTileId,
  Set<String> blockedTileIds = const <String>{},
}) {
  if (expandedTileId == null &&
      pinnedTileId == null &&
      watchedTileIds.isEmpty) {
    return null;
  }
  final Map<String, VoicePipCandidate> byId = <String, VoicePipCandidate>{
    for (final VoicePipCandidate candidate in candidates)
      candidate.tileId: candidate,
  };
  bool eligible(String? tileId, {bool screenShareOnly = false}) {
    if (tileId == null || blockedTileIds.contains(tileId)) {
      return false;
    }
    final VoicePipCandidate? candidate = byId[tileId];
    return candidate != null &&
        candidate.hasVideo &&
        !candidate.isLocal &&
        (!screenShareOnly || candidate.isScreenShare);
  }

  final List<String> focused = <String>[
    if (eligible(expandedTileId)) expandedTileId!,
    if (eligible(pinnedTileId)) pinnedTileId!,
    for (final String tileId in watchedTileIds)
      if (eligible(tileId, screenShareOnly: true)) tileId,
  ];
  if (focused.isEmpty) {
    return null;
  }
  return focused.contains(preferredTileId) ? preferredTileId : focused.first;
}
