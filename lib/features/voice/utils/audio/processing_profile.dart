import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';

class ResolvedVoiceProcessing {
  const ResolvedVoiceProcessing({
    required this.backend,
    required this.echoCancellation,
    required this.autoGainControl,
  });

  final NoiseSuppressionBackend backend;
  final bool echoCancellation;
  final bool autoGainControl;

  bool get noiseSuppression => backend == NoiseSuppressionBackend.standard;
}

NoiseSuppressionBackend requestedNoiseSuppressionBackend(
  VoiceSettingsState settings,
) {
  return switch (settings.voiceProcessingMode) {
    VoiceProcessingMode.studio => NoiseSuppressionBackend.none,
    VoiceProcessingMode.voice => kDefaultNoiseSuppressionBackend,
    VoiceProcessingMode.custom => selectedNoiseSuppressionBackend(settings),
  };
}

NoiseSuppressionBackend selectedNoiseSuppressionBackend(
  VoiceSettingsState settings,
) => settings.noiseSuppressionBackend ?? kDefaultNoiseSuppressionBackend;

ResolvedVoiceProcessing resolveVoiceProcessing({
  required VoiceSettingsState settings,
  Set<NoiseSuppressionBackend> unavailableBackends =
      const <NoiseSuppressionBackend>{},
}) {
  final NoiseSuppressionBackend requested = requestedNoiseSuppressionBackend(
    settings,
  );
  final NoiseSuppressionBackend backend =
      unavailableBackends.contains(requested)
      ? NoiseSuppressionBackend.standard
      : requested;
  return switch (settings.voiceProcessingMode) {
    VoiceProcessingMode.studio => const ResolvedVoiceProcessing(
      backend: NoiseSuppressionBackend.none,
      echoCancellation: false,
      autoGainControl: false,
    ),
    VoiceProcessingMode.custom => ResolvedVoiceProcessing(
      backend: backend,
      echoCancellation: settings.echoCancellation,
      autoGainControl: settings.autoGainControl,
    ),
    VoiceProcessingMode.voice => ResolvedVoiceProcessing(
      backend: backend,
      echoCancellation: true,
      autoGainControl: settings.autoGainControl,
    ),
  };
}

bool voiceProcessingActive({
  required VoiceProcessingMode mode,
  required NoiseSuppressionBackend backend,
}) {
  return mode == VoiceProcessingMode.voice ||
      (mode == VoiceProcessingMode.custom &&
          backend != NoiseSuppressionBackend.none);
}

bool voiceCaptureRestartRequired({
  required VoiceSettingsState previousSettings,
  required ResolvedVoiceProcessing previous,
  required VoiceSettingsState nextSettings,
  required ResolvedVoiceProcessing next,
}) {
  bool isStudio(VoiceSettingsState settings) =>
      settings.voiceProcessingMode == VoiceProcessingMode.studio;
  return previousSettings.inputDeviceId != nextSettings.inputDeviceId ||
      isStudio(previousSettings) != isStudio(nextSettings) ||
      previous.echoCancellation != next.echoCancellation ||
      previous.noiseSuppression != next.noiseSuppression ||
      previous.autoGainControl != next.autoGainControl;
}
