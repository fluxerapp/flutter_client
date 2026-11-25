import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';

String voiceParticipantSemanticsLabel({
  required FluxerLocalizations l10n,
  required String display,
  required VoiceState voice,
  required bool speaking,
}) {
  return <String>[
    display,
    if (speaking) l10n.voiceParticipantSpeaking,
    if (voice.mute || voice.suppress)
      l10n.voiceParticipantTooltipCommunityMuted
    else if (voice.selfMute)
      l10n.voiceParticipantTooltipMuted,
    if (voice.deaf)
      l10n.voiceParticipantTooltipCommunityDeafened
    else if (voice.selfDeaf)
      l10n.voiceParticipantTooltipDeafened,
  ].join(', ');
}
