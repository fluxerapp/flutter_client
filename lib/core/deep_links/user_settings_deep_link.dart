import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/deep_links/deep_link_path_policy.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/utils/user_settings/user_settings_deep_link_scope.dart';
import 'package:fluxer_app/features/settings/utils/user_settings/user_settings_field_registry.dart';

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
  'shortcuts',
  'linked_accounts',
  'default_apps',
  'app_icon',
};

class UserSettingsDeepLinkTarget {
  const UserSettingsDeepLinkTarget({this.section, this.fieldId, this.tab});

  final UserSettingsSection? section;
  final String? fieldId;
  final String? tab;
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
    return UserSettingsDeepLinkTarget(section: nestedTabSection, tab: tab);
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
    return UserSettingsDeepLinkTarget(section: legacySection, tab: tab);
  }
  final String? accountSection =
      _accountSectionForNestedTab(tab) ??
      _accountSectionForLegacySection(rawSection);
  final String resolvedTab = accountSection != null ? 'account_security' : tab;
  final String? pageSectionParam = _pageSectionParam(resolvedTab, rawSection);
  if (pageSectionParam != null) {
    return UserSettingsDeepLinkTarget(
      section: mapUserSettingsDeepLinkToSection(resolvedTab, pageSectionParam),
      tab: resolvedTab,
    );
  }
  final String? fieldId =
      rawSection != null && isKnownUserSettingsFieldId(resolvedTab, rawSection)
      ? rawSection
      : null;
  return UserSettingsDeepLinkTarget(
    section: mapUserSettingsDeepLinkToSection(resolvedTab, null),
    fieldId: fieldId,
    tab: resolvedTab,
  );
}

bool _isUserSettingsTabType(String value) {
  return _safeSettingsParamRegex.hasMatch(value) &&
      _userSettingsTabTypes.contains(value);
}

String? _pageSectionParam(String tab, String? sectionId) {
  if (sectionId == null || !_safeSettingsParamRegex.hasMatch(sectionId)) {
    return null;
  }
  if (tab != 'account_security') {
    return null;
  }
  switch (sectionId) {
    case 'authorized_apps':
    case 'authorized-applications':
      return 'authorized_apps';
    case 'blocked_users':
    case 'blocked-users':
      return 'blocked_users';
    case 'devices':
    case 'signed-in-devices':
      return 'devices';
    default:
      return null;
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
      return UserSettingsSection.chat;
    case 'voice_video':
      return UserSettingsSection.audioAndVideo;
    case 'notifications':
      return UserSettingsSection.notifications;
    case 'language':
      return UserSettingsSection.languageAndTime;
    case 'shortcuts':
      return UserSettingsSection.shortcuts;
    case 'plutonium':
      return UserSettingsSection.fluxerPlutonium;
    case 'gift_inventory':
      return UserSettingsSection.giftsAndCodes;
    case 'linked_accounts':
      return UserSettingsSection.connections;
    case 'applications':
      return UserSettingsSection.applications;
    case 'advanced_settings':
      return UserSettingsSection.advanced;
    case 'client_developer_settings':
      if (!AppBuildConfig.isCanary) {
        return null;
      }
      return UserSettingsSection.developerTools;
    case 'default_apps':
      return UserSettingsSection.defaultApps;
    case 'app_icon':
      return UserSettingsSection.appIcon;
    default:
      return null;
  }
}

bool _isAccountNestedSettingsTab(String tab) {
  switch (tab) {
    case 'authorized_apps':
    case 'blocked_users':
    case 'devices':
      return true;
    default:
      return false;
  }
}

String buildUserSettingsDeepLink(String tabType, [String? sectionId]) {
  final String? accountSection =
      _accountSectionForNestedTab(tabType) ??
      _accountSectionForLegacySection(sectionId);
  final bool shouldUseAccountTab =
      accountSection != null || _isAccountNestedSettingsTab(tabType);
  final String resolvedTab = shouldUseAccountTab ? 'account_security' : tabType;
  final String? resolvedSection = accountSection ?? sectionId;
  final query = StringBuffer('tab=$resolvedTab');
  if (resolvedSection != null && resolvedSection.isNotEmpty) {
    query.write('&section=$resolvedSection');
  }
  return '$appProtocolScheme://settings/user?$query';
}

bool tabHasMultipleLinkableUserSettingsSections({
  required String tab,
  required bool isTouchPrimary,
  required UserSettingsSection pageSection,
}) {
  var count = 0;
  for (final String sectionId in knownUserSettingsFieldIdsForTab(tab)) {
    if (!isUserSettingsScrollFieldVisible(
      isTouchPrimary: isTouchPrimary,
      section: pageSection,
      scrollFieldId: sectionId,
    )) {
      continue;
    }
    count++;
    if (count > 1) {
      return true;
    }
  }
  return false;
}

String? userSettingsSectionDeepLinkHref({
  required String sectionId,
  required String tab,
  required bool isTouchPrimary,
  required UserSettingsSection pageSection,
  bool linkable = true,
}) {
  if (!linkable || !isKnownUserSettingsFieldId(tab, sectionId)) {
    return null;
  }
  if (!tabHasMultipleLinkableUserSettingsSections(
    tab: tab,
    isTouchPrimary: isTouchPrimary,
    pageSection: pageSection,
  )) {
    return null;
  }
  return buildUserSettingsDeepLink(tab, sectionId);
}

String? userSettingsPageDeepLinkHref(UserSettingsSection section) {
  final String? tab = userSettingsDeepLinkTabForPage(section);
  if (tab == null) {
    return null;
  }
  return buildUserSettingsDeepLink(tab);
}
