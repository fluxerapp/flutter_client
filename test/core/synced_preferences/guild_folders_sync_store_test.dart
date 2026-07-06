import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/fields/guild_folders_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_dart/export.dart';

class _FakeUsersApi implements UsersApi {
  _FakeUsersApi();

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

String _settingsWithExpandedFolders(Set<int> folderIds) {
  final synced = pb.SyncedPreferences(
    guildFolders: GuildFoldersSyncedField.toProto(folderIds),
  );
  return base64Encode(synced.writeToBuffer());
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

ProviderContainer _createContainer({
  required db.FluxerDatabase database,
  required _FakeUsersApi usersApi,
}) {
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(database),
      fluxerClientProvider.overrideWithValue(_FakeClient(usersApi)),
    ],
  );
}

Future<void> _waitForDebounce() async {
  await Future<void>.delayed(const Duration(milliseconds: 600));
}

void main() {
  group('SyncedPreferencesStore guild folders', () {
    late db.FluxerDatabase database;
    late _FakeUsersApi usersApi;
    late ProviderContainer container;

    setUp(() {
      database = openTestDatabase();
      usersApi = _FakeUsersApi();
      container = _createContainer(database: database, usersApi: usersApi);
    });

    tearDown(() {
      container.dispose();
    });

    test('hydrate applies remote expanded folder ids', () async {
      final store = container.read(syncedPreferencesStoreProvider);
      await store.hydrateFromUserSettings(
        _testUserSettings(
          syncedPreferences: _settingsWithExpandedFolders({42, 99}),
        ),
      );

      final expanded = container.read(folderExpandedStateProvider);
      expect(expanded, {42, 99});
    });

    test('toggle marks guildFolders dirty and pushes field 105', () async {
      final store = container.read(syncedPreferencesStoreProvider);
      await store.hydrateFromUserSettings(
        _testUserSettings(syncedPreferences: ''),
      );

      container.read(folderExpandedStateProvider.notifier).toggle(7);
      await _waitForDebounce();

      expect(usersApi.pushCount, 1);
      final bytes = base64Decode(usersApi.lastPushBody!.syncedPreferences!);
      final synced = pb.SyncedPreferences.fromBuffer(bytes);
      expect(synced.hasGuildFolders(), isTrue);
      expect(synced.guildFolders.expandedFolderIds.map((id) => id.toInt()), [
        7,
      ]);
    });

    test(
      'second hydrate applies remote expand from USER_SETTINGS_UPDATE',
      () async {
        final store = container.read(syncedPreferencesStoreProvider);
        await store.hydrateFromUserSettings(
          _testUserSettings(syncedPreferences: ''),
        );

        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithExpandedFolders({42, 99}),
          ),
        );

        expect(container.read(folderExpandedStateProvider), {42, 99});
      },
    );

    test(
      'second hydrate applies remote collapse from USER_SETTINGS_UPDATE',
      () async {
        final store = container.read(syncedPreferencesStoreProvider);
        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithExpandedFolders({42}),
          ),
        );

        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithExpandedFolders({}),
          ),
        );

        expect(container.read(folderExpandedStateProvider), isEmpty);
      },
    );

    test('first hydrate applies remote collapse over stale local', () async {
      final store = container.read(syncedPreferencesStoreProvider);
      await container.read(folderExpandedStateProvider.notifier).applySynced({
        42,
      });

      await store.hydrateFromUserSettings(
        _testUserSettings(syncedPreferences: _settingsWithExpandedFolders({})),
      );

      expect(container.read(folderExpandedStateProvider), isEmpty);
    });
  });
}
