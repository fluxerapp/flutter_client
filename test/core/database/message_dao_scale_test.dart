import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

import '../../helpers/open_test_database.dart';

String _snowflakeForIndex(int index) {
  final int internal =
      (DateTime.utc(2026).millisecondsSinceEpoch << 22) + (index << 10);
  return internal.toString();
}

void main() {
  group('MessageDao scale', () {
    test('getLastMessageForChannels returns latest row per channel', () async {
      final FluxerDatabase db = openTestDatabase();
      const int channelCount = 100;
      for (int i = 0; i < channelCount; i++) {
        final String channelId = 'channel-$i';
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: channelId,
            guildId: 'guild-1',
            name: channelId,
          ),
        );
        await db.messageDao.upsertMessage(
          MessagesCompanion.insert(
            id: _snowflakeForIndex(i * 2),
            channelId: channelId,
            authorId: 'author-1',
            content: 'older',
            timestamp: DateTime.utc(2026, 1, 1, 0, 0, i),
          ),
        );
        await db.messageDao.upsertMessage(
          MessagesCompanion.insert(
            id: _snowflakeForIndex(i * 2 + 1),
            channelId: channelId,
            authorId: 'author-1',
            content: 'newer',
            timestamp: DateTime.utc(2026, 1, 2, 0, 0, i),
          ),
        );
      }
      final List<String> channelIds = List<String>.generate(
        channelCount,
        (int i) => 'channel-$i',
      );
      final Stopwatch stopwatch = Stopwatch()..start();
      final Map<String, Message> lastMessages = await db.messageDao
          .getLastMessageForChannels(channelIds);
      stopwatch.stop();
      expect(lastMessages.length, channelCount);
      for (int i = 0; i < channelCount; i++) {
        expect(lastMessages['channel-$i']?.content, 'newer');
      }
      // Scale test timing output.
      // ignore: avoid_print
      print(
        'getLastMessageForChannels($channelCount channels): '
        '${stopwatch.elapsedMilliseconds}ms',
      );
    });

    test('getMessages paginates a 10k-message channel', () async {
      final FluxerDatabase db = openTestDatabase();
      const String channelId = 'channel-1';
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: 'guild-1',
          name: 'general',
        ),
      );
      const int messageCount = 10000;
      final List<MessagesCompanion> batch = <MessagesCompanion>[
        for (int i = 0; i < messageCount; i++)
          MessagesCompanion.insert(
            id: _snowflakeForIndex(i),
            channelId: channelId,
            authorId: 'author-1',
            content: 'message-$i',
            timestamp: DateTime.utc(2026, 1, 1, 0, 0, 0, i % 60, i ~/ 60),
          ),
      ];
      for (int offset = 0; offset < batch.length; offset += 500) {
        final int end = (offset + 500).clamp(0, batch.length);
        await db.messageDao.upsertMessages(batch.sublist(offset, end));
      }
      final Stopwatch stopwatch = Stopwatch()..start();
      final List<Message> page = await db.messageDao.getMessages(channelId);
      stopwatch.stop();
      expect(page.length, 50);
      expect(page.last.content, 'message-${messageCount - 1}');
      // Scale test timing output.
      // ignore: avoid_print
      print(
        'getMessages(limit: 50) over $messageCount rows: '
        '${stopwatch.elapsedMilliseconds}ms',
      );
    });

    test('deleteMessagesForChannels removes all channel rows', () async {
      final FluxerDatabase db = openTestDatabase();
      const List<String> channelIds = <String>['channel-1', 'channel-2'];
      for (final String channelId in channelIds) {
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: channelId,
            guildId: 'guild-1',
            name: channelId,
          ),
        );
        await db.messageDao.upsertMessage(
          MessagesCompanion.insert(
            id: _snowflakeForIndex(channelId.hashCode),
            channelId: channelId,
            authorId: 'author-1',
            content: 'hello',
            timestamp: DateTime.utc(2026),
          ),
        );
      }
      await db.messageDao.deleteMessagesForChannels(channelIds);
      for (final String channelId in channelIds) {
        expect(await db.messageDao.getLastMessage(channelId), isNull);
      }
    });
  });
}
