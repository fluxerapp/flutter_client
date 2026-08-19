import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_nav_group.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/settings_sidebar.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_billing_utils.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_nav_l10n.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_search.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_staff_only_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserSettingsDesktopNavEntry {
  const UserSettingsDesktopNavEntry._({
    this.group,
    this.section,
    this.icon,
    this.isSeparator = false,
    this.isLogout = false,
  });

  const UserSettingsDesktopNavEntry.separator([UserSettingsNavGroup? group])
    : this._(group: group, isSeparator: true);

  const UserSettingsDesktopNavEntry.link(
    UserSettingsSection section, {
    required IconData icon,
  }) : this._(section: section, icon: icon);

  const UserSettingsDesktopNavEntry.logout()
    : this._(icon: PhosphorIconsFill.signOut, isLogout: true);

  final UserSettingsNavGroup? group;
  final UserSettingsSection? section;
  final IconData? icon;
  final bool isSeparator;
  final bool isLogout;

  SettingsSidebarItem toSidebarItem(FluxerLocalizations l10n) {
    if (isSeparator) {
      if (group == null) {
        return const SettingsSidebarItem.separator();
      }
      return SettingsSidebarItem.separator(
        userSettingsNavGroupLabel(l10n, group!),
      );
    }
    if (isLogout) {
      return SettingsSidebarItem(
        l10n.userSettingsNavLogOut,
        icon: icon,
        isDestructive: true,
      );
    }
    return SettingsSidebarItem(
      userSettingsSectionLabel(l10n, section!),
      icon: icon,
    );
  }

  String displayLabel(FluxerLocalizations l10n) {
    if (isLogout) {
      return l10n.userSettingsNavLogOut;
    }
    return userSettingsSectionLabel(l10n, section!);
  }
}

const _userSettingsDesktopNavYourAccount = [
  UserSettingsDesktopNavEntry.separator(UserSettingsNavGroup.yourAccount),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.profile,
    icon: PhosphorIconsFill.user,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.securityLogin,
    icon: PhosphorIconsFill.shieldCheck,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.privacyDashboard,
    icon: PhosphorIconsFill.eyeSlash,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.authorizedApps,
    icon: PhosphorIconsFill.robot,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.blockedUsers,
    icon: PhosphorIconsFill.prohibit,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.linkedDevices,
    icon: PhosphorIconsFill.devices,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.connections,
    icon: PhosphorIconsFill.userList,
  ),
];

const _userSettingsDesktopNavBilling = [
  UserSettingsDesktopNavEntry.separator(UserSettingsNavGroup.billing),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.fluxerPlutonium,
    icon: PhosphorIconsFill.crown,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.giftsAndCodes,
    icon: PhosphorIconsFill.gift,
  ),
];

const _userSettingsDesktopNavApplicationStart = [
  UserSettingsDesktopNavEntry.separator(UserSettingsNavGroup.application),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.lookAndFeel,
    icon: PhosphorIconsFill.paintBrush,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.notifications,
    icon: PhosphorIconsFill.bell,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.accessibility,
    icon: PhosphorIconsFill.personSimpleCircle,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.chat,
    icon: PhosphorIconsFill.chatCircle,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.audioAndVideo,
    icon: PhosphorIconsFill.microphone,
  ),
];

const _userSettingsDesktopNavApplicationShortcuts = [
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.shortcuts,
    icon: PhosphorIconsFill.keyboard,
  ),
];

const _userSettingsDesktopNavApplicationEnd = [
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.languageAndTime,
    icon: PhosphorIconsBold.translate,
  ),
];

const _userSettingsDesktopNavAfterLanguageAndTime = [
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.advanced,
    icon: PhosphorIconsFill.gear,
  ),
  UserSettingsDesktopNavEntry.separator(UserSettingsNavGroup.developer),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.applications,
    icon: PhosphorIconsBold.code,
  ),
];

const _userSettingsDesktopNavStaffOnly = [
  UserSettingsDesktopNavEntry.separator(UserSettingsNavGroup.staffOnly),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.developerTools,
    icon: PhosphorIconsFill.code,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.limitsConfig,
    icon: PhosphorIconsFill.flag,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.featureFlags,
    icon: PhosphorIconsFill.flag,
  ),
];

const _userSettingsDesktopNavAfterStaffOnly = [
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.whatsNew,
    icon: PhosphorIconsFill.megaphone,
  ),
  UserSettingsDesktopNavEntry.logout(),
];

List<UserSettingsDesktopNavEntry> buildUserSettingsDesktopNav({
  required bool showBilling,
  required bool isTouchPrimary,
}) => [
  ..._userSettingsDesktopNavYourAccount,
  if (showBilling) ..._userSettingsDesktopNavBilling,
  ..._userSettingsDesktopNavApplicationStart,
  if (!isTouchPrimary) ..._userSettingsDesktopNavApplicationShortcuts,
  ..._userSettingsDesktopNavApplicationEnd,
  if (isFluxerNativeMobileOs)
    const UserSettingsDesktopNavEntry.link(
      UserSettingsSection.defaultApps,
      icon: PhosphorIconsFill.squaresFour,
    ),
  ..._userSettingsDesktopNavAfterLanguageAndTime,
  if (AppBuildConfig.isCanary) ..._userSettingsDesktopNavStaffOnly,
  ..._userSettingsDesktopNavAfterStaffOnly,
];

int? indexForUserSettingsSection(
  UserSettingsSection section, {
  required bool showBilling,
  required bool isTouchPrimary,
}) {
  if (!isUserSettingsStaffOnlySectionAvailable(section)) {
    return null;
  }
  if (!isUserSettingsBillingSectionAvailable(
    section,
    showBilling: showBilling,
  )) {
    return null;
  }
  final List<UserSettingsDesktopNavEntry> nav = buildUserSettingsDesktopNav(
    showBilling: showBilling,
    isTouchPrimary: isTouchPrimary,
  );
  for (var i = 0; i < nav.length; i++) {
    if (nav[i].section == section) {
      return i;
    }
  }
  return null;
}

IconData? iconForUserSettingsSection(
  UserSettingsSection section, {
  required bool showBilling,
  required bool isTouchPrimary,
}) {
  for (final UserSettingsDesktopNavEntry entry in buildUserSettingsDesktopNav(
    showBilling: showBilling,
    isTouchPrimary: isTouchPrimary,
  )) {
    if (entry.section == section) {
      return entry.icon;
    }
  }
  return null;
}

List<FluxerSettingsNavGroup> buildUserSettingsMobileNavGroups({
  required FluxerLocalizations l10n,
  required void Function(UserSettingsSection section) onOpenSection,
  required VoidCallback onOpenAppLogs,
  required VoidCallback onLogout,
  required bool showBilling,
  required bool isTouchPrimary,
}) {
  FluxerSettingsNavItem link(UserSettingsSection section, IconData icon) {
    return FluxerSettingsNavItem(
      label: userSettingsSectionLabel(l10n, section),
      icon: icon,
      onTap: () => onOpenSection(section),
    );
  }

  return [
    FluxerSettingsNavGroup(
      label: userSettingsNavGroupLabel(l10n, UserSettingsNavGroup.yourAccount),
      items: [
        link(UserSettingsSection.profile, PhosphorIconsFill.user),
        link(UserSettingsSection.securityLogin, PhosphorIconsFill.shieldCheck),
        link(UserSettingsSection.privacyDashboard, PhosphorIconsFill.eyeSlash),
        link(UserSettingsSection.authorizedApps, PhosphorIconsFill.robot),
        link(UserSettingsSection.blockedUsers, PhosphorIconsFill.prohibit),
        link(UserSettingsSection.linkedDevices, PhosphorIconsFill.devices),
        link(UserSettingsSection.connections, PhosphorIconsFill.userList),
      ],
    ),
    if (showBilling)
      FluxerSettingsNavGroup(
        label: userSettingsNavGroupLabel(l10n, UserSettingsNavGroup.billing),
        items: [
          link(UserSettingsSection.fluxerPlutonium, PhosphorIconsFill.crown),
          link(UserSettingsSection.giftsAndCodes, PhosphorIconsFill.gift),
        ],
      ),
    FluxerSettingsNavGroup(
      label: userSettingsNavGroupLabel(l10n, UserSettingsNavGroup.application),
      items: [
        link(UserSettingsSection.lookAndFeel, PhosphorIconsFill.paintBrush),
        link(UserSettingsSection.notifications, PhosphorIconsFill.bell),
        link(
          UserSettingsSection.accessibility,
          PhosphorIconsFill.personSimpleCircle,
        ),
        link(UserSettingsSection.chat, PhosphorIconsFill.chatCircle),
        link(UserSettingsSection.audioAndVideo, PhosphorIconsFill.microphone),
        if (!isTouchPrimary)
          link(UserSettingsSection.shortcuts, PhosphorIconsFill.keyboard),
        link(UserSettingsSection.languageAndTime, PhosphorIconsBold.translate),
        if (isFluxerNativeMobileOs)
          link(UserSettingsSection.defaultApps, PhosphorIconsFill.squaresFour),
        link(UserSettingsSection.advanced, PhosphorIconsFill.gear),
      ],
    ),
    FluxerSettingsNavGroup(
      label: userSettingsNavGroupLabel(l10n, UserSettingsNavGroup.developer),
      items: [
        link(UserSettingsSection.applications, PhosphorIconsBold.code),
        FluxerSettingsNavItem(
          label: l10n.userSettingsNavAppLogs,
          icon: PhosphorIconsFill.list,
          onTap: onOpenAppLogs,
        ),
      ],
    ),
    if (AppBuildConfig.isCanary)
      FluxerSettingsNavGroup(
        label: userSettingsNavGroupLabel(l10n, UserSettingsNavGroup.staffOnly),
        items: [
          link(UserSettingsSection.developerTools, PhosphorIconsFill.code),
          link(UserSettingsSection.limitsConfig, PhosphorIconsFill.flag),
          link(UserSettingsSection.featureFlags, PhosphorIconsFill.flag),
        ],
      ),
    FluxerSettingsNavGroup(
      items: [
        link(UserSettingsSection.whatsNew, PhosphorIconsFill.megaphone),
        FluxerSettingsNavItem(
          label: l10n.userSettingsNavLogOut,
          icon: PhosphorIconsFill.signOut,
          isDanger: true,
          onTap: onLogout,
        ),
      ],
    ),
  ];
}

IconData _searchSectionIcon(
  UserSettingsSection section, {
  required bool showBilling,
  required bool isTouchPrimary,
}) {
  return iconForUserSettingsSection(
        section,
        showBilling: showBilling,
        isTouchPrimary: isTouchPrimary,
      ) ??
      PhosphorIconsFill.gear;
}

final class UserSettingsSearchSidebar {
  const UserSettingsSearchSidebar({
    required this.items,
    required this.hitAtIndex,
  });

  final List<SettingsSidebarItem> items;
  final List<UserSettingsSearchHit?> hitAtIndex;
}

UserSettingsSearchSidebar buildUserSettingsSearchSidebar({
  required FluxerLocalizations l10n,
  required List<UserSettingsSearchHit> hits,
  required bool showBilling,
  required bool isTouchPrimary,
}) {
  final List<SettingsSidebarItem> items = [];
  final List<UserSettingsSearchHit?> hitAtIndex = [];
  for (final MapEntry<UserSettingsSection, List<UserSettingsSearchHit>> entry
      in groupUserSettingsSearchHits(hits)) {
    final UserSettingsSection section = entry.key;
    final List<UserSettingsSearchHit> sectionHits = entry.value;
    final bool onlySectionHit =
        sectionHits.length == 1 && sectionHits.first.fieldId == null;
    if (!onlySectionHit) {
      items.add(
        SettingsSidebarItem.separator(userSettingsSectionLabel(l10n, section)),
      );
      hitAtIndex.add(null);
    }
    final IconData icon = _searchSectionIcon(
      section,
      showBilling: showBilling,
      isTouchPrimary: isTouchPrimary,
    );
    for (final UserSettingsSearchHit hit in sectionHits) {
      items.add(SettingsSidebarItem(hit.label, icon: icon));
      hitAtIndex.add(hit);
    }
  }
  return UserSettingsSearchSidebar(items: items, hitAtIndex: hitAtIndex);
}

List<FluxerSettingsNavGroup> buildUserSettingsSearchNavGroups({
  required FluxerLocalizations l10n,
  required List<UserSettingsSearchHit> hits,
  required void Function(UserSettingsSection section, {String? initialFieldId})
  onOpen,
  required bool showBilling,
  required bool isTouchPrimary,
}) {
  return [
    for (final MapEntry<UserSettingsSection, List<UserSettingsSearchHit>> entry
        in groupUserSettingsSearchHits(hits))
      FluxerSettingsNavGroup(
        label: userSettingsSectionLabel(l10n, entry.key),
        items: [
          for (final UserSettingsSearchHit hit in entry.value)
            FluxerSettingsNavItem(
              label: hit.label,
              hint: hit.fieldId == null
                  ? null
                  : userSettingsSectionLabel(l10n, entry.key),
              icon: _searchSectionIcon(
                entry.key,
                showBilling: showBilling,
                isTouchPrimary: isTouchPrimary,
              ),
              onTap: () => onOpen(entry.key, initialFieldId: hit.fieldId),
            ),
        ],
      ),
  ];
}
