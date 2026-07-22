import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

import '../../../helpers/open_test_database.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

ChannelsCompanion _channel({
  required String id,
  String guildId = 'g1',
  String? lastMessageId,
  bool includeLastMessageId = true,
}) {
  if (!includeLastMessageId) {
    return ChannelsCompanion.insert(
      id: id,
      guildId: guildId,
      name: 'channel-$id',
    );
  }
  return ChannelsCompanion.insert(
    id: id,
    guildId: guildId,
    name: 'channel-$id',
    lastMessageId: Value(lastMessageId),
  );
}

MessagesCompanion _message({required String id, required String channelId}) =>
    MessagesCompanion.insert(
      id: id,
      channelId: channelId,
      authorId: 'author',
      content: 'body $id',
      timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
    );

void main() {
  final String olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 10));
  final String newerId = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 12));
  final String newestId = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 14));

  group('ChannelDao.mergeLastMessageIdValues', () {
    late FluxerDatabase db;

    setUp(() {
      db = openTestDatabase();
    });

    test('keeps existing when incoming is null or empty', () {
      expect(
        db.channelDao.mergeLastMessageIdValues(
          existing: newerId,
          incomingLastMessageId: null,
        ),
        newerId,
      );
      expect(
        db.channelDao.mergeLastMessageIdValues(
          existing: newerId,
          incomingLastMessageId: '',
        ),
        newerId,
      );
    });

    test('takes incoming when existing is null or empty', () {
      expect(
        db.channelDao.mergeLastMessageIdValues(
          existing: null,
          incomingLastMessageId: olderId,
        ),
        olderId,
      );
    });

    test('keeps the newer snowflake of the two', () {
      expect(
        db.channelDao.mergeLastMessageIdValues(
          existing: newerId,
          incomingLastMessageId: olderId,
        ),
        newerId,
      );
      expect(
        db.channelDao.mergeLastMessageIdValues(
          existing: olderId,
          incomingLastMessageId: newestId,
        ),
        newestId,
      );
    });
  });

  group('ChannelDao.upsertChannelsMerged authoritativeTails', () {
    late FluxerDatabase db;

    setUp(() {
      db = openTestDatabase();
    });

    test(
      'READY-shaped authoritative accepts lower incoming regardless of cache',
      () async {
        await db.channelDao.upsertChannel(
          _channel(id: 'c1', lastMessageId: newerId),
        );
        await db.messageDao.upsertMessage(
          _message(id: newerId, channelId: 'c1'),
        );

        await db.channelDao.upsertChannelsMerged(<ChannelsCompanion>[
          _channel(id: 'c1', lastMessageId: olderId),
        ], authoritativeTails: true);

        final Channel? row = await db.channelDao.getChannelById('c1');
        expect(row?.lastMessageId, olderId);
      },
    );

    test(
      'authoritative heals orphaned higher lastMessageId without cache',
      () async {
        await db.channelDao.upsertChannel(
          _channel(id: 'c1', lastMessageId: newerId),
        );

        await db.channelDao.upsertChannelsMerged(<ChannelsCompanion>[
          _channel(id: 'c1', lastMessageId: olderId),
        ], authoritativeTails: true);

        final Channel? row = await db.channelDao.getChannelById('c1');
        expect(row?.lastMessageId, olderId);
      },
    );

    test('absent lastMessageId on companion preserves existing tail', () async {
      await db.channelDao.upsertChannel(
        _channel(id: 'c1', lastMessageId: newerId),
      );

      await db.channelDao.upsertChannelsMerged(<ChannelsCompanion>[
        _channel(
          id: 'c1',
          includeLastMessageId: false,
        ).copyWith(name: const Value('renamed')),
      ], authoritativeTails: true);

      final Channel? row = await db.channelDao.getChannelById('c1');
      expect(row?.lastMessageId, newerId);
      expect(row?.name, 'renamed');
    });

    test('authoritative advances when incoming is newer', () async {
      await db.channelDao.upsertChannel(
        _channel(id: 'c1', lastMessageId: olderId),
      );

      await db.channelDao.upsertChannelsMerged(<ChannelsCompanion>[
        _channel(id: 'c1', lastMessageId: newestId),
      ], authoritativeTails: true);

      final Channel? row = await db.channelDao.getChannelById('c1');
      expect(row?.lastMessageId, newestId);
    });

    test(
      'duplicate ids fold forward; last present tail wins under authoritative',
      () async {
        await db.channelDao.upsertChannelsMerged(<ChannelsCompanion>[
          _channel(id: 'c1', lastMessageId: newerId),
          _channel(id: 'c1', lastMessageId: olderId),
        ], authoritativeTails: true);

        final Channel? row = await db.channelDao.getChannelById('c1');
        expect(row?.lastMessageId, olderId);
      },
    );
  });

  group('ChannelDao single-row max-merge (CHANNEL_UPDATE)', () {
    late FluxerDatabase db;

    setUp(() {
      db = openTestDatabase();
    });

    test('keeps higher local tail against lower CHANNEL_UPDATE', () async {
      await db.channelDao.upsertChannel(
        _channel(id: 'c1', lastMessageId: newerId),
      );

      await db.channelDao.upsertChannel(
        _channel(id: 'c1', lastMessageId: olderId),
      );

      final Channel? row = await db.channelDao.getChannelById('c1');
      expect(row?.lastMessageId, newerId);
    });

    test('advances when CHANNEL_UPDATE carries a newer tail', () async {
      await db.channelDao.upsertChannel(
        _channel(id: 'c1', lastMessageId: olderId),
      );

      await db.channelDao.upsertChannel(
        _channel(id: 'c1', lastMessageId: newestId),
      );

      final Channel? row = await db.channelDao.getChannelById('c1');
      expect(row?.lastMessageId, newestId);
    });

    test(
      'non-authoritative bulk merge still max-merges like single-row',
      () async {
        await db.channelDao.upsertChannel(
          _channel(id: 'c1', lastMessageId: newerId),
        );

        await db.channelDao.upsertChannelsMerged(<ChannelsCompanion>[
          _channel(id: 'c1', lastMessageId: olderId),
        ]);

        final Channel? row = await db.channelDao.getChannelById('c1');
        expect(row?.lastMessageId, newerId);
      },
    );
  });
}
