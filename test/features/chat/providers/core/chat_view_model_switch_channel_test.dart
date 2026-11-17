import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_page_sync.dart';

import '../../../../helpers/chat_view_model_pagination_test_harness.dart';
import '../../../../helpers/open_test_database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<(ProviderContainer, ChatViewModel, Set<String>)>
  setUpTwoChannels() async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'one',
      ),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-2',
        guildId: 'guild-1',
        name: 'two',
      ),
    );
    final List<Map<String, Object?>> channel1 = paginationChannelMessages(
      'channel-1',
      20,
    );
    final List<Map<String, Object?>> channel2 = paginationChannelMessages(
      'channel-2',
      20,
      baseIndex: 100,
    );
    await db.messageDao.upsertMessages([
      for (final Map<String, Object?> row in channel1)
        paginationCachedMessage(
          id: row['id']! as String,
          channelId: 'channel-1',
        ),
      for (final Map<String, Object?> row in channel2)
        paginationCachedMessage(
          id: row['id']! as String,
          channelId: 'channel-2',
        ),
    ]);
    final adapter = PaginatingAdapter(
      messagesByChannel: {'channel-1': channel1, 'channel-2': channel2},
    );
    final container = paginationContainer(db, adapter);
    addTearDown(container.dispose);
    return (
      container,
      container.read(chatViewModelProvider.notifier),
      {for (final Map<String, Object?> row in channel1) row['id']! as String},
    );
  }

  bool windowMixesChannel(
    ChatViewState state,
    String channelId,
    Set<String> otherIds,
  ) {
    if (state.channelId != channelId) {
      return false;
    }
    if (chatMessagesFromOtherChannel(
      channelId: channelId,
      messages: state.messages,
    )) {
      return true;
    }
    return state.messages.any(
      (Message message) => otherIds.contains(message.id),
    );
  }

  test(
    'a channel switch drops the previous transcript before the first await',
    () async {
      final (container, notifier, channel1Ids) = await setUpTwoChannels();

      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();
      expect(container.read(chatViewModelProvider).channelId, 'channel-1');
      expect(container.read(chatViewModelProvider).messages, isNotEmpty);

      final Future<void> switchToTwo = notifier.switchChannel('channel-2');
      final ChatViewState mid = container.read(chatViewModelProvider);
      expect(mid.channelId, 'channel-2');
      expect(
        mid.messages.any((Message message) => channel1Ids.contains(message.id)),
        isFalse,
      );
      expect(
        chatMessagesFromOtherChannel(
          channelId: 'channel-2',
          messages: mid.messages,
        ),
        isFalse,
      );

      await switchToTwo;
      await paginationFlushAsync();
      final ChatViewState settled = container.read(chatViewModelProvider);
      expect(settled.channelId, 'channel-2');
      expect(
        settled.messages.any(
          (Message message) => channel1Ids.contains(message.id),
        ),
        isFalse,
      );
    },
  );

  test(
    'overlapping switchChannel calls never attach the old rows to the new id',
    () async {
      final (container, notifier, channel1Ids) = await setUpTwoChannels();
      var sawMixedWindow = false;
      container.listen<ChatViewState>(chatViewModelProvider, (_, next) {
        if (windowMixesChannel(next, 'channel-2', channel1Ids)) {
          sawMixedWindow = true;
        }
      });

      unawaited(notifier.switchChannel('channel-1'));
      unawaited(notifier.switchChannel('channel-2'));
      await paginationFlushAsync();

      final ChatViewState settled = container.read(chatViewModelProvider);
      expect(settled.channelId, 'channel-2');
      expect(sawMixedWindow, isFalse);
      expect(
        settled.messages.any(
          (Message message) => channel1Ids.contains(message.id),
        ),
        isFalse,
      );
    },
  );

  test('switching back restores the draft on the first state', () async {
    final (ProviderContainer container, ChatViewModel vm, _) =
        await setUpTwoChannels();
    await vm.switchChannel('channel-1');
    vm.updateMessageText('hello there');
    await vm.switchChannel('channel-2');
    expect(container.read(chatViewModelProvider).messageText, isEmpty);

    final Future<void> back = vm.switchChannel('channel-1');
    expect(container.read(chatViewModelProvider).channelId, 'channel-1');
    expect(container.read(chatViewModelProvider).messageText, 'hello there');
    await back;
    expect(container.read(chatViewModelProvider).messageText, 'hello there');
  });

  test('a preloaded channel opens with messages on the first state', () async {
    final (ProviderContainer container, ChatViewModel vm, _) =
        await setUpTwoChannels();
    await container
        .read(fluxerDatabaseProvider)
        .channelDao
        .upsertChannel(
          ChannelsCompanion.insert(
            id: 'channel-2',
            guildId: 'guild-1',
            name: 'two',
            lastMessageId: Value(paginationSnowflakeForIndex(119)),
          ),
        );
    await container
        .read(fluxerDatabaseProvider)
        .readStateDao
        .upsertReadState(
          ReadStatesCompanion.insert(
            channelId: 'channel-2',
            lastMessageId: Value(paginationSnowflakeForIndex(119)),
          ),
        );
    await vm.switchChannel('channel-1');
    await vm.preloadChannel('channel-2');

    final Future<void> open = vm.switchChannel('channel-2');
    final ChatViewState first = container.read(chatViewModelProvider);
    expect(first.channelId, 'channel-2');
    expect(first.isLoading, isFalse);
    expect(first.messages, isNotEmpty);
    expect(
      first.messages.every((Message m) => m.channelId == 'channel-2'),
      isTrue,
    );
    await open;
    await paginationFlushAsync();
  });

  test('a message created while parked shows on return', () async {
    final (ProviderContainer container, ChatViewModel vm, _) =
        await setUpTwoChannels();
    await vm.switchChannel('channel-1');
    await vm.switchChannel('channel-2');
    final String createdId = paginationSnowflakeForIndex(50);
    paginationEmitCreatedMessage(container, id: createdId);
    await paginationFlushAsync();

    final Future<void> back = vm.switchChannel('channel-1');
    final ChatViewState first = container.read(chatViewModelProvider);
    expect(first.channelId, 'channel-1');
    expect(first.messages, isNotEmpty);
    expect(first.messages.last.id, createdId);
    await back;
    await paginationFlushAsync();
  });
}
