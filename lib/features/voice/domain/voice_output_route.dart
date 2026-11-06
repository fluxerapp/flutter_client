enum VoiceOutputRoute { speaker, earpiece, headset, bluetooth }

const Set<VoiceOutputRoute> kPhoneVoiceOutputRoutes = <VoiceOutputRoute>{
  VoiceOutputRoute.speaker,
  VoiceOutputRoute.earpiece,
};

VoiceOutputRoute voiceOutputRouteFromName(String? name) {
  for (final VoiceOutputRoute route in VoiceOutputRoute.values) {
    if (route.name == name) {
      return route;
    }
  }
  return VoiceOutputRoute.speaker;
}

VoiceOutputRoute voiceOutputRouteFromSpeakerPreference({
  required bool? preferSpeaker,
}) {
  if (preferSpeaker == false) {
    return VoiceOutputRoute.earpiece;
  }
  return VoiceOutputRoute.speaker;
}

VoiceOutputRoute resolveVoiceOutputRoute({
  required VoiceOutputRoute preference,
  required Set<VoiceOutputRoute> available,
}) {
  if (available.contains(preference)) {
    return preference;
  }
  if (available.contains(VoiceOutputRoute.speaker)) {
    return VoiceOutputRoute.speaker;
  }
  if (available.contains(VoiceOutputRoute.headset)) {
    return VoiceOutputRoute.headset;
  }
  return VoiceOutputRoute.earpiece;
}

VoiceOutputRoute resolveVoiceCallOutputRoute({
  required VoiceOutputRoute preference,
  required VoiceOutputRoute? override,
  required Set<VoiceOutputRoute> available,
}) {
  if (override != null && available.contains(override)) {
    return override;
  }
  if (available.contains(VoiceOutputRoute.bluetooth)) {
    return VoiceOutputRoute.bluetooth;
  }
  if (available.contains(VoiceOutputRoute.headset)) {
    return VoiceOutputRoute.headset;
  }
  if (isBuiltInVoiceOutputRoute(preference) && available.contains(preference)) {
    return preference;
  }
  if (available.contains(VoiceOutputRoute.speaker)) {
    return VoiceOutputRoute.speaker;
  }
  return VoiceOutputRoute.earpiece;
}

bool isBuiltInVoiceOutputRoute(VoiceOutputRoute route) {
  return route == VoiceOutputRoute.speaker ||
      route == VoiceOutputRoute.earpiece;
}

bool didConnectExternalVoiceOutputRoute({
  required Set<VoiceOutputRoute>? previous,
  required Set<VoiceOutputRoute> current,
}) {
  if (previous == null) {
    return false;
  }
  return current.any(
    (VoiceOutputRoute route) =>
        !isBuiltInVoiceOutputRoute(route) && !previous.contains(route),
  );
}

bool liveKitPrefersSpeaker(VoiceOutputRoute route) {
  return route == VoiceOutputRoute.speaker;
}
