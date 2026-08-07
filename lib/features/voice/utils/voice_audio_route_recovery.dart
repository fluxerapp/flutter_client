const Duration kVoiceAudioRouteRecoveryDebounce = Duration(milliseconds: 400);

bool shouldRecoverVoiceAudioOnDeviceChange({
  required bool isConnected,
  required bool hasLiveKitRoom,
}) {
  return isConnected && hasLiveKitRoom;
}
