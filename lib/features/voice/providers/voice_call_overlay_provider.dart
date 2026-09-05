import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:fluxer_app/features/input/providers/keyboard_mode_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_call_overlay_provider.g.dart';

const Duration kVoiceCallOverlayAutoHideDelay = Duration(seconds: 3);
const Duration kVoiceCallOverlayPinReleaseDelay = Duration(milliseconds: 320);

class VoiceCallOverlayState {
  const VoiceCallOverlayState({
    this.isVisible = true,
    this.isSheetExpanded = false,
    this.isExiting = false,
    this.isMenuPinned = false,
    this.isKeyboardPinned = false,
  });

  final bool isVisible;
  final bool isSheetExpanded;
  final bool isExiting;
  final bool isMenuPinned;
  final bool isKeyboardPinned;

  bool get isPinned => isSheetExpanded || isMenuPinned || isKeyboardPinned;

  bool get showsOverlay => isVisible || isPinned;

  VoiceCallOverlayState copyWith({
    bool? isVisible,
    bool? isSheetExpanded,
    bool? isExiting,
    bool? isMenuPinned,
    bool? isKeyboardPinned,
  }) {
    return VoiceCallOverlayState(
      isVisible: isVisible ?? this.isVisible,
      isSheetExpanded: isSheetExpanded ?? this.isSheetExpanded,
      isExiting: isExiting ?? this.isExiting,
      isMenuPinned: isMenuPinned ?? this.isMenuPinned,
      isKeyboardPinned: isKeyboardPinned ?? this.isKeyboardPinned,
    );
  }
}

@Riverpod(keepAlive: true)
class VoiceCallOverlay extends _$VoiceCallOverlay {
  Timer? _autoHideTimer;
  Timer? _pinReleaseTimer;
  Completer<void>? _phoneExit;
  int _phoneExitHosts = 0;

  @override
  VoiceCallOverlayState build() {
    ref
      ..onDispose(() {
        _cancelAutoHide();
        _pinReleaseTimer?.cancel();
        _completePhoneExit(updateState: false);
      })
      ..listen<VoiceSessionState>(voiceSessionProvider, (
        VoiceSessionState? previous,
        VoiceSessionState next,
      ) {
        if ((previous?.isInVoice ?? false) && !next.isInVoice) {
          reset();
        }
      })
      ..listen<bool>(keyboardModeProvider, (bool? previous, bool next) {
        setKeyboardPinned(value: next);
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
    _pinReleaseTimer?.cancel();
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

  void armJoinOverlay() {
    if (state.isExiting) {
      return;
    }
    _cancelAutoHide();
    _pinReleaseTimer?.cancel();
    state = const VoiceCallOverlayState(isVisible: false);
  }

  void reveal() {
    if (state.isExiting) {
      return;
    }
    _cancelAutoHide();
    if (!state.isVisible) {
      state = state.copyWith(isVisible: true);
    }
    if (!state.isPinned) {
      scheduleAutoHide();
    }
  }

  void hide() {
    if (state.isExiting || state.isPinned) {
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

  void notePointerActivity({required PointerDeviceKind kind}) {
    if (kind == PointerDeviceKind.touch) {
      return;
    }
    reveal();
  }

  void setMenuPinned({required bool value}) {
    _setPinned(isMenuPinned: value);
  }

  void setKeyboardPinned({required bool value}) {
    _setPinned(isKeyboardPinned: value);
  }

  void _setPinned({bool? isMenuPinned, bool? isKeyboardPinned}) {
    if (state.isExiting) {
      return;
    }
    final bool nextMenu = isMenuPinned ?? state.isMenuPinned;
    final bool nextKeyboard = isKeyboardPinned ?? state.isKeyboardPinned;
    if (nextMenu == state.isMenuPinned &&
        nextKeyboard == state.isKeyboardPinned) {
      return;
    }
    final bool pinning = nextMenu || nextKeyboard;
    _pinReleaseTimer?.cancel();
    if (pinning) {
      _cancelAutoHide();
      state = state.copyWith(
        isMenuPinned: nextMenu,
        isKeyboardPinned: nextKeyboard,
        isVisible: true,
      );
      return;
    }
    state = state.copyWith(isMenuPinned: false, isKeyboardPinned: false);
    _pinReleaseTimer = Timer(kVoiceCallOverlayPinReleaseDelay, () {
      if (!ref.mounted || state.isExiting) {
        return;
      }
      if (state.isVisible && !state.isPinned) {
        scheduleAutoHide();
      }
    });
  }

  void scheduleAutoHide() {
    _cancelAutoHide();
    if (!state.isVisible || state.isPinned) {
      return;
    }
    _autoHideTimer = Timer(kVoiceCallOverlayAutoHideDelay, () {
      if (!ref.mounted || state.isPinned || !state.isVisible) {
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
    if (!value && state.isVisible && !state.isPinned) {
      scheduleAutoHide();
    }
  }

  void reset() {
    _cancelAutoHide();
    _pinReleaseTimer?.cancel();
    _completePhoneExit();
    state = const VoiceCallOverlayState();
  }

  void _cancelAutoHide() {
    _autoHideTimer?.cancel();
    _autoHideTimer = null;
  }
}
