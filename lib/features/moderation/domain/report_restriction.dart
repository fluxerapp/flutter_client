import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';

enum ReportRestriction { unclaimed, unverified }

ReportRestriction? getReportRestriction(UserSettingsViewState settings) {
  if (!settings.isProfileLoaded) {
    return null;
  }
  if (!settings.hasVerifiedEmail) {
    return ReportRestriction.unclaimed;
  }
  if (!settings.verified) {
    return ReportRestriction.unverified;
  }
  return null;
}
