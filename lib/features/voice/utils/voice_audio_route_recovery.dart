const Duration kVoiceAudioRouteRecoveryDebounce = Duration(milliseconds: 400);

bool shouldRecoverVoiceAudioOnDeviceChange({
  required bool isConnected,
  required bool hasLiveKitRoom,
}) {
  return isConnected && hasLiveKitRoom;
}

bool didAudioInputDeviceIdsChange({
  required Set<String>? previous,
  required Set<String> current,
}) {
  if (previous == null) {
    return false;
  }
  if (previous.length != current.length) {
    return true;
  }
  return previous.any((String deviceId) => !current.contains(deviceId));
}
