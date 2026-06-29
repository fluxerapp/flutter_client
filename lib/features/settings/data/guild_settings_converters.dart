import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_details.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

GuildSettingsDetails guildSettingsDetailsFromSdk(
  GuildResponse sdk,
  Guild guild,
) {
  return GuildSettingsDetails(
    guild: guild,
    afkChannelId: sdk.afkChannelId?.toString(),
    afkTimeout: sdk.afkTimeout,
    systemChannelId: sdk.systemChannelId?.toString(),
    systemChannelFlags: sdk.systemChannelFlags,
    explicitContentFilter: sdk.explicitContentFilter.json ?? 0,
    mfaLevel: sdk.mfaLevel.json ?? 0,
    defaultMessageNotifications: sdk.defaultMessageNotifications.json ?? 0,
    contentWarningLevel: sdk.contentWarningLevel.json ?? 0,
    contentWarningText: sdk.contentWarningText,
    splash: sdk.splash,
    embedSplash: sdk.embedSplash,
    splashCardAlignment: sdk.splashCardAlignment.json ?? 0,
    messageHistoryCutoff: sdk.messageHistoryCutoff,
    features: sdk.features.toList(),
  );
}

GuildAuditLogPage guildAuditLogPageFromSdk(GuildAuditLogListResponse sdk) {
  final Map<String, GuildAuditLogUser> users = <String, GuildAuditLogUser>{
    for (final UserPartialResponse user in sdk.users)
      user.id: GuildAuditLogUser(
        id: user.id,
        username: user.username,
        globalName: user.globalName,
        avatarHash: user.avatar,
        avatarColor: user.avatarColor,
        isBot: user.bot ?? false,
        displayName: user.globalName ?? user.username,
        avatarUrl: FluxerMediaUrl.userAvatar(
          userId: user.id,
          hash: user.avatar,
        ),
      ),
  };
  final Map<String, String> userNames = <String, String>{
    for (final MapEntry<String, GuildAuditLogUser> entry in users.entries)
      entry.key: entry.value.displayName,
  };
  final List<GuildAuditLogEntry> entries = sdk.auditLogEntries
      .map(guildAuditLogEntryFromSdk)
      .toList();
  final String? nextBefore = entries.isNotEmpty ? entries.last.id : null;
  return GuildAuditLogPage(
    entries: entries,
    userNames: userNames,
    users: users,
    nextBefore: nextBefore,
  );
}

GuildAuditLogEntryOptions? guildAuditLogEntryOptionsFromSdk(
  GuildAuditLogEntryResponseOptions? sdk,
) {
  if (sdk == null) {
    return null;
  }
  return GuildAuditLogEntryOptions(
    channelId: sdk.channelId,
    count: sdk.count,
    deleteMemberDays: sdk.deleteMemberDays,
    id: sdk.id,
    integrationType: sdk.integrationType,
    messageId: sdk.messageId,
    membersRemoved: sdk.membersRemoved,
    roleName: sdk.roleName,
    type: sdk.type,
    inviterId: sdk.inviterId,
    maxAge: sdk.maxAge,
    maxUses: sdk.maxUses,
    temporary: sdk.temporary,
    uses: sdk.uses,
  );
}

GuildAuditLogEntry guildAuditLogEntryFromSdk(GuildAuditLogEntryResponse sdk) {
  return GuildAuditLogEntry(
    id: sdk.id,
    actionType: sdk.actionType,
    userId: sdk.userId?.toString(),
    targetId: sdk.targetId,
    reason: sdk.reason,
    options: guildAuditLogEntryOptionsFromSdk(sdk.options),
    changes:
        sdk.changes
            ?.map(
              (AuditLogChangeSchema change) => GuildAuditLogChange(
                key: change.key,
                oldValue: change.oldValue,
                newValue: change.newValue,
              ),
            )
            .toList() ??
        const <GuildAuditLogChange>[],
    createdAt: dateTimeFromUserSnowflakeOrNull(sdk.id),
  );
}
