import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/chat/domain/message.dart' as domain;

void main() {
  test(
    'persists authorIsBot and webhookId through the messages table',
    () async {
      final FluxerDatabase database = FluxerDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(database.close);
      final domain.Message message = domain.Message(
        id: '100',
        channelId: '200',
        authorId: '300',
        authorName: 'Proxy User',
        authorAvatar: 'proxy_avatar',
        authorIsBot: true,
        webhookId: '400',
        content: 'hello',
        timestamp: DateTime.utc(2026, 1, 2),
      );
      await database.messageDao.upsertMessage(message.toCompanion());
      final domain.Message loaded = domain.Message.fromRow(
        (await database.messageDao.getMessages('200')).single,
      );
      expect(loaded.authorIsBot, isTrue);
      expect(loaded.webhookId, '400');
      expect(loaded.authorName, 'Proxy User');
      expect(loaded.authorAvatar, 'proxy_avatar');
    },
  );
}
