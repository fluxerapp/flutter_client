import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

enum CreateDmRestriction { unclaimed, unverified }

CreateDmRestriction? getCreateDmRestriction(UserSettingsViewState settings) {
  if (!settings.isProfileLoaded) {
    return null;
  }
  if (!settings.isClaimed) {
    return CreateDmRestriction.unclaimed;
  }
  if (!settings.isVerified) {
    return CreateDmRestriction.unverified;
  }
  return null;
}
