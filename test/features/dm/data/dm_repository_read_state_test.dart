import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

ProviderContainer _createDmTestContainer(FluxerDatabase db) {
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      fluxerClientProvider.overrideWithValue(
        FluxerClient(Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))),
      ),
    ],
  );
}

DmRepository _createDmRepository(FluxerDatabase db) {
  final container = _createDmTestContainer(db);
  return DmRepository(
    container.read(fluxerClientProvider),
    db,
    container.read(guildUserSettingsRepositoryProvider),
  );
}

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

void main() {
  test(
    'watchDmChannels derives unread count from read state mention count',
    () async {
      final db = openTestDatabase();
      await db.userDao.upsertUser(
        UsersCompanion.insert(id: 'other', username: 'Other'),
      );
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: 'other',
          unreadCount: const Value(0),
        ),
      ]);
      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('dm-1'),
          mentionCount: Value(2),
        ),
      );

      final repo = _createDmRepository(db);

      final conversations = await repo.watchDmChannels().first;

      expect(conversations.single.unreadCount, 2);
    },
  );

  test(
    'watchDmChannels derives unread when ack is behind latest DM message',
    () async {
      final db = openTestDatabase();
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
      await db.userDao.upsertUser(
        UsersCompanion.insert(id: 'other', username: 'Other'),
      );
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: 'other',
          unreadCount: const Value(0),
        ),
      ]);
      await db.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: latestId,
          channelId: 'dm-1',
          authorId: 'other',
          content: 'hello',
          timestamp: dateTimeFromUserSnowflakeOrNull(latestId)!,
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('dm-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );

      final repo = _createDmRepository(db);

      final conversations = await repo.watchDmChannels().first;

      expect(conversations.single.unreadCount, 1);
    },
  );

  test('watchDmChannels derives unread from DM latest message id without read '
      'state', () async {
    final db = openTestDatabase();
    final dmId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'other', username: 'Other'),
    );
    await db.dmChannelDao.upsertDmChannels([
      DmChannelsCompanion.insert(
        id: dmId,
        recipientId: 'other',
        lastMessageId: Value(latestId),
        unreadCount: const Value(0),
      ),
    ]);

    final repo = _createDmRepository(db);

    final conversations = await repo.watchDmChannels().first;

    expect(conversations.single.unreadCount, 1);
  });

  test(
    'watchDmChannels derives unread from DM latest message id with null ack',
    () async {
      final db = openTestDatabase();
      final dmId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
      await db.userDao.upsertUser(
        UsersCompanion.insert(id: 'other', username: 'Other'),
      );
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: dmId,
          recipientId: 'other',
          lastMessageId: Value(latestId),
          unreadCount: const Value(0),
        ),
      ]);
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: Value(dmId),
          lastMessageId: const Value(null),
          mentionCount: const Value(0),
        ),
      );

      final repo = _createDmRepository(db);

      final conversations = await repo.watchDmChannels().first;

      expect(conversations.single.unreadCount, 1);
    },
  );

  test(
    'watchDmChannels derives unread from DM latest message id without cache',
    () async {
      final db = openTestDatabase();
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
      await db.userDao.upsertUser(
        UsersCompanion.insert(id: 'other', username: 'Other'),
      );
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: 'other',
          lastMessageId: Value(latestId),
          unreadCount: const Value(0),
        ),
      ]);
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('dm-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );

      final repo = _createDmRepository(db);

      final conversations = await repo.watchDmChannels().first;

      expect(conversations.single.unreadCount, 1);
    },
  );

  test(
    'watchDmChannels prefers channel pointer when cached message is stale',
    () async {
      final db = openTestDatabase();
      final cachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final pointerId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 2));
      await db.userDao.upsertUser(
        UsersCompanion.insert(id: 'other', username: 'Other'),
      );
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: 'other',
          lastMessageId: Value(pointerId),
          unreadCount: const Value(0),
        ),
      ]);
      await db.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: cachedId,
          channelId: 'dm-1',
          authorId: 'other',
          content: 'cached',
          timestamp: dateTimeFromUserSnowflakeOrNull(cachedId)!,
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('dm-1'),
          lastMessageId: Value(cachedId),
          mentionCount: const Value(0),
        ),
      );

      final repo = _createDmRepository(db);
      final conversations = await repo.watchDmChannels().first;
      expect(conversations.single.unreadCount, 1);
    },
  );

  test('watchDmChannels reacts to read state changes', () async {
    final db = openTestDatabase();
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'other', username: 'Other'),
    );
    await db.dmChannelDao.upsertDmChannels([
      DmChannelsCompanion.insert(
        id: 'dm-1',
        recipientId: 'other',
        unreadCount: const Value(0),
      ),
    ]);

    final repo = _createDmRepository(db);
    final iterator = StreamIterator(repo.watchDmChannels());
    addTearDown(iterator.cancel);

    expect(await iterator.moveNext(), isTrue);
    expect(iterator.current, hasLength(1));

    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value('dm-1'),
        mentionCount: Value(3),
      ),
    );

    while (await iterator.moveNext()) {
      if (iterator.current.single.unreadCount == 3) {
        break;
      }
    }
    expect(iterator.current.single.unreadCount, 3);
  });
}
