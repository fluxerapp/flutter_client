import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceCallStatusPill extends StatelessWidget {
  const VoiceCallStatusPill({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundFloating,
        borderRadius: context.layout.radiusFull,
        border: Border.all(color: context.colors.backgroundTertiary),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.layout.s3,
          vertical: context.layout.s2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: context.layout.s2,
          children: <Widget>[
            FluxerLoadingSpinner(
              color: context.colors.textPrimary,
              size: FluxerLoadingSpinnerSize.small,
            ),
            Text(
              label,
              style: context.textStyles.smallText.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
