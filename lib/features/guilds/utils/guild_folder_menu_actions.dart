import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_menu_data.dart';
import 'package:fluxer_app/features/guilds/utils/bulk_guild_settings_actions.dart';
import 'package:fluxer_dart/export.dart';

const Map<FolderMenuAction, int> folderMuteDurations = {
  FolderMenuAction.mute15Min: 15 * 60 * 1000,
  FolderMenuAction.mute30Min: 30 * 60 * 1000,
  FolderMenuAction.mute1Hour: 60 * 60 * 1000,
  FolderMenuAction.mute3Hours: 3 * 60 * 60 * 1000,
  FolderMenuAction.mute4Hours: 4 * 60 * 60 * 1000,
  FolderMenuAction.mute8Hours: 8 * 60 * 60 * 1000,
  FolderMenuAction.mute24Hours: 24 * 60 * 60 * 1000,
  FolderMenuAction.mute3Days: 3 * 24 * 60 * 60 * 1000,
};

Future<void> handleFolderMenuAction({
  required FolderMenuAction action,
  required List<Guild> guilds,
  required FluxerDatabase db,
  required FluxerClient client,
  required String userId,
}) async {
  final List<String> guildIds = guilds.map((Guild g) => g.id).toList();
  if (guildIds.isEmpty && action != FolderMenuAction.folderSettings) {
    return;
  }

  switch (action) {
    case FolderMenuAction.markAsRead:
      await markFolderAsRead(guilds: guilds, db: db, client: client);
    case FolderMenuAction.mute15Min:
    case FolderMenuAction.mute30Min:
    case FolderMenuAction.mute1Hour:
    case FolderMenuAction.mute3Hours:
    case FolderMenuAction.mute4Hours:
    case FolderMenuAction.mute8Hours:
    case FolderMenuAction.mute24Hours:
    case FolderMenuAction.mute3Days:
      await bulkMuteGuilds(
        guildIds: guildIds,
        durationMs: folderMuteDurations[action],
        db: db,
        client: client,
      );
    case FolderMenuAction.muteForever:
      await bulkMuteGuilds(
        guildIds: guildIds,
        durationMs: null,
        db: db,
        client: client,
      );
    case FolderMenuAction.unmute:
      await bulkUnmuteGuilds(guildIds: guildIds, db: db, client: client);
    case FolderMenuAction.hideMutedChannels:
      await bulkSetHideMutedChannels(
        guildIds: guildIds,
        hideMutedChannels: true,
        db: db,
        client: client,
      );
    case FolderMenuAction.showMutedChannels:
      await bulkSetHideMutedChannels(
        guildIds: guildIds,
        hideMutedChannels: false,
        db: db,
        client: client,
      );
    case FolderMenuAction.notificationAll:
      await bulkUpdateNotificationSetting(
        guildIds: guildIds,
        db: db,
        client: client,
        messageNotifications: UserNotificationSettings.allMessages,
      );
    case FolderMenuAction.notificationMentions:
      await bulkUpdateNotificationSetting(
        guildIds: guildIds,
        db: db,
        client: client,
        messageNotifications: UserNotificationSettings.onlyMentions,
      );
    case FolderMenuAction.notificationNothing:
      await bulkUpdateNotificationSetting(
        guildIds: guildIds,
        db: db,
        client: client,
        messageNotifications: UserNotificationSettings.noMessages,
      );
    case FolderMenuAction.suppressEveryone:
      await bulkUpdateNotificationSetting(
        guildIds: guildIds,
        db: db,
        client: client,
        suppressEveryone: true,
      );
    case FolderMenuAction.allowEveryone:
      await bulkUpdateNotificationSetting(
        guildIds: guildIds,
        db: db,
        client: client,
        suppressEveryone: false,
      );
    case FolderMenuAction.suppressRoles:
      await bulkUpdateNotificationSetting(
        guildIds: guildIds,
        db: db,
        client: client,
        suppressRoles: true,
      );
    case FolderMenuAction.allowRoles:
      await bulkUpdateNotificationSetting(
        guildIds: guildIds,
        db: db,
        client: client,
        suppressRoles: false,
      );
    case FolderMenuAction.enableMobilePush:
      await bulkUpdateNotificationSetting(
        guildIds: guildIds,
        db: db,
        client: client,
        mobilePush: true,
      );
    case FolderMenuAction.disableMobilePush:
      await bulkUpdateNotificationSetting(
        guildIds: guildIds,
        db: db,
        client: client,
        mobilePush: false,
      );
    case FolderMenuAction.allowDms:
      await bulkUpdateGuildPrivacy(
        guildIds: guildIds,
        client: client,
        db: db,
        userId: userId,
        dmsAllowed: true,
      );
    case FolderMenuAction.blockDms:
      await bulkUpdateGuildPrivacy(
        guildIds: guildIds,
        client: client,
        db: db,
        userId: userId,
        dmsAllowed: false,
      );
    case FolderMenuAction.allowBotDms:
      await bulkUpdateGuildPrivacy(
        guildIds: guildIds,
        client: client,
        db: db,
        userId: userId,
        botDmsAllowed: true,
      );
    case FolderMenuAction.blockBotDms:
      await bulkUpdateGuildPrivacy(
        guildIds: guildIds,
        client: client,
        db: db,
        userId: userId,
        botDmsAllowed: false,
      );
    case FolderMenuAction.folderSettings:
      return;
  }
}
