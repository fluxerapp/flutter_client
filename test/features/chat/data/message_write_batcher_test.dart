import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/features/chat/data/message_write_batcher.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  late FluxerDatabase db;
  late ChannelLastMessageIndex index;
  late MessageWriteBatcher batcher;
  final List<Map<String, String>> flushBatches = <Map<String, String>>[];

  setUp(() {
    db = openTestDatabase();
    index = ChannelLastMessageIndex();
    batcher = MessageWriteBatcher(
      database: db,
      channelLastMessageIndex: index,
      window: const Duration(hours: 1),
      onFlush: flushBatches.add,
    );
  });

  tearDown(() async {
    await batcher.dispose();
    await index.dispose();
  });

  test('batch flush updates channel last message index', () async {
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    batcher
      ..enqueueMessage(
        companion: MessagesCompanion.insert(
          id: 'msg-1',
          channelId: 'channel-1',
          authorId: 'user-1',
          content: 'hello',
          timestamp: DateTime.utc(2020),
        ),
        channelId: 'channel-1',
        messageId: 'msg-1',
      )
      ..enqueueMessage(
        companion: MessagesCompanion.insert(
          id: 'msg-2',
          channelId: 'channel-1',
          authorId: 'user-1',
          content: 'world',
          timestamp: DateTime.utc(2020, 1, 1, 0, 1),
        ),
        channelId: 'channel-1',
        messageId: 'msg-2',
      );
    await batcher.flush();
    expect(index.lastMessageIdFor('channel-1'), 'msg-2');
    expect(flushBatches.length, 1);
    expect(flushBatches.first['channel-1'], 'msg-2');
  });

  test('scheduled flushes respect minimum interval between bursts', () {
    fakeAsync((FakeAsync async) {
      final List<int> flushCounts = <int>[];
      final MessageWriteBatcher fastBatcher = MessageWriteBatcher(
        database: db,
        window: const Duration(milliseconds: 10),
        minIntervalBetweenFlushes: const Duration(milliseconds: 50),
        onFlush: (Map<String, String> _) => flushCounts.add(1),
      );
      addTearDown(fastBatcher.dispose);

      fastBatcher.enqueueMessage(
        companion: MessagesCompanion.insert(
          id: 'msg-1',
          channelId: 'channel-1',
          authorId: 'user-1',
          content: 'a',
          timestamp: DateTime.utc(2020),
        ),
        channelId: 'channel-1',
        messageId: 'msg-1',
      );
      async.elapse(const Duration(milliseconds: 10));
      expect(flushCounts, <int>[1]);

      fastBatcher.enqueueMessage(
        companion: MessagesCompanion.insert(
          id: 'msg-2',
          channelId: 'channel-1',
          authorId: 'user-1',
          content: 'b',
          timestamp: DateTime.utc(2020, 1, 1, 0, 1),
        ),
        channelId: 'channel-1',
        messageId: 'msg-2',
      );
      async.elapse(const Duration(milliseconds: 10));
      expect(flushCounts, <int>[1]);

      async.elapse(const Duration(milliseconds: 40));
      expect(flushCounts, <int>[1, 1]);

      fastBatcher.enqueueMessage(
        companion: MessagesCompanion.insert(
          id: 'msg-3',
          channelId: 'channel-1',
          authorId: 'user-1',
          content: 'c',
          timestamp: DateTime.utc(2020, 1, 1, 0, 2),
        ),
        channelId: 'channel-1',
        messageId: 'msg-3',
      );
      async.elapse(const Duration(milliseconds: 10));
      expect(flushCounts, <int>[1, 1]);

      async.elapse(const Duration(milliseconds: 40));
      expect(flushCounts, <int>[1, 1, 1]);
    });
  });
}
