import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/core/synced_preferences/usage_frecency.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_usage_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/synced_preferences_test_helpers.dart';

const _userId = 'user-1';

pickers_pb.UsageStat _stat(int count, int lastUsedMs) =>
    pickers_pb.UsageStat(count: count, lastUsedMs: Int64(lastUsedMs));

int _nowMs() => DateTime.now().millisecondsSinceEpoch;

pb.SyncedPreferences _emojiPicker({
  Map<String, pickers_pb.UsageStat> usage = const {},
  List<String> favorites = const [],
  List<String> collapsed = const [],
}) {
  final state = pickers_pb.EmojiPickerState(
    favoriteEmojiIds: favorites,
    collapsedCategoryIds: collapsed,
  );
  state.usage.addAll(usage);
  return pb.SyncedPreferences(
    emojiPicker: state,
    sidebar: pb.SidebarPreferences(inlineDmsCollapsed: true),
  );
}

ProviderContainer _container(
  db.FluxerDatabase database,
  RecordingUsersApi api,
) {
  final container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(database),
      fluxerClientProvider.overrideWithValue(RecordingFluxerClient(api)),
      currentUserIdProvider.overrideWithValue(_userId),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  late db.FluxerDatabase database;
  late RecordingUsersApi api;
  late ProviderContainer container;
  late SyncedPreferencesStore store;

  setUp(() {
    database = openTestDatabase();
    api = RecordingUsersApi();
    container = _container(database, api);
    store = container.read(syncedPreferencesStoreProvider);
  });

  group('emoji usage sync', () {
    test('hydrate applies remote usage and ranks it like web', () async {
      final now = _nowMs();
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          _emojiPicker(
            usage: {
              'unicode:sweat_smile': _stat(2, now),
              'unicode:heart': _stat(9, now),
              'custom:1:2': _stat(3, now - 30 * 24 * 3600 * 1000),
              'sticker_like_garbage': _stat(5, now),
            },
          ),
        ),
      );

      expect(await container.read(rankedEmojiUsageKeysProvider.future), [
        'unicode:heart',
        'unicode:sweat_smile',
        'custom:1:2',
      ]);
    });

    test('a live remote usage update replaces the ranking', () async {
      final now = _nowMs();
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          _emojiPicker(usage: {'unicode:heart': _stat(1, now)}),
        ),
      );
      expect(await container.read(rankedEmojiUsageKeysProvider.future), [
        'unicode:heart',
      ]);

      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          _emojiPicker(
            usage: {
              'unicode:heart': _stat(1, now),
              'unicode:tada': _stat(5, now),
            },
          ),
        ),
      );

      expect(await container.read(rankedEmojiUsageKeysProvider.future), [
        'unicode:tada',
        'unicode:heart',
      ]);
    });

    test(
      'tracking pushes usage and keeps favourites and other fields',
      () async {
        await store.hydrateFromUserSettings(
          syncedPreferencesUserSettings(
            _emojiPicker(favorites: ['unicode:heart'], collapsed: ['people']),
          ),
        );

        await container
            .read(expressionUsageProvider(ExpressionUsageKind.emoji).notifier)
            .track('unicode:tada');
        await flushSyncedPreferencesDebounce(store);

        final pushed = api.lastPush;
        expect(pushed.emojiPicker.usage['unicode:tada']?.count, 1);
        expect(pushed.emojiPicker.favoriteEmojiIds, ['unicode:heart']);
        expect(pushed.emojiPicker.collapsedCategoryIds, ['people']);
        expect(pushed.sidebar.inlineDmsCollapsed, isTrue);
      },
    );

    test('tracking ignores keys web would reject', () async {
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(_emojiPicker()),
      );
      await container
          .read(expressionUsageProvider(ExpressionUsageKind.emoji).notifier)
          .track('heart');

      expect(
        await container.read(
          expressionUsageProvider(ExpressionUsageKind.emoji).future,
        ),
        isEmpty,
      );
    });

    test('remote usage is max-merged with unpushed local usage', () async {
      final now = _nowMs();
      await database.userPreferencesDao.setEmojiUsage(_userId, {
        'unicode:heart': UsageEntry(count: 7, lastUsedMs: now - 1000),
        'unicode:local': UsageEntry(count: 1, lastUsedMs: now),
      });

      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          _emojiPicker(
            usage: {
              'unicode:heart': _stat(2, now),
              'unicode:remote': _stat(4, now),
            },
          ),
        ),
      );
      await flushSyncedPreferencesDebounce(store);

      expect(
        await container.read(
          expressionUsageProvider(ExpressionUsageKind.emoji).future,
        ),
        {
          'unicode:heart': UsageEntry(count: 7, lastUsedMs: now),
          'unicode:local': UsageEntry(count: 1, lastUsedMs: now),
          'unicode:remote': UsageEntry(count: 4, lastUsedMs: now),
        },
      );
      final pushedUsage = api.lastPush.emojiPicker.usage;
      expect(pushedUsage.keys.toSet(), {
        'unicode:heart',
        'unicode:local',
        'unicode:remote',
      });
      expect(pushedUsage['unicode:heart']?.count, 7);
    });

    test('usage-heavy picker fields wait 1500ms before pushing', () async {
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(_emojiPicker()),
      );
      await container
          .read(expressionUsageProvider(ExpressionUsageKind.emoji).notifier)
          .track('unicode:tada');

      expect(
        store.scheduledPushDelayForTest,
        const Duration(milliseconds: 1500),
      );
    });
  });

  group('favourite emoji sync', () {
    test('toggle appends like web and refuses past 500', () async {
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          _emojiPicker(favorites: ['unicode:heart']),
        ),
      );
      final notifier = container.read(favoriteEmojiKeysProvider.notifier);
      await notifier.toggle('unicode:tada');
      expect(await container.read(favoriteEmojiKeysProvider.future), [
        'unicode:heart',
        'unicode:tada',
      ]);

      await database.userPreferencesDao.setFavoriteEmojiKeys(_userId, [
        for (var i = 0; i < 500; i++) 'unicode:e$i',
      ]);
      container.invalidate(favoriteEmojiKeysProvider);
      await container.read(favoriteEmojiKeysProvider.future);
      await notifier.toggle('unicode:overflow');
      expect(
        await container.read(favoriteEmojiKeysProvider.future),
        isNot(contains('unicode:overflow')),
      );
    });

    test('a remote reorder of favourites is applied', () async {
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          _emojiPicker(favorites: ['unicode:heart', 'unicode:tada']),
        ),
      );
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          _emojiPicker(favorites: ['unicode:tada', 'unicode:heart']),
        ),
      );

      expect(await database.userPreferencesDao.getFavoriteEmojiKeys(_userId), [
        'unicode:tada',
        'unicode:heart',
      ]);
    });

    test(
      'a favourite removed before the first hydrate is not brought back',
      () async {
        await database.userPreferencesDao.setFavoriteEmojiKeys(_userId, [
          'unicode:heart',
          'unicode:tada',
        ]);
        await container.read(favoriteEmojiKeysProvider.future);
        await container
            .read(favoriteEmojiKeysProvider.notifier)
            .toggle('unicode:heart');

        await store.hydrateFromUserSettings(
          syncedPreferencesUserSettings(
            _emojiPicker(favorites: ['unicode:heart', 'unicode:tada']),
          ),
        );
        await flushSyncedPreferencesDebounce(store);

        expect(
          await database.userPreferencesDao.getFavoriteEmojiKeys(_userId),
          ['unicode:tada'],
        );
        expect(api.lastPush.emojiPicker.favoriteEmojiIds, ['unicode:tada']);
      },
    );
  });

  group('restart', () {
    test(
      'a restored edit waits for the server copy before pushing over the cache',
      () async {
        final cached = _emojiPicker(
          favorites: ['unicode:heart', 'unicode:tada'],
        );
        await store.hydrateFromUserSettings(
          syncedPreferencesUserSettings(cached),
        );
        api.offline = true;
        await container
            .read(favoriteEmojiKeysProvider.notifier)
            .toggle('unicode:heart');
        await drainAsyncWork();
        container.dispose();
        api.offline = false;

        final restarted = _container(database, api);
        final restartedStore = restarted.read(syncedPreferencesStoreProvider);
        final pushesBefore = api.pushes.length;
        await restartedStore.hydrateFromUserSettings(
          syncedPreferencesUserSettings(cached),
          fromCache: true,
        );
        await flushSyncedPreferencesDebounce(restartedStore);
        expect(api.pushes.length, pushesBefore);

        final server = _emojiPicker(
          favorites: ['unicode:heart', 'unicode:tada', 'unicode:fire'],
        )..sidebar = pb.SidebarPreferences(inlineDmsCollapsed: false);
        await restartedStore.hydrateFromUserSettings(
          syncedPreferencesUserSettings(server),
        );
        await flushSyncedPreferencesDebounce(restartedStore);

        expect(api.pushes.length, pushesBefore + 1);
        expect(api.lastPush.emojiPicker.favoriteEmojiIds, [
          'unicode:tada',
          'unicode:fire',
        ]);
        expect(api.lastPush.sidebar.inlineDmsCollapsed, isFalse);
      },
    );

    test('memory-only fields never replay a stale dirty mark', () async {
      final remote = pb.SyncedPreferences(
        favoriteGifs: pickers_pb.FavoriteGifSettings(
          entries: [pickers_pb.FavoriteGifEntry(url: 'https://x/a.gif')],
        ),
      );
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(remote),
      );
      store.markDirty(SyncedPreferenceField.favoriteGifs);
      await drainAsyncWork();
      container.dispose();

      final restarted = _container(database, api);
      final restartedStore = restarted.read(syncedPreferencesStoreProvider);
      final pushesBefore = api.pushes.length;
      await restartedStore.hydrateFromUserSettings(
        syncedPreferencesUserSettings(remote),
      );
      await flushSyncedPreferencesDebounce(restartedStore);

      expect(restarted.read(favoriteGifsProvider).entries.map((e) => e.url), [
        'https://x/a.gif',
      ]);
      expect(
        api.pushes
            .skip(pushesBefore)
            .where((push) => push.hasFavoriteGifs())
            .map((push) => push.favoriteGifs.entries.length),
        everyElement(1),
      );
    });
  });

  group('server without the field', () {
    pb.SyncedPreferences sidebarOnly({required bool collapsed}) =>
        pb.SyncedPreferences(
          sidebar: pb.SidebarPreferences(inlineDmsCollapsed: collapsed),
        );

    test('a first edit survives server updates that lack the field', () async {
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(sidebarOnly(collapsed: true)),
      );
      api.offline = true;
      await container
          .read(expressionUsageProvider(ExpressionUsageKind.emoji).notifier)
          .track('unicode:tada');
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(sidebarOnly(collapsed: false)),
      );
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(sidebarOnly(collapsed: true)),
      );
      api.offline = false;
      await flushSyncedPreferencesDebounce(store);

      expect((await database.userPreferencesDao.getEmojiUsage(_userId)).keys, [
        'unicode:tada',
      ]);
      expect(api.lastPush.emojiPicker.usage['unicode:tada']?.count, 1);
    });

    test('upgraded usage reaches a server that never had the field', () async {
      final int now = _nowMs();
      await database.userPreferencesDao.setEmojiUsage(_userId, {
        'unicode:sweat_smile': UsageEntry(count: 3, lastUsedMs: now),
      });
      await database.userPreferencesDao.setSyncedPreferencesDirtyFields(
        _userId,
        ['emojiPicker'],
      );

      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(sidebarOnly(collapsed: true)),
      );
      await flushSyncedPreferencesDebounce(store);

      expect(api.lastPush.emojiPicker.usage['unicode:sweat_smile']?.count, 3);
      expect(api.lastPush.sidebar.inlineDmsCollapsed, isTrue);
    });
  });

  group('collapsed picker categories', () {
    test('guild sections use the bare guild id like web', () async {
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(_emojiPicker()),
      );
      await database.userPreferencesDao.setCollapsedEmojiPickerCategories(
        _userId,
        ['guild-123', 'people'],
      );
      container.invalidate(collapsedEmojiPickerCategoriesProvider);

      expect(
        await container.read(collapsedEmojiPickerCategoriesProvider.future),
        ['123', 'people'],
      );
    });
  });

  group('sticker and meme usage sync', () {
    test('sticker usage uses web keys and round trips', () async {
      final now = _nowMs();
      final state = pickers_pb.StickerPickerState(favoriteStickerIds: ['1:9']);
      state.usage['1:2'] = _stat(3, now);
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          pb.SyncedPreferences(stickerPicker: state),
        ),
      );

      expect(
        await container.read(
          expressionUsageProvider(ExpressionUsageKind.sticker).future,
        ),
        {'1:2': UsageEntry(count: 3, lastUsedMs: now)},
      );

      await container
          .read(expressionUsageProvider(ExpressionUsageKind.sticker).notifier)
          .track('1:5');
      await flushSyncedPreferencesDebounce(store);

      expect(api.lastPush.stickerPicker.usage.keys.toSet(), {'1:2', '1:5'});
      expect(api.lastPush.stickerPicker.favoriteStickerIds, ['1:9']);
    });

    test('memes picker field syncs usage and keeps favourites', () async {
      final now = _nowMs();
      final state = pickers_pb.MemesPickerState(
        favoriteMemeIds: ['m1'],
        collapsedCategoryIds: ['c1'],
      );
      state.usage['m1'] = _stat(2, now);
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(pb.SyncedPreferences(memesPicker: state)),
      );

      expect(
        await container.read(
          expressionUsageProvider(ExpressionUsageKind.meme).future,
        ),
        {'m1': UsageEntry(count: 2, lastUsedMs: now)},
      );

      await container
          .read(expressionUsageProvider(ExpressionUsageKind.meme).notifier)
          .track('m2');
      await flushSyncedPreferencesDebounce(store);

      final pushed = api.lastPush.memesPicker;
      expect(pushed.usage.keys.toSet(), {'m1', 'm2'});
      expect(pushed.favoriteMemeIds, ['m1']);
      expect(pushed.collapsedCategoryIds, ['c1']);
    });
  });

  group('skin tone sync', () {
    test('remote skin tone applies and local changes push', () async {
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          pb.SyncedPreferences(
            emoji: pickers_pb.EmojiState(skinTone: '\u{1F3FD}'),
          ),
        ),
      );
      expect(await container.read(emojiSkinToneProvider.future), '\u{1F3FD}');

      await container.read(emojiSkinToneProvider.notifier).set('\u{1F3FB}');
      await flushSyncedPreferencesDebounce(store);

      expect(api.lastPush.emoji.skinTone, '\u{1F3FB}');
    });
  });
}
