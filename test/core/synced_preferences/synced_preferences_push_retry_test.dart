import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/synced_preferences_test_helpers.dart';

class _FakeUsersApi implements UsersApi {
  int pushCount = 0;
  Object? pushError;

  @override
  Future<UserSettingsResponse> updateCurrentUserSettings({
    UserSettingsUpdateRequest? body,
  }) async {
    pushCount++;
    if (pushError != null) {
      // ignore: only_throw_errors
      throw pushError!;
    }
    return UserSettingsResponse.fromJson(<String, Object?>{
      'status': 'online',
      'theme': 'dark',
      'locale': 'en-US',
      'synced_preferences': body?.syncedPreferences ?? '',
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

UserSettingsResponse _emptySyncedSettings() {
  return UserSettingsResponse.fromJson(<String, Object?>{
    'status': 'online',
    'theme': 'dark',
    'locale': 'en-US',
    'synced_preferences': '',
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

DioException _dioError({required int statusCode}) {
  final RequestOptions options = RequestOptions(path: '/users/@me/settings');
  return DioException(
    requestOptions: options,
    type: DioExceptionType.badResponse,
    response: Response<dynamic>(
      requestOptions: options,
      statusCode: statusCode,
    ),
  );
}

void main() {
  group('SyncedPreferencesStore push retry', () {
    late _FakeUsersApi usersApi;
    late ProviderContainer container;
    late SyncedPreferencesStore store;

    setUp(() async {
      final database = openTestDatabase();
      usersApi = _FakeUsersApi();
      container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(database),
          fluxerClientProvider.overrideWithValue(_FakeClient(usersApi)),
        ],
      );
      addTearDown(container.dispose);
      store = container.read(syncedPreferencesStoreProvider);
      await store.hydrateFromUserSettings(_emptySyncedSettings());
    });

    test('failed push does not requeue on the 500ms debounce', () async {
      usersApi.pushError = _dioError(statusCode: 500);
      await container
          .read(soundPreferencesProvider.notifier)
          .setMasterVolume(80);
      await flushSyncedPreferencesDebounce(store);

      expect(usersApi.pushCount, 1);
      expect(store.hasDebouncedPushScheduledForTest, isFalse);
      expect(store.hasPushRetryScheduledForTest, isTrue);
    });

    test('429 does not also arm the 500ms debounce', () async {
      usersApi.pushError = _dioError(statusCode: 429);
      await container
          .read(soundPreferencesProvider.notifier)
          .setMasterVolume(80);
      await flushSyncedPreferencesDebounce(store);

      expect(usersApi.pushCount, 1);
      expect(store.hasDebouncedPushScheduledForTest, isFalse);
      expect(store.hasPushRetryScheduledForTest, isTrue);

      await flushSyncedPreferencesPushRetry(store);
      expect(usersApi.pushCount, 2);
    });

    test('markDirty during a 429 retry keeps the backoff timer', () async {
      usersApi.pushError = _dioError(statusCode: 429);
      await container
          .read(soundPreferencesProvider.notifier)
          .setMasterVolume(80);
      await flushSyncedPreferencesDebounce(store);

      expect(usersApi.pushCount, 1);
      expect(store.hasPushRetryScheduledForTest, isTrue);

      await container
          .read(soundPreferencesProvider.notifier)
          .setMasterVolume(40);

      expect(usersApi.pushCount, 1);
      expect(store.hasDebouncedPushScheduledForTest, isFalse);
      expect(store.hasPushRetryScheduledForTest, isTrue);
    });
  });
}
