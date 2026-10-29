import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';

const Duration kVoiceAudioRouteRecoveryDebounce = Duration(milliseconds: 800);

bool shouldRecoverVoiceAudioOnDeviceChange({
  required bool isConnected,
  required bool hasLiveKitRoom,
}) {
  return isConnected && hasLiveKitRoom;
}

bool isExplicitVoiceDeviceId(String deviceId) {
  return deviceId != kDefaultVoiceDeviceId && deviceId.isNotEmpty;
}

bool shouldReapplyMobileVoiceOutputOnDeviceChange({
  required bool isIos,
  required bool isAndroid,
  required bool outputChanged,
}) {
  if (!outputChanged) {
    return false;
  }
  if (isAndroid) {
    return false;
  }
  return isIos;
}

bool shouldReapplyDesktopAudioOutputOnDeviceChange({
  required bool isDesktop,
  required bool outputChanged,
  required String configuredOutputDeviceId,
  required Set<String> availableOutputDeviceIds,
}) {
  if (!isDesktop || !outputChanged) {
    return false;
  }
  if (!isExplicitVoiceDeviceId(configuredOutputDeviceId)) {
    return false;
  }
  return availableOutputDeviceIds.contains(configuredOutputDeviceId);
}

bool shouldClearMissingDesktopOutputDevice({
  required bool isDesktop,
  required bool outputChanged,
  required String configuredOutputDeviceId,
  required Set<String> availableOutputDeviceIds,
}) {
  if (!isDesktop || !outputChanged) {
    return false;
  }
  if (!isExplicitVoiceDeviceId(configuredOutputDeviceId)) {
    return false;
  }
  return !availableOutputDeviceIds.contains(configuredOutputDeviceId);
}

bool shouldRefreshMicrophoneOnAudioRouteChange({
  required bool isIos,
  required bool isAndroid,
  required bool isForeground,
  required String configuredInputDeviceId,
  required Set<String> availableInputDeviceIds,
}) {
  if (isAndroid) {
    return false;
  }
  if (isIos) {
    return isForeground;
  }
  if (!isExplicitVoiceDeviceId(configuredInputDeviceId)) {
    return false;
  }
  return !availableInputDeviceIds.contains(configuredInputDeviceId);
}

bool didAudioDeviceIdsChange({
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

bool didAudioInputDeviceIdsChange({
  required Set<String>? previous,
  required Set<String> current,
}) => didAudioDeviceIdsChange(previous: previous, current: current);

bool didAudioOutputDeviceIdsChange({
  required Set<String>? previous,
  required Set<String> current,
}) => didAudioDeviceIdsChange(previous: previous, current: current);
