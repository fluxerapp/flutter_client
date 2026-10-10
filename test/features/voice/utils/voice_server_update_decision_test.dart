import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_channel_join_guard.dart';
import 'package:fluxer_app/features/voice/utils/voice_server_update_decision.dart';
import 'package:fluxer_dart/gateway.dart';
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

  group('server move reusing the connection id', () {
    const VoiceSessionState connectedInGuild = VoiceSessionState(
      isConnected: true,
      guildId: 'guild-1',
      channelId: channelId,
      voiceServerEndpoint: 'wss://voice.example',
      activeConnectionId: 'conn-1',
    );
    const VoiceServerUpdateEvent moveUpdate = VoiceServerUpdateEvent(
      token: 'token-2',
      endpoint: 'wss://voice.example',
      guildId: 'guild-1',
      channelId: 'voice-2',
      connectionId: 'conn-1',
    );

    VoiceSessionState adopt() {
      expect(
        isServerInitiatedVoiceMove(
          state: connectedInGuild,
          expectedGuildId: 'guild-1',
          expectedChannelId: channelId,
          incomingGuildId: moveUpdate.guildId,
          incomingChannelId: moveUpdate.channelId,
        ),
        isTrue,
      );
      return voiceSessionStateAfterServerMove(
        state: connectedInGuild,
        channelId: moveUpdate.channelId!,
      );
    }

    test('adopting the move targets the new channel as a fresh connect', () {
      final VoiceSessionState moved = adopt();

      expect(moved.channelId, 'voice-2');
      expect(moved.guildId, 'guild-1');
      expect(moved.isConnecting, isTrue);
      expect(moved.isConnected, isFalse);
      expect(moved.activeConnectionId, isNull);
      expect(moved.voiceServerEndpoint, isNull);
    });

    test('the move update on the same endpoint is not an in-flight dupe', () {
      final VoiceSessionState moved = adopt();

      expect(
        isDuplicateVoiceServerUpdateInFlight(
          state: moved,
          connectionId: moveUpdate.connectionId,
          endpoint: moveUpdate.endpoint,
        ),
        isFalse,
      );
    });

    test('the move update is not ignored or hot swapped by later checks', () {
      final VoiceSessionState moved = adopt();

      expect(
        isVoiceServerRegionChange(
          state: moved,
          resolvedChannelId: 'voice-2',
          hasLiveKitRoom: true,
          isRoomConnected: true,
          incomingEndpoint: moveUpdate.endpoint,
          incomingToken: moveUpdate.token,
          incomingChannelId: moveUpdate.channelId,
          e2eeKey: moveUpdate.e2eeKey,
        ),
        isFalse,
      );
      expect(
        shouldIgnoreVoiceServerUpdateForStableSession(
          state: moved,
          resolvedChannelId: 'voice-2',
          hasLiveKitRoom: true,
          isRoomConnected: true,
          incomingEndpoint: moveUpdate.endpoint,
          incomingToken: moveUpdate.token,
          incomingChannelId: moveUpdate.channelId,
          e2eeKey: moveUpdate.e2eeKey,
        ),
        isFalse,
      );
    });

    test('a repeat of the move update is a dupe once the connect began', () {
      final VoiceSessionState connecting = adopt().copyWith(
        voiceServerEndpoint: moveUpdate.endpoint,
        activeConnectionId: moveUpdate.connectionId,
      );

      expect(
        isDuplicateVoiceServerUpdateInFlight(
          state: connecting,
          connectionId: moveUpdate.connectionId,
          endpoint: moveUpdate.endpoint,
        ),
        isTrue,
      );
    });

    test('the old room is dropped without a gateway disconnect', () {
      expect(
        shouldSendVoiceDisconnectForReplacedRoom(
          state: adopt(),
          incomingConnectionId: moveUpdate.connectionId,
        ),
        isFalse,
      );
    });

    test('a pending connection id equal to the old one is never dropped', () {
      expect(
        shouldSendVoiceDisconnectForReplacedRoom(
          state: connectedInGuild.copyWith(
            isConnecting: true,
            isConnected: false,
          ),
          incomingConnectionId: 'conn-1',
        ),
        isFalse,
      );
    });

    test('a user move to a fresh connection id disconnects the old one', () {
      expect(
        shouldSendVoiceDisconnectForReplacedRoom(
          state: connectedInGuild.copyWith(
            isConnecting: true,
            isConnected: false,
            channelId: 'voice-2',
          ),
          incomingConnectionId: 'conn-2',
        ),
        isTrue,
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
