import 'package:fluxer_app/core/deep_links/deep_link_path_policy.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';

final RegExp _safeSettingsParamRegex = RegExp(r'^[A-Za-z0-9_-]+$');

const Set<String> _userSettingsTabTypes = {
  'my_profile',
  'account_security',
  'plutonium',
  'gift_inventory',
  'privacy_safety',
  'authorized_apps',
  'blocked_users',
  'devices',
  'appearance',
  'accessibility',
  'chat_settings',
  'voice_video',
  'notifications',
  'desktop_settings',
  'advanced_settings',
  'client_developer_settings',
  'embed_debugger',
  'applications',
  'component_gallery',
  'language',
  'keybinds',
  'expression_packs',
  'linked_accounts',
};

class UserSettingsDeepLinkTarget {
  const UserSettingsDeepLinkTarget({this.section});

  final UserSettingsSection? section;
}

bool isUserSettingsDeepLinkPath(Uri uri) {
  return normalizeDeepLinkPath(normalizeAppProtocolDeepLinkUri(uri).path) ==
      userSettingsDeepLinkPath;
}

UserSettingsDeepLinkTarget? parseUserSettingsDeepLink(Uri uri) {
  if (!isUserSettingsDeepLinkPath(uri)) {
    return null;
  }
  final String? tab = uri.queryParameters['tab'];
  if (tab == null || !_isUserSettingsTabType(tab)) {
    return const UserSettingsDeepLinkTarget();
  }
  final UserSettingsSection? nestedTabSection = switch (tab) {
    'authorized_apps' => UserSettingsSection.authorizedApps,
    'blocked_users' => UserSettingsSection.blockedUsers,
    'devices' => UserSettingsSection.linkedDevices,
    _ => null,
  };
  if (nestedTabSection != null) {
    return UserSettingsDeepLinkTarget(section: nestedTabSection);
  }
  final String? sectionParam = uri.queryParameters['section'];
  final String? rawSection =
      sectionParam != null && sectionParam.trim().isNotEmpty
      ? sectionParam
      : null;
  final UserSettingsSection? legacySection = _mobileSectionForLegacySection(
    rawSection,
  );
  if (legacySection != null) {
    return UserSettingsDeepLinkTarget(section: legacySection);
  }
  final String? accountSection =
      _accountSectionForNestedTab(tab) ??
      _accountSectionForLegacySection(rawSection);
  final String resolvedTab = accountSection != null ? 'account_security' : tab;
  final String? section = accountSection ?? rawSection;
  if (section != null && !_isUserSettingsSectionTarget(resolvedTab, section)) {
    return const UserSettingsDeepLinkTarget();
  }
  return UserSettingsDeepLinkTarget(
    section: mapUserSettingsDeepLinkToSection(resolvedTab, section),
  );
}

bool _isUserSettingsTabType(String value) {
  return _safeSettingsParamRegex.hasMatch(value) &&
      _userSettingsTabTypes.contains(value);
}

bool _isUserSettingsSectionTarget(String tab, String sectionId) {
  if (!_safeSettingsParamRegex.hasMatch(sectionId)) {
    return false;
  }
  return _knownSectionIdsForTab(tab).contains(sectionId);
}

Set<String> _knownSectionIdsForTab(String tab) {
  switch (tab) {
    case 'account_security':
      return {
        'security',
        'password',
        'two-factor',
        'passkeys',
        'authorized_apps',
        'authorized-applications',
        'blocked_users',
        'blocked-users',
        'devices',
        'signed-in-devices',
      };
    case 'advanced_settings':
      return {'developer', 'experiments', 'logging'};
    default:
      return const {};
  }
}

String? _accountSectionForNestedTab(String tab) {
  switch (tab) {
    case 'authorized_apps':
    case 'devices':
      return 'security';
    case 'blocked_users':
      return 'blocked_users';
    default:
      return null;
  }
}

String? _accountSectionForLegacySection(String? sectionId) {
  switch (sectionId) {
    case 'authorized_apps':
    case 'authorized-applications':
    case 'security':
      return 'security';
    case 'blocked_users':
    case 'blocked-users':
      return 'blocked_users';
    case 'devices':
    case 'signed-in-devices':
      return 'security';
    default:
      return null;
  }
}

UserSettingsSection? _mobileSectionForLegacySection(String? sectionId) {
  switch (sectionId) {
    case 'authorized_apps':
    case 'authorized-applications':
      return UserSettingsSection.authorizedApps;
    case 'blocked_users':
    case 'blocked-users':
      return UserSettingsSection.blockedUsers;
    case 'devices':
    case 'signed-in-devices':
      return UserSettingsSection.linkedDevices;
    default:
      return null;
  }
}

UserSettingsSection? mapUserSettingsDeepLinkToSection(
  String tab,
  String? section,
) {
  switch (tab) {
    case 'my_profile':
      return UserSettingsSection.profile;
    case 'account_security':
      switch (section) {
        case 'authorized_apps':
        case 'authorized-applications':
          return UserSettingsSection.authorizedApps;
        case 'blocked_users':
        case 'blocked-users':
          return UserSettingsSection.blockedUsers;
        case 'devices':
        case 'signed-in-devices':
          return UserSettingsSection.linkedDevices;
        default:
          return UserSettingsSection.securityLogin;
      }
    case 'authorized_apps':
      return UserSettingsSection.authorizedApps;
    case 'blocked_users':
      return UserSettingsSection.blockedUsers;
    case 'devices':
      return UserSettingsSection.linkedDevices;
    case 'privacy_safety':
      return UserSettingsSection.privacyDashboard;
    case 'appearance':
      return UserSettingsSection.lookAndFeel;
    case 'accessibility':
      return UserSettingsSection.accessibility;
    case 'chat_settings':
      return UserSettingsSection.messagesAndMedia;
    case 'voice_video':
      return UserSettingsSection.audioAndVideo;
    case 'notifications':
      return UserSettingsSection.soundsAndAlerts;
    case 'language':
      return UserSettingsSection.languageAndTime;
    case 'keybinds':
      return UserSettingsSection.keybinds;
    case 'expression_packs':
      return UserSettingsSection.expressionPacks;
    case 'linked_accounts':
      return UserSettingsSection.connections;
    case 'applications':
      return UserSettingsSection.applications;
    case 'advanced_settings':
      return UserSettingsSection.advanced;
    case 'client_developer_settings':
      return UserSettingsSection.developerTools;
    default:
      return null;
  }
}
