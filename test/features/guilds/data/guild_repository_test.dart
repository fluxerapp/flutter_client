import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

GuildResponse _apiGuild(String id) => GuildResponse.fromJson({
  'id': id,
  'name': 'Guild $id',
  'splash_card_alignment': 0,
  'owner_id': 'user-1',
  'system_channel_flags': 0,
  'afk_timeout': 300,
  'features': <String>[],
  'verification_level': 0,
  'mfa_level': 0,
  'nsfw_level': 0,
  'nsfw': false,
  'content_warning_level': 0,
  'explicit_content_filter': 0,
  'default_message_notifications': 0,
  'disabled_operations': 0,
});

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

  group('GuildRepository unavailable preservation', () {
    test('upsert keeps unavailable flag when sync logic applies it', () async {
      final db = openTestDatabase();
      await db.guildDao.upsertServer(
        ServersCompanion.insert(
          id: 'guild-1',
          name: 'Offline',
          unavailable: const Value(true),
        ),
      );

      final unavailableIds = (await db.guildDao.getServers())
          .where((row) => row.unavailable)
          .map((row) => row.id)
          .toSet();
      await db.guildDao.upsertServer(
        guildFromSdk(
          _apiGuild('guild-1'),
          unavailable: unavailableIds.contains('guild-1'),
        ),
      );

      final row = await db.guildDao.getServerById('guild-1');
      expect(row?.unavailable, isTrue);
    });
  });
}
