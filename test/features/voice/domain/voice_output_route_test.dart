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

  group('liveKitPrefersSpeaker', () {
    test('forces the speaker only for the speaker route', () {
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.speaker), isTrue);
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.earpiece), isFalse);
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.headset), isFalse);
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
