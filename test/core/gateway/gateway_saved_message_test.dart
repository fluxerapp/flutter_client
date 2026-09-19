import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
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
}
