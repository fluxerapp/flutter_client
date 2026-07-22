import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

MessagesCompanion _message({
  required String id,
  required String channelId,
  required String authorId,
  bool isMentioned = false,
}) => MessagesCompanion.insert(
  id: id,
  channelId: channelId,
  authorId: authorId,
  content: 'message $id',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
  isMentioned: Value(isMentioned),
);

void main() {
  test(
    'ackLatest acknowledges the channel last message without cached messages',
    () async {
      final lastMessageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = _AckAdapter(
          expectedPath: '/v1/channels/channel-1/messages/$lastMessageId/ack',
        );
      final db = openTestDatabase();
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(lastMessageId),
        ),
      );
      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('channel-1'),
          lastMessageId: Value('older-message'),
          mentionCount: Value(2),
        ),
      );

      await ReadStateRepository(FluxerClient(dio), db).ackLatest('channel-1');

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, lastMessageId);
      expect(readState?.mentionCount, 0);
      expect(readState?.manual, isFalse);
    },
  );

  test(
    'applyLocalAckUpTo keeps a newer ack while clearing unread flags',
    () async {
      final String olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final String newerId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final db = openTestDatabase();
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(newerId),
          mentionCount: const Value(2),
          manual: const Value(true),
        ),
      );
      final repository = ReadStateRepository(
        FluxerClient(Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))),
        db,
      );

      final String? ackedId = await repository.applyLocalAckUpTo(
        'channel-1',
        olderId,
      );

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(ackedId, newerId);
      expect(readState?.lastMessageId, newerId);
      expect(readState?.mentionCount, 0);
      expect(readState?.manual, isFalse);
    },
  );

  test(
    'applyLocalAckUpTo is a no-op when a clean newer ack is stored',
    () async {
      final String olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final String newerId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final db = openTestDatabase();
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(newerId),
          mentionCount: const Value(0),
        ),
      );
      final repository = ReadStateRepository(
        FluxerClient(Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))),
        db,
      );

      final String? ackedId = await repository.applyLocalAckUpTo(
        'channel-1',
        olderId,
      );

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(ackedId, null);
      expect(readState?.lastMessageId, newerId);
      expect(readState?.mentionCount, 0);
    },
  );

  test(
    'ackLatest uses newer cached message when channel last message is stale',
    () async {
      final staleId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final newestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = _AckAdapter(
          expectedPath: '/v1/channels/channel-1/messages/$newestId/ack',
        );
      final db = openTestDatabase();
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(staleId),
        ),
      );
      await db.messageDao.upsertMessage(
        _message(id: newestId, channelId: 'channel-1', authorId: 'other'),
      );

      await ReadStateRepository(FluxerClient(dio), db).ackLatest('channel-1');

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, newestId);
    },
  );

  test(
    'ackLatestBulk acknowledges unread channels and clears manual state',
    () async {
      final firstId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final secondId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = _AckAdapter(
          expectedPath: '/v1/read-states/ack-bulk',
          expectedBody: <String, Object?>{
            'read_states': [
              <String, Object?>{
                'channel_id': 'channel-1',
                'message_id': firstId,
              },
              <String, Object?>{
                'channel_id': 'channel-2',
                'message_id': secondId,
              },
            ],
          },
        );
      final db = openTestDatabase();
      await db.channelDao.upsertChannels([
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(firstId),
        ),
        ChannelsCompanion.insert(
          id: 'channel-2',
          guildId: 'guild-1',
          name: 'updates',
          lastMessageId: Value(secondId),
        ),
      ]);
      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('channel-1'),
          lastMessageId: Value('older-message'),
          mentionCount: Value(3),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-2'),
          lastMessageId: Value(secondId),
          mentionCount: const Value(0),
          manual: const Value(true),
        ),
      );

      await ReadStateRepository(
        FluxerClient(dio),
        db,
      ).ackLatestBulk(['channel-1', 'channel-2']);

      final first = await db.readStateDao.getReadState('channel-1');
      final second = await db.readStateDao.getReadState('channel-2');
      expect(first?.lastMessageId, firstId);
      expect(first?.mentionCount, 0);
      expect(first?.manual, isFalse);
      expect(second?.lastMessageId, secondId);
      expect(second?.mentionCount, 0);
      expect(second?.manual, isFalse);
    },
  );

  test('ackLatest clears DM unread count from cached latest message', () async {
    final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = _AckAdapter(
        expectedPath: '/v1/channels/dm-1/messages/$messageId/ack',
      );
    final db = openTestDatabase();
    await db.dmChannelDao.upsertDmChannels([
      DmChannelsCompanion.insert(
        id: 'dm-1',
        recipientId: 'other',
        unreadCount: const Value(3),
      ),
    ]);
    await db.messageDao.upsertMessage(
      _message(id: messageId, channelId: 'dm-1', authorId: 'other'),
    );

    await ReadStateRepository(FluxerClient(dio), db).ackLatest('dm-1');

    final dm = await db.dmChannelDao.getDmChannelById('dm-1');
    final readState = await db.readStateDao.getReadState('dm-1');
    expect(dm?.unreadCount, 0);
    expect(readState?.lastMessageId, messageId);
    expect(readState?.manual, isFalse);
  });

  test('ackPins acknowledges latest channel pin timestamp', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = const _AckAdapter(
        expectedPath: '/v1/channels/channel-1/pins/ack',
      );
    final db = openTestDatabase();
    const latestPin = '2026-05-06T12:00:00.000Z';
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastPinTimestamp: const Value(latestPin),
      ),
    );
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(
        channelId: Value('channel-1'),
        lastPinTimestamp: Value('2026-05-05T12:00:00.000Z'),
      ),
    );

    await ReadStateRepository(FluxerClient(dio), db).ackPins('channel-1');

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastPinTimestamp, latestPin);
  });

  test('cleanupStaleReadStates deletes remote and local stale rows', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = _RecordingAdapter();
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    await db.dmChannelDao.upsertDmChannels([
      DmChannelsCompanion.insert(id: 'dm-1', recipientId: 'other'),
    ]);
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(channelId: Value('channel-1')),
    );
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(channelId: Value('dm-1')),
    );
    await db.readStateDao.upsertReadState(
      const ReadStatesCompanion(channelId: Value('missing-1')),
    );

    await ReadStateRepository(FluxerClient(dio), db).cleanupStaleReadStates();

    final adapter = dio.httpClientAdapter as _RecordingAdapter;
    expect(adapter.requests, [
      ('DELETE', '/v1/channels/missing-1/messages/ack'),
    ]);
    expect(await db.readStateDao.getReadState('missing-1'), null);
    expect(await db.readStateDao.getReadState('channel-1'), isA<ReadState>());
    expect(await db.readStateDao.getReadState('dm-1'), isA<ReadState>());
  });

  test('markMessageUnread manually acks the previous message', () async {
    final firstId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final secondId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
    final thirdId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 2));
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = _AckAdapter(
        expectedPath: '/v1/channels/channel-1/messages/$firstId/ack',
        expectedBody: <String, Object?>{'mention_count': 1, 'manual': true},
      );
    final db = openTestDatabase();
    await db.messageDao.upsertMessages([
      _message(id: firstId, channelId: 'channel-1', authorId: 'other'),
      _message(id: secondId, channelId: 'channel-1', authorId: 'other'),
      _message(
        id: thirdId,
        channelId: 'channel-1',
        authorId: 'other',
        isMentioned: true,
      ),
    ]);

    await ReadStateRepository(FluxerClient(dio), db).markMessageUnread(
      channelId: 'channel-1',
      messageId: secondId,
      currentUserId: 'me',
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, firstId);
    expect(readState?.mentionCount, 1);
    expect(readState?.manual, isTrue);
  });

  test('markMessageUnread persists stickyUnreadMessageId', () async {
    final firstId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final secondId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = _AckAdapter(
        expectedPath: '/v1/channels/channel-1/messages/$firstId/ack',
      );
    final db = openTestDatabase();
    await db.messageDao.upsertMessages([
      _message(id: firstId, channelId: 'channel-1', authorId: 'other'),
      _message(id: secondId, channelId: 'channel-1', authorId: 'other'),
    ]);

    await ReadStateRepository(FluxerClient(dio), db).markMessageUnread(
      channelId: 'channel-1',
      messageId: secondId,
      currentUserId: 'me',
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.stickyUnreadMessageId, secondId);
    expect(readState?.manual, isTrue);
  });

  test(
    'recomputeMentionsAfterBackfill refreshes mentionCount from cached messages',
    () async {
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final m1 = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final m2 = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final m3 = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
      final db = openTestDatabase();
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(m3),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
          stickyUnreadMessageId: const Value('sticky-1'),
          manual: const Value(true),
        ),
      );
      await db.messageDao.upsertMessages([
        _message(id: m1, channelId: 'channel-1', authorId: 'other'),
        _message(
          id: m2,
          channelId: 'channel-1',
          authorId: 'other',
          isMentioned: true,
        ),
        _message(
          id: m3,
          channelId: 'channel-1',
          authorId: 'other',
          isMentioned: true,
        ),
      ]);

      await ReadStateRepository(
        FluxerClient(dio),
        db,
      ).recomputeMentionsAfterBackfill(
        channelId: 'channel-1',
        currentUserId: 'me',
      );

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.mentionCount, 2);
      expect(readState?.stickyUnreadMessageId, 'sticky-1');
      expect(readState?.manual, isTrue);
      expect(readState?.lastMessageId, ackId);
    },
  );

  test(
    'recomputeMentionsAfterBackfill is idempotent on repeated calls',
    () async {
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final m1 = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
      final db = openTestDatabase();
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
        ),
      );
      await db.messageDao.upsertMessages([
        _message(
          id: m1,
          channelId: 'channel-1',
          authorId: 'other',
          isMentioned: true,
        ),
      ]);

      final repo = ReadStateRepository(FluxerClient(dio), db);
      await repo.recomputeMentionsAfterBackfill(
        channelId: 'channel-1',
        currentUserId: 'me',
      );
      await repo.recomputeMentionsAfterBackfill(
        channelId: 'channel-1',
        currentUserId: 'me',
      );

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.mentionCount, 1);
    },
  );

  test('ackLatest clears stickyUnreadMessageId after manual unread', () async {
    final firstId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final secondId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12, 1));
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = _AckAdapter(
        expectedPath: '/v1/channels/channel-1/messages/$secondId/ack',
      );
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(secondId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(firstId),
        stickyUnreadMessageId: Value(secondId),
        manual: const Value(true),
      ),
    );

    await ReadStateRepository(FluxerClient(dio), db).ackLatest('channel-1');

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, secondId);
    expect(readState?.stickyUnreadMessageId, null);
    expect(readState?.manual, isFalse);
  });

  test('recomputeMentionsForUnreadOrMentionedChannels drops blocked author '
      'mentions', () async {
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final mentionId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    await db.messageDao.upsertMessages([
      _message(id: ackId, channelId: 'channel-1', authorId: 'me'),
      _message(
        id: mentionId,
        channelId: 'channel-1',
        authorId: 'spammer',
        isMentioned: true,
      ),
    ]);
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(1),
      ),
    );
    await db.relationshipDao.upsertRelationships([
      RelationshipsCompanion.insert(userId: 'spammer', type: 2),
    ]);

    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
    await ReadStateRepository(
      FluxerClient(dio),
      db,
    ).recomputeMentionsForUnreadOrMentionedChannels(currentUserId: 'me');

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.mentionCount, 0);
  });

  test('recomputeMentionsAfterBackfill keeps the larger stored count on an '
      'incomplete cache', () async {
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
    final m1 = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final m2 = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
    final db = openTestDatabase();
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(5),
      ),
    );
    await db.messageDao.upsertMessages([
      _message(
        id: m1,
        channelId: 'channel-1',
        authorId: 'other',
        isMentioned: true,
      ),
      _message(
        id: m2,
        channelId: 'channel-1',
        authorId: 'other',
        isMentioned: true,
      ),
    ]);

    await ReadStateRepository(
      FluxerClient(dio),
      db,
    ).recomputeMentionsAfterBackfill(
      channelId: 'channel-1',
      currentUserId: 'me',
    );

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.mentionCount, 5);
  });

  test(
    'reconcileAfterMessageDelete walks tail back and drops mentions',
    () async {
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final mentionId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
      final db = openTestDatabase();
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(mentionId),
        ),
      );
      await db.messageDao.upsertMessages([
        _message(id: ackId, channelId: 'channel-1', authorId: 'other'),
        _message(
          id: mentionId,
          channelId: 'channel-1',
          authorId: 'other',
          isMentioned: true,
        ),
      ]);
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(1),
        ),
      );
      await db.messageDao.deleteMessages([mentionId]);

      await ReadStateRepository(
        FluxerClient(dio),
        db,
      ).reconcileAfterMessageDelete(
        channelId: 'channel-1',
        deletedMessageIds: [mentionId],
        currentUserId: 'me',
      );

      final channel = await db.channelDao.getChannelById('channel-1');
      final readState = await db.readStateDao.getReadState('channel-1');
      expect(channel?.lastMessageId, ackId);
      expect(readState?.mentionCount, 0);
    },
  );

  test(
    'unblock restores mentions in an unread channel with no current count',
    () async {
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final mentionId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
      final db = openTestDatabase();
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(mentionId),
        ),
      );
      await db.messageDao.upsertMessages([
        _message(id: ackId, channelId: 'channel-1', authorId: 'me'),
        _message(
          id: mentionId,
          channelId: 'channel-1',
          authorId: 'friend',
          isMentioned: true,
        ),
      ]);
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );

      // Author just unblocked: the channel is unread with a zero mention count.
      await ReadStateRepository(
        FluxerClient(dio),
        db,
      ).recomputeMentionsForUnreadOrMentionedChannels(currentUserId: 'me');

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.mentionCount, 1);
    },
  );
}

class _RecordingAdapter implements HttpClientAdapter {
  final List<(String method, String path)> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add((options.method, options.uri.path));
    return ResponseBody.fromString('', 204, statusMessage: 'No Content');
  }

  @override
  void close({bool force = false}) {}
}

class _AckAdapter implements HttpClientAdapter {
  const _AckAdapter({required this.expectedPath, this.expectedBody});

  final String expectedPath;
  final Map<String, Object?>? expectedBody;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    expect(options.method, 'POST');
    expect(options.uri.path, expectedPath);
    if (expectedBody != null) {
      final builder = BytesBuilder();
      if (requestStream != null) {
        await for (final chunk in requestStream) {
          builder.add(chunk);
        }
      }
      final decoded = jsonDecode(utf8.decode(builder.takeBytes()));
      expect(decoded, expectedBody);
    }

    return ResponseBody.fromString('', 204, statusMessage: 'No Content');
  }

  @override
  void close({bool force = false}) {}
}
