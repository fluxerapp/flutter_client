import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';

void main() {
  group('VoiceSettingsState preferSpeakerOutput', () {
    test('defaults to speaker on', () {
      expect(const VoiceSettingsState().preferSpeakerOutput, isTrue);
    });

    test('fromJson defaults missing preferSpeakerOutput to true', () {
      final VoiceSettingsState settings = VoiceSettingsState.fromJson(
        <String, dynamic>{},
      );
      expect(settings.preferSpeakerOutput, isTrue);
    });

    test('fromJson preserves explicit preferSpeakerOutput false', () {
      final VoiceSettingsState settings = VoiceSettingsState.fromJson(
        <String, dynamic>{'preferSpeakerOutput': false},
      );
      expect(settings.preferSpeakerOutput, isFalse);
    });

    test('fromJson preserves explicit preferSpeakerOutput true', () {
      final VoiceSettingsState settings = VoiceSettingsState.fromJson(
        <String, dynamic>{'preferSpeakerOutput': true},
      );
      expect(settings.preferSpeakerOutput, isTrue);
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
}
