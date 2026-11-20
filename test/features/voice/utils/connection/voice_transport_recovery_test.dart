import 'package:fluxer_app/features/voice/utils/connection/transport_recovery.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:test/test.dart';

void main() {
  group('voiceTransportLossAction', () {
    test('leaves for deliberate or terminal disconnects', () {
      for (final DisconnectReason reason in <DisconnectReason>[
        DisconnectReason.clientInitiated,
        DisconnectReason.duplicateIdentity,
        DisconnectReason.participantRemoved,
        DisconnectReason.roomDeleted,
      ]) {
        expect(
          voiceTransportLossAction(reason),
          VoiceTransportLossAction.leave,
          reason: reason.name,
        );
      }
    });

    test('recovers from network and server-side drops', () {
      for (final DisconnectReason? reason in <DisconnectReason?>[
        null,
        DisconnectReason.unknown,
        DisconnectReason.serverShutdown,
        DisconnectReason.signalingConnectionFailure,
        DisconnectReason.reconnectAttemptsExceeded,
        DisconnectReason.disconnected,
        DisconnectReason.stateMismatch,
      ]) {
        expect(
          voiceTransportLossAction(reason),
          VoiceTransportLossAction.recover,
          reason: reason?.name ?? 'null',
        );
      }
    });

    test('recovery schedule stays within about two minutes', () {
      final Duration total = kVoiceTransportRecoveryDelays.fold(
        Duration.zero,
        (Duration sum, Duration delay) => sum + delay,
      );
      expect(total, lessThanOrEqualTo(const Duration(minutes: 2)));
    });
  });

  group('shouldDeferVoiceServerUpdateWhileReconnecting', () {
    bool decide({
      bool reconnecting = true,
      String? sessionChannelId = 'c1',
      String? activeConnectionId = 'conn',
      String? activeEndpoint = 'wss://a',
      String incomingConnectionId = 'conn',
      String incomingEndpoint = 'wss://a',
    }) {
      return shouldDeferVoiceServerUpdateWhileReconnecting(
        sessionChannelId: sessionChannelId,
        resolvedChannelId: 'c1',
        roomReconnecting: reconnecting,
        activeConnectionId: activeConnectionId,
        activeEndpoint: activeEndpoint,
        incomingConnectionId: incomingConnectionId,
        incomingEndpoint: incomingEndpoint,
      );
    }

    test('defers a repeat update while LiveKit is reconnecting', () {
      expect(decide(), isTrue);
    });

    test('does not defer when the room is not reconnecting', () {
      expect(decide(reconnecting: false), isFalse);
    });

    test('does not defer for a new endpoint or connection', () {
      expect(decide(incomingEndpoint: 'wss://b'), isFalse);
      expect(decide(incomingConnectionId: 'other'), isFalse);
      expect(decide(activeConnectionId: null), isFalse);
    });

    test('does not defer for another channel', () {
      expect(decide(sessionChannelId: 'c2'), isFalse);
    });
  });
}
