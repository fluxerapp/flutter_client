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
    this.isFocusMiniGridExpanded = false,
    this.expandedUserIds = const <String>{},
  });

  final VoiceCallLayoutMode mode;
  final String? pinnedTileId;
  final bool isFilmstripCollapsed;
  final bool isFocusMiniGridExpanded;
  final Set<String> expandedUserIds;

  bool isPinned(String tileId) => pinnedTileId == tileId;

  VoiceCallLayoutState copyWith({
    VoiceCallLayoutMode? mode,
    String? pinnedTileId,
    bool? isFilmstripCollapsed,
    bool? isFocusMiniGridExpanded,
    Set<String>? expandedUserIds,
    bool clearPinnedTileId = false,
  }) {
    return VoiceCallLayoutState(
      mode: mode ?? this.mode,
      pinnedTileId: clearPinnedTileId
          ? null
          : (pinnedTileId ?? this.pinnedTileId),
      isFilmstripCollapsed: isFilmstripCollapsed ?? this.isFilmstripCollapsed,
      isFocusMiniGridExpanded:
          isFocusMiniGridExpanded ?? this.isFocusMiniGridExpanded,
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
    state = state.copyWith(
      mode: VoiceCallLayoutMode.focus,
      pinnedTileId: tileId,
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

  void setFocusMiniGridExpanded({required bool value}) {
    if (state.isFocusMiniGridExpanded == value) {
      return;
    }
    state = state.copyWith(isFocusMiniGridExpanded: value);
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
