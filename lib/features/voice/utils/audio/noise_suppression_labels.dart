import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/audio/processing_profile.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String noiseSuppressionBackendLabel(
  FluxerLocalizations l10n,
  NoiseSuppressionBackend backend,
) {
  return switch (backend) {
    NoiseSuppressionBackend.none => l10n.audioAndVideoNoiseSuppressionNoneLabel,
    NoiseSuppressionBackend.standard => 'WebRTC',
    NoiseSuppressionBackend.gate => l10n.audioAndVideoNoiseSuppressionGateLabel,
    NoiseSuppressionBackend.rnnoise => 'RNNoise',
  };
}

String noiseSuppressionBackendDescription(
  FluxerLocalizations l10n,
  NoiseSuppressionBackend backend,
) {
  return switch (backend) {
    NoiseSuppressionBackend.none =>
      l10n.audioAndVideoNoiseSuppressionNoneDescription,
    NoiseSuppressionBackend.standard =>
      l10n.audioAndVideoNoiseSuppressionStandardDescription,
    NoiseSuppressionBackend.gate =>
      l10n.audioAndVideoNoiseSuppressionGateDescription,
    NoiseSuppressionBackend.rnnoise =>
      l10n.audioAndVideoNoiseSuppressionRnnoiseDescription,
  };
}

String? noiseSuppressionFallbackMessage(
  FluxerLocalizations l10n, {
  required VoiceSettingsState settings,
  required Set<NoiseSuppressionBackend> unavailableBackends,
}) {
  final NoiseSuppressionBackend requested = requestedNoiseSuppressionBackend(
    settings,
  );
  final NoiseSuppressionBackend effective = resolveVoiceProcessing(
    settings: settings,
    unavailableBackends: unavailableBackends,
  ).backend;
  if (requested == effective) {
    return null;
  }
  return l10n.audioAndVideoNoiseSuppressionFallback(
    noiseSuppressionBackendLabel(l10n, requested),
    noiseSuppressionBackendLabel(l10n, effective),
  );
}

String voiceAudioProcessingTooltip(
  FluxerLocalizations l10n, {
  required VoiceProcessingMode mode,
  required NoiseSuppressionBackend backend,
}) {
  return switch (mode) {
    VoiceProcessingMode.studio => l10n.voiceAudioProcessingDirectInput,
    VoiceProcessingMode.voice => l10n.voiceAudioProcessingFocusedVoice,
    VoiceProcessingMode.custom when backend.isEnhanced =>
      l10n.voiceAudioProcessingCustomEnhanced,
    VoiceProcessingMode.custom when backend == NoiseSuppressionBackend.none =>
      l10n.voiceAudioProcessingCustomNoSuppression,
    VoiceProcessingMode.custom => l10n.voiceAudioProcessingCustom,
  };
}
