import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceAdvancedVideoSettingsRow extends StatelessWidget {
  const VoiceAdvancedVideoSettingsRow({
    required this.label,
    required this.buttonLabel,
    required this.onPressed,
    super.key,
  });

  final String label;
  final String buttonLabel;
  final VoidCallback onPressed;

  static const double _kMinHeight = 44;
  static const double _kGap = 16;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: _kMinHeight),
      child: Row(
        spacing: _kGap,
        children: <Widget>[
          Expanded(
            child: Text(
              label,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 20 / 14,
              ),
            ),
          ),
          FluxerButton.secondary(
            label: buttonLabel,
            icon: PhosphorIconsBold.gear,
            fitContent: true,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
