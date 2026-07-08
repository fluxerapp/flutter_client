import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/chat/domain/message.dart' as domain;
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  test('persists author metadata through the messages table', () async {
    final FluxerDatabase database = openTestDatabase();
    final domain.Message message = domain.Message(
      id: '100',
      channelId: '200',
      authorId: '300',
      authorName: 'Proxy User',
      authorAvatar: 'proxy_avatar',
      authorIsBot: true,
      authorIsSystem: true,
      webhookId: '400',
      content: 'hello',
      timestamp: DateTime.utc(2026, 1, 2),
    );
    await database.messageDao.upsertMessage(message.toCompanion());
    final domain.Message loaded = domain.Message.fromRow(
      (await database.messageDao.getMessages('200')).single,
    );
    expect(loaded.authorIsBot, isTrue);
    expect(loaded.authorIsSystem, isTrue);
    expect(loaded.webhookId, '400');
    expect(loaded.authorName, 'Proxy User');
    expect(loaded.authorAvatar, 'proxy_avatar');
  });

  test('system authors render system user tags regardless of id', () {
    expect(
      messageAuthorShowsUserTag(authorIsBot: false, authorIsSystem: true),
      isTrue,
    );
    expect(messageAuthorUserTagIsSystem(authorIsSystem: true), isTrue);
  });

  test('authors without bot or system flags do not render user tags', () {
    expect(
      messageAuthorShowsUserTag(authorIsBot: false, authorIsSystem: false),
      isFalse,
    );
    expect(messageAuthorUserTagIsSystem(authorIsSystem: false), isFalse);
  });
}
