import 'package:fluxer_app/features/settings/domain/user_settings_nav_group.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String userSettingsSectionLabel(
  FluxerLocalizations l10n,
  UserSettingsSection section,
) {
  switch (section) {
    case UserSettingsSection.profile:
      return l10n.userSettingsNavProfile;
    case UserSettingsSection.securityLogin:
      return l10n.userSettingsNavSecurityLogin;
    // case UserSettingsSection.fluxerPlutonium:
    //   return l10n.userSettingsNavFluxerPlutonium;
    // case UserSettingsSection.giftsAndCodes:
    //   return l10n.userSettingsNavGiftsAndCodes;
    case UserSettingsSection.privacyDashboard:
      return l10n.userSettingsNavPrivacyDashboard;
    case UserSettingsSection.authorizedApps:
      return l10n.userSettingsNavAuthorizedApps;
    case UserSettingsSection.blockedUsers:
      return l10n.userSettingsNavBlockedUsers;
    case UserSettingsSection.linkedDevices:
      return l10n.userSettingsNavLinkedDevices;
    case UserSettingsSection.connections:
      return l10n.userSettingsNavConnections;
    case UserSettingsSection.lookAndFeel:
      return l10n.userSettingsNavLookAndFeel;
    case UserSettingsSection.accessibility:
      return l10n.userSettingsNavAccessibility;
    case UserSettingsSection.chat:
      return l10n.userSettingsNavChat;
    case UserSettingsSection.audioAndVideo:
      return l10n.userSettingsNavAudioAndVideo;
    case UserSettingsSection.keybinds:
      return 'Keybinds';
    case UserSettingsSection.notifications:
      return l10n.userSettingsNavNotifications;
    case UserSettingsSection.languageAndTime:
      return l10n.userSettingsNavLanguageAndTime;
    case UserSettingsSection.advanced:
      return l10n.userSettingsNavAdvanced;
    case UserSettingsSection.applications:
      return l10n.userSettingsNavApplications;
    case UserSettingsSection.developerTools:
      return l10n.userSettingsNavDeveloperTools;
    case UserSettingsSection.limitsConfig:
      return l10n.userSettingsNavLimitsConfig;
    case UserSettingsSection.featureFlags:
      return l10n.userSettingsNavFeatureFlags;
    case UserSettingsSection.whatsNew:
      return l10n.userSettingsNavWhatsNew;
  }
}

String userSettingsNavGroupLabel(
  FluxerLocalizations l10n,
  UserSettingsNavGroup group,
) {
  switch (group) {
    case UserSettingsNavGroup.yourAccount:
      return l10n.userSettingsGroupYourAccount;
    case UserSettingsNavGroup.application:
      return l10n.userSettingsGroupApplication;
    case UserSettingsNavGroup.developer:
      return l10n.userSettingsGroupDeveloper;
    case UserSettingsNavGroup.staffOnly:
      return l10n.userSettingsGroupStaffOnly;
  }
}
