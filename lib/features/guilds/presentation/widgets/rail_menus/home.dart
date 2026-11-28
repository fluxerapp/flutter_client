import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' show DmChannel;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/providers/read_state_repository_provider.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/dm/utils/bulk_settings_actions.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_context_menu_item.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_menu_data.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/utils/guild_folder_menu_actions.dart';
import 'package:fluxer_app/features/guilds/utils/guild_settings_actions.dart';
import 'package:fluxer_app/features/settings/domain/privacy_permission.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/synced_extras_preferences_provider.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_dart/export.dart' show UserNotificationSettings;

Future<void> showHomeButtonMenu(
  BuildContext context,
  WidgetRef ref, {
  required Offset position,
}) async {
  final List<DmChannel> dms = await ref
      .read(fluxerDatabaseProvider)
      .dmChannelDao
      .getDmChannels();
  if (!context.mounted) {
    return;
  }
  final List<String> dmChannelIds = <String>[
    for (final DmChannel dm in dms) dm.id,
  ];
  await FluxerActionMenu.show(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback close) =>
        _buildHomeMenuItems(
          hostContext: context,
          ref: ref,
          l10n: FluxerLocalizations.of(menuContext),
          close: close,
          dmChannelIds: dmChannelIds,
        ),
  );
}

List<Widget> _buildHomeMenuItems({
  required BuildContext hostContext,
  required WidgetRef ref,
  required FluxerLocalizations l10n,
  required VoidCallback close,
  required List<String> dmChannelIds,
}) {
  final bool dmsDisabled = ref
      .read(instanceRuntimeConfigProvider)
      .directMessagesDisabled;
  final bool inlineDmsCollapsed = ref
      .read(appearancePreferencesProvider)
      .collapseDMs;
  final SyncedExtrasState extras = ref.read(syncedExtrasPreferencesProvider);
  final List<String> unreadDmIds = ref
      .read(unreadDmChannelsProvider)
      .unreadChannelIds
      .toList();
  final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
  final Map<String, GuildReadStateEntry> readStates = ref.read(
    guildReadStateProvider,
  );
  final List<String> unreadGuildIds = <String>[
    for (final Guild guild in guilds)
      if (!guild.unavailable && (readStates[guild.id]?.hasUnread ?? false))
        guild.id,
  ];

  void markAllDmsRead() {
    close();
    unawaited(ref.read(readStateRepositoryProvider).ackLatestBulk(unreadDmIds));
  }

  void markAllCommunitiesRead() {
    close();
    unawaited(
      markGuildsAsRead(
        unreadGuildIds,
        ref.read(fluxerDatabaseProvider),
        ref.read(fluxerClientProvider),
      ),
    );
  }

  return fluxerMenuGroups(<List<Widget>>[
    <Widget>[
      if (!dmsDisabled) ...<Widget>[
        FluxerMenuItem(
          label: l10n.railMenuMarkAllDmsRead,
          icon: PhosphorIconsFill.eye,
          enabled: unreadDmIds.isNotEmpty,
          onPressed: markAllDmsRead,
        ),
        FluxerMenuItem(
          label: inlineDmsCollapsed
              ? l10n.railMenuShowInlineDmList
              : l10n.railMenuCollapseInlineDmList,
          icon: inlineDmsCollapsed
              ? PhosphorIconsFill.eye
              : PhosphorIconsFill.eyeSlash,
          onPressed: () {
            close();
            unawaited(
              ref
                  .read(appearancePreferencesProvider.notifier)
                  .setCollapseDMs(value: !inlineDmsCollapsed),
            );
          },
        ),
        FluxerMenuCheckboxItem(
          label: l10n.railMenuShowUnreadDmCountWhenCollapsed,
          isChecked: extras.showCollapsedUnreadDmsBadge,
          onPressed: () {
            close();
            unawaited(
              ref
                  .read(syncedExtrasPreferencesProvider.notifier)
                  .setShowCollapsedUnreadDmsBadge(
                    value: !extras.showCollapsedUnreadDmsBadge,
                  ),
            );
          },
        ),
      ],
      FluxerMenuCheckboxItem(
        label: l10n.railMenuShowIncomingFriendRequestCount,
        isChecked: extras.showIncomingFriendRequestBadge,
        onPressed: () {
          close();
          unawaited(
            ref
                .read(syncedExtrasPreferencesProvider.notifier)
                .setShowIncomingFriendRequestBadge(
                  value: !extras.showIncomingFriendRequestBadge,
                ),
          );
        },
      ),
      FluxerMenuItem(
        label: l10n.railMenuMarkAllCommunitiesRead,
        icon: PhosphorIconsFill.eye,
        enabled: unreadGuildIds.isNotEmpty,
        onPressed: markAllCommunitiesRead,
      ),
    ],
    _buildBulkGuildSubmenus(
      hostContext: hostContext,
      ref: ref,
      l10n: l10n,
      close: close,
      guilds: guilds,
      dmsDisabled: dmsDisabled,
    ),
    if (!dmsDisabled)
      _buildBulkDmSubmenus(
        hostContext: hostContext,
        ref: ref,
        l10n: l10n,
        close: close,
        channelIds: dmChannelIds,
      ),
  ]);
}

List<Widget> _buildBulkGuildSubmenus({
  required BuildContext hostContext,
  required WidgetRef ref,
  required FluxerLocalizations l10n,
  required VoidCallback close,
  required List<Guild> guilds,
  required bool dmsDisabled,
}) {
  final List<FolderMenuGroup> folderGroups = buildFolderMenuGroups(
    l10n: l10n,
    hasUnread: false,
    hasGuilds: guilds.isNotEmpty,
  );
  final Iterable<FolderMenuSubmenu> submenus = folderGroups
      .expand((FolderMenuGroup group) => group)
      .whereType<FolderMenuSubmenu>()
      .where(
        (FolderMenuSubmenu submenu) => !dmsDisabled || submenu.key != 'privacy',
      );

  void run(FolderMenuAction action) {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    unawaited(
      handleFolderMenuAction(
        action: action,
        guilds: guilds,
        db: ref.read(fluxerDatabaseProvider),
        client: ref.read(fluxerClientProvider),
        userId: userId,
      ),
    );
  }

  return <Widget>[
    for (final FolderMenuSubmenu submenu in submenus)
      fluxerAdaptiveSubmenuItem(
        hostContext: hostContext,
        label: submenu.label,
        enabled: !submenu.isDisabled,
        close: close,
        builder: (BuildContext _, VoidCallback innerClose) =>
            buildFolderContextMenuItems(
              groups: submenu.groups,
              onAction: (FolderMenuAction action) {
                innerClose();
                run(action);
              },
            ),
      ),
  ];
}

List<Widget> _buildBulkDmSubmenus({
  required BuildContext hostContext,
  required WidgetRef ref,
  required FluxerLocalizations l10n,
  required VoidCallback close,
  required List<String> channelIds,
}) {
  final bool hasChannels = channelIds.isNotEmpty;
  final GuildUserSettingsRepository repository = ref.read(
    guildUserSettingsRepositoryProvider,
  );

  void updateOverrides({
    bool? muted,
    int? durationSeconds,
    UserNotificationSettings? messageNotifications,
  }) {
    unawaited(
      bulkUpdateDmOverrides(
        repository: repository,
        channelIds: channelIds,
        muted: muted,
        durationSeconds: durationSeconds,
        messageNotifications: messageNotifications,
      ),
    );
  }

  void updatePrivacy({int? incomingCalls, int? groupDmAdds}) {
    unawaited(
      updateDmPrivacyFlags(
        client: ref.read(fluxerClientProvider),
        incomingCallFlags: incomingCalls,
        groupDmAddPermissionFlags: groupDmAdds,
      ),
    );
  }

  Widget action(String label, VoidCallback innerClose, VoidCallback run) {
    return FluxerMenuItem(
      label: label,
      onPressed: () {
        innerClose();
        run();
      },
    );
  }

  return <Widget>[
    fluxerAdaptiveSubmenuItem(
      hostContext: hostContext,
      label: l10n.railMenuMuteDms,
      enabled: hasChannels,
      close: close,
      builder: (BuildContext _, VoidCallback innerClose) =>
          fluxerMenuGroups(<List<Widget>>[
            <Widget>[
              for (final GuildMenuAction entry in buildMuteSubmenuItems(
                l10n,
              ).whereType<GuildMenuAction>())
                action(
                  entry.label,
                  innerClose,
                  () => updateOverrides(
                    muted: true,
                    durationSeconds: switch (guildMuteDurations[entry.action]) {
                      final int ms => ms ~/ 1000,
                      null => null,
                    },
                  ),
                ),
            ],
            <Widget>[
              action(
                l10n.railMenuUnmuteDms,
                innerClose,
                () => updateOverrides(muted: false),
              ),
            ],
          ]),
    ),
    fluxerAdaptiveSubmenuItem(
      hostContext: hostContext,
      label: l10n.railMenuDmNotificationSettings,
      enabled: hasChannels,
      close: close,
      builder: (BuildContext _, VoidCallback innerClose) => <Widget>[
        action(
          l10n.guildSettingsNotificationsAll,
          innerClose,
          () => updateOverrides(
            messageNotifications: UserNotificationSettings.allMessages,
          ),
        ),
        action(
          l10n.notificationOnlyAtMentions,
          innerClose,
          () => updateOverrides(
            messageNotifications: UserNotificationSettings.onlyMentions,
          ),
        ),
        action(
          l10n.notificationNothing,
          innerClose,
          () => updateOverrides(
            messageNotifications: UserNotificationSettings.noMessages,
          ),
        ),
      ],
    ),
    fluxerAdaptiveSubmenuItem(
      hostContext: hostContext,
      label: l10n.railMenuDmPrivacySettings,
      close: close,
      builder: (BuildContext _, VoidCallback innerClose) => fluxerMenuGroups(
        <List<Widget>>[
          <Widget>[
            action(
              l10n.railMenuIncomingCallsNobody,
              innerClose,
              () => updatePrivacy(incomingCalls: IncomingCallFlag.nobody),
            ),
            action(
              l10n.railMenuIncomingCallsFriendsOnly,
              innerClose,
              () => updatePrivacy(incomingCalls: IncomingCallFlag.friendsOnly),
            ),
            action(
              l10n.railMenuIncomingCallsEveryone,
              innerClose,
              () => updatePrivacy(incomingCalls: IncomingCallFlag.everyone),
            ),
          ],
          <Widget>[
            action(
              l10n.railMenuGroupChatAddsNobody,
              innerClose,
              () => updatePrivacy(groupDmAdds: GroupDmAddPermissionFlag.nobody),
            ),
            action(
              l10n.railMenuGroupChatAddsFriendsOnly,
              innerClose,
              () => updatePrivacy(
                groupDmAdds: GroupDmAddPermissionFlag.friendsOnly,
              ),
            ),
            action(
              l10n.railMenuGroupChatAddsEveryone,
              innerClose,
              () =>
                  updatePrivacy(groupDmAdds: GroupDmAddPermissionFlag.everyone),
            ),
          ],
        ],
      ),
    ),
  ];
}
