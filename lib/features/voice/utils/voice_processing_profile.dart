import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';

class ResolvedVoiceProcessing {
  const ResolvedVoiceProcessing({
    required this.useNoiseFilter,
    required this.echoCancellation,
    required this.noiseSuppression,
    required this.autoGainControl,
  });

  final bool useNoiseFilter;
  final bool echoCancellation;
  final bool noiseSuppression;
  final bool autoGainControl;

  bool get bypassNoiseFilter => !useNoiseFilter;
}

ResolvedVoiceProcessing resolveVoiceProcessing({
  required VoiceSettingsState settings,
  required bool noiseFilterSupported,
}) {
  switch (settings.voiceProcessingMode) {
    case VoiceProcessingMode.studio:
      return const ResolvedVoiceProcessing(
        useNoiseFilter: false,
        echoCancellation: false,
        noiseSuppression: false,
        autoGainControl: false,
      );
    case VoiceProcessingMode.custom:
      return _resolveCustomProfile(settings, noiseFilterSupported);
    case VoiceProcessingMode.voice:
      return ResolvedVoiceProcessing(
        useNoiseFilter: noiseFilterSupported,
        echoCancellation: true,
        noiseSuppression: false,
        autoGainControl: false,
      );
  }
}

ResolvedVoiceProcessing _resolveCustomProfile(
  VoiceSettingsState settings,
  bool noiseFilterSupported,
) {
  final NoiseSuppressionTier tier = settings.noiseSuppressionTier;
  final bool useEnhanced =
      tier == NoiseSuppressionTier.enhanced && noiseFilterSupported;
  final bool useStandardNs =
      tier == NoiseSuppressionTier.standard && !useEnhanced;
  final bool autoGain = !useEnhanced && settings.autoGainControl;
  return ResolvedVoiceProcessing(
    useNoiseFilter: useEnhanced,
    echoCancellation: settings.echoCancellation,
    noiseSuppression: useStandardNs,
    autoGainControl: autoGain,
  );
}
