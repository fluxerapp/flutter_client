import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_style.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreHero extends StatelessWidget {
  const PremiumStoreHero({
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.priceLoading,
    super.key,
  });

  final String? monthlyPrice;
  final String? yearlyPrice;
  final bool priceLoading;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool wide = constraints.maxWidth >= 560;
        final double crownWidth = wide ? 180 : 112;
        final textStyles = context.textStyles;
        final bool showPrices =
            !priceLoading && monthlyPrice != null && yearlyPrice != null;
        return Column(
          children: [
            Image.asset(
              'assets/images/promo-plutonium-crown.png',
              width: crownWidth,
              fit: BoxFit.contain,
              excludeFromSemantics: true,
            ),
            if (priceLoading) ...[
              SizedBox(height: wide ? 16 : 12),
              const FluxerLoadingSpinner(),
            ] else if (showPrices) ...[
              SizedBox(height: wide ? 16 : 12),
              Semantics(
                label: l10n.storePlutoniumPriceLine(
                  monthlyPrice!,
                  yearlyPrice!,
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      monthlyPrice!,
                      style: textStyles.channelName.copyWith(
                        color: PremiumStoreStyle.ink,
                      ),
                    ),
                    Text(
                      l10n.storePlutoniumPriceOr,
                      style: textStyles.bodySmall.copyWith(
                        color: PremiumStoreStyle.inkMuted,
                      ),
                    ),
                    Text(
                      yearlyPrice!,
                      style: textStyles.channelName.copyWith(
                        color: PremiumStoreStyle.ink,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
