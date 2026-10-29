import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/audio/audio_route_recovery.dart';
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
    test('skips refresh on Android', () {
      expect(
        shouldRefreshMicrophoneOnAudioRouteChange(
          isIos: false,
          isAndroid: true,
          isForeground: true,
          configuredInputDeviceId: 'mic-1',
          availableInputDeviceIds: <String>{'mic-2'},
        ),
        isFalse,
      );
    });

    test('allows refresh on iOS when foreground', () {
      expect(
        shouldRefreshMicrophoneOnAudioRouteChange(
          isIos: true,
          isAndroid: false,
          isForeground: true,
          configuredInputDeviceId: kDefaultVoiceDeviceId,
          availableInputDeviceIds: <String>{'mic-1'},
        ),
        isTrue,
      );
    });

    test('skips refresh on iOS when backgrounded', () {
      expect(
        shouldRefreshMicrophoneOnAudioRouteChange(
          isIos: true,
          isAndroid: false,
          isForeground: false,
          configuredInputDeviceId: kDefaultVoiceDeviceId,
          availableInputDeviceIds: <String>{'mic-1'},
        ),
        isFalse,
      );
    });

    test('skips desktop refresh when input is default', () {
      expect(
        shouldRefreshMicrophoneOnAudioRouteChange(
          isIos: false,
          isAndroid: false,
          isForeground: true,
          configuredInputDeviceId: kDefaultVoiceDeviceId,
          availableInputDeviceIds: <String>{'mic-1', 'mic-2'},
        ),
        isFalse,
      );
    });

    test('skips desktop refresh when selected input is still available', () {
      expect(
        shouldRefreshMicrophoneOnAudioRouteChange(
          isIos: false,
          isAndroid: false,
          isForeground: true,
          configuredInputDeviceId: 'mic-1',
          availableInputDeviceIds: <String>{'mic-1', 'mic-2'},
        ),
        isFalse,
      );
    });

    test('refreshes desktop when selected input disappeared', () {
      expect(
        shouldRefreshMicrophoneOnAudioRouteChange(
          isIos: false,
          isAndroid: false,
          isForeground: true,
          configuredInputDeviceId: 'mic-1',
          availableInputDeviceIds: <String>{'mic-2'},
        ),
        isTrue,
      );
    });
  });

  group('shouldReapplyMobileVoiceOutputOnDeviceChange', () {
    test('reapplies on iOS when outputs change', () {
      expect(
        shouldReapplyMobileVoiceOutputOnDeviceChange(
          isIos: true,
          isAndroid: false,
          outputChanged: true,
        ),
        isTrue,
      );
    });

    test('skips on Android where native route hold handles drift', () {
      expect(
        shouldReapplyMobileVoiceOutputOnDeviceChange(
          isIos: false,
          isAndroid: true,
          outputChanged: true,
        ),
        isFalse,
      );
    });
  });

  group('shouldReapplyDesktopAudioOutputOnDeviceChange', () {
    test('reapplies when configured output is still present', () {
      expect(
        shouldReapplyDesktopAudioOutputOnDeviceChange(
          isDesktop: true,
          outputChanged: true,
          configuredOutputDeviceId: 'out-1',
          availableOutputDeviceIds: <String>{'out-1', 'out-2'},
        ),
        isTrue,
      );
    });

    test('skips when configured output is missing', () {
      expect(
        shouldReapplyDesktopAudioOutputOnDeviceChange(
          isDesktop: true,
          outputChanged: true,
          configuredOutputDeviceId: 'out-1',
          availableOutputDeviceIds: <String>{'out-2'},
        ),
        isFalse,
      );
    });
  });

  group('shouldClearMissingDesktopOutputDevice', () {
    test('clears when configured output disappeared', () {
      expect(
        shouldClearMissingDesktopOutputDevice(
          isDesktop: true,
          outputChanged: true,
          configuredOutputDeviceId: 'out-1',
          availableOutputDeviceIds: <String>{'out-2'},
        ),
        isTrue,
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

  group('didAudioOutputDeviceIdsChange', () {
    test('returns false when previous snapshot is missing', () {
      expect(
        didAudioOutputDeviceIdsChange(
          previous: null,
          current: <String>{'out-1'},
        ),
        isFalse,
      );
    });

    test('returns false when output devices are unchanged', () {
      expect(
        didAudioOutputDeviceIdsChange(
          previous: <String>{'out-1'},
          current: <String>{'out-1'},
        ),
        isFalse,
      );
    });

    test('returns true when output devices changed', () {
      expect(
        didAudioOutputDeviceIdsChange(
          previous: <String>{'out-1'},
          current: <String>{'out-2'},
        ),
        isTrue,
      );
    });
  });
}
