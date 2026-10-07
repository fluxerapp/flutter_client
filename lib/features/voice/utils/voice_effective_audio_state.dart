import 'package:fluxer_dart/gateway.dart';

class EffectiveAudioState {
  const EffectiveAudioState({
    required this.selfMute,
    required this.selfDeaf,
    required this.effectiveMute,
    required this.effectiveDeaf,
    required this.micShouldPublish,
  });

  final bool selfMute;
  final bool selfDeaf;
  final bool effectiveMute;
  final bool effectiveDeaf;
  final bool micShouldPublish;
}

EffectiveAudioState computeEffectiveAudioState({
  required bool selfMute,
  required bool selfDeaf,
  bool serverMute = false,
  bool serverDeaf = false,
}) {
  final bool resolvedServerMute = serverMute;
  final bool resolvedServerDeaf = serverDeaf;
  final bool effectiveMute =
      resolvedServerMute || resolvedServerDeaf || selfMute || selfDeaf;
  final bool effectiveDeaf = resolvedServerDeaf || selfDeaf;
  return EffectiveAudioState(
    selfMute: selfMute,
    selfDeaf: selfDeaf,
    effectiveMute: effectiveMute,
    effectiveDeaf: effectiveDeaf,
    micShouldPublish: !effectiveMute,
  );
}

EffectiveAudioState effectiveAudioStateFromVoiceState({
  required VoiceState? voiceState,
  required bool fallbackSelfMute,
  required bool fallbackSelfDeaf,
}) {
  if (voiceState == null) {
    return computeEffectiveAudioState(
      selfMute: fallbackSelfMute,
      selfDeaf: fallbackSelfDeaf,
    );
  }
  return computeEffectiveAudioState(
    selfMute: voiceState.selfMute,
    selfDeaf: voiceState.selfDeaf,
    serverMute: voiceState.mute || voiceState.suppress,
    serverDeaf: voiceState.deaf,
  );
}

bool isTrackPublishFailure(Object error) {
  final String message = error.toString();
  return message.contains('TrackPublishException') ||
      message.contains('Failed to publish track');
}
