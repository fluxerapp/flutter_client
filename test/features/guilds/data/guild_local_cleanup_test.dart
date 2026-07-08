import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/guilds/data/guild_local_cleanup.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  group('removeGuildFromLocalDb', () {
    test('deletes guild and related rows', () async {
      final db = openTestDatabase();

      const guildId = 'guild-1';
      await db.guildDao.upsertServer(
        ServersCompanion.insert(id: guildId, name: 'Guild One'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: guildId,
          name: 'general',
          type: const Value(0),
        ),
      );
      await db.userGuildSettingsDao.upsert(
        UserGuildSettingsTableCompanion.insert(guildId: guildId, data: '{}'),
      );
      await db.guildLastChannelDao.setLastChannel(guildId, 'channel-1');

      await removeGuildFromLocalDb(db, guildId);

      expect(await db.guildDao.getServerById(guildId), isNull);
      expect(await db.channelDao.getChannels(guildId), isEmpty);
      expect(await db.userGuildSettingsDao.getByGuildId(guildId), isNull);
      expect(await db.guildLastChannelDao.getLastChannel(guildId), isNull);
    });
  });

  group('removeGuildsNotInLocalDb', () {
    test('removes only guilds missing from keep set', () async {
      final db = openTestDatabase();

      await db.guildDao.upsertServer(
        ServersCompanion.insert(id: 'keep', name: 'Keep'),
      );
      await db.guildDao.upsertServer(
        ServersCompanion.insert(id: 'stale', name: 'Stale'),
      );

      final removed = await removeGuildsNotInLocalDb(db, {'keep'});

      expect(removed, ['stale']);
      expect(await db.guildDao.getServerById('keep'), isNotNull);
      expect(await db.guildDao.getServerById('stale'), isNull);
    });
  });
}
