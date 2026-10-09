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
    this.expandedUserIds = const <String>{},
  });

  final VoiceCallLayoutMode mode;
  final String? pinnedTileId;
  final Set<String> expandedUserIds;

  VoiceCallLayoutState copyWith({
    VoiceCallLayoutMode? mode,
    String? pinnedTileId,
    Set<String>? expandedUserIds,
    bool clearPinnedTileId = false,
  }) {
    return VoiceCallLayoutState(
      mode: mode ?? this.mode,
      pinnedTileId: clearPinnedTileId
          ? null
          : (pinnedTileId ?? this.pinnedTileId),
      expandedUserIds: expandedUserIds ?? this.expandedUserIds,
    );
  }
}

/// Grid vs focus layout for the active voice call
@Riverpod(keepAlive: true)
class VoiceCallLayout extends _$VoiceCallLayout {
  @override
  VoiceCallLayoutState build() => const VoiceCallLayoutState();

  void pin(String tileId) {
    if (state.mode == VoiceCallLayoutMode.focus &&
        state.pinnedTileId == tileId) {
      return;
    }
    state = state.copyWith(
      mode: VoiceCallLayoutMode.focus,
      pinnedTileId: tileId,
    );
  }

  void setMode(VoiceCallLayoutMode mode) {
    if (mode == VoiceCallLayoutMode.grid) {
      if (state.mode == VoiceCallLayoutMode.grid &&
          state.pinnedTileId == null) {
        return;
      }
      state = state.copyWith(
        mode: VoiceCallLayoutMode.grid,
        clearPinnedTileId: true,
      );
      return;
    }
    if (state.mode == VoiceCallLayoutMode.focus) {
      return;
    }
    state = state.copyWith(mode: VoiceCallLayoutMode.focus);
  }

  void unpin() {
    if (state.mode == VoiceCallLayoutMode.grid && state.pinnedTileId == null) {
      return;
    }
    if (state.mode == VoiceCallLayoutMode.focus) {
      setMode(VoiceCallLayoutMode.grid);
      return;
    }
    state = state.copyWith(clearPinnedTileId: true);
  }

  void clearStalePin() {
    if (state.pinnedTileId == null) {
      return;
    }
    state = state.copyWith(clearPinnedTileId: true);
  }

  void toggleExpandedUser(String userId) {
    final Set<String> next = Set<String>.from(state.expandedUserIds);
    if (!next.add(userId)) {
      next.remove(userId);
    }
    state = state.copyWith(expandedUserIds: next);
  }

  void reset() {
    if (state.pinnedTileId == null && state.mode == VoiceCallLayoutMode.grid) {
      return;
    }
    state = const VoiceCallLayoutState();
  }
}
