import 'package:flutter/material.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class VoiceChannelJoinButton extends StatelessWidget {
  const VoiceChannelJoinButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FluxerButton.primary(
      onPressed: onPressed,
      label: FluxerLocalizations.of(context).voiceChannelJoin,
    );
  }
}
