import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/router/app_location_persistence.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/pending_app_location.dart';
import 'package:fluxer_app/core/router/pre_reconnecting_location_provider.dart';
import 'package:fluxer_app/core/router/route_names.dart';

import '../../helpers/open_test_database.dart';

class _PendingStore implements PendingAppLocationStore {
  String? value;

  @override
  Future<String?> read() async => value;

  @override
  Future<void> write(String location) async {
    value = location;
  }

  @override
  Future<void> clear() async {
    value = null;
  }
}

void main() {
  late FluxerDatabase db;

  setUp(() {
    db = openTestDatabase();
  });

  Future<void> addGuild(String guildId) async {
    await db.guildDao.upsertServer(
      ServersCompanion.insert(id: guildId, name: guildId),
    );
  }

  Future<void> addGuildChannel(String channelId, String guildId) async {
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: channelId,
        guildId: guildId,
        name: channelId,
        type: const Value(0),
      ),
    );
  }

  group('persistAppLocation', () {
    test('saves restorable locations', () async {
      persistAppLocation(db, '/channels/guild-1/chan-1');
      expect(await readPersistedAppLocation(db), '/channels/guild-1/chan-1');
    });

    test('ignores login loading and reconnecting', () async {
      persistAppLocation(db, '/login');
      persistAppLocation(db, '/loading');
      persistAppLocation(db, '/reconnecting');
      expect(await readPersistedAppLocation(db), isNull);
    });
  });

  group('restoreAppLocation', () {
    test('prefers valid in memory over disk', () async {
      await addGuild('guild-1');
      await addGuildChannel('chan-1', 'guild-1');
      persistAppLocation(db, '/channels/@me');
      expect(
        await restoreAppLocation(db: db, inMemory: '/channels/guild-1/chan-1'),
        '/channels/guild-1/chan-1',
      );
    });

    test('falls back to disk then me', () async {
      expect(await restoreAppLocation(db: db), RoutePaths.me);

      persistAppLocation(db, '/notifications');
      expect(await restoreAppLocation(db: db), '/notifications');
    });

    test('falls back when guild is missing', () async {
      persistAppLocation(db, '/channels/missing-guild/chan-1');
      expect(await restoreAppLocation(db: db), RoutePaths.me);
    });

    test(
      'falls back to another guild channel when channel is missing',
      () async {
        await addGuild('guild-1');
        await addGuildChannel('still-here', 'guild-1');
        persistAppLocation(db, '/channels/guild-1/gone');
        expect(
          await restoreAppLocation(db: db),
          RoutePaths.guildChannel('guild-1', 'still-here'),
        );
      },
    );

    test('falls back when favorite is missing', () async {
      persistAppLocation(db, '/channels/@favorites/gone');
      expect(await restoreAppLocation(db: db), RoutePaths.me);
    });

    test('keeps favorite when it still exists', () async {
      await db.favoriteChannelsDao.addChannel(channelId: 'fav-1');
      persistAppLocation(db, '/channels/@favorites/fav-1');
      expect(await restoreAppLocation(db: db), '/channels/@favorites/fav-1');
    });

    test('falls back when dm is missing', () async {
      persistAppLocation(db, '/channels/@me/dm-gone');
      expect(await restoreAppLocation(db: db), RoutePaths.me);
    });

    test('skips invalid memory and uses valid disk', () async {
      await addGuild('guild-1');
      await addGuildChannel('chan-1', 'guild-1');
      persistAppLocation(db, '/channels/guild-1/chan-1');
      expect(
        await restoreAppLocation(db: db, inMemory: '/channels/missing/chan'),
        '/channels/guild-1/chan-1',
      );
    });
  });

  group('PreReconnectingLocation.takeOrRestore', () {
    test('uses memory then disk', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final PendingAppLocation pending = PendingAppLocation(
        store: _PendingStore(),
      );
      addTearDown(pending.dispose);

      persistAppLocation(db, '/notifications');
      container
          .read(preReconnectingLocationProvider.notifier)
          .remember(path: '/you', query: '');

      expect(
        await container
            .read(preReconnectingLocationProvider.notifier)
            .takeOrRestore(db, pending: pending),
        '/you',
      );
      await Future<void>.delayed(Duration.zero);
      expect(
        await container
            .read(preReconnectingLocationProvider.notifier)
            .takeOrRestore(db, pending: pending),
        '/notifications',
      );
    });

    test('skips pending guild restore and clears last channel', () async {
      await addGuild('guild-1');
      await addGuildChannel('chan-1', 'guild-1');
      await addGuildChannel('chan-2', 'guild-1');
      persistAppLocation(db, '/channels/guild-1/chan-1');
      persistGuildChannelFromLocation(db, '/channels/guild-1/chan-1');
      await Future<void>.delayed(Duration.zero);

      final _PendingStore store = _PendingStore();
      final PendingAppLocation crashed = PendingAppLocation(store: store);
      await crashed.mark('/channels/guild-1/chan-1');
      crashed.dispose();

      final PendingAppLocation nextLaunch = PendingAppLocation(store: store);
      addTearDown(nextLaunch.dispose);
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        await container
            .read(preReconnectingLocationProvider.notifier)
            .takeOrRestore(db, pending: nextLaunch),
        RoutePaths.me,
      );
      expect(await readPersistedAppLocation(db), isNull);
      expect(await db.guildLastChannelDao.getLastChannel('guild-1'), isNull);
    });

    test('skips pending favorites restore', () async {
      await db.favoriteChannelsDao.addChannel(channelId: 'fav-1');
      persistAppLocation(db, '/channels/@favorites/fav-1');
      persistGuildChannelFromLocation(db, '/channels/@favorites/fav-1');
      await Future<void>.delayed(Duration.zero);

      final _PendingStore store = _PendingStore();
      final PendingAppLocation crashed = PendingAppLocation(store: store);
      await crashed.mark('/channels/@favorites/fav-1');
      crashed.dispose();

      final PendingAppLocation nextLaunch = PendingAppLocation(store: store);
      addTearDown(nextLaunch.dispose);
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        await container
            .read(preReconnectingLocationProvider.notifier)
            .takeOrRestore(db, pending: nextLaunch),
        RoutePaths.me,
      );
      expect(await readPersistedAppLocation(db), isNull);
      expect(
        await db.guildLastChannelDao.getLastChannel(kFavoritesLastChannelKey),
        isNull,
      );
    });

    test('restores after the previous launch cleared pending', () async {
      await addGuild('guild-1');
      await addGuildChannel('chan-1', 'guild-1');
      persistAppLocation(db, '/channels/guild-1/chan-1');
      persistGuildChannelFromLocation(db, '/channels/guild-1/chan-1');
      await Future<void>.delayed(Duration.zero);

      final _PendingStore store = _PendingStore();
      final PendingAppLocation previous = PendingAppLocation(store: store);
      addTearDown(previous.dispose);
      await previous.mark('/channels/guild-1/chan-1');
      await previous.clear();

      final PendingAppLocation nextLaunch = PendingAppLocation(store: store);
      addTearDown(nextLaunch.dispose);
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        await container
            .read(preReconnectingLocationProvider.notifier)
            .takeOrRestore(db, pending: nextLaunch),
        '/channels/guild-1/chan-1',
      );
      expect(await db.guildLastChannelDao.getLastChannel('guild-1'), 'chan-1');
    });

    test('keeps in-memory restore when pending is still set', () async {
      await addGuild('guild-1');
      await addGuildChannel('chan-1', 'guild-1');
      persistAppLocation(db, '/channels/guild-1/chan-1');
      persistGuildChannelFromLocation(db, '/channels/guild-1/chan-1');
      await Future<void>.delayed(Duration.zero);

      final _PendingStore store = _PendingStore();
      final PendingAppLocation pending = PendingAppLocation(store: store);
      addTearDown(pending.dispose);
      await pending.mark('/channels/guild-1/chan-1');

      final container = ProviderContainer();
      addTearDown(container.dispose);
      container
          .read(preReconnectingLocationProvider.notifier)
          .remember(path: '/channels/guild-1/chan-1', query: '');

      expect(
        await container
            .read(preReconnectingLocationProvider.notifier)
            .takeOrRestore(db, pending: pending),
        '/channels/guild-1/chan-1',
      );
      await Future<void>.delayed(Duration.zero);
      expect(await db.guildLastChannelDao.getLastChannel('guild-1'), 'chan-1');
    });
  });

  group('clearPersistedLocation', () {
    test('clears app location and guild last channel', () async {
      persistAppLocation(db, '/channels/guild-1/chan-1');
      persistGuildChannelFromLocation(db, '/channels/guild-1/chan-1');
      persistGuildChannelFromLocation(db, '/channels/guild-2/other');
      await Future<void>.delayed(Duration.zero);

      await clearPersistedLocation(db, '/channels/guild-1/chan-1');

      expect(await readPersistedAppLocation(db), isNull);
      expect(await db.guildLastChannelDao.getLastChannel('guild-1'), isNull);
      expect(await db.guildLastChannelDao.getLastChannel('guild-2'), 'other');
    });
  });

  group('PendingAppLocation', () {
    test('clears pending after the delay', () async {
      final _PendingStore store = _PendingStore();
      final PendingAppLocation pending = PendingAppLocation(
        store: store,
        clearDelay: Duration.zero,
      );
      addTearDown(pending.dispose);

      await pending.mark('/channels/guild-1/chan-1');
      expect(store.value, '/channels/guild-1/chan-1');
      await Future<void>.delayed(Duration.zero);
      expect(store.value, isNull);
    });
  });
}
