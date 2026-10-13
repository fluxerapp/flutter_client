import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_channel_join_guard.dart';

bool isServerInitiatedVoiceMove({
  required VoiceSessionState state,
  required String? expectedGuildId,
  required String? expectedChannelId,
  required String? incomingGuildId,
  required String? incomingChannelId,
}) {
  if (expectedChannelId == null || incomingChannelId == null) {
    return false;
  }
  if (incomingChannelId == expectedChannelId) {
    return false;
  }
  if (expectedGuildId == null || incomingGuildId != expectedGuildId) {
    return false;
  }
  if (!state.isConnected || state.isConnecting) {
    return false;
  }
  return state.channelId == expectedChannelId;
}

VoiceSessionState voiceSessionStateAfterServerMove({
  required VoiceSessionState state,
  required String channelId,
}) {
  return state.copyWith(
    isConnecting: true,
    isConnected: false,
    clearError: true,
    channelId: channelId,
    clearActiveConnectionId: true,
  );
}

bool shouldSendVoiceDisconnectForReplacedRoom({
  required VoiceSessionState state,
  required String incomingConnectionId,
}) {
  final String? replacedConnectionId = state.activeConnectionId;
  return replacedConnectionId != null &&
      replacedConnectionId != incomingConnectionId;
}

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
