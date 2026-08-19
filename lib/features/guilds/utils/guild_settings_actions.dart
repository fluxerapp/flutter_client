import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/guilds/utils/guild_notification_resolution.dart';
import 'package:fluxer_dart/export.dart';

export 'package:fluxer_app/features/guilds/utils/guild_notification_resolution.dart';

Future<void> markGuildAsRead(
  String guildId,
  FluxerDatabase db,
  FluxerClient client,
) async {
  final channels = await db.channelDao.getChannels(guildId);
  final channelIds = channels.map((c) => c.id).toList();
  final readStates = await db.readStateDao
      .watchReadStatesForChannels(channelIds)
      .first;
  final readStateMap = {for (final rs in readStates) rs.channelId: rs};

  final ackEntries = <ReadStateAckBulkRequestReadStates>[];
  for (final channel in channels) {
    final lastMsgId = channel.lastMessageId;
    if (lastMsgId == null) {
      continue;
    }
    final ackId = readStateMap[channel.id]?.lastMessageId;
    final mentionCount = readStateMap[channel.id]?.mentionCount ?? 0;
    final isManual = readStateMap[channel.id]?.manual ?? false;
    if (ackId == lastMsgId && mentionCount == 0 && !isManual) {
      continue;
    }
    ackEntries.add(
      ReadStateAckBulkRequestReadStates(
        channelId: channel.id,
        messageId: lastMsgId,
      ),
    );
  }

  if (ackEntries.isEmpty) {
    return;
  }

  for (final entry in ackEntries) {
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: Value(entry.channelId),
        lastMessageId: Value(entry.messageId),
        mentionCount: const Value(0),
        manual: const Value(false),
      ),
    );
  }

  unawaited(
    client.readStates.ackBulkMessages(
      body: ReadStateAckBulkRequest(readStates: ackEntries),
    ),
  );
}

Future<({bool isDmsAllowed, bool isBotDmsAllowed})> getGuildPrivacyState({
  required FluxerDatabase db,
  required String userId,
  required String guildId,
}) async {
  final row = await db.userSettingsDao.getSettings(userId);
  if (row == null) {
    return (isDmsAllowed: true, isBotDmsAllowed: true);
  }
  final data = jsonDecode(row.data) as Map<String, dynamic>;
  final s = UserSettingsResponse.fromJson(data);
  return (
    isDmsAllowed: !s.restrictedGuilds.contains(guildId),
    isBotDmsAllowed: !s.botRestrictedGuilds.contains(guildId),
  );
}

Future<void> updateGuildPrivacySetting({
  required FluxerClient client,
  required FluxerDatabase db,
  required String userId,
  required String guildId,
  bool? dmsAllowed,
  bool? botDmsAllowed,
}) async {
  try {
    final row = await db.userSettingsDao.getSettings(userId);
    if (row == null) {
      return;
    }

    final data = jsonDecode(row.data) as Map<String, dynamic>;
    final settings = UserSettingsResponse.fromJson(data);

    List<String>? newRestricted;
    if (dmsAllowed != null) {
      newRestricted = List<String>.from(settings.restrictedGuilds);
      if (dmsAllowed) {
        newRestricted.remove(guildId);
      } else if (!newRestricted.contains(guildId)) {
        newRestricted.add(guildId);
      }
    }

    List<String>? newBotRestricted;
    if (botDmsAllowed != null) {
      newBotRestricted = List<String>.from(settings.botRestrictedGuilds);
      if (botDmsAllowed) {
        newBotRestricted.remove(guildId);
      } else if (!newBotRestricted.contains(guildId)) {
        newBotRestricted.add(guildId);
      }
    }

    await client.users.updateCurrentUserSettings(
      body: UserSettingsUpdateRequest(
        restrictedGuilds: newRestricted,
        botRestrictedGuilds: newBotRestricted,
      ),
    );
  } on Exception catch (e) {
    talker.error('[GuildSettingsActions] Failed to update privacy setting: $e');
  }
}

Future<
  ({
    bool muted,
    int messageNotifications,
    bool suppressEveryone,
    bool suppressRoles,
    bool mobilePush,
    Map<String, ({int messageNotifications, bool muted})> channelOverrides,
  })
>
getGuildNotificationSettings({
  required FluxerDatabase db,
  required String guildId,
}) async {
  final guildRow = await db.guildDao.getServerById(guildId);
  final guildContext = GuildNotificationContext.fromServer(guildRow);
  final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
  if (existing == null) {
    return (
      muted: false,
      messageNotifications: guildContext.effectiveMessageNotifications,
      suppressEveryone: false,
      suppressRoles: false,
      mobilePush: true,
      channelOverrides: <String, ({int messageNotifications, bool muted})>{},
    );
  }

  final json = jsonDecode(existing.data) as Map<String, dynamic>;
  final settings = UserGuildSettingsResponse.fromJson(json);

  final overrides = <String, ({int messageNotifications, bool muted})>{};
  if (settings.channelOverrides != null) {
    for (final entry in settings.channelOverrides!.entries) {
      overrides[entry.key] = (
        messageNotifications:
            entry.value.messageNotifications.json ??
            UserNotificationSettings.inherit.json!,
        muted: entry.value.muted,
      );
    }
  }

  return (
    muted: settings.muted,
    messageNotifications: resolveGuildMessageNotificationsForDisplay(
      stored: settings.messageNotifications,
      memberCount: guildContext.memberCount,
      features: guildContext.features,
      defaultMessageNotifications: guildContext.defaultMessageNotifications,
    ),
    suppressEveryone: settings.suppressEveryone,
    suppressRoles: settings.suppressRoles,
    mobilePush: settings.mobilePush,
    channelOverrides: overrides,
  );
}

Future<
  List<({String id, String name, int type, String? parentId, int position})>
>
getGuildChannelsForSettings({
  required FluxerDatabase db,
  required String guildId,
}) async {
  final channels = await db.channelDao.getChannels(guildId);
  return channels
      .map(
        (c) => (
          id: c.id,
          name: c.name,
          type: c.type,
          parentId: c.parentId,
          position: c.position,
        ),
      )
      .toList();
}

final _notifSettingTimers = <String, Timer>{};
final _notifSettingPending =
    <
      String,
      ({
        bool? muted,
        UserNotificationSettings? messageNotifications,
        bool? suppressEveryone,
        bool? suppressRoles,
        bool? mobilePush,
      })
    >{};

Future<void> updateGuildNotificationSetting({
  required FluxerDatabase db,
  required FluxerClient client,
  required String guildId,
  bool? muted,
  UserNotificationSettings? messageNotifications,
  bool? suppressEveryone,
  bool? suppressRoles,
  bool? mobilePush,
}) async {
  try {
    final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
    final data = existing != null
        ? jsonDecode(existing.data) as Map<String, dynamic>
        : <String, dynamic>{};

    if (muted != null) {
      data['muted'] = muted;
      if (!muted) {
        data.remove('mute_config');
      }
    }
    if (messageNotifications != null) {
      data['message_notifications'] = messageNotifications.json;
    }
    if (suppressEveryone != null) {
      data['suppress_everyone'] = suppressEveryone;
    }
    if (suppressRoles != null) {
      data['suppress_roles'] = suppressRoles;
    }
    if (mobilePush != null) {
      data['mobile_push'] = mobilePush;
    }

    await db.userGuildSettingsDao.upsert(
      UserGuildSettingsTableCompanion(
        guildId: Value(guildId),
        data: Value(jsonEncode(data)),
      ),
    );

    final prev = _notifSettingPending[guildId];
    _notifSettingPending[guildId] = (
      muted: muted ?? prev?.muted,
      messageNotifications: messageNotifications ?? prev?.messageNotifications,
      suppressEveryone: suppressEveryone ?? prev?.suppressEveryone,
      suppressRoles: suppressRoles ?? prev?.suppressRoles,
      mobilePush: mobilePush ?? prev?.mobilePush,
    );

    _notifSettingTimers[guildId]?.cancel();
    _notifSettingTimers[guildId] = Timer(const Duration(seconds: 3), () {
      final pending = _notifSettingPending.remove(guildId);
      _notifSettingTimers.remove(guildId);
      if (pending == null) {
        return;
      }
      unawaited(
        client.users.updateGuildSettingsForUser(
          guildId: guildId,
          body: UserGuildSettingsUpdateRequest(
            muted: pending.muted,
            messageNotifications: pending.messageNotifications,
            suppressEveryone: pending.suppressEveryone,
            suppressRoles: pending.suppressRoles,
            mobilePush: pending.mobilePush,
          ),
        ),
      );
    });
  } on Exception catch (e) {
    talker.error(
      '[GuildSettingsActions] Failed to update notification setting: $e',
    );
  }
}

const Map<GuildAction, int> guildMuteDurations = {
  GuildAction.mute15Min: 15 * 60 * 1000,
  GuildAction.mute30Min: 30 * 60 * 1000,
  GuildAction.mute1Hour: 60 * 60 * 1000,
  GuildAction.mute3Hours: 3 * 60 * 60 * 1000,
  GuildAction.mute4Hours: 4 * 60 * 60 * 1000,
  GuildAction.mute8Hours: 8 * 60 * 60 * 1000,
  GuildAction.mute24Hours: 24 * 60 * 60 * 1000,
  GuildAction.mute3Days: 3 * 24 * 60 * 60 * 1000,
};

Future<void> updateGuildUserSettings(
  GuildAction action,
  String guildId,
  FluxerDatabase db,
  FluxerClient client,
) async {
  final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
  final currentData = existing != null
      ? jsonDecode(existing.data) as Map<String, dynamic>
      : <String, dynamic>{};

  UserGuildSettingsUpdateRequest request;

  switch (action) {
    case GuildAction.hideMutedChannels:
      final current = currentData['hide_muted_channels'] as bool? ?? false;
      currentData['hide_muted_channels'] = !current;
      request = UserGuildSettingsUpdateRequest(hideMutedChannels: !current);

    case GuildAction.unmute:
      currentData['muted'] = false;
      currentData.remove('mute_config');
      request = const UserGuildSettingsUpdateRequest(muted: false);

    case GuildAction.muteForever:
      currentData['muted'] = true;
      currentData.remove('mute_config');
      request = const UserGuildSettingsUpdateRequest(muted: true);

    case GuildAction.mute15Min:
    case GuildAction.mute30Min:
    case GuildAction.mute1Hour:
    case GuildAction.mute3Hours:
    case GuildAction.mute4Hours:
    case GuildAction.mute8Hours:
    case GuildAction.mute24Hours:
    case GuildAction.mute3Days:
      final durationMs = guildMuteDurations[action]!;
      final endTime = DateTime.now().add(Duration(milliseconds: durationMs));
      final endTimeIso = endTime.toUtc().toIso8601String();
      currentData['muted'] = true;
      currentData['mute_config'] = {
        'end_time': endTimeIso,
        'selected_time_window': durationMs,
      };
      request = UserGuildSettingsUpdateRequest(
        muted: true,
        muteConfig: UserGuildSettingsUpdateRequestMuteConfig(
          selectedTimeWindow: durationMs,
          endTime: endTimeIso,
        ),
      );

    case GuildAction.markAsRead:
    case GuildAction.inviteMembers:
    case GuildAction.createChannel:
    case GuildAction.createCategory:
    case GuildAction.settingsOverview:
    case GuildAction.settingsRoles:
    case GuildAction.settingsEmoji:
    case GuildAction.settingsStickers:
    case GuildAction.settingsSafetyModeration:
    case GuildAction.settingsActivityLog:
    case GuildAction.settingsWebhooks:
    case GuildAction.settingsDiscovery:
    case GuildAction.settingsMembers:
    case GuildAction.settingsInviteLinks:
    case GuildAction.settingsBans:
    case GuildAction.settingsChannels:
    case GuildAction.notificationSettings:
    case GuildAction.privacySettings:
    case GuildAction.editCommunityProfile:
    case GuildAction.leaveGuild:
    case GuildAction.deleteMyMessages:
    case GuildAction.reportCommunity:
    case GuildAction.debugCommunity:
    case GuildAction.copyGuildId:
      return;
  }

  await db.userGuildSettingsDao.upsert(
    UserGuildSettingsTableCompanion(
      guildId: Value(guildId),
      data: Value(jsonEncode(currentData)),
    ),
  );

  unawaited(
    client.users.updateGuildSettingsForUser(guildId: guildId, body: request),
  );
}

Future<void> setGuildHideMutedChannels({
  required String guildId,
  required bool hideMutedChannels,
  required FluxerDatabase db,
  required FluxerClient client,
}) async {
  final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
  final currentData = existing != null
      ? jsonDecode(existing.data) as Map<String, dynamic>
      : <String, dynamic>{};
  currentData['hide_muted_channels'] = hideMutedChannels;

  await db.userGuildSettingsDao.upsert(
    UserGuildSettingsTableCompanion(
      guildId: Value(guildId),
      data: Value(jsonEncode(currentData)),
    ),
  );

  unawaited(
    client.users.updateGuildSettingsForUser(
      guildId: guildId,
      body: UserGuildSettingsUpdateRequest(
        hideMutedChannels: hideMutedChannels,
      ),
    ),
  );
}

Future<void> muteGuildForDuration({
  required String guildId,
  required int? durationMs,
  required FluxerDatabase db,
  required FluxerClient client,
}) async {
  final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
  final currentData = existing != null
      ? jsonDecode(existing.data) as Map<String, dynamic>
      : <String, dynamic>{};

  UserGuildSettingsUpdateRequest request;
  if (durationMs == null) {
    currentData['muted'] = true;
    currentData.remove('mute_config');
    request = const UserGuildSettingsUpdateRequest(muted: true);
  } else {
    final endTime = DateTime.now().add(Duration(milliseconds: durationMs));
    final endTimeIso = endTime.toUtc().toIso8601String();
    currentData['muted'] = true;
    currentData['mute_config'] = {
      'end_time': endTimeIso,
      'selected_time_window': durationMs,
    };
    request = UserGuildSettingsUpdateRequest(
      muted: true,
      muteConfig: UserGuildSettingsUpdateRequestMuteConfig(
        selectedTimeWindow: durationMs,
        endTime: endTimeIso,
      ),
    );
  }

  await db.userGuildSettingsDao.upsert(
    UserGuildSettingsTableCompanion(
      guildId: Value(guildId),
      data: Value(jsonEncode(currentData)),
    ),
  );

  unawaited(
    client.users.updateGuildSettingsForUser(guildId: guildId, body: request),
  );
}

Future<void> unmuteGuild({
  required String guildId,
  required FluxerDatabase db,
  required FluxerClient client,
}) async {
  final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
  final currentData = existing != null
      ? jsonDecode(existing.data) as Map<String, dynamic>
      : <String, dynamic>{};
  currentData['muted'] = false;
  currentData.remove('mute_config');

  await db.userGuildSettingsDao.upsert(
    UserGuildSettingsTableCompanion(
      guildId: Value(guildId),
      data: Value(jsonEncode(currentData)),
    ),
  );

  unawaited(
    client.users.updateGuildSettingsForUser(
      guildId: guildId,
      body: const UserGuildSettingsUpdateRequest(muted: false),
    ),
  );
}
