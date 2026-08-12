import 'dart:async';

import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_call_overlay_provider.g.dart';

const Duration kVoiceCallOverlayAutoHideDelay = Duration(seconds: 3);

class VoiceCallOverlayState {
  const VoiceCallOverlayState({
    this.isVisible = true,
    this.isSheetExpanded = false,
  });

  final bool isVisible;
  final bool isSheetExpanded;

  bool get showsOverlay => isVisible || isSheetExpanded;

  VoiceCallOverlayState copyWith({bool? isVisible, bool? isSheetExpanded}) {
    return VoiceCallOverlayState(
      isVisible: isVisible ?? this.isVisible,
      isSheetExpanded: isSheetExpanded ?? this.isSheetExpanded,
    );
  }
}

@Riverpod(keepAlive: true)
class VoiceCallOverlay extends _$VoiceCallOverlay {
  Timer? _autoHideTimer;

  @override
  VoiceCallOverlayState build() {
    ref
      ..onDispose(_cancelAutoHide)
      ..listen<VoiceSessionState>(voiceSessionProvider, (
        VoiceSessionState? previous,
        VoiceSessionState next,
      ) {
        if ((previous?.isInVoice ?? false) && !next.isInVoice) {
          reset();
        }
      });
    return const VoiceCallOverlayState();
  }

  void reveal() {
    _cancelAutoHide();
    final bool wasVisible = state.isVisible;
    if (!wasVisible) {
      state = state.copyWith(isVisible: true);
    }
    if (!state.isSheetExpanded) {
      scheduleAutoHide();
    }
  }

  void hide() {
    if (state.isSheetExpanded) {
      return;
    }
    _cancelAutoHide();
    if (state.isVisible) {
      state = state.copyWith(isVisible: false);
    }
  }

  void toggle() {
    if (state.showsOverlay) {
      hide();
    } else {
      reveal();
    }
  }

  void scheduleAutoHide() {
    _cancelAutoHide();
    if (!state.isVisible || state.isSheetExpanded) {
      return;
    }
    _autoHideTimer = Timer(kVoiceCallOverlayAutoHideDelay, () {
      if (!ref.mounted || state.isSheetExpanded || !state.isVisible) {
        return;
      }
      state = state.copyWith(isVisible: false);
    });
  }

  void setSheetExpanded({required bool value}) {
    _cancelAutoHide();
    if (state.isSheetExpanded == value) {
      return;
    }
    state = state.copyWith(
      isSheetExpanded: value,
      isVisible: value || state.isVisible,
    );
    if (!value && state.isVisible) {
      scheduleAutoHide();
    }
  }

  void reset() {
    _cancelAutoHide();
    state = const VoiceCallOverlayState();
  }

  void _cancelAutoHide() {
    _autoHideTimer?.cancel();
    _autoHideTimer = null;
  }
}
