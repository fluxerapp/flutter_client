import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum FolderMenuAction {
  markAsRead,
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
  hideMutedChannels,
  showMutedChannels,
  notificationAll,
  notificationMentions,
  notificationNothing,
  suppressEveryone,
  allowEveryone,
  suppressRoles,
  allowRoles,
  enableMobilePush,
  disableMobilePush,
  allowDms,
  blockDms,
  allowBotDms,
  blockBotDms,
  folderSettings,
}

sealed class FolderMenuEntry {
  const FolderMenuEntry();
}

class FolderMenuActionEntry extends FolderMenuEntry {
  const FolderMenuActionEntry({
    required this.label,
    required this.action,
    this.icon,
    this.isDisabled = false,
  });

  final String label;
  final FolderMenuAction action;
  final IconData? icon;
  final bool isDisabled;
}

class FolderMenuSubmenu extends FolderMenuEntry {
  const FolderMenuSubmenu({
    required this.key,
    required this.label,
    required this.groups,
    this.icon,
    this.isDisabled = false,
  });

  final String key;
  final String label;
  final IconData? icon;
  final bool isDisabled;
  final List<FolderMenuGroup> groups;
}

typedef FolderMenuGroup = List<FolderMenuEntry>;

const List<String> kGuildFolderIconIds = <String>[
  'folder',
  'star',
  'heart',
  'bookmark',
  'game_controller',
  'shield',
  'music_note',
];

String guildFolderIconLabel(FluxerLocalizations l10n, String iconId) {
  return switch (iconId) {
    'star' => l10n.guildFolderIconStar,
    'heart' => l10n.guildFolderIconHeart,
    'bookmark' => l10n.guildFolderIconBookmark,
    'game_controller' => l10n.guildFolderIconGameController,
    'shield' => l10n.guildFolderIconShield,
    'music_note' => l10n.guildFolderIconMusicNote,
    _ => l10n.guildFolderIconFolder,
  };
}

List<FolderMenuEntry> _buildFolderMuteSubmenuItems(FluxerLocalizations l10n) {
  return buildMuteSubmenuItems(l10n)
      .whereType<GuildMenuAction>()
      .map(
        (GuildMenuAction entry) => FolderMenuActionEntry(
          label: entry.label,
          action: _folderMuteActionForGuildAction(entry.action),
        ),
      )
      .toList();
}

FolderMenuAction _folderMuteActionForGuildAction(GuildAction action) {
  return switch (action) {
    GuildAction.mute15Min => FolderMenuAction.mute15Min,
    GuildAction.mute30Min => FolderMenuAction.mute30Min,
    GuildAction.mute1Hour => FolderMenuAction.mute1Hour,
    GuildAction.mute3Hours => FolderMenuAction.mute3Hours,
    GuildAction.mute4Hours => FolderMenuAction.mute4Hours,
    GuildAction.mute8Hours => FolderMenuAction.mute8Hours,
    GuildAction.mute24Hours => FolderMenuAction.mute24Hours,
    GuildAction.mute3Days => FolderMenuAction.mute3Days,
    GuildAction.muteForever => FolderMenuAction.muteForever,
    _ => FolderMenuAction.muteForever,
  };
}

List<FolderMenuGroup> buildFolderMenuGroups({
  required FluxerLocalizations l10n,
  required bool hasUnread,
  required bool hasGuilds,
}) {
  return <FolderMenuGroup>[
    [
      FolderMenuActionEntry(
        label: l10n.guildFolderMarkAsRead,
        icon: PhosphorIconsFill.eye,
        action: FolderMenuAction.markAsRead,
        isDisabled: !hasUnread,
      ),
    ],
    [
      FolderMenuSubmenu(
        key: 'mute',
        label: l10n.guildBulkMuteCommunities,
        icon: PhosphorIconsFill.bellSlash,
        isDisabled: !hasGuilds,
        groups: <FolderMenuGroup>[
          _buildFolderMuteSubmenuItems(l10n),
          <FolderMenuEntry>[
            FolderMenuActionEntry(
              label: l10n.guildBulkUnmuteCommunities,
              action: FolderMenuAction.unmute,
            ),
          ],
          <FolderMenuEntry>[
            FolderMenuActionEntry(
              label: l10n.guildMenuHideMutedChannels,
              action: FolderMenuAction.hideMutedChannels,
            ),
            FolderMenuActionEntry(
              label: l10n.favoritesShowMutedChannels,
              action: FolderMenuAction.showMutedChannels,
            ),
          ],
        ],
      ),
      FolderMenuSubmenu(
        key: 'notifications',
        label: l10n.guildBulkCommunityNotificationSettings,
        icon: PhosphorIconsFill.bell,
        isDisabled: !hasGuilds,
        groups: <FolderMenuGroup>[
          <FolderMenuEntry>[
            FolderMenuActionEntry(
              label: l10n.guildSettingsNotificationsAll,
              action: FolderMenuAction.notificationAll,
            ),
            FolderMenuActionEntry(
              label: l10n.notificationOnlyAtMentions,
              action: FolderMenuAction.notificationMentions,
            ),
            FolderMenuActionEntry(
              label: l10n.notificationNothing,
              action: FolderMenuAction.notificationNothing,
            ),
          ],
          <FolderMenuEntry>[
            FolderMenuActionEntry(
              label: l10n.notificationSuppressEveryone,
              action: FolderMenuAction.suppressEveryone,
            ),
            FolderMenuActionEntry(
              label: l10n.guildBulkAllowEveryoneAndHere,
              action: FolderMenuAction.allowEveryone,
            ),
            FolderMenuActionEntry(
              label: l10n.notificationSuppressRoles,
              action: FolderMenuAction.suppressRoles,
            ),
            FolderMenuActionEntry(
              label: l10n.guildBulkAllowRoleMentions,
              action: FolderMenuAction.allowRoles,
            ),
          ],
          <FolderMenuEntry>[
            FolderMenuActionEntry(
              label: l10n.guildBulkEnableMobilePush,
              action: FolderMenuAction.enableMobilePush,
            ),
            FolderMenuActionEntry(
              label: l10n.guildBulkDisableMobilePush,
              action: FolderMenuAction.disableMobilePush,
            ),
          ],
        ],
      ),
      FolderMenuSubmenu(
        key: 'privacy',
        label: l10n.guildBulkCommunityPrivacySettings,
        icon: PhosphorIconsFill.shield,
        isDisabled: !hasGuilds,
        groups: <FolderMenuGroup>[
          <FolderMenuEntry>[
            FolderMenuActionEntry(
              label: l10n.guildBulkAllowDirectMessages,
              action: FolderMenuAction.allowDms,
            ),
            FolderMenuActionEntry(
              label: l10n.guildBulkBlockDirectMessages,
              action: FolderMenuAction.blockDms,
            ),
          ],
          <FolderMenuEntry>[
            FolderMenuActionEntry(
              label: l10n.guildBulkAllowBotDirectMessages,
              action: FolderMenuAction.allowBotDms,
            ),
            FolderMenuActionEntry(
              label: l10n.guildBulkBlockBotDirectMessages,
              action: FolderMenuAction.blockBotDms,
            ),
          ],
        ],
      ),
    ],
    [
      FolderMenuActionEntry(
        label: l10n.guildFolderSettingsTitle,
        icon: PhosphorIconsFill.gear,
        action: FolderMenuAction.folderSettings,
      ),
    ],
  ];
}
