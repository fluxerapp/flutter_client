import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/synced_preferences_test_helpers.dart';

const _userId = 'user-1';

class _FakeUsersApi implements UsersApi {
  @override
  Future<UserSettingsResponse> updateCurrentUserSettings({
    required UserSettingsUpdateRequest body,
  }) async {
    return _testUserSettings(syncedPreferences: body.syncedPreferences ?? '');
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

String _settingsWithFavoriteEmojiIds(List<String> ids) {
  final synced = pb.SyncedPreferences(
    emojiPicker: pickers_pb.EmojiPickerState(favoriteEmojiIds: ids),
  );
  return base64Encode(synced.writeToBuffer());
}

String _settingsOmittingEmojiPicker() {
  final synced = pb.SyncedPreferences(
    sidebar: pb.SidebarPreferences(inlineDmsCollapsed: true),
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

ProviderContainer _createContainer({required db.FluxerDatabase database}) {
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(database),
      fluxerClientProvider.overrideWithValue(_FakeClient(_FakeUsersApi())),
      currentUserIdProvider.overrideWithValue(_userId),
    ],
  );
}

void main() {
  group('SyncedPreferencesStore emoji picker', () {
    late db.FluxerDatabase database;
    late ProviderContainer container;

    setUp(() {
      database = openTestDatabase();
      container = _createContainer(database: database);
    });

    tearDown(() {
      container.dispose();
    });

    test('hydrate applies remote favorite emoji ids', () async {
      final store = container.read(syncedPreferencesStoreProvider);
      await store.hydrateFromUserSettings(
        _testUserSettings(
          syncedPreferences: _settingsWithFavoriteEmojiIds([
            'unicode:heart',
            'unicode:tada',
          ]),
        ),
      );

      expect(await database.userPreferencesDao.getFavoriteEmojiKeys(_userId), [
        'unicode:heart',
        'unicode:tada',
      ]);
    });

    test(
      'second hydrate applies remote unfavorite from USER_SETTINGS_UPDATE',
      () async {
        final store = container.read(syncedPreferencesStoreProvider);
        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithFavoriteEmojiIds([
              'unicode:heart',
              'unicode:tada',
            ]),
          ),
        );

        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithFavoriteEmojiIds(['unicode:tada']),
          ),
        );

        expect(
          await database.userPreferencesDao.getFavoriteEmojiKeys(_userId),
          ['unicode:tada'],
        );
      },
    );

    test('second hydrate applies remote clear of the last favorite', () async {
      final store = container.read(syncedPreferencesStoreProvider);
      await store.hydrateFromUserSettings(
        _testUserSettings(
          syncedPreferences: _settingsWithFavoriteEmojiIds(['unicode:heart']),
        ),
      );

      await store.hydrateFromUserSettings(
        _testUserSettings(syncedPreferences: _settingsWithFavoriteEmojiIds([])),
      );

      expect(
        await database.userPreferencesDao.getFavoriteEmojiKeys(_userId),
        isEmpty,
      );
    });

    test(
      'second hydrate applies omitted emojiPicker as a cleared favorite list',
      () async {
        final store = container.read(syncedPreferencesStoreProvider);
        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithFavoriteEmojiIds(['unicode:heart']),
          ),
        );

        await store.hydrateFromUserSettings(
          _testUserSettings(syncedPreferences: _settingsOmittingEmojiPicker()),
        );

        expect(
          await database.userPreferencesDao.getFavoriteEmojiKeys(_userId),
          isEmpty,
        );
      },
    );

    test('first hydrate applies remote unfavorite over stale local', () async {
      await database.userPreferencesDao.setFavoriteEmojiKeys(_userId, [
        'unicode:heart',
      ]);

      final store = container.read(syncedPreferencesStoreProvider);
      await store.hydrateFromUserSettings(
        _testUserSettings(syncedPreferences: _settingsWithFavoriteEmojiIds([])),
      );

      expect(
        await database.userPreferencesDao.getFavoriteEmojiKeys(_userId),
        isEmpty,
      );
    });

    test(
      'first hydrate applies omitted emojiPicker over stale local favorites',
      () async {
        await database.userPreferencesDao.setFavoriteEmojiKeys(_userId, [
          'unicode:heart',
        ]);

        final store = container.read(syncedPreferencesStoreProvider);
        await store.hydrateFromUserSettings(
          _testUserSettings(syncedPreferences: _settingsOmittingEmojiPicker()),
        );

        expect(
          await database.userPreferencesDao.getFavoriteEmojiKeys(_userId),
          isEmpty,
        );
      },
    );

    test(
      'omitted emojiPicker clears favorites after a local push ack',
      () async {
        final store = container.read(syncedPreferencesStoreProvider);
        await store.hydrateFromUserSettings(
          _testUserSettings(
            syncedPreferences: _settingsWithFavoriteEmojiIds([]),
          ),
        );

        await container
            .read(favoriteEmojiKeysProvider.notifier)
            .toggle('unicode:heart');
        await flushSyncedPreferencesDebounce(store);

        await store.hydrateFromUserSettings(
          _testUserSettings(syncedPreferences: _settingsOmittingEmojiPicker()),
        );

        expect(
          await database.userPreferencesDao.getFavoriteEmojiKeys(_userId),
          isEmpty,
        );
      },
    );

    test('remote unfavorite applies after a local push ack', () async {
      final store = container.read(syncedPreferencesStoreProvider);
      await store.hydrateFromUserSettings(
        _testUserSettings(
          syncedPreferences: _settingsWithFavoriteEmojiIds([
            'unicode:heart',
            'unicode:tada',
          ]),
        ),
      );

      expect(await container.read(favoriteEmojiKeysProvider.future), [
        'unicode:heart',
        'unicode:tada',
      ]);

      await container
          .read(favoriteEmojiKeysProvider.notifier)
          .toggle('unicode:ok_hand');
      await flushSyncedPreferencesDebounce(store);

      await store.hydrateFromUserSettings(
        _testUserSettings(
          syncedPreferences: _settingsWithFavoriteEmojiIds(['unicode:tada']),
        ),
      );

      expect(await database.userPreferencesDao.getFavoriteEmojiKeys(_userId), [
        'unicode:tada',
      ]);
    });
  });
}
