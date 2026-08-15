import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

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
