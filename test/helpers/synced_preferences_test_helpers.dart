import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_dart/export.dart';

Future<void> drainAsyncWork({int rounds = 64}) async {
  for (var i = 0; i < rounds; i++) {
    await pumpEventQueue();
  }
}

Future<void> flushSyncedPreferencesDebounce(
  SyncedPreferencesStore store,
) async {
  store.triggerDebouncedPushForTest();
  await drainAsyncWork();
}

Future<void> flushSyncedPreferencesPushRetry(
  SyncedPreferencesStore store,
) async {
  store.triggerPushRetryForTest();
  await drainAsyncWork();
}

String encodeSyncedPreferences(pb.SyncedPreferences preferences) =>
    base64Encode(preferences.writeToBuffer());

UserSettingsResponse syncedPreferencesUserSettings(
  pb.SyncedPreferences preferences,
) => testUserSettingsWithSyncedBlob(encodeSyncedPreferences(preferences));

UserSettingsResponse testUserSettingsWithSyncedBlob(String syncedPreferences) {
  return UserSettingsResponse.fromJson({
    'status': 'online',
    'theme': 'dark',
    'locale': 'en-US',
    'synced_preferences': syncedPreferences,
    'render_embeds': true,
    'profile_privacy': 0,
    'privacy_setup_version': 0,
    'restricted_guilds': <String>[],
    'bot_restricted_guilds': <String>[],
    'default_guilds_restricted': false,
    'bot_default_guilds_restricted': false,
    'inline_attachment_media': true,
    'inline_embed_media': true,
    'gif_auto_play': true,
    'render_reactions': true,
    'animate_emoji': true,
    'animate_stickers': 0,
    'render_spoilers': 0,
    'message_display_compact': false,
    'friend_source_flags': 0,
    'incoming_call_flags': 0,
    'group_dm_add_permission_flags': 0,
    'guild_folders': <Map<String, Object?>>[],
    'afk_timeout': 600,
    'time_format': 0,
    'developer_mode': false,
    'trusted_domains': <String>[],
    'default_hide_muted_channels': false,
    'sensitive_content_friend_dm_filter': 0,
    'sensitive_content_non_friend_dm_filter': 0,
    'sensitive_content_guild_filter': 0,
    'suppress_unprivileged_self_mentions': false,
    'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
    'staff_dm_access_user_ids': <String>[],
    'default_share_voice_activity': false,
  });
}

class RecordingUsersApi implements UsersApi {
  final List<pb.SyncedPreferences> pushes = <pb.SyncedPreferences>[];
  bool offline = false;

  pb.SyncedPreferences get lastPush => pushes.last;

  @override
  Future<UserSettingsResponse> updateCurrentUserSettings({
    UserSettingsUpdateRequest? body,
  }) async {
    if (offline) {
      throw DioException.connectionError(
        requestOptions: RequestOptions(),
        reason: 'offline',
      );
    }
    final String encoded = body?.syncedPreferences.value ?? '';
    pushes.add(pb.SyncedPreferences.fromBuffer(base64Decode(encoded)));
    return testUserSettingsWithSyncedBlob(encoded);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class RecordingFluxerClient extends FluxerClient {
  RecordingFluxerClient(this.recordingUsers) : super(Dio());

  final RecordingUsersApi recordingUsers;

  @override
  UsersApi get users => recordingUsers;
}
