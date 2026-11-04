import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';

void main() {
  group('VoiceSessionState.isInVoice', () {
    test('is true while connecting to a channel', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnecting: true,
        channelId: 'voice-1',
      );
      expect(state.isInVoice, isTrue);
    });

    test('is true when connected to a channel', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: 'voice-1',
      );
      expect(state.isInVoice, isTrue);
    });

    test('is false without a channel id', () {
      const VoiceSessionState state = VoiceSessionState(isConnecting: true);
      expect(state.isInVoice, isFalse);
    });

    test('is false for an idle session', () {
      expect(const VoiceSessionState().isInVoice, isFalse);
    });
  });

  group('VoiceSessionState.copyWith', () {
    test('clearChannel nulls guildId and channelId', () {
      const VoiceSessionState before = VoiceSessionState(
        guildId: 'g1',
        channelId: 'voice-1',
        activeConnectionId: 'conn-1',
      );
      final VoiceSessionState after = before.copyWith(clearChannel: true);
      expect(after.guildId, isNull);
      expect(after.channelId, isNull);
      expect(after.activeConnectionId, 'conn-1');
    });

    test('clearActiveConnectionId nulls connection fields', () {
      const VoiceSessionState before = VoiceSessionState(
        guildId: 'g1',
        channelId: 'voice-1',
        activeConnectionId: 'conn-1',
        voiceServerEndpoint: 'wss://livekit.example',
      );
      final VoiceSessionState after = before.copyWith(
        clearActiveConnectionId: true,
      );
      expect(after.activeConnectionId, isNull);
      expect(after.voiceServerEndpoint, isNull);
      expect(after.channelId, 'voice-1');
    });

    test('clearError removes errorMessage', () {
      const VoiceSessionState before = VoiceSessionState(
        errorMessage: 'VOICE_ERR_MIC_PERM',
      );
      final VoiceSessionState after = before.copyWith(clearError: true);
      expect(after.errorMessage, isNull);
    });

    test('clearRoom nulls liveKitRoom and e2eeKey', () {
      const VoiceSessionState before = VoiceSessionState(e2eeKey: 'key');
      final VoiceSessionState after = before.copyWith(clearRoom: true);
      expect(after.liveKitRoom, isNull);
      expect(after.e2eeKey, isNull);
    });
  });
}
