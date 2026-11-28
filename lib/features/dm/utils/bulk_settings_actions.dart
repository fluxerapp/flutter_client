import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_dart/export.dart';

const String kDmSettingsScopeId = '@me';

Future<void> bulkUpdateDmOverrides({
  required GuildUserSettingsRepository repository,
  required Iterable<String> channelIds,
  bool? muted,
  int? durationSeconds,
  UserNotificationSettings? messageNotifications,
}) async {
  try {
    await repository.updateChannelOverrides(
      guildId: kDmSettingsScopeId,
      channelIds: channelIds,
      muted: muted,
      durationSeconds: durationSeconds,
      messageNotifications: messageNotifications,
    );
  } on Object catch (error) {
    talker.error('[BulkDmSettings] Failed to update DM overrides: $error');
  }
}

Future<void> updateDmPrivacyFlags({
  required FluxerClient client,
  int? incomingCallFlags,
  int? groupDmAddPermissionFlags,
}) async {
  try {
    await client.users.updateCurrentUserSettings(
      body: UserSettingsUpdateRequest(
        incomingCallFlags: incomingCallFlags,
        groupDmAddPermissionFlags: groupDmAddPermissionFlags,
      ),
    );
  } on Object catch (error) {
    talker.error('[BulkDmSettings] Failed to update DM privacy: $error');
  }
}
