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

  group('shouldRefreshMicrophoneOnAudioRouteChange', () {
    test('allows refresh on Android when backgrounded', () {
      expect(
        shouldRefreshMicrophoneOnAudioRouteChange(
          isIos: false,
          isForeground: false,
        ),
        isTrue,
      );
    });

    test('allows refresh on iOS when foreground', () {
      expect(
        shouldRefreshMicrophoneOnAudioRouteChange(
          isIos: true,
          isForeground: true,
        ),
        isTrue,
      );
    });

    test('skips refresh on iOS when backgrounded', () {
      expect(
        shouldRefreshMicrophoneOnAudioRouteChange(
          isIos: true,
          isForeground: false,
        ),
        isFalse,
      );
    });
  });

  group('didAudioInputDeviceIdsChange', () {
    test('returns false when previous snapshot is missing', () {
      expect(
        didAudioInputDeviceIdsChange(
          previous: null,
          current: <String>{'mic-1'},
        ),
        isFalse,
      );
    });

    test('returns false when input devices are unchanged', () {
      expect(
        didAudioInputDeviceIdsChange(
          previous: <String>{'mic-1'},
          current: <String>{'mic-1'},
        ),
        isFalse,
      );
    });

    test('returns true when input devices changed', () {
      expect(
        didAudioInputDeviceIdsChange(
          previous: <String>{'mic-1'},
          current: <String>{'mic-2'},
        ),
        isTrue,
      );
    });
  });
}
