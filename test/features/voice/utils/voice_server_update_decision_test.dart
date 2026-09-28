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

    test('returns false when e2ee key is present', () {
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
        isFalse,
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
