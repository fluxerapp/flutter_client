import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

const String _storedReactions =
    '[{"emoji":"👍","emojiId":null,"animated":false,"count":3,'
    '"hasReacted":true}]';

Map<String, Object?> _broadcastMessageJson({
  required String id,
  required String content,
}) => <String, Object?>{
  'id': id,
  'channel_id': 'c1',
  'author': <String, Object?>{
    'id': 'author-1',
    'username': 'author',
    'discriminator': '0001',
    'global_name': null,
    'avatar': null,
    'avatar_color': null,
    'flags': 0,
  },
  'type': 0,
  'flags': 0,
  'content': content,
  'timestamp': DateTime.utc(2026, 10).toIso8601String(),
  'edited_timestamp': DateTime.utc(2026, 10, 2).toIso8601String(),
  'pinned': true,
  'mention_everyone': false,
  'tts': false,
  'mentions': <Object?>[],
  'mention_roles': <Object?>[],
  'embeds': <Object?>[],
  'attachments': <Object?>[],
  'stickers': <Object?>[],
};

void main() {
  late FluxerDatabase database;

  setUp(() {
    database = openTestDatabase();
  });

  test(
    'MESSAGE_UPDATE without a reactions key keeps the stored reactions',
    () async {
      await database.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: 'm1',
          channelId: 'c1',
          authorId: 'author-1',
          content: 'before',
          timestamp: DateTime.utc(2026, 10),
          reactionsJson: const Value(_storedReactions),
        ),
      );
      final GatewayEventHandler handler = GatewayEventHandler(
        database: database,
        currentUserId: 'me',
      );

      await handler.handle(
        MessageUpdateEvent(
          message: MessageResponseSchema.fromJson(
            _broadcastMessageJson(id: 'm1', content: 'after'),
          ),
        ),
      );

      final Message? stored = await database.messageDao.getMessage('c1', 'm1');
      expect(stored?.content, 'after');
      expect(stored?.pinned, isTrue);
      expect(jsonDecode(stored!.reactionsJson), jsonDecode(_storedReactions));
    },
  );
}
