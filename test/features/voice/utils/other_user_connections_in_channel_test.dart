import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
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
}
