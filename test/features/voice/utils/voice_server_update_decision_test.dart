import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_server_update_decision.dart';
import 'package:test/test.dart';

void main() {
  const String channelId = 'voice-1';
  const VoiceSessionState liveConnected = VoiceSessionState(
    isConnected: true,
    channelId: channelId,
    voiceServerEndpoint: 'wss://old.example',
    activeConnectionId: 'conn-1',
  );

  group('isServerInitiatedVoiceMove', () {
    const VoiceSessionState connectedInGuild = VoiceSessionState(
      isConnected: true,
      guildId: 'guild-1',
      channelId: channelId,
      voiceServerEndpoint: 'wss://old.example',
      activeConnectionId: 'conn-1',
    );

    test('accepts a moderator move to another channel of the same guild', () {
      expect(
        isServerInitiatedVoiceMove(
          state: connectedInGuild,
          expectedGuildId: 'guild-1',
          expectedChannelId: channelId,
          incomingGuildId: 'guild-1',
          incomingChannelId: 'voice-2',
        ),
        isTrue,
      );
    });

    test('is not a move when the update targets the current channel', () {
      expect(
        isServerInitiatedVoiceMove(
          state: connectedInGuild,
          expectedGuildId: 'guild-1',
          expectedChannelId: channelId,
          incomingGuildId: 'guild-1',
          incomingChannelId: channelId,
        ),
        isFalse,
      );
    });

    test('ignores another channel while a user join is still connecting', () {
      expect(
        isServerInitiatedVoiceMove(
          state: const VoiceSessionState(
            isConnecting: true,
            guildId: 'guild-1',
            channelId: channelId,
          ),
          expectedGuildId: 'guild-1',
          expectedChannelId: channelId,
          incomingGuildId: 'guild-1',
          incomingChannelId: 'voice-2',
        ),
        isFalse,
      );
    });

    test('ignores another channel when the guild differs', () {
      expect(
        isServerInitiatedVoiceMove(
          state: connectedInGuild,
          expectedGuildId: 'guild-1',
          expectedChannelId: channelId,
          incomingGuildId: 'guild-2',
          incomingChannelId: 'voice-2',
        ),
        isFalse,
      );
    });

    test('ignores another channel when not in voice', () {
      expect(
        isServerInitiatedVoiceMove(
          state: const VoiceSessionState(),
          expectedGuildId: null,
          expectedChannelId: null,
          incomingGuildId: 'guild-1',
          incomingChannelId: 'voice-2',
        ),
        isFalse,
      );
    });

    test('ignores another channel during a direct call', () {
      expect(
        isServerInitiatedVoiceMove(
          state: liveConnected,
          expectedGuildId: null,
          expectedChannelId: channelId,
          incomingGuildId: null,
          incomingChannelId: 'voice-2',
        ),
        isFalse,
      );
    });
  });

  group('isVoiceServerRegionChange', () {
    test('detects endpoint change on a live plaintext session', () {
      expect(
        isVoiceServerRegionChange(
          state: liveConnected,
          resolvedChannelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
          incomingEndpoint: 'wss://new.example',
          incomingToken: 'token',
          incomingChannelId: channelId,
          e2eeKey: null,
        ),
        isTrue,
      );
    });

    test('returns false when endpoint is unchanged', () {
      expect(
        isVoiceServerRegionChange(
          state: liveConnected,
          resolvedChannelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
          incomingEndpoint: 'wss://old.example',
          incomingToken: 'token',
          incomingChannelId: channelId,
          e2eeKey: null,
        ),
        isFalse,
      );
    });

    test('detects endpoint change when an e2ee key is present', () {
      expect(
        isVoiceServerRegionChange(
          state: liveConnected,
          resolvedChannelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
          incomingEndpoint: 'wss://new.example',
          incomingToken: 'token',
          incomingChannelId: channelId,
          e2eeKey: 'secret-key',
        ),
        isTrue,
      );
    });
  });

  group('shouldIgnoreVoiceServerUpdateForStableSession', () {
    test('does not ignore region change updates', () {
      expect(
        shouldIgnoreVoiceServerUpdateForStableSession(
          state: liveConnected,
          resolvedChannelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
          incomingEndpoint: 'wss://new.example',
          incomingToken: 'token',
          incomingChannelId: channelId,
          e2eeKey: null,
        ),
        isFalse,
      );
    });

    test('does not ignore a keyed region change', () {
      expect(
        shouldIgnoreVoiceServerUpdateForStableSession(
          state: liveConnected,
          resolvedChannelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
          incomingEndpoint: 'wss://new.example',
          incomingToken: 'token',
          incomingChannelId: channelId,
          e2eeKey: 'secret-key',
        ),
        isFalse,
      );
    });

    test('ignores duplicate updates for the same endpoint', () {
      expect(
        shouldIgnoreVoiceServerUpdateForStableSession(
          state: liveConnected,
          resolvedChannelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
          incomingEndpoint: 'wss://old.example',
          incomingToken: 'token',
          incomingChannelId: channelId,
          e2eeKey: null,
        ),
        isTrue,
      );
    });
  });
}
