import 'package:audio_session/audio_session.dart';
import 'package:fluxer_app/features/voice/utils/voice_speaker_route.dart';
import 'package:test/test.dart';

void main() {
  group('iosSpeakerCategoryOptions', () {
    test('adds defaultToSpeaker when routing to speaker', () {
      expect(
        iosSpeakerCategoryOptions(
          speaker: true,
        ).contains(AVAudioSessionCategoryOptions.defaultToSpeaker),
        isTrue,
      );
    });

    test('omits defaultToSpeaker when routing to earpiece', () {
      expect(
        iosSpeakerCategoryOptions(
          speaker: false,
        ).contains(AVAudioSessionCategoryOptions.defaultToSpeaker),
        isFalse,
      );
    });
  });

  group('iosSpeakerAudioMode', () {
    test('uses videoChat for speaker', () {
      expect(iosSpeakerAudioMode(speaker: true), AVAudioSessionMode.videoChat);
    });

    test('uses voiceChat for earpiece', () {
      expect(iosSpeakerAudioMode(speaker: false), AVAudioSessionMode.voiceChat);
    });
  });
}
