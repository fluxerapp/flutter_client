import 'dart:async';

import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_participant_volume_provider.g.dart';

@Riverpod()
class VoiceParticipantVolume extends _$VoiceParticipantVolume {
  @override
  Map<String, int> build() {
    ref.listen<VoiceSettingsState>(voiceSettingsProvider, (
      VoiceSettingsState? _,
      VoiceSettingsState next,
    ) {
      state = next.participantVolumes;
    });
    return ref.read(voiceSettingsProvider).participantVolumes;
  }

  int volumeFor(String userId) {
    return state[userId] ?? kDefaultVoiceVolumePercent;
  }

  Future<void> setVolume(String userId, int percent) async {
    await ref
        .read(voiceSettingsProvider.notifier)
        .setParticipantVolume(userId, percent);
    await ref
        .read(voiceSessionProvider.notifier)
        .applyParticipantVolume(userId);
  }
}
