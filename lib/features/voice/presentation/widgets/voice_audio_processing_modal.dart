import 'package:flutter/material.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_audio_processing_options.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Future<void> showVoiceAudioProcessingModal(BuildContext context) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerModal.show<void>(
    context,
    title: l10n.voiceAudioProcessing,
    builder: (BuildContext context, VoidCallback close) {
      return const VoiceAudioProcessingOptions();
    },
  );
}
