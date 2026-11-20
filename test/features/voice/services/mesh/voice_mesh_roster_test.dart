import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_peer.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_transport.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  const String channelId = 'c1';
  const String self = 'conn-self';

  VoiceState voice(String connectionId, {bool p2p = true, String? channel}) {
    return VoiceState(
      userId: 'u-$connectionId',
      channelId: channel ?? channelId,
      connectionId: connectionId,
      p2p: p2p,
    );
  }

  group('voiceMeshRosterTargets', () {
    test('returns null when our own state is missing', () {
      expect(
        voiceMeshRosterTargets(
          states: <VoiceState>[voice('conn-a')],
          channelId: channelId,
          connectionId: self,
        ),
        isNull,
      );
    });

    test('returns null for an empty map after a gateway READY clear', () {
      expect(
        voiceMeshRosterTargets(
          states: const <VoiceState>[],
          channelId: channelId,
          connectionId: self,
        ),
        isNull,
      );
    });

    test('returns no peers once our own state leaves P2P', () {
      expect(
        voiceMeshRosterTargets(
          states: <VoiceState>[voice(self, p2p: false), voice('conn-a')],
          channelId: channelId,
          connectionId: self,
        ),
        isEmpty,
      );
    });

    test('returns P2P peers in the same channel only', () {
      final Map<String, VoiceState>? targets = voiceMeshRosterTargets(
        states: <VoiceState>[
          voice(self),
          voice('conn-a'),
          voice('conn-b', p2p: false),
          voice('conn-c', channel: 'other'),
        ],
        channelId: channelId,
        connectionId: self,
      );
      expect(targets?.keys, <String>['conn-a']);
    });
  });

  group('voiceMeshPeerRetryDelay', () {
    test('backs off and caps at the last delay', () {
      expect(voiceMeshPeerRetryDelay(0), kVoiceMeshPeerRetryDelays.first);
      expect(voiceMeshPeerRetryDelay(1), kVoiceMeshPeerRetryDelays[1]);
      expect(voiceMeshPeerRetryDelay(99), kVoiceMeshPeerRetryDelays.last);
      expect(voiceMeshPeerRetryDelay(-1), kVoiceMeshPeerRetryDelays.first);
    });
  });
}
