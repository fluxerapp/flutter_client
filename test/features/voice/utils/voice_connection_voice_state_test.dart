import 'package:fluxer_app/features/voice/utils/voice_connection_voice_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_effective_audio_state.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:test/test.dart';

VoiceState _voiceState({
  required String userId,
  required String channelId,
  String? connectionId,
  bool selfDeaf = false,
  bool selfMute = false,
}) {
  return VoiceState(
    userId: userId,
    channelId: channelId,
    guildId: 'g1',
    connectionId: connectionId,
    selfDeaf: selfDeaf,
    selfMute: selfMute,
  );
}

void main() {
  group('resolveSelfConnectionVoiceState', () {
    test('returns state keyed by activeConnectionId', () {
      final VoiceState mobile = _voiceState(
        userId: 'u1',
        channelId: 'c1',
        connectionId: 'conn-mobile',
        selfDeaf: true,
      );
      final Map<String, VoiceState> map = <String, VoiceState>{
        'conn-mobile': mobile,
        'conn-desktop': _voiceState(
          userId: 'u1',
          channelId: 'c1',
          connectionId: 'conn-desktop',
          selfDeaf: false,
        ),
      };

      final VoiceState? resolved = resolveSelfConnectionVoiceState(
        voiceStates: map,
        activeConnectionId: 'conn-mobile',
        userId: 'u1',
        channelId: 'c1',
      );

      expect(resolved, mobile);
      expect(resolved?.selfDeaf, isTrue);
    });

    test('falls back to synthetic key before connectionId is mapped', () {
      final VoiceState synthetic = _voiceState(
        userId: 'u1',
        channelId: 'c1',
        connectionId: null,
        selfDeaf: true,
      );
      final String syntheticKey = voiceStateSyntheticStorageKey(
        userId: 'u1',
        channelId: 'c1',
      );
      final Map<String, VoiceState> map = <String, VoiceState>{
        syntheticKey: synthetic,
      };

      final VoiceState? resolved = resolveSelfConnectionVoiceState(
        voiceStates: map,
        activeConnectionId: 'conn-new',
        userId: 'u1',
        channelId: 'c1',
      );

      expect(resolved, synthetic);
    });

    test('prefers activeConnectionId over synthetic key', () {
      final VoiceState byConnection = _voiceState(
        userId: 'u1',
        channelId: 'c1',
        connectionId: 'conn-2',
        selfDeaf: true,
      );
      final Map<String, VoiceState> map = <String, VoiceState>{
        'conn-2': byConnection,
        voiceStateSyntheticStorageKey(
          userId: 'u1',
          channelId: 'c1',
        ): _voiceState(
          userId: 'u1',
          channelId: 'c1',
          connectionId: null,
          selfDeaf: false,
        ),
      };

      final VoiceState? resolved = resolveSelfConnectionVoiceState(
        voiceStates: map,
        activeConnectionId: 'conn-2',
        userId: 'u1',
        channelId: 'c1',
      );

      expect(resolved?.selfDeaf, isTrue);
    });
  });

  group('deafen during connect fallback', () {
    test(
      'pending self deaf blocks remote subscribe decision when map is empty',
      () {
        const bool pendingSelfDeaf = true;
        final EffectiveAudioState audio = effectiveAudioStateFromVoiceState(
          voiceState: null,
          fallbackSelfMute: true,
          fallbackSelfDeaf: pendingSelfDeaf,
        );

        expect(audio.effectiveDeaf, isTrue);
      },
    );

    test('undeafen fallback allows remote subscribe when map is empty', () {
      final EffectiveAudioState audio = effectiveAudioStateFromVoiceState(
        voiceState: null,
        fallbackSelfMute: false,
        fallbackSelfDeaf: false,
      );

      expect(audio.effectiveDeaf, isFalse);
    });

    test('second connection deaf state does not affect active lookup', () {
      final Map<String, VoiceState> map = <String, VoiceState>{
        'conn-desktop': _voiceState(
          userId: 'u1',
          channelId: 'c1',
          connectionId: 'conn-desktop',
          selfDeaf: false,
        ),
        'conn-mobile': _voiceState(
          userId: 'u1',
          channelId: 'c1',
          connectionId: 'conn-mobile',
          selfDeaf: true,
        ),
      };

      final VoiceState? mobileState = resolveSelfConnectionVoiceState(
        voiceStates: map,
        activeConnectionId: 'conn-mobile',
        userId: 'u1',
        channelId: 'c1',
      );
      final EffectiveAudioState mobileAudio = effectiveAudioStateFromVoiceState(
        voiceState: mobileState,
        fallbackSelfMute: false,
        fallbackSelfDeaf: false,
      );

      final VoiceState? desktopState = resolveSelfConnectionVoiceState(
        voiceStates: map,
        activeConnectionId: 'conn-desktop',
        userId: 'u1',
        channelId: 'c1',
      );
      final EffectiveAudioState desktopAudio =
          effectiveAudioStateFromVoiceState(
            voiceState: desktopState,
            fallbackSelfMute: false,
            fallbackSelfDeaf: false,
          );

      expect(mobileAudio.effectiveDeaf, isTrue);
      expect(desktopAudio.effectiveDeaf, isFalse);
    });
  });
}
