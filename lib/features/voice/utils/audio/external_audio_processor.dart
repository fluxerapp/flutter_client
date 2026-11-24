import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';

final List<(String, RegExp)> _kProcessors = <(String, RegExp)>[
  (
    'NVIDIA Broadcast',
    RegExp(r'nvidia\s*broadcast|rtx\s*voice', caseSensitive: false),
  ),
  ('Krisp', RegExp(r'\bkrisp\b', caseSensitive: false)),
  (
    'Elgato Wave Link',
    RegExp(r'wave\s*link|elgato\s*wave', caseSensitive: false),
  ),
  ('VoiceMeeter', RegExp('voicemeeter|vb-audio', caseSensitive: false)),
  (
    'SteelSeries Sonar',
    RegExp(
      r'steelseries\s*sonar|sonar\s*-\s*(mic|stream|chat)',
      caseSensitive: false,
    ),
  ),
  (
    'Razer Synapse',
    RegExp(r'razer\s*virtual|synapse\s*virtual', caseSensitive: false),
  ),
];

String? detectExternalAudioProcessor(String label) {
  for (final (String name, RegExp pattern) in _kProcessors) {
    if (pattern.hasMatch(label)) {
      return name;
    }
  }
  return null;
}

String? externalAudioProcessorForDevice({
  required String deviceId,
  required List<VoiceMediaDeviceOption> devices,
}) {
  for (final VoiceMediaDeviceOption device in devices) {
    if (device.deviceId == deviceId) {
      return detectExternalAudioProcessor(device.label);
    }
  }
  return null;
}
