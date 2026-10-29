import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_hero_art.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_style.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreHero extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool selfHosted = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.selfHosted),
    );
    final String heroAsset = plutoniumStoreHeroArtAsset(selfHosted: selfHosted);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool wide = constraints.maxWidth >= 560;
        final double artWidth = wide ? 180 : 112;
        final textStyles = context.textStyles;
        final bool showPrices =
            !priceLoading && monthlyPrice != null && yearlyPrice != null;
        return Column(
          children: [
            Image.asset(
              heroAsset,
              width: artWidth,
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
                      style: textStyles.channelName.copyWith(color: style.ink),
                    ),
                    Text(
                      l10n.storePlutoniumPriceOr,
                      style: textStyles.bodySmall.copyWith(
                        color: style.inkMuted,
                      ),
                    ),
                    Text(
                      yearlyPrice!,
                      style: textStyles.channelName.copyWith(color: style.ink),
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
