import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';

const Set<UserSettingsSection> userSettingsStaffOnlySections = {
  UserSettingsSection.developerTools,
  UserSettingsSection.limitsConfig,
  UserSettingsSection.featureFlags,
};

bool isUserSettingsStaffOnlySection(UserSettingsSection section) {
  return userSettingsStaffOnlySections.contains(section);
}

bool get isUserSettingsStaffOnlyNavAvailable => AppBuildConfig.isCanary;

bool isUserSettingsStaffOnlySectionAvailable(UserSettingsSection section) {
  if (!isUserSettingsStaffOnlySection(section)) {
    return true;
  }
  return isUserSettingsStaffOnlyNavAvailable;
}
