import 'package:flutter_riverpod/flutter_riverpod.dart';

const int kVoiceMaxWatchedStreams = 256;

/// Watched screen-share tile ids (`identity|screen`).
class VoiceScreenShareWatchTile extends Notifier<Set<String>> {
  @override
  Set<String> build() => const <String>{};

  String? get primaryTileId {
    if (state.isEmpty) {
      return null;
    }
    return state.first;
  }

  void watch(String tileId) {
    if (state.contains(tileId) || state.length >= kVoiceMaxWatchedStreams) {
      return;
    }
    state = <String>{...state, tileId};
  }

  void unwatch(String tileId) {
    if (!state.contains(tileId)) {
      return;
    }
    final Set<String> next = Set<String>.from(state)..remove(tileId);
    state = next;
  }

  void retainTileIds(Set<String> aliveTileIds) {
    final Set<String> next = state.intersection(aliveTileIds);
    if (next.length == state.length) {
      return;
    }
    state = next;
  }

  void setActiveTileId(String? tileId) {
    if (tileId == null) {
      if (state.isEmpty) {
        return;
      }
      state = const <String>{};
      return;
    }
    if (state.length == 1 && state.contains(tileId)) {
      return;
    }
    state = <String>{tileId};
  }
}

final voiceScreenShareWatchTileProvider =
    NotifierProvider<VoiceScreenShareWatchTile, Set<String>>(
      VoiceScreenShareWatchTile.new,
    );

List<String> voiceViewerStreamKeysForWatchedTiles({
  required Set<String> watchedTileIds,
  required String? Function(String tileId) streamKeyForTile,
  int maxKeys = kVoiceMaxWatchedStreams,
}) {
  if (watchedTileIds.isEmpty || maxKeys <= 0) {
    return const <String>[];
  }
  final List<String> keys = <String>[];
  final Set<String> seen = <String>{};
  for (final String tileId in watchedTileIds) {
    final String? key = streamKeyForTile(tileId);
    if (key == null || key.isEmpty || !seen.add(key)) {
      continue;
    }
    keys.add(key);
    if (keys.length >= maxKeys) {
      break;
    }
  }
  return keys;
}
