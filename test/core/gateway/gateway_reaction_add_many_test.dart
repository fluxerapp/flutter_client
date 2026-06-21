import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/features/chat/domain/message.dart' as domain;
import 'package:fluxer_dart/gateway.dart';

void main() {
  const channelId = '200';
  const messageId = '500';

  Future<FluxerDatabase> seed({
    List<domain.Reaction> reactions = const [],
  }) async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    await db.messageDao.upsertMessage(
      domain.Message(
        id: messageId,
        channelId: channelId,
        authorId: '300',
        authorName: 'author',
        content: 'hello',
        timestamp: DateTime.utc(2026, 1, 2),
        reactions: reactions,
      ).toCompanion(),
    );
    return db;
  }

  Future<Map<String?, int?>> reactionCountsOf(FluxerDatabase db) async {
    final row = await db.messageDao.getMessage(messageId);
    final list = (jsonDecode(row!.reactionsJson) as List<dynamic>)
        .cast<Map<String, dynamic>>();
    return {for (final r in list) r['emoji'] as String?: r['count'] as int?};
  }

  test('REACTION_ADD_MANY applies every emoji in one write', () async {
    final db = await seed();
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      const MessageReactionAddManyEvent(
        channelId: channelId,
        messageId: messageId,
        reactions: [
          <String, dynamic>{
            'emoji': <String, dynamic>{'name': '👍', 'id': null},
          },
          <String, dynamic>{
            'emoji': <String, dynamic>{'name': '❤️', 'id': null},
          },
          <String, dynamic>{
            'emoji': <String, dynamic>{'name': '😂', 'id': null},
          },
        ],
      ),
    );
    await pumpEventQueue();

    final counts = await reactionCountsOf(db);
    expect(counts, {'👍': 1, '❤️': 1, '😂': 1});
  });

  test('REACTION_ADD_MANY increments an existing reaction without losing '
      'concurrent additions', () async {
    final db = await seed(
      reactions: const [domain.Reaction(emoji: '👍', count: 1)],
    );
    final handler = GatewayEventHandler(database: db, currentUserId: 'me');

    await handler.handle(
      const MessageReactionAddManyEvent(
        channelId: channelId,
        messageId: messageId,
        reactions: [
          <String, dynamic>{
            'emoji': <String, dynamic>{'name': '👍', 'id': null},
          },
          <String, dynamic>{
            'emoji': <String, dynamic>{'name': '🔥', 'id': null},
          },
        ],
      ),
    );
    await pumpEventQueue();

    final counts = await reactionCountsOf(db);
    expect(counts['👍'], 2);
    expect(counts['🔥'], 1);
  });
}
