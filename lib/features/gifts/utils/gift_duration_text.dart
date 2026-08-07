import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_dart/export.dart';

const String kPremiumProductName = 'Plutonium';

String giftDurationText(FluxerLocalizations l10n, GiftCodeResponse gift) {
  if (gift.durationQuantity == 0) {
    return l10n.embedGiftVisionaryLifetime(kPremiumProductName);
  }
  return switch (gift.durationType) {
    GiftCodeResponseDurationTypeDurationType.days => l10n.embedGiftDurationDays(
      gift.durationQuantity,
      kPremiumProductName,
    ),
    GiftCodeResponseDurationTypeDurationType.weeks =>
      l10n.embedGiftDurationWeeks(gift.durationQuantity, kPremiumProductName),
    GiftCodeResponseDurationTypeDurationType.months =>
      l10n.embedGiftDurationMonths(gift.durationQuantity, kPremiumProductName),
    GiftCodeResponseDurationTypeDurationType.years =>
      l10n.embedGiftDurationYears(gift.durationQuantity, kPremiumProductName),
    GiftCodeResponseDurationTypeDurationType.$unknown =>
      l10n.embedGiftDurationMonths(gift.durationQuantity, kPremiumProductName),
  };
}

String giftCreatorDisplayName(UserPartialResponse creator) {
  return resolveDisplayName(
    username: creator.username,
    globalName: creator.globalName,
  );
}
