import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_channel_join_guard.dart';

/// LiveKit endpoint change while already connected on the same channel (no E2EE
/// key on the server update).
bool isVoiceServerRegionChange({
  required VoiceSessionState state,
  required String resolvedChannelId,
  required bool hasLiveKitRoom,
  required bool isRoomConnected,
  required String incomingEndpoint,
  required String incomingToken,
  required String? incomingChannelId,
  required String? e2eeKey,
}) {
  if (!voiceSessionHasLiveConnection(
    state: state,
    channelId: resolvedChannelId,
    hasLiveKitRoom: hasLiveKitRoom,
    isRoomConnected: isRoomConnected,
  )) {
    return false;
  }
  final bool isChannelMove =
      incomingChannelId != null && incomingChannelId != resolvedChannelId;
  if (isChannelMove) {
    return false;
  }
  final String? currentEndpoint = state.voiceServerEndpoint;
  if (currentEndpoint == null || currentEndpoint.isEmpty) {
    return false;
  }
  if (incomingEndpoint.isEmpty || incomingToken.isEmpty) {
    return false;
  }
  if (incomingEndpoint == currentEndpoint) {
    return false;
  }
  if (e2eeKey != null && e2eeKey.isNotEmpty) {
    return false;
  }
  return true;
}

bool shouldIgnoreVoiceServerUpdateForStableSession({
  required VoiceSessionState state,
  required String resolvedChannelId,
  required bool hasLiveKitRoom,
  required bool isRoomConnected,
  required String incomingEndpoint,
  required String incomingToken,
  required String? incomingChannelId,
  required String? e2eeKey,
}) {
  if (isVoiceServerRegionChange(
    state: state,
    resolvedChannelId: resolvedChannelId,
    hasLiveKitRoom: hasLiveKitRoom,
    isRoomConnected: isRoomConnected,
    incomingEndpoint: incomingEndpoint,
    incomingToken: incomingToken,
    incomingChannelId: incomingChannelId,
    e2eeKey: e2eeKey,
  )) {
    return false;
  }
  return shouldIgnoreVoiceServerUpdateWhenConnected(
    state: state,
    resolvedChannelId: resolvedChannelId,
    hasLiveKitRoom: hasLiveKitRoom,
    isRoomConnected: isRoomConnected,
  );
}
