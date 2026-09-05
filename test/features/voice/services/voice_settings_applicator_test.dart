import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/services/voice_settings_applicator.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:test/test.dart';

void main() {
  test(
    'capture options disable voice isolation and use platform NS when filter is missing',
    () {
      const VoiceSettingsApplicator applicator = VoiceSettingsApplicator(
        noiseFilterSupported: false,
      );
      final AudioCaptureOptions options = applicator.buildAudioCaptureOptions(
        const VoiceSettingsState(),
      );
      expect(options.voiceIsolation, isFalse);
      expect(options.echoCancellation, isTrue);
      expect(options.noiseSuppression, isTrue);
      expect(options.autoGainControl, isTrue);
    },
  );

  test('room options include channel bitrate publish encoding', () {
    const VoiceSettingsApplicator applicator = VoiceSettingsApplicator(
      noiseFilterSupported: false,
    );
    final RoomOptions roomOptions = applicator.buildRoomOptions(
      const VoiceSettingsState(),
      channelBitrate: 64000,
    );
    expect(roomOptions.defaultAudioPublishOptions.encoding?.maxBitrate, 64000);
    expect(roomOptions.defaultAudioCaptureOptions.voiceIsolation, isFalse);
  });
}
