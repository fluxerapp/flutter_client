import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';

bool voiceSessionHasLiveConnection({
  required VoiceSessionState state,
  required String channelId,
  required bool hasLiveKitRoom,
  required bool isRoomConnected,
}) {
  if (!state.isConnected || state.channelId != channelId) {
    return false;
  }
  if (!hasLiveKitRoom) {
    return false;
  }
  return isRoomConnected;
}

bool voiceSessionIsJoinInFlight({
  required VoiceSessionState state,
  required String channelId,
  required String? expectedChannelId,
  required bool liveKitConnectInFlight,
}) {
  if (state.channelId != channelId) {
    return false;
  }
  if (state.isConnecting) {
    return true;
  }
  if (expectedChannelId == channelId && liveKitConnectInFlight) {
    return true;
  }
  return false;
}

bool shouldSkipVoiceChannelJoin({
  required VoiceSessionState state,
  required String channelId,
  required bool hasLiveKitRoom,
  required bool isRoomConnected,
  required String? expectedChannelId,
  required bool liveKitConnectInFlight,
}) {
  if (voiceSessionHasLiveConnection(
    state: state,
    channelId: channelId,
    hasLiveKitRoom: hasLiveKitRoom,
    isRoomConnected: isRoomConnected,
  )) {
    return true;
  }
  if (voiceSessionIsJoinInFlight(
    state: state,
    channelId: channelId,
    expectedChannelId: expectedChannelId,
    liveKitConnectInFlight: liveKitConnectInFlight,
  )) {
    return true;
  }
  return false;
}

bool shouldClearStaleVoiceSession({
  required VoiceSessionState state,
  required String channelId,
  required bool hasLiveKitRoom,
  required bool isRoomConnected,
  required String? expectedChannelId,
  required bool liveKitConnectInFlight,
}) {
  if (shouldSkipVoiceChannelJoin(
    state: state,
    channelId: channelId,
    hasLiveKitRoom: hasLiveKitRoom,
    isRoomConnected: isRoomConnected,
    expectedChannelId: expectedChannelId,
    liveKitConnectInFlight: liveKitConnectInFlight,
  )) {
    return false;
  }
  if (state.channelId != channelId) {
    return false;
  }
  if (!state.isConnected && !state.isConnecting) {
    return false;
  }
  if (!hasLiveKitRoom) {
    return true;
  }
  return !isRoomConnected;
}

bool shouldIgnoreVoiceServerUpdateWhenConnected({
  required VoiceSessionState state,
  required String resolvedChannelId,
  required bool hasLiveKitRoom,
  required bool isRoomConnected,
}) {
  return voiceSessionHasLiveConnection(
    state: state,
    channelId: resolvedChannelId,
    hasLiveKitRoom: hasLiveKitRoom,
    isRoomConnected: isRoomConnected,
  );
}

bool isDuplicateVoiceServerUpdateInFlight({
  required VoiceSessionState state,
  required String connectionId,
  required String endpoint,
}) {
  return !state.isConnected &&
      state.isConnecting &&
      connectionId.isNotEmpty &&
      state.activeConnectionId != null &&
      connectionId == state.activeConnectionId &&
      state.voiceServerEndpoint != null &&
      state.voiceServerEndpoint == endpoint;
}
