import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';

import '../../../helpers/open_test_database.dart';

const String _channelId = '100000000000000001';
const String _guildId = '200000000000000001';

db.ChannelsCompanion _channelRow({String name = 'general'}) {
  return db.ChannelsCompanion.insert(
    id: _channelId,
    guildId: _guildId,
    name: name,
    type: const Value<int>(0),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('channelByIdProvider', () {
    test('a lastMessageId-only write does not re-emit the channel', () async {
      final db.FluxerDatabase database = openTestDatabase();
      await database.channelDao.upsertChannel(_channelRow());

      final ProviderContainer container = ProviderContainer(
        overrides: [fluxerDatabaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final List<Channel?> emissions = <Channel?>[];
      container.listen(channelByIdProvider(_channelId), (previous, next) {
        if (next case AsyncData(:final value)) {
          emissions.add(value);
        }
      });
      await container.read(channelByIdProvider(_channelId).future);
      expect(emissions, hasLength(1));

      await database.channelDao.updateLastMessageId(
        _channelId,
        '300000000000000001',
      );
      // Flush the tail write's stream notification before the rename, so the
      // two writes cannot coalesce into a single re-query.
      await pumpEventQueue();
      // The rename is ordered behind the tail write on the same drift stream,
      // so its arrival proves the tail write alone emitted nothing.
      await database.channelDao.upsertChannel(_channelRow(name: 'renamed'));
      while (emissions.last?.name != 'renamed') {
        await Future<void>.delayed(Duration.zero);
      }

      expect(emissions, hasLength(2));
      expect(emissions.last?.name, 'renamed');
    });
  });

  group('Channel equality', () {
    test('identical field values compare equal across instances', () {
      const Channel a = Channel(id: '1', guildId: 'g', name: 'general');
      const Channel b = Channel(id: '1', guildId: 'g', name: 'general');
      expect(a, b);
      expect(a.hashCode, b.hashCode);
    });

    test('a differing field breaks equality', () {
      const Channel a = Channel(id: '1', guildId: 'g', name: 'general');
      expect(a, isNot(a.copyWith(rateLimitPerUser: 5)));
      expect(a, isNot(a.copyWith(name: 'renamed')));
    });
  });
}
