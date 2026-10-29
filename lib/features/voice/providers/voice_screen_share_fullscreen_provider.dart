import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_fullscreen.dart';

class VoiceScreenShareFullscreen
    extends Notifier<VoiceScreenShareFullscreenPrefs> {
  @override
  VoiceScreenShareFullscreenPrefs build() {
    ref.listen<Set<String>>(voiceScreenShareWatchTileProvider, (
      Set<String>? previous,
      Set<String> next,
    ) {
      if (next.isNotEmpty || previous == null || previous.isEmpty) {
        return;
      }
      final String? tileId = state.expandedTileId;
      if (tileId == null || previous.contains(tileId)) {
        state = const VoiceScreenShareFullscreenPrefs();
      }
    });
    return const VoiceScreenShareFullscreenPrefs();
  }

  void toggle({required bool currentlyExpanded}) {
    if (currentlyExpanded) {
      state = state.copyWith(
        userExpanded: false,
        blockLandscapeAutoExpand: true,
        clearExpandedTileId: true,
      );
      return;
    }
    state = state.copyWith(userExpanded: true, blockLandscapeAutoExpand: false);
  }

  void expandTile(String tileId) {
    state = state.copyWith(
      userExpanded: true,
      blockLandscapeAutoExpand: false,
      expandedTileId: tileId,
    );
  }

  void reset() {
    state = const VoiceScreenShareFullscreenPrefs();
  }
}

final voiceScreenShareFullscreenProvider =
    NotifierProvider<
      VoiceScreenShareFullscreen,
      VoiceScreenShareFullscreenPrefs
    >(VoiceScreenShareFullscreen.new);

bool resolveVoiceScreenShareExpanded({
  required Set<String> watchedTileIds,
  required bool landscape,
  required VoiceScreenShareFullscreenPrefs prefs,
}) {
  return voiceScreenShareShouldExpand(
    isWatchingScreenShare: watchedTileIds.isNotEmpty,
    landscape: landscape,
    prefs: prefs,
  );
}
