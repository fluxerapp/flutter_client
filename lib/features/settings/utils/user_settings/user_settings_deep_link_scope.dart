import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/material_ui.dart';

class UserSettingsDeepLinkScope extends InheritedWidget {
  const UserSettingsDeepLinkScope({
    required this.settingsTab,
    required this.pageSection,
    required this.isTouchPrimary,
    required super.child,
    super.key,
  });

  final String settingsTab;
  final UserSettingsSection pageSection;
  final bool isTouchPrimary;

  static UserSettingsDeepLinkScope? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UserSettingsDeepLinkScope>();
  }

  @override
  bool updateShouldNotify(UserSettingsDeepLinkScope oldWidget) {
    return settingsTab != oldWidget.settingsTab ||
        pageSection != oldWidget.pageSection ||
        isTouchPrimary != oldWidget.isTouchPrimary;
  }
}

String? userSettingsDeepLinkTabForPage(UserSettingsSection section) {
  switch (section) {
    case UserSettingsSection.profile:
      return 'my_profile';
    case UserSettingsSection.securityLogin:
      return 'account_security';
    case UserSettingsSection.authorizedApps:
      return 'authorized_apps';
    case UserSettingsSection.blockedUsers:
      return 'blocked_users';
    case UserSettingsSection.linkedDevices:
      return 'devices';
    case UserSettingsSection.privacyDashboard:
      return 'privacy_safety';
    case UserSettingsSection.lookAndFeel:
    case UserSettingsSection.themeColors:
      return 'appearance';
    case UserSettingsSection.accessibility:
      return 'accessibility';
    case UserSettingsSection.chat:
      return 'chat_settings';
    case UserSettingsSection.audioAndVideo:
      return 'voice_video';
    case UserSettingsSection.notifications:
      return 'notifications';
    case UserSettingsSection.languageAndTime:
      return 'language';
    case UserSettingsSection.shortcuts:
      return 'shortcuts';
    case UserSettingsSection.fluxerPlutonium:
      return 'plutonium';
    case UserSettingsSection.giftsAndCodes:
      return 'gift_inventory';
    case UserSettingsSection.connections:
      return 'linked_accounts';
    case UserSettingsSection.applications:
      return 'applications';
    case UserSettingsSection.advanced:
      return 'advanced_settings';
    case UserSettingsSection.developerTools:
      return 'client_developer_settings';
    case UserSettingsSection.defaultApps:
      return 'default_apps';
    case UserSettingsSection.appIcon:
      return 'app_icon';
    case UserSettingsSection.limitsConfig:
    case UserSettingsSection.featureFlags:
    case UserSettingsSection.appLicenses:
      return null;
  }
}
