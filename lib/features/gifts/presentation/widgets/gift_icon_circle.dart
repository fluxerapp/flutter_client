import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const List<Color> kGiftIconGradientColors = [
  Color(0xFF9B59FF),
  Color(0xFFFF5CA8),
];

class GiftIconCircle extends StatelessWidget {
  const GiftIconCircle({
    required this.size,
    this.redeemed = false,
    this.error = false,
    super.key,
  });

  final double size;
  final bool redeemed;
  final bool error;

  @override
  Widget build(BuildContext context) {
    final iconSize = size * 0.5;
    if (error) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: context.colors.backgroundTertiary,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: PhosphorIcon(
            PhosphorIconsFill.question,
            size: iconSize,
            color: context.colors.textTertiaryMuted,
          ),
        ),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: redeemed
            ? null
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: kGiftIconGradientColors,
              ),
        color: redeemed ? context.colors.backgroundTertiary : null,
      ),
      child: Center(
        child: PhosphorIcon(
          PhosphorIconsFill.gift,
          size: iconSize,
          color: redeemed
              ? context.colors.textTertiaryMuted
              : context.colors.textOnBrandPrimary,
        ),
      ),
    );
  }
}
