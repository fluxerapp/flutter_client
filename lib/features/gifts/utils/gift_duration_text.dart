import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_dart/export.dart';

const String kPremiumProductName = 'Plutonium';

String giftDurationText(FluxerLocalizations l10n, GiftCodeResponse gift) {
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

String giftCreatorDisplayName(UserPartialResponse creator) {
  return resolveDisplayName(
    username: creator.username,
    globalName: creator.globalName,
  );
}
