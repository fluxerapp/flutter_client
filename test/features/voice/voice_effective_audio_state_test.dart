import 'package:fluxer_app/features/voice/utils/voice_effective_audio_state.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:test/test.dart';

VoiceState _voiceState({
  bool selfMute = false,
  bool selfDeaf = false,
  bool mute = false,
  bool deaf = false,
  bool suppress = false,
}) {
  return VoiceState(
    userId: 'u1',
    channelId: 'c1',
    selfMute: selfMute,
    selfDeaf: selfDeaf,
    mute: mute,
    deaf: deaf,
    suppress: suppress,
  );
}

void main() {
  group('computeEffectiveAudioState', () {
    test('mic publishes when unmuted', () {
      final EffectiveAudioState state = computeEffectiveAudioState(
        selfMute: false,
        selfDeaf: false,
      );
      expect(state.micShouldPublish, isTrue);
      expect(state.effectiveMute, isFalse);
    });

    test('suppress blocks mic publish', () {
      final EffectiveAudioState state = effectiveAudioStateFromVoiceState(
        voiceState: _voiceState(suppress: true),
        fallbackSelfMute: false,
        fallbackSelfDeaf: false,
      );
      expect(state.serverMute, isTrue);
      expect(state.micShouldPublish, isFalse);
    });

    test('self deaf blocks mic publish', () {
      final EffectiveAudioState state = computeEffectiveAudioState(
        selfMute: false,
        selfDeaf: true,
      );
      expect(state.effectiveDeaf, isTrue);
      expect(state.micShouldPublish, isFalse);
    });

    test('falls back to lobby flags without voice state', () {
      final EffectiveAudioState state = effectiveAudioStateFromVoiceState(
        voiceState: null,
        fallbackSelfMute: true,
        fallbackSelfDeaf: false,
      );
      expect(state.micShouldPublish, isFalse);
    });
  });

  group('isTrackPublishFailure', () {
    test('detects TrackPublishException message', () {
      expect(
        isTrackPublishFailure(
          Exception('LiveKit: [TrackPublishException] Failed to publish track'),
        ),
        isTrue,
      );
    });
  });
}
