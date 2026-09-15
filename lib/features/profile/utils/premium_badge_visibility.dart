import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';

class PremiumBadgeVisibility {
  const PremiumBadgeVisibility({
    required this.hasPlutonium,
    required this.isLifetimePlutonium,
    required this.premiumSince,
    required this.premiumLifetimeSequence,
  });

  final bool hasPlutonium;
  final bool isLifetimePlutonium;
  final String? premiumSince;
  final int? premiumLifetimeSequence;

  factory PremiumBadgeVisibility.fromSettings(UserSettingsViewState settings) {
    final bool hidden = settings.effectivePremiumBadgeHidden;
    final bool show = settings.isPremium && !hidden;
    final bool masked = settings.effectivePremiumBadgeMasked;
    final bool timestampHidden = settings.effectivePremiumBadgeTimestampHidden;
    final bool sequenceHidden = settings.effectivePremiumBadgeSequenceHidden;
    final bool showLifetime = show && settings.hasLifetimePremium && !masked;
    return PremiumBadgeVisibility(
      hasPlutonium: show,
      isLifetimePlutonium: showLifetime,
      premiumSince: show && !timestampHidden ? settings.premiumSince : null,
      premiumLifetimeSequence: showLifetime && !sequenceHidden
          ? settings.premiumLifetimeSequence
          : null,
    );
  }

  factory PremiumBadgeVisibility.fromProfile({
    required UserPremiumTypes? premiumType,
    required String? premiumSince,
    required int? premiumLifetimeSequence,
  }) {
    final bool hasPlutonium =
        premiumType != null && premiumType != UserPremiumTypes.none;
    final bool isLifetime = premiumType == UserPremiumTypes.lifetime;
    return PremiumBadgeVisibility(
      hasPlutonium: hasPlutonium,
      isLifetimePlutonium: isLifetime,
      premiumSince: premiumSince,
      premiumLifetimeSequence: isLifetime ? premiumLifetimeSequence : null,
    );
  }
}
