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
  try {
    await applicator.attachNoiseFilterToTrack(track: track, settings: settings);
  } on Object {
    await _disposeQuietly(track);
    rethrow;
  }
  return track;
}

Future<void> _disposeQuietly(LocalAudioTrack track) async {
  try {
    await track.stop();
    await track.dispose();
  } on Object {
    return;
  }
}
