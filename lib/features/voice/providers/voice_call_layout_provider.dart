import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_call_layout_provider.g.dart';

enum VoiceCallLayoutMode {
  /// All tiles share a responsive grid
  grid,

  /// One large tile with the rest in a film mode
  focus,
}

class VoiceCallLayoutState {
  const VoiceCallLayoutState({
    this.mode = VoiceCallLayoutMode.grid,
    this.pinnedTileId,
    this.isFilmstripCollapsed = false,
  });

  final VoiceCallLayoutMode mode;
  final String? pinnedTileId;
  final bool isFilmstripCollapsed;

  bool isPinned(String tileId) => pinnedTileId == tileId;

  VoiceCallLayoutState copyWith({
    VoiceCallLayoutMode? mode,
    String? pinnedTileId,
    bool? isFilmstripCollapsed,
    bool clearPinnedTileId = false,
  }) {
    return VoiceCallLayoutState(
      mode: mode ?? this.mode,
      pinnedTileId: clearPinnedTileId
          ? null
          : (pinnedTileId ?? this.pinnedTileId),
      isFilmstripCollapsed: isFilmstripCollapsed ?? this.isFilmstripCollapsed,
    );
  }
}

/// Grid vs focus layout for the active voice call
@Riverpod(keepAlive: true)
class VoiceCallLayout extends _$VoiceCallLayout {
  @override
  VoiceCallLayoutState build() => const VoiceCallLayoutState();

  void pin(String tileId) {
    state = VoiceCallLayoutState(
      mode: VoiceCallLayoutMode.focus,
      pinnedTileId: tileId,
      isFilmstripCollapsed: state.isFilmstripCollapsed,
    );
  }

  void unpin() {
    if (state.pinnedTileId == null && state.mode == VoiceCallLayoutMode.grid) {
      return;
    }
    state = const VoiceCallLayoutState();
  }

  void togglePin(String tileId) {
    if (state.pinnedTileId == tileId) {
      unpin();
    } else {
      pin(tileId);
    }
  }

  void setFilmstripCollapsed({required bool value}) {
    if (state.isFilmstripCollapsed == value) {
      return;
    }
    state = state.copyWith(isFilmstripCollapsed: value);
  }

  void toggleFilmstripCollapsed() {
    setFilmstripCollapsed(value: !state.isFilmstripCollapsed);
  }

  void reset() {
    if (state.pinnedTileId == null && state.mode == VoiceCallLayoutMode.grid) {
      return;
    }
    state = const VoiceCallLayoutState();
  }
}
