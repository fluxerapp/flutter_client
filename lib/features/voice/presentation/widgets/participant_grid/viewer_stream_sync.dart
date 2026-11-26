import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/media/participant_track_resolver.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceViewerStreamSync {
  VoiceViewerStreamSync(this._ref);

  final WidgetRef _ref;
  List<String> _streamKeys = const <String>[];

  void sync({
    required List<VoiceGridTile> tiles,
    required Set<String> watchedTileIds,
  }) {
    _dropEndedStreams(tiles, watchedTileIds);
    final List<String> streamKeys = voiceViewerStreamKeysForWatchedTiles(
      watchedTileIds: watchedTileIds,
      streamKeyForTile: (String tileId) => _streamKey(tiles.byId(tileId)),
    );
    if (listEquals(_streamKeys, streamKeys)) {
      return;
    }
    _streamKeys = streamKeys;
    _afterFrame(
      () => _ref
          .read(voiceSessionProvider.notifier)
          .updateViewerStreamKeys(streamKeys),
    );
  }

  void _dropEndedStreams(
    List<VoiceGridTile> tiles,
    Set<String> watchedTileIds,
  ) {
    final Set<String> liveTileIds = <String>{
      for (final VoiceGridTile tile in tiles)
        if (tile.isScreenShare) tile.tileId,
    };
    if (liveTileIds.containsAll(watchedTileIds)) {
      return;
    }
    _afterFrame(
      () => _ref
          .read(voiceScreenShareWatchTileProvider.notifier)
          .retainTileIds(liveTileIds),
    );
  }

  String? _streamKey(VoiceGridTile? tile) {
    if (tile == null) {
      return null;
    }
    return buildViewerStreamKey(
      voice: tile.data.voice,
      isScreenShareTile: tile.isScreenShare,
    );
  }

  void _afterFrame(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_ref.context.mounted) {
        callback();
      }
    });
  }
}
