import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/media/watched_video_tile.dart';

VoiceGridTile autoMainVoiceGridTile(
  List<VoiceGridTile> tiles, {
  required Set<String> watchedTileIds,
  required String? currentUserId,
}) {
  final Iterable<VoiceGridTile> screenShares = tiles.where(
    (VoiceGridTile tile) => tile.isScreenShare,
  );
  final VoiceGridTile? screenShare =
      screenShares
          .where((VoiceGridTile tile) => watchedTileIds.contains(tile.tileId))
          .firstOrNull ??
      screenShares.firstOrNull;
  if (screenShare != null) {
    return screenShare;
  }
  return tiles
          .where(
            (VoiceGridTile tile) =>
                currentUserId == null || tile.data.userId != currentUserId,
          )
          .firstOrNull ??
      tiles.last;
}

VoiceGridTile? fullscreenVoiceGridTile(
  List<VoiceGridTile> tiles, {
  required Set<String> watchedTileIds,
  required String? currentUserId,
  required String? expandedTileId,
  required String? pinnedTileId,
  required bool focusMode,
}) {
  if (tiles.isEmpty) {
    return null;
  }
  bool supportsFullscreen(VoiceGridTile tile) =>
      voiceFocusMainSupportsVideoFullscreen(
        source: tile.source,
        voice: tile.data.voice,
        isWatching: watchedTileIds.contains(tile.tileId),
      );

  final VoiceGridTile? expanded = tiles.byId(expandedTileId);
  if (expanded != null) {
    return expanded;
  }
  final VoiceGridTile? pinned = tiles.byId(pinnedTileId);
  if (pinned != null && supportsFullscreen(pinned)) {
    return pinned;
  }
  if (focusMode) {
    final VoiceGridTile main = autoMainVoiceGridTile(
      tiles,
      watchedTileIds: watchedTileIds,
      currentUserId: currentUserId,
    );
    if (supportsFullscreen(main)) {
      return main;
    }
  }
  return tiles
      .where(
        (VoiceGridTile tile) =>
            tile.isScreenShare && watchedTileIds.contains(tile.tileId),
      )
      .firstOrNull;
}
