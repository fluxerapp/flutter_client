import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/providers/keybind_preferences_provider.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_transmit_provider.g.dart';

@immutable
class VoiceTransmitHoldState {
  const VoiceTransmitHoldState({
    this.pushToTalkHeld = false,
    this.pushToMuteHeld = false,
    this.voiceActivityOpen = true,
  });

  final bool pushToTalkHeld;
  final bool pushToMuteHeld;
  final bool voiceActivityOpen;

  VoiceTransmitHoldState copyWith({
    bool? pushToTalkHeld,
    bool? pushToMuteHeld,
    bool? voiceActivityOpen,
  }) {
    return VoiceTransmitHoldState(
      pushToTalkHeld: pushToTalkHeld ?? this.pushToTalkHeld,
      pushToMuteHeld: pushToMuteHeld ?? this.pushToMuteHeld,
      voiceActivityOpen: voiceActivityOpen ?? this.voiceActivityOpen,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is VoiceTransmitHoldState &&
      other.pushToTalkHeld == pushToTalkHeld &&
      other.pushToMuteHeld == pushToMuteHeld &&
      other.voiceActivityOpen == voiceActivityOpen;

  @override
  int get hashCode =>
      Object.hash(pushToTalkHeld, pushToMuteHeld, voiceActivityOpen);
}

@Riverpod(keepAlive: true)
class VoiceTransmitHold extends _$VoiceTransmitHold {
  Timer? _releaseTimer;

  @override
  VoiceTransmitHoldState build() {
    ref.onDispose(() => _releaseTimer?.cancel());
    return const VoiceTransmitHoldState();
  }

  void pressPushToTalk() {
    _releaseTimer?.cancel();
    _releaseTimer = null;
    state = state.copyWith(pushToTalkHeld: true);
  }

  void releasePushToTalk() {
    _releaseTimer?.cancel();
    final int delayMs = ref
        .read(keybindPreferencesProvider)
        .pushToTalkReleaseDelayMs;
    _releaseTimer = Timer(Duration(milliseconds: delayMs), () {
      _releaseTimer = null;
      state = state.copyWith(pushToTalkHeld: false);
    });
  }

  void setPushToMuteHeld({required bool held}) {
    state = state.copyWith(pushToMuteHeld: held);
  }

  void setVoiceActivityOpen({required bool open}) {
    if (state.voiceActivityOpen == open) {
      return;
    }
    state = state.copyWith(voiceActivityOpen: open);
  }

  void reset() {
    _releaseTimer?.cancel();
    _releaseTimer = null;
    state = const VoiceTransmitHoldState();
  }
}

@Riverpod(keepAlive: true)
bool voicePushToTalkActive(Ref ref) {
  if (ref.watch(inputModalityProvider)) {
    return false;
  }
  return ref.watch(
    keybindPreferencesProvider.select(
      (KeybindPreferencesState state) =>
          state.isPushToTalk &&
          (state.primaryFor(KeybindAction.voicePushToTalk)?.isActive ?? false),
    ),
  );
}

@Riverpod(keepAlive: true)
bool voiceMicrophoneGateOpen(Ref ref) {
  final bool pushToTalk = ref.watch(voicePushToTalkActiveProvider);
  final VoiceTransmitHoldState hold = ref.watch(voiceTransmitHoldProvider);
  if (hold.pushToMuteHeld) {
    return false;
  }
  if (pushToTalk) {
    return hold.pushToTalkHeld;
  }
  return hold.voiceActivityOpen;
}
