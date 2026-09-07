import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/chat/data/reaction_write_batcher.dart';
import 'package:fluxer_app/features/chat/domain/message.dart' as domain;
import 'package:fluxer_dart/gateway.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  const String channelId = 'channel-1';
  const String messageId = 'message-1';
  const ReactionEmoji thumbsUp = ReactionEmoji(name: '👍');
  const ReactionEmoji heart = ReactionEmoji(name: '❤️');

  late FluxerDatabase db;
  late List<(String, String)> flushes;

  Future<void> seed({List<domain.Reaction> reactions = const []}) async {
    await db.messageDao.upsertMessage(
      domain.Message(
        id: messageId,
        channelId: channelId,
        authorId: 'user-1',
        authorName: 'author',
        content: 'hello',
        timestamp: DateTime.utc(2026, 1, 2),
        reactions: reactions,
      ).toCompanion(),
    );
  }

  Future<Map<String?, int?>> reactionCounts() async {
    final row = await db.messageDao.getMessage(messageId);
    final list = (jsonDecode(row!.reactionsJson) as List<dynamic>)
        .cast<Map<String, dynamic>>();
    return {for (final r in list) r['emoji'] as String?: r['count'] as int?};
  }

  ReactionWriteBatcher createBatcher() {
    return ReactionWriteBatcher(
      database: db,
      window: const Duration(hours: 1),
      onFlush: (String flushedChannelId, String flushedMessageId) {
        flushes.add((flushedChannelId, flushedMessageId));
      },
    );
  }

  setUp(() {
    db = openTestDatabase();
    flushes = <(String, String)>[];
  });

  test('onFlush runs after the database has the new emoji', () async {
    await seed();
    final ReactionWriteBatcher batcher = createBatcher();
    addTearDown(batcher.dispose);

    batcher.enqueue(
      messageId: messageId,
      channelId: channelId,
      emoji: thumbsUp,
      isAdd: true,
      isCurrentUser: false,
    );

    expect(flushes, isEmpty);
    expect(await reactionCounts(), isEmpty);

    await batcher.flush(messageId);

    expect(flushes, <(String, String)>[(channelId, messageId)]);
    expect(await reactionCounts(), <String?, int?>{'👍': 1});
  });

  test(
    'two adds then a remove match the applied deltas after each flush',
    () async {
      await seed();
      final ReactionWriteBatcher batcher = createBatcher();
      addTearDown(batcher.dispose);

      batcher.enqueue(
        messageId: messageId,
        channelId: channelId,
        emoji: thumbsUp,
        isAdd: true,
        isCurrentUser: false,
      );
      await batcher.flush(messageId);
      expect(await reactionCounts(), <String?, int?>{'👍': 1});

      batcher.enqueue(
        messageId: messageId,
        channelId: channelId,
        emoji: heart,
        isAdd: true,
        isCurrentUser: false,
      );
      await batcher.flush(messageId);
      expect(await reactionCounts(), <String?, int?>{'👍': 1, '❤️': 1});

      batcher.enqueue(
        messageId: messageId,
        channelId: channelId,
        emoji: heart,
        isAdd: false,
        isCurrentUser: false,
      );
      await batcher.flush(messageId);
      expect(await reactionCounts(), <String?, int?>{'👍': 1});
      expect(flushes.length, 3);
    },
  );

  test(
    'enqueue during an in-flight write still applies the second batch',
    () async {
      await seed();
      final ReactionWriteBatcher batcher = createBatcher();
      addTearDown(batcher.dispose);

      batcher.enqueue(
        messageId: messageId,
        channelId: channelId,
        emoji: thumbsUp,
        isAdd: true,
        isCurrentUser: false,
      );
      final Future<void> inFlight = batcher.flush(messageId);
      batcher.enqueue(
        messageId: messageId,
        channelId: channelId,
        emoji: heart,
        isAdd: true,
        isCurrentUser: false,
      );
      await inFlight;

      expect(await reactionCounts(), <String?, int?>{'👍': 1, '❤️': 1});
      expect(flushes, isNotEmpty);
    },
  );
}
