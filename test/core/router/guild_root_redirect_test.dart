import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_names.dart';

import '../../helpers/open_test_database.dart';

void main() {
  late FluxerDatabase db;

  setUp(() {
    db = openTestDatabase();
  });

  Future<void> addChannel(
    String id,
    String guildId, {
    int type = 0,
    int position = 0,
  }) async {
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: id,
        guildId: guildId,
        name: id,
        type: Value(type),
        position: Value(position),
      ),
    );
  }

  group('resolveGuildRootRedirect', () {
    const guildId = 'guild-1';

    test('restores the remembered channel', () async {
      await addChannel('chan-1', guildId);
      await db.guildLastChannelDao.setLastChannel(guildId, 'chan-1');

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        db: db,
      );

      expect(result, RoutePaths.guildChannel(guildId, 'chan-1'));
    });

    test(
      'skips invalid remembered channels and picks first eligible',
      () async {
        await addChannel('category', guildId, type: 4);
        await addChannel('text', guildId, position: 1);
        await db.guildLastChannelDao.setLastChannel(guildId, 'missing');

        final result = await resolveGuildRootRedirect(
          guildId: guildId,
          fullPath: RoutePaths.guild(guildId),
          db: db,
        );

        expect(result, RoutePaths.guildChannel(guildId, 'text'));
      },
    );

    test('picks first eligible channel by position', () async {
      await addChannel('category', guildId, type: 4);
      await addChannel('text', guildId, position: 1);

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        db: db,
      );

      expect(result, RoutePaths.guildChannel(guildId, 'text'));
    });

    test('null guildId redirects to me', () async {
      final result = await resolveGuildRootRedirect(
        guildId: null,
        fullPath: '/channels',
        db: db,
      );

      expect(result, RoutePaths.me);
    });

    test('child route returns null', () async {
      await addChannel('chan-1', guildId);
      await db.guildLastChannelDao.setLastChannel(guildId, 'chan-1');

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guildChannel(guildId, 'chan-1'),
        db: db,
      );

      expect(result, isNull);
    });

    test('returns null when guild has no restorable channels', () async {
      await addChannel('category', guildId, type: 4);

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        db: db,
      );

      expect(result, isNull);
    });
  });

  group('resolveFavoritesRootRedirect', () {
    Future<void> addFavorite(
      String channelId, {
      String? guildId,
      int position = 0,
    }) async {
      await db.favoriteChannelsDao.addChannel(
        channelId: channelId,
        guildId: guildId,
        position: position,
      );
    }

    test('restores the remembered favorite', () async {
      await addFavorite('fav-1');
      await addFavorite('fav-2', position: 1);
      await db.guildLastChannelDao.setLastChannel(
        kFavoritesLastChannelKey,
        'fav-2',
      );

      final result = await resolveFavoritesRootRedirect(
        fullPath: RoutePaths.favoritesBase,
        db: db,
      );

      expect(result, RoutePaths.favoritesChannel('fav-2'));
    });

    test('skips removed favorites and picks first eligible', () async {
      await addFavorite('fav-1', guildId: 'g1');
      await addFavorite('fav-2', position: 1);
      await db.guildLastChannelDao.setLastChannel(
        kFavoritesLastChannelKey,
        'missing',
      );

      final result = await resolveFavoritesRootRedirect(
        fullPath: RoutePaths.favoritesBase,
        db: db,
      );

      expect(result, RoutePaths.favoritesChannel('fav-1'));
    });

    test('returns null when favorites are empty', () async {
      final result = await resolveFavoritesRootRedirect(
        fullPath: RoutePaths.favoritesBase,
        db: db,
      );

      expect(result, isNull);
    });

    test('child route returns null', () async {
      await addFavorite('fav-1');
      await db.guildLastChannelDao.setLastChannel(
        kFavoritesLastChannelKey,
        'fav-1',
      );

      final result = await resolveFavoritesRootRedirect(
        fullPath: RoutePaths.favoritesChannel('fav-1'),
        db: db,
      );

      expect(result, isNull);
    });
  });

  group('persistGuildChannelFromLocation', () {
    test('saves guild channel paths', () async {
      persistGuildChannelFromLocation(db, '/channels/guild-1/chan-1');
      expect(await db.guildLastChannelDao.getLastChannel('guild-1'), 'chan-1');
    });

    test('saves favorites channel paths', () async {
      persistGuildChannelFromLocation(db, '/channels/@favorites/fav-1');
      expect(
        await db.guildLastChannelDao.getLastChannel(kFavoritesLastChannelKey),
        'fav-1',
      );
    });

    test('ignores dms and message jumps', () async {
      persistGuildChannelFromLocation(db, '/channels/@me/dm-1');
      persistGuildChannelFromLocation(db, '/channels/guild-1/chan-1/msg-1');
      persistGuildChannelFromLocation(db, '/channels/@favorites/fav-1/msg-1');
      expect(await db.guildLastChannelDao.getLastChannel('guild-1'), isNull);
      expect(
        await db.guildLastChannelDao.getLastChannel(kFavoritesLastChannelKey),
        isNull,
      );
    });
  });
}
