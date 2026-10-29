import 'package:fluxer_app/features/profile/domain/profile_badge_variant_field.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const String kVisionaryProfileBadgeKey = 'visionary';
const String kVisionaryNumberProfileBadgeKey = 'visionary_number';

class ProfileBadgeSettingsVariantConfig {
  const ProfileBadgeSettingsVariantConfig({
    required this.field,
    required this.label,
    this.description,
  });

  final ProfileBadgeVariantField field;
  final String Function(FluxerLocalizations l10n, String premiumProductName)
  label;
  final String Function(FluxerLocalizations l10n, String premiumProductName)?
  description;
}

final Map<String, List<ProfileBadgeSettingsVariantConfig>>
profileBadgeSettingsVariantConfigs =
    <String, List<ProfileBadgeSettingsVariantConfig>>{
      kVisionaryProfileBadgeKey: <ProfileBadgeSettingsVariantConfig>[
        ProfileBadgeSettingsVariantConfig(
          field: ProfileBadgeVariantField.premiumBadgeMasked,
          label: (l10n, _) => l10n.maskVisionaryAsSubscription,
          description: (l10n, _) => l10n.maskVisionaryDescription,
        ),
        ProfileBadgeSettingsVariantConfig(
          field: ProfileBadgeVariantField.premiumBadgeTimestampHidden,
          label: (l10n, premium) => l10n.hidePlutoniumPurchaseDate,
          description: (l10n, premium) => l10n.hidePurchaseDateDescription,
        ),
      ],
      'plutonium': <ProfileBadgeSettingsVariantConfig>[
        ProfileBadgeSettingsVariantConfig(
          field: ProfileBadgeVariantField.premiumBadgeTimestampHidden,
          label: (l10n, premium) => l10n.hidePlutoniumPurchaseDate,
          description: (l10n, premium) => l10n.hidePurchaseDateDescription,
        ),
      ],
      'premium': <ProfileBadgeSettingsVariantConfig>[
        ProfileBadgeSettingsVariantConfig(
          field: ProfileBadgeVariantField.premiumBadgeTimestampHidden,
          label: (l10n, premium) => l10n.hidePlutoniumPurchaseDate,
          description: (l10n, premium) => l10n.hidePurchaseDateDescription,
        ),
      ],
      'operator_pass': <ProfileBadgeSettingsVariantConfig>[
        ProfileBadgeSettingsVariantConfig(
          field: ProfileBadgeVariantField.operatorPassBadgeTimestampHidden,
          label: (l10n, _) => l10n.operatorPassHideDate(l10n.operatorPassName),
        ),
        ProfileBadgeSettingsVariantConfig(
          field: ProfileBadgeVariantField.operatorPassBadgeCountHidden,
          label: (l10n, _) => l10n.operatorPassHideCount,
        ),
      ],
    };

bool profileBadgeSettingsVisionaryNumberHasNoEffect({
  required String badgeKey,
  required Set<String> hiddenBadgeKeys,
  required UserSettingsViewState state,
}) {
  return badgeKey == kVisionaryNumberProfileBadgeKey &&
      (hiddenBadgeKeys.contains(kVisionaryProfileBadgeKey) ||
          state.effectivePremiumBadgeMasked);
}

List<ProfileBadgeSettingsVariantConfig> profileBadgeSettingsVariantsForBadge({
  required String badgeKey,
  required bool badgeShown,
}) {
  if (!badgeShown) {
    return const <ProfileBadgeSettingsVariantConfig>[];
  }
  return profileBadgeSettingsVariantConfigs[badgeKey] ??
      const <ProfileBadgeSettingsVariantConfig>[];
}

bool effectiveProfileBadgeVariantValue(
  UserSettingsViewState state,
  ProfileBadgeVariantField field,
) {
  return switch (field) {
    ProfileBadgeVariantField.premiumBadgeTimestampHidden =>
      state.effectivePremiumBadgeTimestampHidden,
    ProfileBadgeVariantField.premiumBadgeMasked =>
      state.effectivePremiumBadgeMasked,
    ProfileBadgeVariantField.operatorPassBadgeTimestampHidden =>
      state.effectiveOperatorPassBadgeTimestampHidden,
    ProfileBadgeVariantField.operatorPassBadgeCountHidden =>
      state.effectiveOperatorPassBadgeCountHidden,
  };
}
