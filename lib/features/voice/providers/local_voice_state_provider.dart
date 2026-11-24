import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/features/voice/domain/local_voice_state_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_voice_state_provider.g.dart';

@Riverpod(keepAlive: true)
class LocalVoiceState extends _$LocalVoiceState {
  @override
  LocalVoiceStateData build() {
    final LocalSettingsStore store = ref.watch(localSettingsStoreProvider);
    return LocalVoiceStateData(
      selfMute: store.read(LocalSettingKeys.selfMute),
      selfDeaf: store.read(LocalSettingKeys.selfDeaf),
    );
  }

  void _persist() {
    ref.read(localSettingsStoreProvider)
      ..write(LocalSettingKeys.selfMute, state.selfMute)
      ..write(LocalSettingKeys.selfDeaf, state.selfDeaf);
  }

  Future<void> toggleSelfMute() async {
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
    _persist();
  }

  Future<void> toggleSelfDeaf() async {
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
    _persist();
  }

  Future<void> setSelfMute({required bool muted}) async {
    if (state.selfMute == muted) {
      return;
    }
    state = state.copyWith(selfMute: muted);
    _persist();
  }

  Future<void> setSelfDeaf({required bool deafened}) async {
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
    _persist();
  }
}
