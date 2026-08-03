import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart'
    as engine;
import 'package:fluxer_app/core/synced_preferences/favorites_state_codec.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as accessibility_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/core/synced_preferences/synced_preferences_wire_codec.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

class _FakeUsersApi implements UsersApi {
  _FakeUsersApi() : pushError = null;

  Object? pushError;
  UserSettingsUpdateRequest? lastPushBody;
  int pushCount = 0;
  Completer<void>? firstPushGate;

  @override
  Future<UserSettingsResponse> updateCurrentUserSettings({
    required UserSettingsUpdateRequest body,
  }) async {
    pushCount++;
    lastPushBody = body;
    if (pushCount == 1 && firstPushGate != null) {
      await firstPushGate!.future;
    }
    if (pushError != null) {
      // The fake accepts arbitrary configured failures to exercise error paths.
      // ignore: only_throw_errors
      throw pushError!;
    }
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

UserSettingsResponse _settingsFor(FavoritesLocalState state) {
  final encoded = FavoritesStateCodec.encodeFavoritesIntoWire(
    currentWire: null,
    local: state,
  );
  return _testUserSettings(syncedPreferences: encoded);
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
  group('SyncedPreferencesStore favorites', () {
    late db.FluxerDatabase database;
    late _FakeUsersApi usersApi;
    late ProviderContainer container;
    late SyncedPreferencesStore syncStore;

    setUp(() {
      database = openTestDatabase();
      usersApi = _FakeUsersApi();
      container = _createContainer(database: database, usersApi: usersApi);
      syncStore = container.read(syncedPreferencesStoreProvider);
    });

    tearDown(() {
      container.dispose();
    });

    test('defers push until settings hydration completes', () async {
      await database.favoriteChannelsDao.addChannel(
        channelId: 'channel-1',
        guildId: 'guild-1',
      );
      syncStore.markDirty(SyncedPreferenceField.favorites);
      await _waitForDebounce();

      expect(usersApi.pushCount, 0);

      await syncStore.hydrateFromUserSettings(
        _settingsFor(FavoritesLocalState.empty),
      );
      await _waitForDebounce();

      expect(usersApi.pushCount, 1);
      final pushed = FavoritesStateCodec.decodeFavoritesFromWire(
        usersApi.lastPushBody!.syncedPreferences!,
      );
      expect(pushed.channels.single.channelId, 'channel-1');
    });

    test('push sends full local snapshot, not union with stale wire', () async {
      const server = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'desktop-1',
            guildId: 'guild-1',
            position: 0,
          ),
          db.FavoriteChannel(
            channelId: 'desktop-2',
            guildId: 'guild-1',
            position: 1,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );

      await syncStore.hydrateFromUserSettings(_settingsFor(server));
      await database.favoriteChannelsDao.addChannel(
        channelId: 'android-1',
        guildId: '@me',
      );
      syncStore.markDirty(SyncedPreferenceField.favorites);
      await _waitForDebounce();

      expect(usersApi.pushCount, 1);
      final pushed = FavoritesStateCodec.decodeFavoritesFromWire(
        usersApi.lastPushBody!.syncedPreferences!,
      );
      expect(
        pushed.channels.map((channel) => channel.channelId),
        containsAll(['desktop-1', 'desktop-2', 'android-1']),
      );
    });

    test('remove local channel is excluded from push payload', () async {
      const server = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'keep',
            guildId: 'guild-1',
            position: 0,
          ),
          db.FavoriteChannel(
            channelId: 'remove-me',
            guildId: 'guild-1',
            position: 1,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );

      await syncStore.hydrateFromUserSettings(_settingsFor(server));
      await database.favoriteChannelsDao.removeChannel('remove-me');
      syncStore.markDirty(SyncedPreferenceField.favorites);
      await _waitForDebounce();

      final pushed = FavoritesStateCodec.decodeFavoritesFromWire(
        usersApi.lastPushBody!.syncedPreferences!,
      );
      expect(pushed.channels.map((channel) => channel.channelId), ['keep']);
    });

    test('hydrate applies remote when favorites are not dirty', () async {
      const server = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'remote-1',
            guildId: 'guild-1',
            position: 0,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );

      await syncStore.hydrateFromUserSettings(_settingsFor(server));

      final channel = await database.favoriteChannelsDao.getChannel('remote-1');
      expect(channel, isNotNull);
    });

    test(
      'first hydrate removes a category deleted on another client',
      () async {
        await database.favoriteChannelsDao.addCategory(
          id: 'cat-1',
          name: 'Read',
        );

        await syncStore.hydrateFromUserSettings(
          _settingsFor(FavoritesLocalState.empty),
        );

        final categories = await database.favoriteChannelsDao.getCategories();
        expect(categories, isEmpty);
      },
    );

    test(
      'hydrate ignores remote shrink while dirty and recently acked',
      () async {
        const initial = FavoritesLocalState(
          channels: [
            db.FavoriteChannel(
              channelId: 'local-1',
              guildId: 'guild-1',
              position: 0,
            ),
          ],
          categories: [],
          collapsedCategoryIds: [],
          hideMutedChannels: false,
          muted: false,
        );
        const remoteShrink = FavoritesLocalState.empty;

        await syncStore.hydrateFromUserSettings(_settingsFor(initial));
        await database.favoriteChannelsDao.addChannel(
          channelId: 'local-2',
          guildId: 'guild-1',
        );
        syncStore.markDirty(SyncedPreferenceField.favorites);
        await _waitForDebounce();
        expect(usersApi.pushCount, 1);

        await syncStore.hydrateFromUserSettings(_settingsFor(remoteShrink));

        final channels = await database.favoriteChannelsDao
            .watchChannels()
            .first;
        expect(
          channels.map((channel) => channel.channelId),
          containsAll(['local-1', 'local-2']),
        );
      },
    );

    test('session reset clears hydrated state and wire blob', () async {
      const server = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'server-1',
            guildId: 'guild-1',
            position: 0,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );

      await syncStore.hydrateFromUserSettings(_settingsFor(server));
      syncStore.reset();

      await database.favoriteChannelsDao.addChannel(
        channelId: 'local-only',
        guildId: 'guild-2',
      );
      syncStore.markDirty(SyncedPreferenceField.favorites);
      await _waitForDebounce();
      expect(usersApi.pushCount, 0);

      await syncStore.hydrateFromUserSettings(_settingsFor(server));
      await _waitForDebounce();
      expect(usersApi.pushCount, 1);
    });

    test(
      'first hydrate merges server favorites when dirty from pre-ready tap',
      () async {
        const server = FavoritesLocalState(
          channels: [
            db.FavoriteChannel(
              channelId: 'desktop-1',
              guildId: 'guild-1',
              position: 0,
            ),
            db.FavoriteChannel(
              channelId: 'desktop-2',
              guildId: 'guild-1',
              position: 1,
            ),
          ],
          categories: [],
          collapsedCategoryIds: [],
          hideMutedChannels: false,
          muted: false,
        );

        await database.favoriteChannelsDao.addChannel(
          channelId: 'android-1',
          guildId: '@me',
        );
        syncStore.markDirty(SyncedPreferenceField.favorites);

        await syncStore.hydrateFromUserSettings(_settingsFor(server));
        await _waitForDebounce();

        final channels = await database.favoriteChannelsDao
            .watchChannels()
            .first;
        expect(
          channels.map((channel) => channel.channelId),
          containsAll(['android-1', 'desktop-1', 'desktop-2']),
        );
        expect(usersApi.pushCount, 1);
        final pushed = FavoritesStateCodec.decodeFavoritesFromWire(
          usersApi.lastPushBody!.syncedPreferences!,
        );
        expect(
          pushed.channels.map((channel) => channel.channelId),
          containsAll(['android-1', 'desktop-1', 'desktop-2']),
        );
      },
    );

    test('hydrate applies remote reorder after gateway reconnect', () async {
      const localOrder = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'channel-a',
            guildId: 'guild-1',
            position: 0,
          ),
          db.FavoriteChannel(
            channelId: 'channel-b',
            guildId: 'guild-1',
            position: 1,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );
      const remoteOrder = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'channel-b',
            guildId: 'guild-1',
            position: 0,
          ),
          db.FavoriteChannel(
            channelId: 'channel-a',
            guildId: 'guild-1',
            position: 1,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );

      await syncStore.hydrateFromUserSettings(_settingsFor(localOrder));
      syncStore.markSessionChanging();
      await syncStore.hydrateFromUserSettings(_settingsFor(remoteOrder));

      final channels = await database.favoriteChannelsDao.watchChannels().first;
      final sorted = [...channels]
        ..sort((a, b) => a.position.compareTo(b.position));
      expect(sorted.map((channel) => channel.channelId), [
        'channel-b',
        'channel-a',
      ]);
    });

    test('hydrate merges remote additions while dirty', () async {
      const initial = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'local-1',
            guildId: 'guild-1',
            position: 0,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );
      const expanded = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'local-1',
            guildId: 'guild-1',
            position: 0,
          ),
          db.FavoriteChannel(
            channelId: 'desktop-added',
            guildId: 'guild-1',
            position: 1,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );

      await syncStore.hydrateFromUserSettings(_settingsFor(initial));
      await database.favoriteChannelsDao.addChannel(
        channelId: 'local-2',
        guildId: 'guild-1',
      );
      syncStore.markDirty(SyncedPreferenceField.favorites);
      await _waitForDebounce();
      expect(usersApi.pushCount, 1);

      await syncStore.hydrateFromUserSettings(_settingsFor(expanded));

      final channels = await database.favoriteChannelsDao.watchChannels().first;
      expect(
        channels.map((channel) => channel.channelId),
        containsAll(['local-1', 'local-2', 'desktop-added']),
      );
    });

    test('retries push after 429 rate limit', () async {
      usersApi.pushError = DioException(
        requestOptions: RequestOptions(path: '/users/@me/settings'),
        response: Response(
          requestOptions: RequestOptions(path: '/users/@me/settings'),
          statusCode: 429,
        ),
      );

      await syncStore.hydrateFromUserSettings(
        _settingsFor(FavoritesLocalState.empty),
      );
      await database.favoriteChannelsDao.addChannel(
        channelId: 'retry-1',
        guildId: 'guild-1',
      );
      syncStore.markDirty(SyncedPreferenceField.favorites);
      await _waitForDebounce();
      expect(usersApi.pushCount, 1);

      usersApi.pushError = null;
      await Future<void>.delayed(const Duration(seconds: 6));
      expect(usersApi.pushCount, greaterThan(1));
    });

    test(
      'overlapping pushes do not crash while first push is in flight',
      () async {
        usersApi.firstPushGate = Completer<void>();

        await syncStore.hydrateFromUserSettings(
          _settingsFor(FavoritesLocalState.empty),
        );
        await database.favoriteChannelsDao.addChannel(
          channelId: 'channel-1',
          guildId: 'guild-1',
        );
        syncStore.markDirty(SyncedPreferenceField.favorites);
        await _waitForDebounce();

        expect(usersApi.pushCount, 1);

        await database.favoriteChannelsDao.addChannel(
          channelId: 'channel-2',
          guildId: 'guild-1',
        );
        syncStore.markDirty(SyncedPreferenceField.favorites);
        syncStore.scheduleFlush();
        await _waitForDebounce();

        usersApi.firstPushGate!.complete();
        await _waitForDebounce();

        expect(usersApi.pushCount, greaterThanOrEqualTo(2));
        final pushed = FavoritesStateCodec.decodeFavoritesFromWire(
          usersApi.lastPushBody!.syncedPreferences!,
        );
        expect(
          pushed.channels.map((channel) => channel.channelId),
          containsAll(['channel-1', 'channel-2']),
        );
      },
    );
  });

  group('FavoritesStateCodec cross-client', () {
    test('statesEqual treats null and @me guildId as equivalent', () {
      const withNull = FavoritesLocalState(
        channels: [db.FavoriteChannel(channelId: 'dm-1', position: 0)],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );
      const withAtMe = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(channelId: 'dm-1', guildId: '@me', position: 0),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );

      expect(FavoritesStateCodec.statesEqual(withNull, withAtMe), isTrue);
    });

    test('wire roundtrip preserves unrelated synced preference fields', () {
      const initial = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'initial',
            guildId: 'guild',
            position: 0,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );
      final favoritesWire = base64Decode(
        FavoritesStateCodec.encodeFavoritesIntoWire(
          currentWire: null,
          local: initial,
        ),
      );
      final preservedField = base64Decode(
        engine.SyncedPreferencesWireCodec.encodeFieldIntoWire(
          currentWire: null,
          fieldNumber: 1,
          fieldMessageBytes: accessibility_pb.AccessibilitySettings(
            hideKeyboardHints: true,
          ).writeToBuffer(),
        ),
      );
      final combined = Uint8List.fromList([
        ...preservedField,
        ...favoritesWire,
      ]);
      final currentWire = base64Encode(combined);

      final updated = FavoritesStateCodec.encodeFavoritesIntoWire(
        currentWire: currentWire,
        local: const FavoritesLocalState(
          channels: [
            db.FavoriteChannel(
              channelId: 'updated',
              guildId: 'guild',
              position: 0,
            ),
          ],
          categories: [],
          collapsedCategoryIds: [],
          hideMutedChannels: false,
          muted: false,
        ),
      );

      final updatedBytes = base64Decode(updated);
      final synced = pb.SyncedPreferences.fromBuffer(updatedBytes);
      expect(synced.accessibility.hideKeyboardHints, isTrue);
      final decoded = FavoritesStateCodec.decodeFavoritesFromWire(updated);
      expect(decoded.channels.single.channelId, 'updated');
    });

    test('verifyWirePreservesForeignFields rejects stripped blobs', () {
      const initial = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'initial',
            guildId: 'guild',
            position: 0,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );
      final favoritesOnly = FavoritesStateCodec.encodeFavoritesIntoWire(
        currentWire: null,
        local: initial,
      );
      final foreignField = _encodeStringField(1, 'keep-me');
      final combined = base64Encode(
        Uint8List.fromList([...foreignField, ...base64Decode(favoritesOnly)]),
      );
      expect(
        SyncedPreferencesWireCodec.verifyWirePreservesForeignFields(
          before: combined,
          after: favoritesOnly,
        ),
        isFalse,
      );
      expect(SyncedPreferencesWireCodec.countForeignFields(combined), 1);
    });
  });
}

List<int> _encodeVarint(int value) {
  final bytes = <int>[];
  var current = value;
  while (current > 0x7f) {
    bytes.add((current & 0x7f) | 0x80);
    current >>= 7;
  }
  bytes.add(current);
  return bytes;
}

Uint8List _encodeStringField(int fieldNumber, String value) {
  final valueBytes = utf8.encode(value);
  final tag = (fieldNumber << 3) | 2;
  return Uint8List.fromList([
    ..._encodeVarint(tag),
    ..._encodeVarint(valueBytes.length),
    ...valueBytes,
  ]);
}
