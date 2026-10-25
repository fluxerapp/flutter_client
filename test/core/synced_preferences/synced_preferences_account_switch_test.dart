import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as accessibility_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_usage_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/synced_preferences_test_helpers.dart';

const _userA = '100000000000000001';
const _userB = '200000000000000002';

class _Account {
  _Account(this.blob);

  String blob;
  Completer<void>? fetchGate;
  int patches = 0;
}

class _InstancesUsersApi implements UsersApi {
  _InstancesUsersApi(this.accounts);

  final Map<String, _Account> accounts;
  String active = _userA;

  @override
  Future<UserSettingsResponse> getCurrentUserSettings() async {
    final _Account account = accounts[active]!;
    await account.fetchGate?.future;
    return testUserSettingsWithSyncedBlob(account.blob);
  }

  @override
  Future<UserSettingsResponse> updateCurrentUserSettings({
    UserSettingsUpdateRequest? body,
  }) async {
    final _Account account = accounts[active]!;
    account
      ..patches += 1
      ..blob = body?.syncedPreferences.value ?? account.blob;
    return testUserSettingsWithSyncedBlob(account.blob);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _InstancesClient extends FluxerClient {
  _InstancesClient(this._users) : super(Dio());

  final UsersApi _users;

  @override
  UsersApi get users => _users;
}

pickers_pb.FavoriteGifEntry _gif(int i) => pickers_pb.FavoriteGifEntry(
  url: 'https://media.example/gif-$i.gif',
  proxyUrl: 'https://proxy.example/gif-$i.gif',
  width: 100,
  height: 100,
);

pb.SyncedPreferences _decode(String blob) =>
    pb.SyncedPreferences.fromBuffer(base64Decode(blob));

void main() {
  late db.FluxerDatabase database;
  late _InstancesUsersApi api;
  late ProviderContainer container;
  late SyncedPreferencesStore store;

  void setUpAccounts(Map<String, pb.SyncedPreferences> blobs) {
    database = openTestDatabase();
    api = _InstancesUsersApi({
      for (final MapEntry<String, pb.SyncedPreferences> entry in blobs.entries)
        entry.key: _Account(encodeSyncedPreferences(entry.value)),
    });
    container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        fluxerClientProvider.overrideWithValue(_InstancesClient(api)),
      ],
    );
    addTearDown(container.dispose);
    store = container.read(syncedPreferencesStoreProvider);
  }

  Future<void> switchTo(String userId) async {
    store.reset();
    await database.clearAccountData();
    container.read(currentUserIdProvider.notifier).set(userId);
    api.active = userId;
    unawaited(container.read(themePreferenceProvider.notifier).load(userId));
    unawaited(
      container.read(appearancePreferencesProvider.notifier).load(userId),
    );
    await drainAsyncWork();
  }

  test('a settings fetch for the previous account never hydrates the '
      'current one', () async {
    setUpAccounts({
      _userA: pb.SyncedPreferences(
        emojiPicker: pickers_pb.EmojiPickerState(
          favoriteEmojiIds: ['unicode:heart', 'unicode:tada'],
        ),
        favoriteGifs: pickers_pb.FavoriteGifSettings(
          entries: [for (var i = 0; i < 5; i++) _gif(i)],
        ),
        accessibility: accessibility_pb.AccessibilitySettings(
          showFavorites: false,
        ),
      ),
      _userB: pb.SyncedPreferences(
        sidebar: pb.SidebarPreferences(inlineDmsCollapsed: true),
      ),
    });

    await switchTo(_userA);
    api.accounts[_userB]!.fetchGate = Completer<void>();
    await switchTo(_userB);
    api.accounts[_userA]!.fetchGate = Completer<void>();
    await switchTo(_userA);

    api.accounts[_userB]!.fetchGate!.complete();
    await drainAsyncWork();
    expect(store.hasHydrated, isFalse);
    expect(await database.userPreferencesDao.getFavoriteEmojiKeys(_userA), [
      'unicode:heart',
      'unicode:tada',
    ]);

    await container
        .read(appearancePreferencesProvider.notifier)
        .setHideKeyboardHints(value: true);
    await flushSyncedPreferencesDebounce(store);
    expect(api.accounts[_userA]!.patches, 0);

    api.accounts[_userA]!.fetchGate!.complete();
    await drainAsyncWork();
    await flushSyncedPreferencesDebounce(store);

    final pb.SyncedPreferences serverA = _decode(api.accounts[_userA]!.blob);
    expect(serverA.emojiPicker.favoriteEmojiIds, [
      'unicode:heart',
      'unicode:tada',
    ]);
    expect(serverA.favoriteGifs.entries, hasLength(5));
    expect(serverA.accessibility.showFavorites, isFalse);
    expect(serverA.hasSidebar(), isFalse);
    expect(container.read(favoriteGifsProvider).entries, hasLength(5));
    expect(container.read(appearancePreferencesProvider).showFavorites, false);
    expect(await database.userPreferencesDao.getFavoriteEmojiKeys(_userA), [
      'unicode:heart',
      'unicode:tada',
    ]);
  });

  test('synced values for the new account never land in the previous '
      'account row', () async {
    pb.SyncedPreferences blob({required bool showFavorites}) =>
        pb.SyncedPreferences(
          accessibility: accessibility_pb.AccessibilitySettings(
            showFavorites: showFavorites,
            showMediaFavoriteButton: showFavorites,
          ),
        );
    setUpAccounts({
      _userA: blob(showFavorites: true),
      _userB: blob(showFavorites: false),
    });
    for (final (String userId, bool value) in [
      (_userA, true),
      (_userB, false),
    ]) {
      await database.userPreferencesDao.savePreferences(
        db.UserPreferencesTableCompanion(
          userId: Value(userId),
          showFavorites: Value(value),
          showMediaFavoriteButton: Value(value),
        ),
      );
    }
    final appearance = container.read(appearancePreferencesProvider.notifier);

    Future<void> readyThenLoad(String userId) async {
      store.reset();
      api.active = userId;
      container.read(currentUserIdProvider.notifier).set(userId);
      await store.hydrateFromUserSettings(
        testUserSettingsWithSyncedBlob(api.accounts[userId]!.blob),
      );
      await Future.wait<void>([
        appearance.load(userId),
        container.read(advancedPreferencesProvider.notifier).load(userId),
      ]);
      await drainAsyncWork();
    }

    container.read(currentUserIdProvider.notifier).set(_userA);
    await appearance.load(_userA);
    await store.hydrateFromUserSettings(
      testUserSettingsWithSyncedBlob(api.accounts[_userA]!.blob),
    );
    await readyThenLoad(_userB);

    final db.UserPreferencesTableData? rowA = await database.userPreferencesDao
        .getPreferences(_userA);
    expect(rowA!.showFavorites, isTrue);
    expect(rowA.showMediaFavoriteButton, isTrue);

    await readyThenLoad(_userA);
    expect(container.read(appearancePreferencesProvider).showFavorites, true);
    await appearance.setShowActiveNow(value: false);
    await flushSyncedPreferencesDebounce(store);

    final accessibility_pb.AccessibilitySettings serverA = _decode(
      api.accounts[_userA]!.blob,
    ).accessibility;
    expect(serverA.showFavorites, isTrue);
    expect(serverA.showMediaFavoriteButton, isTrue);
    expect(
      (await database.userPreferencesDao.getPreferences(_userB))!.showFavorites,
      isFalse,
    );
  });

  test('a persisted unpushed emoji edit without a baseline keeps the server '
      'favourites', () async {
    pb.SyncedPreferences favorites(List<String> ids) => pb.SyncedPreferences(
      emojiPicker: pickers_pb.EmojiPickerState(favoriteEmojiIds: ids),
    );
    setUpAccounts({
      _userA: favorites(['unicode:heart', 'unicode:tada']),
      _userB: favorites(['unicode:cat']),
    });
    final dao = database.userPreferencesDao;

    container.read(currentUserIdProvider.notifier).set(_userA);
    await store.hydrateFromUserSettings(
      testUserSettingsWithSyncedBlob(api.accounts[_userA]!.blob),
    );
    await container
        .read(expressionUsageProvider(ExpressionUsageKind.emoji).notifier)
        .track('unicode:fire');
    await drainAsyncWork();
    expect(await dao.getSyncedPreferencesDirtyFields(_userA), ['emojiPicker']);

    store.reset();
    api.active = _userB;
    container.read(currentUserIdProvider.notifier).set(_userB);
    await store.hydrateFromUserSettings(
      testUserSettingsWithSyncedBlob(api.accounts[_userB]!.blob),
    );

    api.accounts[_userA]!.blob = encodeSyncedPreferences(
      favorites(['unicode:heart', 'unicode:tada', 'unicode:star']),
    );
    store.reset();
    api.active = _userA;
    container.read(currentUserIdProvider.notifier).set(_userA);
    await store.hydrateFromUserSettings(
      testUserSettingsWithSyncedBlob(api.accounts[_userA]!.blob),
    );
    await drainAsyncWork();
    await flushSyncedPreferencesDebounce(store);

    const expected = ['unicode:heart', 'unicode:tada', 'unicode:star'];
    expect(await dao.getFavoriteEmojiKeys(_userA), expected);
    expect(
      _decode(api.accounts[_userA]!.blob).emojiPicker.favoriteEmojiIds,
      expected,
    );
  });
}
