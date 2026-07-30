import 'dart:async';

import 'package:fluxer_app/features/voice/domain/local_voice_state_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_voice_state_provider.g.dart';

const String kPersistedSelfMuteKey = 'persistedSelfMute';
const String kPersistedSelfDeafKey = 'persistedSelfDeaf';

@Riverpod(keepAlive: true)
class LocalVoiceState extends _$LocalVoiceState {
  bool _hydrated = false;

  @override
  LocalVoiceStateData build() {
    unawaited(_hydrate());
    return const LocalVoiceStateData();
  }

  Future<void> _hydrate() async {
    if (_hydrated) {
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _hydrated = true;
    state = LocalVoiceStateData(
      selfMute: prefs.getBool(kPersistedSelfMuteKey) ?? false,
      selfDeaf: prefs.getBool(kPersistedSelfDeafKey) ?? false,
    );
  }

  Future<void> _persist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kPersistedSelfMuteKey, state.selfMute);
    await prefs.setBool(kPersistedSelfDeafKey, state.selfDeaf);
  }

  Future<void> toggleSelfMute() async {
    await _hydrate();
    final bool nextMute = !state.selfMute;
    if (state.selfDeaf && !nextMute) {
      state = state.copyWith(
        selfMute: false,
        selfDeaf: false,
        shouldUnmuteOnUndeafen: false,
      );
    } else {
      state = state.copyWith(
        selfMute: nextMute,
        shouldUnmuteOnUndeafen: state.selfDeaf && state.shouldUnmuteOnUndeafen,
      );
    }
    await _persist();
  }

  Future<void> toggleSelfDeaf() async {
    await _hydrate();
    final bool nextDeaf = !state.selfDeaf;
    if (nextDeaf) {
      final bool wasMutedBefore = state.selfMute;
      state = state.copyWith(
        selfDeaf: true,
        selfMute: true,
        shouldUnmuteOnUndeafen: !wasMutedBefore,
      );
    } else {
      state = state.copyWith(
        selfDeaf: false,
        selfMute: !state.shouldUnmuteOnUndeafen && state.selfMute,
        shouldUnmuteOnUndeafen: false,
      );
    }
    await _persist();
  }

  Future<void> setSelfMute({required bool muted}) async {
    await _hydrate();
    if (state.selfMute == muted) {
      return;
    }
    state = state.copyWith(selfMute: muted);
    await _persist();
  }

  Future<void> setSelfDeaf({required bool deafened}) async {
    await _hydrate();
    if (state.selfDeaf == deafened) {
      return;
    }
    if (deafened) {
      final bool wasMutedBefore = state.selfMute;
      state = state.copyWith(
        selfDeaf: true,
        selfMute: true,
        shouldUnmuteOnUndeafen: !wasMutedBefore,
      );
    } else {
      state = state.copyWith(
        selfDeaf: false,
        selfMute: !state.shouldUnmuteOnUndeafen && state.selfMute,
        shouldUnmuteOnUndeafen: false,
      );
    }
    await _persist();
  }
}
