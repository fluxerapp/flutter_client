const Duration kVoiceAudioRouteRecoveryDebounce = Duration(milliseconds: 800);

bool shouldRecoverVoiceAudioOnDeviceChange({
  required bool isConnected,
  required bool hasLiveKitRoom,
}) {
  return isConnected && hasLiveKitRoom;
}

bool shouldRefreshMicrophoneOnAudioRouteChange({
  required bool isIos,
  required bool isForeground,
}) {
  if (!isIos) {
    return true;
  }
  return isForeground;
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
