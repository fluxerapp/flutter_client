import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/features/voice/domain/voice_connect_failed_target.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  VoiceState voiceState({
    required String userId,
    required String channelId,
    required String? guildId,
    String? connectionId,
  }) => VoiceState(
    userId: userId,
    channelId: channelId,
    guildId: guildId,
    connectionId: connectionId,
  );

  group('otherUserConnectionsInChannel', () {
    test('returns other connections for the same user in the channel', () {
      final Map<String, VoiceState> map = <String, VoiceState>{
        'conn-desktop': voiceState(
          userId: 'self',
          channelId: 'voice-1',
          guildId: 'g1',
          connectionId: 'conn-desktop',
        ),
        'conn-mobile': voiceState(
          userId: 'self',
          channelId: 'voice-1',
          guildId: 'g1',
          connectionId: 'conn-mobile',
        ),
      };

      final List<VoiceState> others = otherUserConnectionsInChannel(
        voiceStates: map,
        guildId: 'g1',
        channelId: 'voice-1',
        currentUserId: 'self',
        localConnectionId: 'conn-mobile',
      );

      expect(others, hasLength(1));
      expect(others.single.connectionId, 'conn-desktop');
    });

    test('ignores connections in other channels', () {
      final Map<String, VoiceState> map = <String, VoiceState>{
        'conn-desktop': voiceState(
          userId: 'self',
          channelId: 'voice-2',
          guildId: 'g1',
          connectionId: 'conn-desktop',
        ),
      };

      final List<VoiceState> others = otherUserConnectionsInChannel(
        voiceStates: map,
        guildId: 'g1',
        channelId: 'voice-1',
        currentUserId: 'self',
      );

      expect(others, isEmpty);
    });

    test('ignores other users in the same channel', () {
      final Map<String, VoiceState> map = <String, VoiceState>{
        'conn-peer': voiceState(
          userId: 'peer',
          channelId: 'voice-1',
          guildId: 'g1',
          connectionId: 'conn-peer',
        ),
      };

      final List<VoiceState> others = otherUserConnectionsInChannel(
        voiceStates: map,
        guildId: 'g1',
        channelId: 'voice-1',
        currentUserId: 'self',
      );

      expect(others, isEmpty);
    });

    test('matches null guild only for null-guild voice states', () {
      final Map<String, VoiceState> map = <String, VoiceState>{
        'conn-dm': voiceState(
          userId: 'self',
          channelId: 'dm-voice',
          guildId: null,
          connectionId: 'conn-dm',
        ),
        'conn-guild': voiceState(
          userId: 'self',
          channelId: 'dm-voice',
          guildId: 'g1',
          connectionId: 'conn-guild',
        ),
      };

      final List<VoiceState> dmOthers = otherUserConnectionsInChannel(
        voiceStates: map,
        guildId: null,
        channelId: 'dm-voice',
        currentUserId: 'self',
        localConnectionId: 'conn-mobile',
      );
      final List<VoiceState> guildOthers = otherUserConnectionsInChannel(
        voiceStates: map,
        guildId: 'g1',
        channelId: 'dm-voice',
        currentUserId: 'self',
        localConnectionId: 'conn-mobile',
      );

      expect(dmOthers, hasLength(1));
      expect(dmOthers.single.connectionId, 'conn-dm');
      expect(guildOthers, hasLength(1));
      expect(guildOthers.single.connectionId, 'conn-guild');
    });
  });

  group('partitionSelfVoiceConnectionsForJoin', () {
    VoiceState selfConnection({
      required String connectionId,
      required String sessionId,
      bool isMobile = true,
    }) => VoiceState.fromJson(<String, dynamic>{
      'guild_id': 'g1',
      'channel_id': 'voice-1',
      'user_id': 'self',
      'connection_id': connectionId,
      'session_id': sessionId,
      'member': null,
      'mute': false,
      'deaf': false,
      'self_mute': false,
      'self_deaf': false,
      'self_video': false,
      'self_stream': false,
      'is_mobile': isMobile,
      'suppress': false,
      'viewer_stream_keys': <String>[],
      'e2ee_capable': false,
      'version': 0,
    });

    test('treats a connection from this gateway session as stale', () {
      final SelfVoiceConnectionsForJoin partitioned =
          partitionSelfVoiceConnectionsForJoin(
            voiceStates: <String, VoiceState>{
              'conn-stale': selfConnection(
                connectionId: 'conn-stale',
                sessionId: 'session-this',
              ),
            },
            guildId: 'g1',
            channelId: 'voice-1',
            currentUserId: 'self',
            gatewaySessionId: 'session-this',
            session: const VoiceSessionState(),
          );

      expect(partitioned.stale.single.connectionId, 'conn-stale');
      expect(partitioned.otherDevices, isEmpty);
    });

    test('asks about a second phone from another gateway session', () {
      final SelfVoiceConnectionsForJoin partitioned =
          partitionSelfVoiceConnectionsForJoin(
            voiceStates: <String, VoiceState>{
              'conn-tablet': selfConnection(
                connectionId: 'conn-tablet',
                sessionId: 'session-tablet',
                isMobile: isFluxerMobileOs,
              ),
            },
            guildId: 'g1',
            channelId: 'voice-1',
            currentUserId: 'self',
            gatewaySessionId: 'session-this',
            session: const VoiceSessionState(),
          );

      expect(partitioned.stale, isEmpty);
      expect(partitioned.otherDevices.single.connectionId, 'conn-tablet');
    });

    test('asks about another session even after a failed join there', () {
      final SelfVoiceConnectionsForJoin partitioned =
          partitionSelfVoiceConnectionsForJoin(
            voiceStates: <String, VoiceState>{
              'conn-desktop': selfConnection(
                connectionId: 'conn-desktop',
                sessionId: 'session-desktop',
                isMobile: false,
              ),
              'conn-failed': selfConnection(
                connectionId: 'conn-failed',
                sessionId: 'session-this',
              ),
            },
            guildId: 'g1',
            channelId: 'voice-1',
            currentUserId: 'self',
            gatewaySessionId: 'session-this',
            session: const VoiceSessionState(
              connectFailed: true,
              connectFailedTarget: VoiceConnectFailedTarget(
                channelId: 'voice-1',
                guildId: 'g1',
              ),
            ),
          );

      expect(partitioned.stale.single.connectionId, 'conn-failed');
      expect(partitioned.otherDevices.single.connectionId, 'conn-desktop');
    });

    test('asks about every connection without a gateway session id', () {
      final SelfVoiceConnectionsForJoin partitioned =
          partitionSelfVoiceConnectionsForJoin(
            voiceStates: <String, VoiceState>{
              'conn-1': selfConnection(
                connectionId: 'conn-1',
                sessionId: 'session-1',
              ),
            },
            guildId: 'g1',
            channelId: 'voice-1',
            currentUserId: 'self',
            gatewaySessionId: null,
            session: const VoiceSessionState(),
          );

      expect(partitioned.stale, isEmpty);
      expect(partitioned.otherDevices.single.connectionId, 'conn-1');
    });
  });
}
