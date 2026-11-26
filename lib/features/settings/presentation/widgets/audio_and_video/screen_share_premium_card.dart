import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/icons/plutonium_product_icon.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceScreenSharePremiumCard extends StatelessWidget {
  const VoiceScreenSharePremiumCard({
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback onPressed;

  static const double _kPadding = 14;
  static const double _kIconSize = 18;
  static const double _kHeaderGap = 8;
  static const double _kDescriptionGap = 12;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final TextStyle base = context.textStyles.bodySmall.copyWith(fontSize: 14);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: context.layout.radiusLg,
        border: Border.all(color: colors.backgroundModifierAccent),
      ),
      child: Padding(
        padding: const EdgeInsets.all(_kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              spacing: _kHeaderGap,
              children: <Widget>[
                PlutoniumProductIcon(
                  size: _kIconSize,
                  color: colors.textPrimary,
                ),
                Flexible(
                  child: Text(
                    title,
                    style: base.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: _kHeaderGap),
            Text(
              description,
              style: base.copyWith(color: colors.textPrimaryMuted),
            ),
            const SizedBox(height: _kDescriptionGap),
            FluxerButton.secondary(
              label: buttonLabel,
              size: FluxerButtonSize.small,
              fitContent: true,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
