import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';

void main() {
  group('VoiceSettingsState outputRoute', () {
    test('defaults to speaker', () {
      expect(const VoiceSettingsState().outputRoute, VoiceOutputRoute.speaker);
    });

    test('fromJson defaults a missing route to speaker', () {
      final VoiceSettingsState settings = VoiceSettingsState.fromJson(
        <String, dynamic>{},
      );
      expect(settings.outputRoute, VoiceOutputRoute.speaker);
    });

    test('fromJson keeps an older earpiece preference', () {
      final VoiceSettingsState settings = VoiceSettingsState.fromJson(
        <String, dynamic>{'preferSpeakerOutput': false},
      );
      expect(settings.outputRoute, VoiceOutputRoute.earpiece);
    });

    test('fromJson reads the stored route', () {
      final VoiceSettingsState settings = VoiceSettingsState.fromJson(
        <String, dynamic>{'outputRoute': 'headset'},
      );
      expect(settings.outputRoute, VoiceOutputRoute.headset);
    });
  });

  group('VoiceSettingsState prioritizeSpeakingParticipants', () {
    test('defaults to false', () {
      expect(
        const VoiceSettingsState().prioritizeSpeakingParticipants,
        isFalse,
      );
    });

    test('round-trips through json', () {
      const VoiceSettingsState settings = VoiceSettingsState(
        prioritizeSpeakingParticipants: true,
      );
      final VoiceSettingsState restored = VoiceSettingsState.fromJson(
        settings.toJson(),
      );
      expect(restored.prioritizeSpeakingParticipants, isTrue);
    });

    test(
      'fromJson defaults missing prioritizeSpeakingParticipants to false',
      () {
        final VoiceSettingsState settings = VoiceSettingsState.fromJson(
          <String, dynamic>{},
        );
        expect(settings.prioritizeSpeakingParticipants, isFalse);
      },
    );
  });

  group('VoiceSettingsState participantLocalMutes', () {
    test('defaults to empty', () {
      expect(const VoiceSettingsState().participantLocalMutes, isEmpty);
    });

    test('round-trips through json', () {
      const VoiceSettingsState settings = VoiceSettingsState(
        participantLocalMutes: <String, bool>{'42': true},
      );
      final VoiceSettingsState restored = VoiceSettingsState.fromJson(
        settings.toJson(),
      );
      expect(restored.participantLocalMutes, <String, bool>{'42': true});
    });
  });
}
