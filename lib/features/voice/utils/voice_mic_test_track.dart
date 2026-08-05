import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/services/voice_settings_applicator.dart';
import 'package:livekit_client/livekit_client.dart';

Future<LocalAudioTrack> createMicTestAudioTrack({
  required VoiceSettingsApplicator applicator,
  required VoiceSettingsState settings,
}) async {
  final LocalAudioTrack track = await LocalAudioTrack.create(
    applicator.buildAudioCaptureOptions(settings),
  );
  await applicator.attachNoiseFilterToTrack(track: track, settings: settings);
  return track;
}
