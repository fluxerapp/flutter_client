import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart';
import 'package:fluxer_app/core/synced_preferences/fields/guild_folders_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/synced_preferences_test_helpers.dart';

class _FakeUsersApi implements UsersApi {
  UserSettingsUpdateRequest? lastPushBody;
  int pushCount = 0;

  @override
  Future<UserSettingsResponse> updateCurrentUserSettings({
    required UserSettingsUpdateRequest body,
  }) async {
    pushCount++;
    lastPushBody = body;
    return UserSettingsResponse.fromJson({
      'status': 'online',
      'theme': 'dark',
      'locale': 'en-US',
      'synced_preferences': body.syncedPreferences ?? '',
      'render_embeds': true,
      'profile_privacy': 0,
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

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._usersApi) : super(Dio());

  final UsersApi _usersApi;

  @override
  UsersApi get users => _usersApi;
}

UserSettingsResponse _testUserSettings({required String syncedPreferences}) {
  return UserSettingsResponse.fromJson({
    'status': 'online',
    'theme': 'dark',
    'locale': 'en-US',
    'synced_preferences': syncedPreferences,
    'render_embeds': true,
    'profile_privacy': 0,
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

String _wireWithGuildFoldersAndSound({
  required Set<int> folderIds,
  required double masterVolume,
}) {
  final foldersWire = SyncedPreferencesWireCodec.encodeFieldIntoWire(
    currentWire: null,
    fieldNumber: SyncedPreferenceField.guildFolders.fieldNumber,
    fieldMessageBytes: GuildFoldersSyncedField.toProto(
      folderIds,
    ).writeToBuffer(),
  );
  return SyncedPreferencesWireCodec.encodeFieldIntoWire(
    currentWire: foldersWire,
    fieldNumber: SyncedPreferenceField.sound.fieldNumber,
    fieldMessageBytes: pickers_pb.SoundSettings(
      masterVolume: masterVolume,
    ).writeToBuffer(),
  );
}

void main() {
  test('push encodes only dirty fields on the wire', () async {
    final database = openTestDatabase();
    final usersApi = _FakeUsersApi();
    addTearDown(database.close);

    final container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        fluxerClientProvider.overrideWithValue(_FakeClient(usersApi)),
      ],
    );
    addTearDown(container.dispose);

    final initialWire = _wireWithGuildFoldersAndSound(
      folderIds: {42},
      masterVolume: 50,
    );
    final store = container.read(syncedPreferencesStoreProvider);
    await store.hydrateFromUserSettings(
      _testUserSettings(syncedPreferences: initialWire),
    );

    await container.read(soundPreferencesProvider.notifier).setMasterVolume(80);
    await flushSyncedPreferencesDebounce(store);

    expect(usersApi.pushCount, 1);
    final pushedWire = usersApi.lastPushBody!.syncedPreferences!;
    final pushed = pb.SyncedPreferences.fromBuffer(base64Decode(pushedWire));

    expect(pushed.hasSound(), isTrue);
    expect(pushed.sound.masterVolume, closeTo(80, 0.001));
    expect(pushed.hasGuildFolders(), isTrue);
    expect(pushed.guildFolders.expandedFolderIds.map((id) => id.toInt()), [42]);

    final initialBytes = base64Decode(initialWire);
    final pushedBytes = base64Decode(pushedWire);
    final folderChunks = SyncedPreferencesWireCodec.extractFieldChunks(
      initialBytes,
      SyncedPreferenceField.guildFolders.fieldNumber,
    );
    final pushedFolderChunks = SyncedPreferencesWireCodec.extractFieldChunks(
      pushedBytes,
      SyncedPreferenceField.guildFolders.fieldNumber,
    );
    expect(pushedFolderChunks, folderChunks);
  });
}
