import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum GuildAction {
  markAsRead,
  inviteMembers,
  createChannel,
  createCategory,
  settingsOverview,
  settingsRoles,
  settingsEmoji,
  settingsStickers,
  settingsSafetyModeration,
  settingsActivityLog,
  settingsWebhooks,
  settingsDiscovery,
  settingsMembers,
  settingsInviteLinks,
  settingsBans,
  settingsChannels,
  notificationSettings,
  privacySettings,
  editCommunityProfile,
  hideMutedChannels,
  leaveGuild,
  deleteMyMessages,
  reportCommunity,
  debugCommunity,
  copyGuildId,
  mute15Min,
  mute30Min,
  mute1Hour,
  mute3Hours,
  mute4Hours,
  mute8Hours,
  mute24Hours,
  mute3Days,
  muteForever,
  unmute,
}

sealed class GuildMenuEntry {
  const GuildMenuEntry();
}

class GuildMenuAction extends GuildMenuEntry {
  final String label;
  final IconData? icon;
  final GuildAction action;
  final bool isDanger;
  final String? hint;

  const GuildMenuAction({
    required this.label,
    required this.action,
    this.icon,
    this.isDanger = false,
    this.hint,
  });
}

class GuildMenuSubmenu extends GuildMenuEntry {
  final String key;
  final String label;
  final IconData? icon;
  final String? hint;
  final List<GuildMenuEntry> children;

  const GuildMenuSubmenu({
    required this.key,
    required this.label,
    required this.children,
    this.icon,
    this.hint,
  });
}

class GuildMenuCheckbox extends GuildMenuEntry {
  final String label;
  final bool isChecked;
  final GuildAction action;

  const GuildMenuCheckbox({
    required this.label,
    required this.isChecked,
    required this.action,
  });
}

typedef GuildMenuGroup = List<GuildMenuEntry>;

String? _formatMuteHint(
  FluxerLocalizations l10n,
  DateTime? muteEndTime, {
  required String locale,
  required bool use12Hour,
}) {
  if (muteEndTime == null) {
    return l10n.voiceParticipantTooltipMuted;
  }
  final now = DateTime.now();
  if (muteEndTime.isBefore(now)) {
    return null;
  }
  return l10n.guildMenuMutedUntil(
    formatUserTime(muteEndTime.toLocal(), locale, use12Hour: use12Hour),
  );
}

List<GuildMenuGroup> buildGuildMenuGroups({
  required FluxerLocalizations l10n,
  required bool hasUnread,
  required bool isMuted,
  required bool isOwner,
  required int permissions,
  required String locale,
  required bool use12Hour,
  DateTime? muteEndTime,
  bool hideMutedChannels = false,
  bool developerMode = false,
  bool isTouchPrimary = false,
  Guild? guild,
}) {
  final p = permissions;
  final canInvite = hasPermission(p, Permission.createInstantInvite);
  final canManageChannels = hasPermission(p, Permission.manageChannels);
  final canAccessSettings = canOpenGuildSettings(
    permissions: p,
    guild: guild,
    isTouchPrimary: isTouchPrimary,
  );

  return <GuildMenuGroup>[
    [
      if (hasUnread)
        GuildMenuAction(
          label: l10n.guildMenuMarkAsRead,
          icon: PhosphorIconsFill.eye,
          action: GuildAction.markAsRead,
        ),
      if (canInvite)
        GuildMenuAction(
          label: l10n.guildMenuInviteMembers,
          icon: PhosphorIconsFill.userPlus,
          action: GuildAction.inviteMembers,
        ),
      if (canAccessSettings)
        GuildMenuSubmenu(
          key: 'communitySettings',
          label: l10n.guildMenuCommunitySettings,
          icon: PhosphorIconsFill.gear,
          children: _buildSettingsSubmenu(l10n, p),
        ),
      if (canManageChannels) ...[
        GuildMenuAction(
          label: l10n.guildNavbarCreateChannel,
          icon: PhosphorIconsFill.plusCircle,
          action: GuildAction.createChannel,
        ),
        GuildMenuAction(
          label: l10n.guildNavbarCreateCategory,
          icon: PhosphorIconsFill.folderPlus,
          action: GuildAction.createCategory,
        ),
      ],
    ],
    [
      GuildMenuAction(
        label: l10n.notificationSettings,
        icon: PhosphorIconsFill.bell,
        action: GuildAction.notificationSettings,
      ),
      GuildMenuAction(
        label: l10n.privacySettings,
        icon: PhosphorIconsFill.shield,
        action: GuildAction.privacySettings,
      ),
      GuildMenuAction(
        label: l10n.guildMenuEditCommunityProfile,
        icon: PhosphorIconsFill.userCircle,
        action: GuildAction.editCommunityProfile,
      ),
    ],
    [
      if (isMuted)
        GuildMenuAction(
          label: l10n.guildMenuUnmuteCommunity,
          icon: PhosphorIconsFill.bellSlash,
          action: GuildAction.unmute,
          hint: _formatMuteHint(
            l10n,
            muteEndTime,
            locale: locale,
            use12Hour: use12Hour,
          ),
        )
      else
        GuildMenuSubmenu(
          key: 'mute',
          label: l10n.guildMenuMuteCommunity,
          children: _buildMuteSubmenuItems(l10n),
        ),
      GuildMenuCheckbox(
        label: l10n.guildMenuHideMutedChannels,
        isChecked: hideMutedChannels,
        action: GuildAction.hideMutedChannels,
      ),
    ],
    if (!isOwner)
      [
        GuildMenuAction(
          label: l10n.guildNavbarDeleteMyMessagesConfirm,
          icon: PhosphorIconsFill.trash,
          action: GuildAction.deleteMyMessages,
          isDanger: true,
        ),
        GuildMenuAction(
          label: l10n.guildNavbarLeaveCommunityConfirm,
          icon: PhosphorIconsFill.signOut,
          action: GuildAction.leaveGuild,
          isDanger: true,
        ),
        GuildMenuAction(
          label: l10n.guildMenuReportCommunity,
          icon: PhosphorIconsFill.flag,
          action: GuildAction.reportCommunity,
          isDanger: true,
        ),
      ],
    if (developerMode)
      [
        GuildMenuAction(
          label: l10n.guildMenuDebugCommunity,
          icon: PhosphorIconsFill.bugBeetle,
          action: GuildAction.debugCommunity,
        ),
      ],
    [
      GuildMenuAction(
        label: l10n.guildMenuCopyCommunityId,
        icon: PhosphorIconsBold.snowflake,
        action: GuildAction.copyGuildId,
      ),
    ],
  ];
}

typedef _SettingsTabDef = ({
  GuildAction action,
  List<Permission> perms,
  IconData icon,
});

const List<_SettingsTabDef> _settingsTabDefs = <_SettingsTabDef>[
  (
    action: GuildAction.settingsOverview,
    perms: [Permission.manageGuild],
    icon: PhosphorIconsFill.gear,
  ),
  (
    action: GuildAction.settingsRoles,
    perms: [Permission.manageRoles],
    icon: PhosphorIconsFill.shield,
  ),
  (
    action: GuildAction.settingsChannels,
    perms: [Permission.manageChannels],
    icon: PhosphorIconsFill.hash,
  ),
  (
    action: GuildAction.settingsSafetyModeration,
    perms: [Permission.manageGuild],
    icon: PhosphorIconsFill.hammer,
  ),
  (
    action: GuildAction.settingsActivityLog,
    perms: [Permission.viewAuditLog],
    icon: PhosphorIconsFill.bookOpen,
  ),
  (
    action: GuildAction.settingsEmoji,
    perms: [Permission.createExpressions, Permission.manageExpressions],
    icon: PhosphorIconsFill.smiley,
  ),
  (
    action: GuildAction.settingsStickers,
    perms: [Permission.createExpressions, Permission.manageExpressions],
    icon: PhosphorIconsFill.sticker,
  ),
  (
    action: GuildAction.settingsWebhooks,
    perms: [Permission.manageWebhooks],
    icon: PhosphorIconsFill.webhooksLogo,
  ),
  (
    action: GuildAction.settingsDiscovery,
    perms: [Permission.manageGuild],
    icon: PhosphorIconsFill.compass,
  ),
  (
    action: GuildAction.settingsMembers,
    perms: [Permission.manageGuild],
    icon: PhosphorIconsFill.users,
  ),
  (
    action: GuildAction.settingsInviteLinks,
    perms: [Permission.manageGuild],
    icon: PhosphorIconsFill.ticket,
  ),
  (
    action: GuildAction.settingsBans,
    perms: [Permission.banMembers],
    icon: PhosphorIconsFill.prohibit,
  ),
];

String _settingsTabLabel(GuildAction action, FluxerLocalizations l10n) {
  return switch (action) {
    GuildAction.settingsOverview => l10n.guildMenuSettingsGeneral,
    GuildAction.settingsRoles => l10n.guildMenuSettingsRoles,
    GuildAction.settingsEmoji => l10n.guildMenuSettingsEmoji,
    GuildAction.settingsStickers => l10n.guildMenuSettingsStickers,
    GuildAction.settingsSafetyModeration =>
      l10n.guildMenuSettingsSafetyModeration,
    GuildAction.settingsActivityLog => l10n.guildMenuSettingsActivityLog,
    GuildAction.settingsWebhooks => l10n.guildMenuSettingsWebhooks,
    GuildAction.settingsDiscovery => l10n.guildMenuSettingsDiscovery,
    GuildAction.settingsMembers => l10n.guildMenuSettingsMembers,
    GuildAction.settingsInviteLinks => l10n.guildMenuSettingsInviteLinks,
    GuildAction.settingsBans => l10n.guildMenuSettingsBans,
    GuildAction.settingsChannels => l10n.guildMenuSettingsChannels,
    _ => '',
  };
}

bool canAccessAnyGuildSettings(int permissions) {
  return _settingsTabDefs.any(
    (tab) => tab.perms.any((p) => hasPermission(permissions, p)),
  );
}

bool canAccessGuildSettingsTab(GuildAction action, int permissions) {
  for (final _SettingsTabDef tab in _settingsTabDefs) {
    if (tab.action == action) {
      return tab.perms.any(
        (Permission permission) => hasPermission(permissions, permission),
      );
    }
  }
  return false;
}

List<GuildMenuEntry> _buildSettingsSubmenu(
  FluxerLocalizations l10n,
  int permissions,
) {
  return [
    for (final _SettingsTabDef tab in _settingsTabDefs)
      if (tab.perms.any((Permission p) => hasPermission(permissions, p)))
        GuildMenuAction(
          label: _settingsTabLabel(tab.action, l10n),
          action: tab.action,
          icon: tab.icon,
        ),
  ];
}

List<GuildMenuEntry> _buildMuteSubmenuItems(FluxerLocalizations l10n) {
  return <GuildMenuEntry>[
    GuildMenuAction(label: l10n.dmMuteFor15Min, action: GuildAction.mute15Min),
    GuildMenuAction(label: l10n.dmMuteFor30Min, action: GuildAction.mute30Min),
    GuildMenuAction(label: l10n.dmMuteFor1Hour, action: GuildAction.mute1Hour),
    GuildMenuAction(
      label: l10n.dmMuteFor3Hours,
      action: GuildAction.mute3Hours,
    ),
    GuildMenuAction(
      label: l10n.dmMuteFor4Hours,
      action: GuildAction.mute4Hours,
    ),
    GuildMenuAction(
      label: l10n.dmMuteFor8Hours,
      action: GuildAction.mute8Hours,
    ),
    GuildMenuAction(
      label: l10n.dmMuteFor24Hours,
      action: GuildAction.mute24Hours,
    ),
    GuildMenuAction(label: l10n.dmMuteFor3Days, action: GuildAction.mute3Days),
    GuildMenuAction(label: l10n.dmMuteForever, action: GuildAction.muteForever),
  ];
}
