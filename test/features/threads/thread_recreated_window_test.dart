@Tags(['slow'])
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';

import '../../helpers/chat_view_model_pagination_test_harness.dart';
import '../../helpers/open_test_database.dart';

const String _parentId = 'parent-1';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'a thread created again under the same id opens without the old window',
    () async {
      final FluxerDatabase db = openTestDatabase();
      final String threadId = paginationSnowflakeForIndex(0);
      for (final String id in <String>[_parentId, threadId]) {
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(id: id, guildId: 'guild-1', name: id),
        );
      }
      final Map<String, Object?> oldMessage = <String, Object?>{
        ...paginationMessageJson(
          id: paginationSnowflakeForIndex(1),
          channelId: threadId,
          authorId: 'other',
        ),
        'content': 'whoa',
      };
      final PaginatingAdapter adapter = PaginatingAdapter(
        messagesByChannel: <String, List<Map<String, Object?>>>{
          threadId: <Map<String, Object?>>[oldMessage],
        },
      );
      final ProviderContainer container = paginationContainer(db, adapter);
      addTearDown(container.dispose);
      final ChatViewModel notifier = container.read(
        chatViewModelProvider.notifier,
      );

      await notifier.switchChannel(threadId);
      await paginationFlushAsync();
      expect(
        container.read(chatViewModelProvider).messages.map((m) => m.content),
        <String>['whoa'],
      );
      await notifier.switchChannel(_parentId, loadMessages: false);
      await paginationFlushAsync();

      adapter.messagesByChannel[threadId] = <Map<String, Object?>>[
        <String, Object?>{
          ...paginationMessageJson(
            id: paginationSnowflakeForIndex(2),
            channelId: threadId,
            authorId: 'other',
          ),
          'content': '123',
        },
      ];
      await container
          .read(fluxerDatabaseProvider)
          .messageDao
          .deleteMessagesForChannel(threadId);
      notifier.forgetChannel(threadId);

      await notifier.switchChannel(threadId);
      await paginationFlushAsync();

      expect(
        container.read(chatViewModelProvider).messages.map((m) => m.content),
        <String>['123'],
      );
    },
  );

  test('a deleted live channel is not parked when the reader leaves', () async {
    final FluxerDatabase db = openTestDatabase();
    final String threadId = paginationSnowflakeForIndex(0);
    for (final String id in <String>[_parentId, threadId]) {
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(id: id, guildId: 'guild-1', name: id),
      );
    }
    final PaginatingAdapter adapter = PaginatingAdapter(
      messagesByChannel: <String, List<Map<String, Object?>>>{
        threadId: paginationChannelMessages(threadId, 3, baseIndex: 1),
      },
    );
    final ProviderContainer container = paginationContainer(db, adapter);
    addTearDown(container.dispose);
    final ChatViewModel notifier = container.read(
      chatViewModelProvider.notifier,
    );

    await notifier.switchChannel(threadId);
    await paginationFlushAsync();
    expect(container.read(chatViewModelProvider).messages, hasLength(3));

    notifier.forgetChannel(threadId);
    await notifier.switchChannel(_parentId, loadMessages: false);
    await paginationFlushAsync();
    adapter.messagesByChannel[threadId] = <Map<String, Object?>>[];
    await db.messageDao.deleteMessagesForChannel(threadId);

    await notifier.switchChannel(threadId);
    await paginationFlushAsync();

    expect(container.read(chatViewModelProvider).messages, isEmpty);
  });
}
