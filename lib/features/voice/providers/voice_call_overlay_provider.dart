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
    this.isExiting = false,
  });

  final bool isVisible;
  final bool isSheetExpanded;
  final bool isExiting;

  bool get showsOverlay => isVisible || isSheetExpanded;

  VoiceCallOverlayState copyWith({
    bool? isVisible,
    bool? isSheetExpanded,
    bool? isExiting,
  }) {
    return VoiceCallOverlayState(
      isVisible: isVisible ?? this.isVisible,
      isSheetExpanded: isSheetExpanded ?? this.isSheetExpanded,
      isExiting: isExiting ?? this.isExiting,
    );
  }
}

@Riverpod(keepAlive: true)
class VoiceCallOverlay extends _$VoiceCallOverlay {
  Timer? _autoHideTimer;
  Completer<void>? _phoneExit;
  int _phoneExitHosts = 0;

  @override
  VoiceCallOverlayState build() {
    ref
      ..onDispose(() {
        _cancelAutoHide();
        _completePhoneExit(updateState: false);
      })
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

  void registerPhoneExitHost() {
    _phoneExitHosts++;
  }

  void unregisterPhoneExitHost() {
    if (_phoneExitHosts > 0) {
      _phoneExitHosts--;
    }
    if (_phoneExitHosts == 0) {
      _completePhoneExit();
    }
  }

  Future<void> playPhoneExit() {
    if (_phoneExit != null) {
      return _phoneExit!.future;
    }
    _cancelAutoHide();
    if (_phoneExitHosts == 0) {
      state = const VoiceCallOverlayState(isVisible: false);
      return Future<void>.value();
    }
    _phoneExit = Completer<void>();
    state = const VoiceCallOverlayState(isVisible: false, isExiting: true);
    return _phoneExit!.future;
  }

  void completePhoneExit() {
    _completePhoneExit();
  }

  void _completePhoneExit({bool updateState = true}) {
    final Completer<void>? pending = _phoneExit;
    _phoneExit = null;
    if (pending != null && !pending.isCompleted) {
      pending.complete();
    }
    if (updateState && state.isExiting) {
      state = state.copyWith(isExiting: false);
    }
  }

  void armJoinChrome() {
    if (state.isExiting) {
      return;
    }
    _cancelAutoHide();
    state = const VoiceCallOverlayState(isVisible: false);
  }

  void reveal() {
    if (state.isExiting) {
      return;
    }
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
    if (state.isExiting || state.isSheetExpanded) {
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
    if (state.isExiting) {
      return;
    }
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
    _completePhoneExit();
    state = const VoiceCallOverlayState();
  }

  void _cancelAutoHide() {
    _autoHideTimer?.cancel();
    _autoHideTimer = null;
  }
}
