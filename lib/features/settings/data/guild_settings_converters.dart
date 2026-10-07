import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart' show Channel;
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_details.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
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

GuildAuditLogPage guildAuditLogPageFromSdk(
  GuildAuditLogListResponse sdk, {
  required String guildId,
}) {
  final Map<String, GuildAuditLogUser> users = <String, GuildAuditLogUser>{
    for (final UserPartialResponse user in sdk.users)
      user.id: GuildAuditLogUser(
        id: user.id,
        username: user.username,
        globalName: user.globalName,
        avatarHash: user.avatar,
        avatarColor: user.avatarColor,
        isBot: user.bot ?? false,
        avatarUrl: FluxerMediaUrl.userAvatar(
          userId: user.id,
          hash: user.avatar,
        ),
      ),
  };
  final List<GuildAuditLogEntry> entries = sdk.auditLogEntries
      .map(guildAuditLogEntryFromSdk)
      .toList();
  return GuildAuditLogPage(
    entries: entries,
    users: users,
    threads: <String, Channel>{
      for (final ThreadChannelResponse thread
          in sdk.threads ?? const <ThreadChannelResponse>[])
        thread.id: threadFromResponse(thread, guildId),
    },
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
    messageId: sdk.messageId,
    membersRemoved: sdk.membersRemoved,
    roleName: sdk.roleName,
    inviterId: sdk.inviterId,
    maxAge: sdk.maxAge,
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
