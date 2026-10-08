import 'dart:math' as math;

import 'package:fluxer_app/features/gifts/utils/gift_duration_text.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:intl/intl.dart';

const Set<String> _stripeTwoDecimalWholeUnitCurrencies = {'ISK', 'HUF', 'UGX'};

String? formatPremiumMinorUnitPrice({
  required int? amountMinor,
  required String? currency,
  required String locale,
}) {
  if (amountMinor == null || currency == null || currency.isEmpty) {
    return null;
  }
  final bool wholeUnitDisplay = _stripeTwoDecimalWholeUnitCurrencies.contains(
    currency.toUpperCase(),
  );
  final int fractionDigits = wholeUnitDisplay
      ? 0
      : NumberFormat.simpleCurrency(
              name: currency,
              locale: locale,
            ).decimalDigits ??
            2;
  final int exponent = wholeUnitDisplay ? 2 : fractionDigits;
  final double major = amountMinor / math.pow(10, exponent).toDouble();
  return NumberFormat.simpleCurrency(
    name: currency,
    locale: locale,
    decimalDigits: fractionDigits,
  ).format(major);
}

String formatPremiumPriceLabel({
  required int? amountMinor,
  required String? currency,
  required String locale,
  String placeholder = '...',
}) {
  final String? formatted = formatPremiumMinorUnitPrice(
    amountMinor: amountMinor,
    currency: currency,
    locale: locale,
  );
  return formatted ?? placeholder;
}

String formatGiftMetadataDuration(
  GiftCodeMetadataResponse gift,
  FluxerLocalizations l10n,
) {
  if (gift.durationQuantity == 0) {
    return l10n.embedGiftVisionaryLifetime(kPremiumProductName);
  }
  return switch (gift.durationType) {
    GiftCodeDurationTypeSchema.days => l10n.embedGiftDurationDays(
      gift.durationQuantity,
      kPremiumProductName,
    ),
    GiftCodeDurationTypeSchema.weeks => l10n.embedGiftDurationWeeks(
      gift.durationQuantity,
      kPremiumProductName,
    ),
    GiftCodeDurationTypeSchema.months => l10n.embedGiftDurationMonths(
      gift.durationQuantity,
      kPremiumProductName,
    ),
    GiftCodeDurationTypeSchema.years => l10n.embedGiftDurationYears(
      gift.durationQuantity,
      kPremiumProductName,
    ),
    GiftCodeDurationTypeSchema.$unknown => l10n.embedGiftDurationMonths(
      gift.durationQuantity,
      kPremiumProductName,
    ),
  };
}

String formatPremiumShortDate(DateTime date, String locale) {
  return DateFormat.yMMMd(locale).format(date.toLocal());
}

String? priceIdsCurrencyCode(PremiumCurrency currency) {
  return currency.isEmpty ? null : currency;
}

String? giftCurrencyCode(PremiumCurrency? currency) {
  if (currency == null || currency.isEmpty) {
    return null;
  }
  return currency;
}
