import 'package:flutter/material.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_nav_group.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/settings_sidebar.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_nav_l10n.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_staff_only_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
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

const _userSettingsDesktopNavBeforeStaffOnly = [
  UserSettingsDesktopNavEntry.separator(UserSettingsNavGroup.yourAccount),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.profile,
    icon: PhosphorIconsFill.user,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.securityLogin,
    icon: PhosphorIconsFill.shieldCheck,
  ),
  // UserSettingsDesktopNavEntry.link(
  //   UserSettingsSection.fluxerPlutonium,
  //   icon: PhosphorIconsFill.crown,
  // ),
  // UserSettingsDesktopNavEntry.link(
  //   UserSettingsSection.giftsAndCodes,
  //   icon: PhosphorIconsFill.gift,
  // ),
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
  // UserSettingsDesktopNavEntry.link(
  //   UserSettingsSection.keybinds,
  //   icon: PhosphorIconsFill.keyboard,
  // ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.languageAndTime,
    icon: PhosphorIconsBold.translate,
  ),
  UserSettingsDesktopNavEntry.link(
    UserSettingsSection.advanced,
    icon: PhosphorIconsFill.flask,
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

List<UserSettingsDesktopNavEntry> get userSettingsDesktopNav => [
  ..._userSettingsDesktopNavBeforeStaffOnly,
  if (AppBuildConfig.isCanary) ..._userSettingsDesktopNavStaffOnly,
  ..._userSettingsDesktopNavAfterStaffOnly,
];

int? indexForUserSettingsSection(UserSettingsSection section) {
  if (!isUserSettingsStaffOnlySectionAvailable(section)) {
    return null;
  }
  for (var i = 0; i < userSettingsDesktopNav.length; i++) {
    if (userSettingsDesktopNav[i].section == section) {
      return i;
    }
  }
  return null;
}

List<FluxerSettingsNavGroup> buildUserSettingsMobileNavGroups({
  required FluxerLocalizations l10n,
  required void Function(UserSettingsSection section) onOpenSection,
  required VoidCallback onOpenAppLogs,
  required VoidCallback onLogout,
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
        // link(UserSettingsSection.fluxerPlutonium, PhosphorIconsFill.crown),
        // link(UserSettingsSection.giftsAndCodes, PhosphorIconsFill.gift),
        link(UserSettingsSection.privacyDashboard, PhosphorIconsFill.eyeSlash),
        link(UserSettingsSection.authorizedApps, PhosphorIconsFill.robot),
        link(UserSettingsSection.blockedUsers, PhosphorIconsFill.prohibit),
        link(UserSettingsSection.linkedDevices, PhosphorIconsFill.devices),
        link(UserSettingsSection.connections, PhosphorIconsFill.userList),
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
        link(UserSettingsSection.languageAndTime, PhosphorIconsBold.translate),
        link(UserSettingsSection.advanced, PhosphorIconsFill.flask),
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
