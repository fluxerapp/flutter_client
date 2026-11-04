import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/bulk_upsert.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

import '../../helpers/open_test_database.dart';

void main() {
  test('batchUpsert stores the same rows as the drift upsert', () async {
    final FluxerDatabase database = openTestDatabase();

    final List<ChannelsCompanion> channels = <ChannelsCompanion>[
      ChannelsCompanion.insert(
        id: 'c1',
        guildId: 'g1',
        name: 'general',
        type: const Value(0),
        position: const Value(3),
        lastMessageId: const Value('m9'),
        nsfw: const Value(true),
      ),
      ChannelsCompanion.insert(
        id: 'c2',
        guildId: 'g1',
        name: 'voice',
        type: const Value(2),
      ),
    ];
    final List<ChannelsCompanion> channelUpdates = <ChannelsCompanion>[
      const ChannelsCompanion(
        id: Value('c1'),
        guildId: Value('g1'),
        name: Value('renamed'),
        lastMessageId: Value(null),
      ),
    ];
    final List<RolesCompanion> roles = <RolesCompanion>[
      RolesCompanion.insert(
        id: 'r1',
        guildId: 'g1',
        name: 'mods',
        permissions: const Value('8'),
        position: const Value(2),
      ),
    ];
    final List<UsersCompanion> users = <UsersCompanion>[
      UsersCompanion.insert(
        id: 'u1',
        username: 'first',
        avatar: const Value('a1'),
        bot: const Value(true),
      ),
      UsersCompanion.insert(id: 'u1', username: 'second'),
    ];

    Future<List<List<Object>>> storedRows() async => <List<Object>>[
      await database.select(database.channels).get(),
      await database.select(database.roles).get(),
      await database.select(database.users).get(),
    ];

    await database.batch((Batch b) {
      for (final ChannelsCompanion row in <ChannelsCompanion>[
        ...channels,
        ...channelUpdates,
      ]) {
        b.insert(database.channels, row, onConflict: DoUpdate((_) => row));
      }
      for (final RolesCompanion row in roles) {
        b.insert(database.roles, row, onConflict: DoUpdate((_) => row));
      }
      for (final UsersCompanion row in users) {
        b.insert(database.users, row, onConflict: DoUpdate((_) => row));
      }
    });
    final List<List<Object>> viaDrift = await storedRows();
    await database.batch((Batch b) {
      b
        ..deleteAll(database.channels)
        ..deleteAll(database.roles)
        ..deleteAll(database.users);
    });

    await database.batch((Batch b) {
      batchUpsert(b, database, database.channels, channels);
      batchUpsert(b, database, database.channels, channelUpdates);
      batchUpsert(b, database, database.roles, roles);
      batchUpsert(b, database, database.users, users);
    });

    expect(viaDrift.every((List<Object> rows) => rows.isNotEmpty), isTrue);
    expect(await storedRows(), viaDrift);
  });
}
