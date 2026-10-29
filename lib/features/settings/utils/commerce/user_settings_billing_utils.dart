import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';

const Set<UserSettingsSection> userSettingsBillingSections = {
  UserSettingsSection.fluxerPlutonium,
  UserSettingsSection.giftsAndCodes,
};

bool isUserSettingsBillingSection(UserSettingsSection section) {
  return userSettingsBillingSections.contains(section);
}

bool get isOssWebCheckoutBuild => AppBuildConfig.isOssWebCheckout;

bool isUserSettingsBillingSectionAvailable(
  UserSettingsSection section, {
  required bool showBilling,
  bool showGifts = true,
}) {
  if (section == UserSettingsSection.giftsAndCodes) {
    return showBilling && showGifts;
  }
  if (!isUserSettingsBillingSection(section)) {
    return true;
  }
  return showBilling;
}
