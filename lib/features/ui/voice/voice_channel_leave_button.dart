import 'package:flutter/material.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class VoiceChannelLeaveButton extends StatelessWidget {
  const VoiceChannelLeaveButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FluxerButton.dangerSecondary(
      onPressed: onPressed,
      label: FluxerLocalizations.of(context).voiceChannelLeave,
    );
  }
}
