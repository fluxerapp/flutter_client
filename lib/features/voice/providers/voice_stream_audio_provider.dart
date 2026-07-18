import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_stream_audio_provider.g.dart';

class VoiceStreamAudioPrefsState {
  const VoiceStreamAudioPrefsState({
    required this.volumes,
    required this.muted,
  });

  final Map<String, int> volumes;
  final Map<String, bool> muted;

  int volumeFor(String streamKey) {
    return volumes[streamKey] ?? kDefaultVoiceVolumePercent;
  }

  bool isMuted(String streamKey) {
    return muted[streamKey] ?? false;
  }
}

@Riverpod()
class VoiceStreamAudio extends _$VoiceStreamAudio {
  @override
  VoiceStreamAudioPrefsState build() {
    ref.listen<VoiceSettingsState>(voiceSettingsProvider, (
      VoiceSettingsState? _,
      VoiceSettingsState next,
    ) {
      state = VoiceStreamAudioPrefsState(
        volumes: next.streamAudioVolumes,
        muted: next.streamAudioMuted,
      );
    });
    final VoiceSettingsState settings = ref.read(voiceSettingsProvider);
    return VoiceStreamAudioPrefsState(
      volumes: settings.streamAudioVolumes,
      muted: settings.streamAudioMuted,
    );
  }

  Future<void> setVolume(String streamKey, int percent) async {
    await ref
        .read(voiceSettingsProvider.notifier)
        .setStreamVolume(streamKey, percent);
  }

  Future<void> setMuted(String streamKey, {required bool muted}) async {
    await ref
        .read(voiceSettingsProvider.notifier)
        .setStreamMuted(streamKey, muted: muted);
  }
}
