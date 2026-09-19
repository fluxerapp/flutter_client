import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/features/chat/domain/message.dart' as chat;
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

UserPartialResponse _author() => const UserPartialResponse(
  id: '300',
  username: 'author',
  discriminator: '0001',
  globalName: null,
  avatar: null,
  avatarColor: null,
  flags: 0,
);

MessageResponseSchema _message({
  required String id,
  required String channelId,
  required String content,
}) => MessageResponseSchema(
  id: id,
  channelId: channelId,
  author: _author(),
  type: MessageResponseSchemaTypeType.valueDefault,
  flags: 0,
  content: content,
  timestamp: DateTime.utc(2026, 1, 2),
  pinned: false,
  mentionEveryone: false,
  tts: false,
  mentions: const [],
  mentionRoles: const [],
);

void main() {
  test(
    'SAVED_MESSAGE_CREATE stores the message before the bookmark id',
    () async {
      final FluxerDatabase database = openTestDatabase();
      await database.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'c1',
          guildId: 'g1',
          name: 'general',
          lastMessageId: const Value('old'),
        ),
      );

      await GatewayEventHandler(database: database, currentUserId: 'me').handle(
        SavedMessageCreateEvent(
          message: _message(id: 'm1', channelId: 'c1', content: 'from desktop'),
        ),
      );

      expect(await database.savedMessageDao.isSaved('m1'), isTrue);
      final Message? row = await database.messageDao.getMessage('m1');
      expect(row, isNotNull);
      expect(row!.content, 'from desktop');
      expect(row.channelId, 'c1');
      expect(
        (await database.channelDao.getChannelById('c1'))?.lastMessageId,
        'old',
      );
    },
  );

  test('SAVED_MESSAGE_CREATE notifies listeners after persist', () async {
    final FluxerDatabase database = openTestDatabase();
    chat.Message? created;

    await GatewayEventHandler(
      database: database,
      currentUserId: 'me',
      onSavedMessageCreate: (chat.Message message) => created = message,
    ).handle(
      SavedMessageCreateEvent(
        message: _message(id: 'm1', channelId: 'c1', content: 'from desktop'),
      ),
    );

    expect(created?.id, 'm1');
    expect(created?.content, 'from desktop');
  });

  test('SAVED_MESSAGE_DELETE notifies listeners', () async {
    final FluxerDatabase database = openTestDatabase();
    await database.savedMessageDao.addSavedMessage('m1');
    String? deletedId;

    await GatewayEventHandler(
      database: database,
      onSavedMessageDelete: (String messageId) => deletedId = messageId,
    ).handle(const SavedMessageDeleteEvent(messageId: 'm1'));

    expect(deletedId, 'm1');
    expect(await database.savedMessageDao.isSaved('m1'), isFalse);
  });
}
