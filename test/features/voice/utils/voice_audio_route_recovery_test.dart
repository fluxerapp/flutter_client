import 'package:fluxer_app/features/voice/utils/voice_audio_route_recovery.dart';
import 'package:test/test.dart';

void main() {
  group('shouldRecoverVoiceAudioOnDeviceChange', () {
    test('recovers when connected with a LiveKit room', () {
      expect(
        shouldRecoverVoiceAudioOnDeviceChange(
          isConnected: true,
          hasLiveKitRoom: true,
        ),
        isTrue,
      );
    });

    test('skips when not connected', () {
      expect(
        shouldRecoverVoiceAudioOnDeviceChange(
          isConnected: false,
          hasLiveKitRoom: true,
        ),
        isFalse,
      );
    });

    test('skips when room is missing', () {
      expect(
        shouldRecoverVoiceAudioOnDeviceChange(
          isConnected: true,
          hasLiveKitRoom: false,
        ),
        isFalse,
      );
    });
  });
}
