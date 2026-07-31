import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/utils/guild_settings_actions.dart';
import 'package:fluxer_dart/export.dart';

List<String> uniqueGuildIds(Iterable<String> guildIds) {
  return guildIds.toSet().toList();
}

Future<void> bulkMuteGuilds({
  required List<String> guildIds,
  required int? durationMs,
  required FluxerDatabase db,
  required FluxerClient client,
}) async {
  for (final guildId in uniqueGuildIds(guildIds)) {
    await muteGuildForDuration(
      guildId: guildId,
      durationMs: durationMs,
      db: db,
      client: client,
    );
  }
}

Future<void> bulkUnmuteGuilds({
  required List<String> guildIds,
  required FluxerDatabase db,
  required FluxerClient client,
}) async {
  for (final guildId in uniqueGuildIds(guildIds)) {
    await unmuteGuild(guildId: guildId, db: db, client: client);
  }
}

Future<void> bulkSetHideMutedChannels({
  required List<String> guildIds,
  required bool hideMutedChannels,
  required FluxerDatabase db,
  required FluxerClient client,
}) async {
  for (final guildId in uniqueGuildIds(guildIds)) {
    await setGuildHideMutedChannels(
      guildId: guildId,
      hideMutedChannels: hideMutedChannels,
      db: db,
      client: client,
    );
  }
}

Future<void> bulkUpdateNotificationSetting({
  required List<String> guildIds,
  required FluxerDatabase db,
  required FluxerClient client,
  bool? muted,
  UserNotificationSettings? messageNotifications,
  bool? suppressEveryone,
  bool? suppressRoles,
  bool? mobilePush,
}) async {
  for (final guildId in uniqueGuildIds(guildIds)) {
    await updateGuildNotificationSetting(
      db: db,
      client: client,
      guildId: guildId,
      muted: muted,
      messageNotifications: messageNotifications,
      suppressEveryone: suppressEveryone,
      suppressRoles: suppressRoles,
      mobilePush: mobilePush,
    );
  }
}

Future<void> bulkUpdateGuildPrivacy({
  required List<String> guildIds,
  required FluxerClient client,
  required FluxerDatabase db,
  required String userId,
  bool? dmsAllowed,
  bool? botDmsAllowed,
}) async {
  if (dmsAllowed == null && botDmsAllowed == null) {
    return;
  }

  try {
    final row = await db.userSettingsDao.getSettings(userId);
    if (row == null) {
      return;
    }

    final data = jsonDecode(row.data) as Map<String, dynamic>;
    final settings = UserSettingsResponse.fromJson(data);
    final ids = uniqueGuildIds(guildIds);

    List<String>? newRestricted;
    if (dmsAllowed != null) {
      newRestricted = List<String>.from(settings.restrictedGuilds);
      for (final guildId in ids) {
        if (dmsAllowed) {
          newRestricted.remove(guildId);
        } else if (!newRestricted.contains(guildId)) {
          newRestricted.add(guildId);
        }
      }
    }

    List<String>? newBotRestricted;
    if (botDmsAllowed != null) {
      newBotRestricted = List<String>.from(settings.botRestrictedGuilds);
      for (final guildId in ids) {
        if (botDmsAllowed) {
          newBotRestricted.remove(guildId);
        } else if (!newBotRestricted.contains(guildId)) {
          newBotRestricted.add(guildId);
        }
      }
    }

    await client.users.updateCurrentUserSettings(
      body: UserSettingsUpdateRequest(
        restrictedGuilds: newRestricted,
        botRestrictedGuilds: newBotRestricted,
      ),
    );
  } on Exception catch (e) {
    talker.error('[BulkGuildSettingsActions] Failed to update privacy: $e');
  }
}

Future<void> markFolderAsRead({
  required List<Guild> guilds,
  required FluxerDatabase db,
  required FluxerClient client,
}) async {
  for (final guild in guilds) {
    if (guild.isUnavailable) {
      continue;
    }
    await markGuildAsRead(guild.id, db, client);
  }
}
