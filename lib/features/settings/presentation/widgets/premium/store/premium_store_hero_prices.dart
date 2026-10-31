import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreHeroPrices extends StatelessWidget {
  const PremiumStoreHeroPrices({
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.priceLoading,
    this.yearlySavingsPercent,
    super.key,
  });

  final String? monthlyPrice;
  final String? yearlyPrice;
  final bool priceLoading;
  final int? yearlySavingsPercent;

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final textStyles = context.textStyles;
    if (priceLoading) {
      return const FluxerLoadingSpinner();
    }
    if (monthlyPrice == null || yearlyPrice == null) {
      return const SizedBox.shrink();
    }
    final String? savings = yearlySavingsPercent == null
        ? null
        : l10n.storePlutoniumSavePercent(yearlySavingsPercent!);
    return Semantics(
      label: l10n.storePlutoniumPriceLine(monthlyPrice!, yearlyPrice!),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool row = constraints.maxWidth >= 420;
          final TextStyle amount = textStyles.channelName.copyWith(
            color: style.ink,
            fontWeight: FontWeight.w700,
          );
          final TextStyle period = textStyles.bodySmall.copyWith(
            color: style.ink,
            fontWeight: FontWeight.w700,
          );
          final TextStyle muted = textStyles.bodySmall.copyWith(
            color: style.ink,
          );
          final Widget monthly = _PriceItem(
            amount: monthlyPrice!,
            suffix: l10n.storePlutoniumMonthSuffix,
            amountStyle: amount,
            periodStyle: period,
          );
          final Widget yearly = Stack(
            clipBehavior: Clip.none,
            children: [
              _PriceItem(
                amount: yearlyPrice!,
                suffix: l10n.storePlutoniumYearSuffix,
                amountStyle: amount,
                periodStyle: period,
              ),
              if (savings != null)
                Positioned(
                  left: row ? null : 0,
                  right: row ? -4 : 0,
                  top: row ? -18 : null,
                  bottom: row ? null : 36,
                  child: Text(
                    savings,
                    textAlign: row ? TextAlign.center : TextAlign.start,
                    style: textStyles.bodySmall.copyWith(
                      color: style.accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          );
          if (row) {
            return Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 8,
              children: [
                monthly,
                Text(l10n.storePlutoniumPriceOr, style: muted),
                yearly,
              ],
            );
          }
          return Column(
            children: [
              monthly,
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l10n.storePlutoniumPriceOr, style: muted),
                  const SizedBox(width: 8),
                  yearly,
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PriceItem extends StatelessWidget {
  const _PriceItem({
    required this.amount,
    required this.suffix,
    required this.amountStyle,
    required this.periodStyle,
  });

  final String amount;
  final String suffix;
  final TextStyle amountStyle;
  final TextStyle periodStyle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: amount, style: amountStyle),
          TextSpan(text: suffix, style: periodStyle),
        ],
      ),
    );
  }
}

class PremiumStoreHeroPricesFromStore extends ConsumerWidget {
  const PremiumStoreHeroPricesFromStore({
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.priceLoading,
    required this.monthlyRawPrice,
    required this.yearlyRawPrice,
    super.key,
  });

  final String? monthlyPrice;
  final String? yearlyPrice;
  final bool priceLoading;
  final double monthlyRawPrice;
  final double yearlyRawPrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PremiumStoreHeroPrices(
      monthlyPrice: monthlyPrice,
      yearlyPrice: yearlyPrice,
      priceLoading: priceLoading,
      yearlySavingsPercent: plutoniumYearlySavingsPercent(
        monthlyRawPrice: monthlyRawPrice,
        yearlyRawPrice: yearlyRawPrice,
      ),
    );
  }
}
