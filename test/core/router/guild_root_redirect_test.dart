import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_names.dart';

void main() {
  late FluxerDatabase db;

  setUp(() {
    db = FluxerDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() => db.close());

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

    test('mobile returns null even with a remembered channel', () async {
      await addChannel('chan-1', guildId);
      await db.guildLastChannelDao.setLastChannel(guildId, 'chan-1');

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        isMobile: true,
        db: db,
      );

      expect(result, isNull);
    });

    test('mobile returns null with no remembered channel', () async {
      await addChannel('chan-1', guildId);

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        isMobile: true,
        db: db,
      );

      expect(result, isNull);
    });

    test('desktop restores the remembered channel', () async {
      await addChannel('chan-1', guildId);
      await db.guildLastChannelDao.setLastChannel(guildId, 'chan-1');

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        isMobile: false,
        db: db,
      );

      expect(result, RoutePaths.guildChannel(guildId, 'chan-1'));
    });

    test('desktop picks first eligible channel by position', () async {
      await addChannel('category', guildId, type: 4);
      await addChannel('text', guildId, position: 1);

      final result = await resolveGuildRootRedirect(
        guildId: guildId,
        fullPath: RoutePaths.guild(guildId),
        isMobile: false,
        db: db,
      );

      expect(result, RoutePaths.guildChannel(guildId, 'text'));
    });

    test('null guildId redirects to me', () async {
      final result = await resolveGuildRootRedirect(
        guildId: null,
        fullPath: '/channels',
        isMobile: false,
        db: db,
      );

      expect(result, RoutePaths.me);
    });

    test('child route returns null regardless of layout', () async {
      await addChannel('chan-1', guildId);
      await db.guildLastChannelDao.setLastChannel(guildId, 'chan-1');

      for (final isMobile in [true, false]) {
        final result = await resolveGuildRootRedirect(
          guildId: guildId,
          fullPath: RoutePaths.guildChannel(guildId, 'chan-1'),
          isMobile: isMobile,
          db: db,
        );

        expect(result, isNull);
      }
    });
  });
}
