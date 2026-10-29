enum VoiceOutputRoute { speaker, earpiece, headset }

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

bool liveKitPrefersSpeaker(VoiceOutputRoute route) {
  return route == VoiceOutputRoute.speaker;
}
