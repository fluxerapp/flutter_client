import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:test/test.dart';

void main() {
  group('resolveVoiceOutputRoute', () {
    test('keeps the saved route when it is available', () {
      expect(
        resolveVoiceOutputRoute(
          preference: VoiceOutputRoute.headset,
          available: VoiceOutputRoute.values.toSet(),
        ),
        VoiceOutputRoute.headset,
      );
    });

    test('keeps speaker while a headset is connected', () {
      expect(
        resolveVoiceOutputRoute(
          preference: VoiceOutputRoute.speaker,
          available: VoiceOutputRoute.values.toSet(),
        ),
        VoiceOutputRoute.speaker,
      );
    });

    test('falls back to speaker when the saved headset is gone', () {
      expect(
        resolveVoiceOutputRoute(
          preference: VoiceOutputRoute.headset,
          available: kPhoneVoiceOutputRoutes,
        ),
        VoiceOutputRoute.speaker,
      );
    });
  });

  group('resolveVoiceCallOutputRoute', () {
    const Set<VoiceOutputRoute> withBluetooth = <VoiceOutputRoute>{
      ...kPhoneVoiceOutputRoutes,
      VoiceOutputRoute.bluetooth,
    };

    test('moves to a connected Bluetooth device over the saved route', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.speaker,
          override: null,
          available: withBluetooth,
        ),
        VoiceOutputRoute.bluetooth,
      );
    });

    test('prefers Bluetooth over a wired headset', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.speaker,
          override: null,
          available: VoiceOutputRoute.values.toSet(),
        ),
        VoiceOutputRoute.bluetooth,
      );
    });

    test('moves to a wired headset when there is no Bluetooth device', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.earpiece,
          override: null,
          available: <VoiceOutputRoute>{
            ...kPhoneVoiceOutputRoutes,
            VoiceOutputRoute.headset,
          },
        ),
        VoiceOutputRoute.headset,
      );
    });

    test('holds a route the user picked while a headset is connected', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.speaker,
          override: VoiceOutputRoute.earpiece,
          available: withBluetooth,
        ),
        VoiceOutputRoute.earpiece,
      );
    });

    test('returns to the saved earpiece when the headset is gone', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.earpiece,
          override: VoiceOutputRoute.bluetooth,
          available: kPhoneVoiceOutputRoutes,
        ),
        VoiceOutputRoute.earpiece,
      );
    });

    test('falls back to speaker for an older saved headset route', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.headset,
          override: null,
          available: kPhoneVoiceOutputRoutes,
        ),
        VoiceOutputRoute.speaker,
      );
    });

    test('uses the earpiece when there is no speaker', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.speaker,
          override: null,
          available: const <VoiceOutputRoute>{VoiceOutputRoute.earpiece},
        ),
        VoiceOutputRoute.earpiece,
      );
    });
  });

  group('didConnectExternalVoiceOutputRoute', () {
    test('is true when a Bluetooth or wired route appears', () {
      expect(
        didConnectExternalVoiceOutputRoute(
          previous: kPhoneVoiceOutputRoutes,
          current: <VoiceOutputRoute>{
            ...kPhoneVoiceOutputRoutes,
            VoiceOutputRoute.bluetooth,
          },
        ),
        isTrue,
      );
    });

    test('is false when a headset disconnects or nothing is known yet', () {
      expect(
        didConnectExternalVoiceOutputRoute(
          previous: VoiceOutputRoute.values.toSet(),
          current: kPhoneVoiceOutputRoutes,
        ),
        isFalse,
      );
      expect(
        didConnectExternalVoiceOutputRoute(
          previous: null,
          current: VoiceOutputRoute.values.toSet(),
        ),
        isFalse,
      );
    });
  });

  group('liveKitPrefersSpeaker', () {
    test('forces the speaker only for the speaker route', () {
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.speaker), isTrue);
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.earpiece), isFalse);
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.headset), isFalse);
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.bluetooth), isFalse);
    });
  });

  group('stored speaker preference', () {
    test('maps the old boolean onto speaker or earpiece', () {
      expect(
        voiceOutputRouteFromSpeakerPreference(preferSpeaker: true),
        VoiceOutputRoute.speaker,
      );
      expect(
        voiceOutputRouteFromSpeakerPreference(preferSpeaker: false),
        VoiceOutputRoute.earpiece,
      );
      expect(
        voiceOutputRouteFromSpeakerPreference(preferSpeaker: null),
        VoiceOutputRoute.speaker,
      );
    });
  });
}
