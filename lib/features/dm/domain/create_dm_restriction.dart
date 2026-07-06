import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

enum CreateDmRestriction { unclaimed, unverified }

CreateDmRestriction? getCreateDmRestriction(UserSettingsViewState settings) {
  if (!settings.hasVerifiedEmail) {
    return CreateDmRestriction.unclaimed;
  }
  if (!settings.verified) {
    return CreateDmRestriction.unverified;
  }
  return null;
}
