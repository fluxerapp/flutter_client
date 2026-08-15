import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:material_ui/material_ui.dart';

class PremiumPricingCard extends StatelessWidget {
  const PremiumPricingCard({
    required this.title,
    required this.price,
    required this.period,
    required this.buttonLabel,
    required this.onSelect,
    this.badge,
    this.isPopular = false,
    this.isLoading = false,
    this.disabled = false,
    super.key,
  });

  final String title;
  final String price;
  final String period;
  final String buttonLabel;
  final VoidCallback onSelect;
  final String? badge;
  final bool isPopular;
  final bool isLoading;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final bool isDisabled = disabled || isLoading;
    final Color titleColor = isPopular
        ? colors.textOnBrandPrimary
        : colors.textPrimary;
    final Color mutedColor = isPopular
        ? colors.textOnBrandPrimary.withValues(alpha: 0.8)
        : colors.textPrimaryMuted;
    final Color cardColor = isPopular
        ? colors.brandPrimary
        : colors.backgroundSecondary;
    final Color borderColor = isPopular
        ? colors.brandPrimary
        : colors.backgroundHeaderSecondary;

    return Opacity(
      opacity: isDisabled ? 0.6 : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: layout.radiusXl,
          border: Border.all(color: borderColor, width: isPopular ? 2 : 1),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(layout.s6),
          child: Column(
            children: [
              if (isPopular)
                Container(
                  margin: EdgeInsets.only(bottom: layout.s4),
                  padding: EdgeInsets.symmetric(
                    horizontal: layout.s4,
                    vertical: layout.s1_5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: layout.radiusFull,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1A000000),
                        blurRadius: 15,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Text(
                    badge ?? '',
                    style: textStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: colors.brandPrimary,
                    ),
                  ),
                )
              else if (badge != null)
                Padding(
                  padding: EdgeInsets.only(bottom: layout.s4),
                  child: _Badge(label: badge!, isOnBrand: false),
                )
              else
                SizedBox(height: layout.s8),
              Text(
                title,
                style: textStyles.heading.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: titleColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: layout.s3),
              Text(
                price,
                style: textStyles.heading.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                  color: titleColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: layout.s1),
              Text(
                period,
                style: textStyles.bodySmall.copyWith(
                  fontSize: 14,
                  color: mutedColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: layout.s4),
              if (badge != null && isPopular)
                _Badge(label: badge!, isOnBrand: true),
              SizedBox(height: layout.s4),
              SizedBox(
                width: double.infinity,
                child: isPopular
                    ? FluxerButton.inverted(
                        label: buttonLabel,
                        isLoading: isLoading,
                        onPressed: isDisabled ? null : onSelect,
                      )
                    : FluxerButton.primary(
                        label: buttonLabel,
                        isLoading: isLoading,
                        onPressed: isDisabled ? null : onSelect,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.isOnBrand});

  final String label;
  final bool isOnBrand;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: layout.s3 + 2,
        vertical: layout.s1,
      ),
      decoration: BoxDecoration(
        borderRadius: layout.radiusFull,
        border: Border.all(
          color: isOnBrand
              ? colors.textOnBrandPrimary.withValues(alpha: 0.55)
              : colors.brandPrimary.withValues(alpha: 0.4),
        ),
        color: isOnBrand
            ? colors.textOnBrandPrimary.withValues(alpha: 0.12)
            : colors.brandPrimary.withValues(alpha: 0.12),
      ),
      child: Text(
        label,
        style: context.textStyles.bodySmall.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 12.8,
          letterSpacing: 0.16,
          color: isOnBrand ? colors.textOnBrandPrimary : colors.brandPrimary,
        ),
      ),
    );
  }
}
