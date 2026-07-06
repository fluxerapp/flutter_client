import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('GuildRepository.getOwnedGuilds', () {
    late FluxerDatabase db;
    late GuildRepository repository;

    setUp(() {
      db = openTestDatabase();
      repository = GuildRepository(FluxerClient(Dio()), db);
    });

    test('returns only guilds owned by the user', () async {
      await db.guildDao.upsertServers([
        ServersCompanion.insert(
          id: 'guild-1',
          name: 'Owned',
          ownerId: const Value('user-1'),
        ),
        ServersCompanion.insert(
          id: 'guild-2',
          name: 'Other',
          ownerId: const Value('user-2'),
        ),
        ServersCompanion.insert(
          id: 'guild-3',
          name: 'Also Owned',
          ownerId: const Value('user-1'),
        ),
      ]);

      final ownedGuilds = await repository.getOwnedGuilds('user-1');

      expect(ownedGuilds.map((guild) => guild.id).toSet(), {
        'guild-1',
        'guild-3',
      });
    });

    test('returns empty list when user owns no guilds', () async {
      await db.guildDao.upsertServer(
        ServersCompanion.insert(
          id: 'guild-1',
          name: 'Other',
          ownerId: const Value('user-2'),
        ),
      );

      final ownedGuilds = await repository.getOwnedGuilds('user-1');

      expect(ownedGuilds, isEmpty);
    });
  });
}
