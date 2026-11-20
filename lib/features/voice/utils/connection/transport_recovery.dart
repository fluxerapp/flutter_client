import 'package:livekit_client/livekit_client.dart';

enum VoiceTransportLossAction { leave, recover }

const List<Duration> kVoiceTransportRecoveryDelays = <Duration>[
  Duration(seconds: 1),
  Duration(seconds: 2),
  Duration(seconds: 5),
  Duration(seconds: 10),
  Duration(seconds: 20),
  Duration(seconds: 30),
];

const Duration kVoiceTransportRecoveryAttemptTimeout = Duration(seconds: 20);

VoiceTransportLossAction voiceTransportLossAction(DisconnectReason? reason) {
  return switch (reason) {
    DisconnectReason.clientInitiated ||
    DisconnectReason.duplicateIdentity ||
    DisconnectReason.participantRemoved ||
    DisconnectReason.roomDeleted => VoiceTransportLossAction.leave,
    _ => VoiceTransportLossAction.recover,
  };
}

bool shouldDeferVoiceServerUpdateWhileReconnecting({
  required String? sessionChannelId,
  required String resolvedChannelId,
  required bool roomReconnecting,
  required String? activeConnectionId,
  required String? activeEndpoint,
  required String incomingConnectionId,
  required String incomingEndpoint,
}) {
  if (!roomReconnecting) {
    return false;
  }
  if (sessionChannelId != resolvedChannelId) {
    return false;
  }
  if (activeConnectionId == null ||
      activeConnectionId != incomingConnectionId) {
    return false;
  }
  return activeEndpoint != null && activeEndpoint == incomingEndpoint;
}
