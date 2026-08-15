import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class VoiceChannelJoinButton extends StatelessWidget {
  const VoiceChannelJoinButton({
    required this.onPressed,
    this.disabledTooltip,
    this.isLoading = false,
    this.label,
    super.key,
  });

  final VoidCallback? onPressed;
  final String? disabledTooltip;
  final bool isLoading;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Widget button = FluxerButton.primary(
      onPressed: onPressed,
      isLoading: isLoading,
      label: label ?? l10n.voiceChannelJoin,
    );
    if (onPressed != null || disabledTooltip == null) {
      return button;
    }
    return Tooltip(message: disabledTooltip, child: button);
  }
}
