import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_channel_join_guard.dart';
import 'package:test/test.dart';

void main() {
  const String channelId = 'voice-1';

  group('voiceSessionHasLiveConnection', () {
    test('returns true when connected with live room', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: channelId,
      );
      expect(
        voiceSessionHasLiveConnection(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
        ),
        isTrue,
      );
    });

    test('returns false when isConnected but room is not connected', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: channelId,
      );
      expect(
        voiceSessionHasLiveConnection(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: false,
        ),
        isFalse,
      );
    });

    test('returns false for a different channel', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: 'other-channel',
      );
      expect(
        voiceSessionHasLiveConnection(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
        ),
        isFalse,
      );
    });

    test('returns false when room handle is missing', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: channelId,
      );
      expect(
        voiceSessionHasLiveConnection(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: false,
          isRoomConnected: true,
        ),
        isFalse,
      );
    });
  });

  group('voiceSessionIsJoinInFlight', () {
    test('returns true while isConnecting to the channel', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnecting: true,
        channelId: channelId,
      );
      expect(
        voiceSessionIsJoinInFlight(
          state: state,
          channelId: channelId,
          expectedChannelId: channelId,
          liveKitConnectInFlight: false,
        ),
        isTrue,
      );
    });

    test('returns true while LiveKit connect is in flight', () {
      const VoiceSessionState state = VoiceSessionState(channelId: channelId);
      expect(
        voiceSessionIsJoinInFlight(
          state: state,
          channelId: channelId,
          expectedChannelId: channelId,
          liveKitConnectInFlight: true,
        ),
        isTrue,
      );
    });

    test('returns false for a different channel', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnecting: true,
        channelId: 'other-channel',
      );
      expect(
        voiceSessionIsJoinInFlight(
          state: state,
          channelId: channelId,
          expectedChannelId: channelId,
          liveKitConnectInFlight: true,
        ),
        isFalse,
      );
    });
  });

  group('shouldSkipVoiceChannelJoin', () {
    test('skips duplicate join while already live-connected', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: channelId,
      );
      expect(
        shouldSkipVoiceChannelJoin(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
          expectedChannelId: channelId,
          liveKitConnectInFlight: false,
        ),
        isTrue,
      );
    });

    test('skips duplicate join while connect is in progress', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnecting: true,
        channelId: channelId,
      );
      expect(
        shouldSkipVoiceChannelJoin(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: false,
          isRoomConnected: false,
          expectedChannelId: channelId,
          liveKitConnectInFlight: false,
        ),
        isTrue,
      );
    });

    test('allows join when stale session has no room', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: channelId,
      );
      expect(
        shouldSkipVoiceChannelJoin(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: false,
          isRoomConnected: false,
          expectedChannelId: null,
          liveKitConnectInFlight: false,
        ),
        isFalse,
      );
    });
  });

  group('shouldClearStaleVoiceSession', () {
    test('does not clear while join is in flight', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnecting: true,
        channelId: channelId,
      );
      expect(
        shouldClearStaleVoiceSession(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: false,
          isRoomConnected: false,
          expectedChannelId: channelId,
          liveKitConnectInFlight: false,
        ),
        isFalse,
      );
    });

    test('clears when connected flag is set but room is gone', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: channelId,
      );
      expect(
        shouldClearStaleVoiceSession(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: false,
          isRoomConnected: false,
          expectedChannelId: null,
          liveKitConnectInFlight: false,
        ),
        isTrue,
      );
    });

    test('clears when room exists but transport is disconnected', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: channelId,
      );
      expect(
        shouldClearStaleVoiceSession(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: false,
          expectedChannelId: null,
          liveKitConnectInFlight: false,
        ),
        isTrue,
      );
    });

    test('does not clear a healthy live connection', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: channelId,
      );
      expect(
        shouldClearStaleVoiceSession(
          state: state,
          channelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
          expectedChannelId: channelId,
          liveKitConnectInFlight: false,
        ),
        isFalse,
      );
    });
  });

  group('shouldIgnoreVoiceServerUpdateWhenConnected', () {
    test('ignores server update for an active live session', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: channelId,
      );
      expect(
        shouldIgnoreVoiceServerUpdateWhenConnected(
          state: state,
          resolvedChannelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: true,
        ),
        isTrue,
      );
    });

    test('accepts server update when transport is not live', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnected: true,
        channelId: channelId,
      );
      expect(
        shouldIgnoreVoiceServerUpdateWhenConnected(
          state: state,
          resolvedChannelId: channelId,
          hasLiveKitRoom: true,
          isRoomConnected: false,
        ),
        isFalse,
      );
    });
  });

  group('isDuplicateVoiceServerUpdateInFlight', () {
    test('detects repeated server update for the same in-flight connect', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnecting: true,
        channelId: channelId,
        activeConnectionId: 'conn-1',
        voiceServerEndpoint: 'wss://livekit.example',
      );
      expect(
        isDuplicateVoiceServerUpdateInFlight(
          state: state,
          connectionId: 'conn-1',
          endpoint: 'wss://livekit.example',
        ),
        isTrue,
      );
    });

    test('does not treat a new connection id as duplicate', () {
      const VoiceSessionState state = VoiceSessionState(
        isConnecting: true,
        channelId: channelId,
        activeConnectionId: 'conn-1',
        voiceServerEndpoint: 'wss://livekit.example',
      );
      expect(
        isDuplicateVoiceServerUpdateInFlight(
          state: state,
          connectionId: 'conn-2',
          endpoint: 'wss://livekit.example',
        ),
        isFalse,
      );
    });
  });
}
