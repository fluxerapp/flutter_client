import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_auto_ack_allowed_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Map<String, Object?> _messageJson({
  required String id,
  required String channelId,
  required String authorId,
}) => <String, Object?>{
  'id': id,
  'channel_id': channelId,
  'author': <String, Object?>{
    'id': authorId,
    'username': 'user-$authorId',
    'discriminator': '0001',
    'global_name': null,
    'avatar': null,
    'avatar_color': null,
    'flags': 0,
  },
  'type': 0,
  'flags': 0,
  'tts': false,
  'content': 'message $id',
  'timestamp': dateTimeFromUserSnowflakeOrNull(id)!.toIso8601String(),
  'pinned': false,
  'mention_everyone': false,
  'mentions': <Object?>[],
  'mention_roles': <Object?>[],
};

MessagesCompanion _cachedMessage({
  required String id,
  required String channelId,
  required String authorId,
}) => MessagesCompanion.insert(
  id: id,
  channelId: channelId,
  authorId: authorId,
  content: 'message $id',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
);

void main() {
  test(
    'switchChannel honors loadMessages false when target is provided',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final adapter = _ChatAdapter();
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel(
        'channel-1',
        targetMessageId: 'message-1',
        loadMessages: false,
      );

      final state = container.read(chatViewModelProvider);
      expect(state.channelId, 'channel-1');
      expect(state.messages, isEmpty);
      expect(state.isLoading, isFalse);
      expect(adapter.messageRequestUris, isEmpty);
    },
  );

  test('switchChannel loads target messages when changing channels', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-2',
        guildId: 'guild-2',
        name: 'other',
      ),
    );
    final String targetId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final adapter = _ChatAdapter(
      messagesByChannel: <String, List<Map<String, Object?>>>{
        'channel-2': <Map<String, Object?>>[
          _messageJson(id: targetId, channelId: 'channel-2', authorId: 'other'),
        ],
      },
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await notifier.switchChannel('channel-2', targetMessageId: targetId);
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.channelId, 'channel-2');
    expect(state.isLoading, isFalse);
    expect(state.messages.map((m) => m.id), contains(targetId));
    expect(adapter.messageRequestUris, isNotEmpty);
  });

  test('auto ack does not run while channel messages are loading', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    final adapter = _ChatAdapter()..holdMessageFetch = true;
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    final load = notifier.switchChannel('channel-1');
    notifier.setReadViewportActive(isActive: true);
    await _flushAsync();

    expect(adapter.ackedMessageIds, isEmpty);
    adapter.releaseMessageFetch();
    await load;
  });

  test(
    'cache hit shows messages immediately without loading spinner state',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final cachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      await db.messageDao.upsertMessage(
        _cachedMessage(id: cachedId, channelId: 'channel-1', authorId: 'other'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(cachedId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(cachedId),
          mentionCount: const Value(0),
        ),
      );
      final networkId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(
            id: networkId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
      )..holdMessageFetch = true;
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      unawaited(notifier.switchChannel('channel-1'));
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.isLoading, isFalse);
      expect(state.isSyncingMessages, isTrue);
      expect(state.messages.map((m) => m.id), [cachedId]);
      expect(adapter.messageRequestUris, isNotEmpty);

      adapter.releaseMessageFetch();
      await _flushAsync();
      expect(container.read(chatViewModelProvider).isSyncingMessages, isFalse);
      expect(container.read(chatViewModelProvider).messages.last.id, networkId);
    },
  );

  test(
    'auto ack does not run while cache-first messages are syncing',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.messageDao.upsertMessage(
        _cachedMessage(id: latestId, channelId: 'channel-1', authorId: 'other'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(latestId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(latestId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        ],
      )..holdMessageFetch = true;
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      notifier.setReadViewportActive(isActive: true);
      await _flushAsync();

      expect(adapter.ackedMessageIds, isEmpty);
      expect(container.read(chatViewModelProvider).isSyncingMessages, isTrue);
      adapter.releaseMessageFetch();
      await _flushAsync();
      expect(container.read(chatViewModelProvider).isSyncingMessages, isFalse);
    },
  );

  test('unread channel skips cache-first and shows loading spinner', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
    final unreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 11));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 17, 12));
    await db.messageDao.upsertMessage(
      _cachedMessage(id: ackId, channelId: 'channel-1', authorId: 'other'),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(0),
        manual: const Value(true),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: unreadId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
      ],
    )..holdMessageFetch = true;
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    final load = notifier.switchChannel('channel-1');
    for (var i = 0; i < 20; i++) {
      await _flushAsync();
      final state = container.read(chatViewModelProvider);
      if (state.channelId == 'channel-1' && state.isLoading) {
        expect(state.isSyncingMessages, isFalse);
        expect(state.messages, isEmpty);
        adapter.releaseMessageFetch();
        await load;
        return;
      }
    }
    fail('expected loading state for unread channel');
  });

  test('stale cache does not suppress unread channel load detection', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final cachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
    await db.messageDao.upsertMessage(
      _cachedMessage(id: cachedId, channelId: 'channel-1', authorId: 'other'),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(cachedId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: cachedId, channelId: 'channel-1', authorId: 'other'),
      ],
    )..holdMessageFetch = true;
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    final load = notifier.switchChannel('channel-1');
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.isLoading, isTrue);
    expect(state.isSyncingMessages, isFalse);
    expect(state.messages, isEmpty);
    adapter.releaseMessageFetch();
    await load;
  });

  test(
    'cache-first sync removes deleted messages from memory and drift',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final anchorId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
      final deletedId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 11));
      final keptId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
      await db.messageDao.upsertMessages([
        _cachedMessage(id: anchorId, channelId: 'channel-1', authorId: 'other'),
        _cachedMessage(
          id: deletedId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
        _cachedMessage(id: keptId, channelId: 'channel-1', authorId: 'other'),
      ]);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(keptId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(keptId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
        ],
      )..holdMessageFetch = true;
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      expect(
        container.read(chatViewModelProvider).messages.map((m) => m.id),
        containsAll([anchorId, deletedId, keptId]),
      );

      adapter.releaseMessageFetch();
      for (var i = 0; i < 30; i++) {
        await _flushAsync();
        if (!container.read(chatViewModelProvider).isSyncingMessages) {
          break;
        }
      }

      final state = container.read(chatViewModelProvider);
      expect(state.isSyncingMessages, isFalse);
      expect(state.messages.map((m) => m.id), [anchorId, keptId]);
      expect(await db.messageDao.getMessage(deletedId), null);
      expect(await db.messageDao.getMessage(keptId), isNot(null));
    },
  );

  test('cache miss keeps loading state until network returns', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
      ],
    )..holdMessageFetch = true;
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    final load = notifier.switchChannel('channel-1');
    await _flushAsync();

    final loadingState = container.read(chatViewModelProvider);
    expect(loadingState.isLoading, isTrue);
    expect(loadingState.isSyncingMessages, isFalse);
    expect(loadingState.messages, isEmpty);

    adapter.releaseMessageFetch();
    await load;
    final loadedState = container.read(chatViewModelProvider);
    expect(loadedState.isLoading, isFalse);
    expect(loadedState.isSyncingMessages, isFalse);
    expect(loadedState.messages.last.id, latestId);
  });

  test('stale channel fetch does not overwrite active channel state', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final channel1CachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
    final channel1NetworkId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final channel2CachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 20));
    final channel2NetworkId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 21));
    await db.messageDao.upsertMessages([
      _cachedMessage(
        id: channel1CachedId,
        channelId: 'channel-1',
        authorId: 'other',
      ),
      _cachedMessage(
        id: channel2CachedId,
        channelId: 'channel-2',
        authorId: 'other',
      ),
    ]);
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general-1',
        lastMessageId: Value(channel1CachedId),
      ),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-2',
        guildId: 'guild-1',
        name: 'general-2',
        lastMessageId: Value(channel2CachedId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(channel1CachedId),
        mentionCount: const Value(0),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-2'),
        lastMessageId: Value(channel2CachedId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      messagesByChannel: {
        'channel-1': [
          _messageJson(
            id: channel1NetworkId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
        'channel-2': [
          _messageJson(
            id: channel2NetworkId,
            channelId: 'channel-2',
            authorId: 'other',
          ),
        ],
      },
    )..holdMessageFetch = true;
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    unawaited(notifier.switchChannel('channel-1'));
    await _flushAsync();
    await notifier.switchChannel('channel-2');
    await _flushAsync();

    expect(container.read(chatViewModelProvider).channelId, 'channel-2');
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      channel2CachedId,
    );

    adapter.releaseMessageFetch();
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.channelId, 'channel-2');
    expect(state.messages.last.id, channel2NetworkId);
    expect(state.messages.any((m) => m.id == channel1NetworkId), isFalse);
  });

  test(
    'opening unread channel sets sticky divider without auto-scrolling',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final unreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(latestId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: unreadId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await (notifier..setReadViewportActive(isActive: true)).switchChannel(
        'channel-1',
      );
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.scrollToMessageSignal, null);
      expect(state.stickyUnreadMessageId, unreadId);
      expect(state.hasMoreNewerMessages, isFalse);
      expect(state.messages.map((message) => message.id), [
        ackId,
        unreadId,
        latestId,
      ]);
      expect(adapter.aroundQueries, isEmpty);
      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, ackId);
      expect(adapter.ackedMessageIds, isEmpty);
    },
  );

  test('auto ack preserves sticky unread divider after ack advances', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final unreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: unreadId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    notifier
      ..setReadViewportActive(isActive: true)
      ..updateReadViewport(isNearBottom: true);
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, latestId);
    expect(
      container.read(chatViewModelProvider).stickyUnreadMessageId,
      unreadId,
    );
  });

  test('server ack echo does not clear sticky unread divider', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final unreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: unreadId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).stickyUnreadMessageId,
      unreadId,
    );

    // A non-manual ack (e.g. the server echoing our own auto-ack) must not
    // clear the pinned divider.
    notifier.applyExternalAck('channel-1', manual: false);
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).stickyUnreadMessageId,
      unreadId,
    );
  });

  test('manual external ack clears sticky unread divider', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final unreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: unreadId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).stickyUnreadMessageId,
      unreadId,
    );

    // A manual mark-read clears the divider.
    notifier.applyExternalAck('channel-1', manual: true);
    await _flushAsync();

    expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);
  });

  test(
    'auto ack does not preserve sticky unread divider for own messages',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final ownId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(ownId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: ownId, channelId: 'channel-1', authorId: 'me'),
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      notifier
        ..setReadViewportActive(isActive: true)
        ..updateReadViewport(isNearBottom: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, ownId);
      expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);
    },
  );

  test(
    'unread channel loads the latest page instead of around the ack',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final boundaryId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(latestId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
          manual: const Value(true),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(
            id: boundaryId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      notifier.setReadViewportActive(isActive: true);
      await _flushAsync();

      expect(adapter.aroundQueries, isEmpty);
      expect(adapter.afterQueries, isEmpty);
      final state = container.read(chatViewModelProvider);
      expect(state.messages.map((message) => message.id), [
        ackId,
        boundaryId,
        latestId,
      ]);
      expect(state.stickyUnreadMessageId, boundaryId);
      expect(state.hasMoreNewerMessages, isFalse);
    },
  );

  test('unread channel with large gap loads the latest page', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 10));
    final unreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 11));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 30, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(0),
        manual: const Value(true),
        stickyUnreadMessageId: Value(unreadId),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();

    expect(adapter.aroundQueries, isEmpty);
    expect(adapter.afterQueries, isEmpty);
    final state = container.read(chatViewModelProvider);
    expect(state.messages.map((message) => message.id), [latestId]);
    expect(state.hasMoreNewerMessages, isFalse);
  });

  test(
    'boundary fetch is skipped when ack is older than the loaded window',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final unreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(latestId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
          manual: const Value(true),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: <Map<String, Object?>>[
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        ],
        messagesAfterAck: <Map<String, Object?>>[
          _messageJson(id: unreadId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      notifier
        ..setReadViewportActive(isActive: true)
        ..updateReadViewport(isNearBottom: true);
      await _flushAsync();

      expect(adapter.afterQueries, isEmpty);
      expect(
        container.read(chatViewModelProvider).messages.map((m) => m.id),
        isNot(contains(unreadId)),
      );
    },
  );

  test('auto ack waits while app UI is not foreground', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter, foreground: false);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    notifier.setReadViewportActive(isActive: true);
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, ackId);
    expect(adapter.ackedMessageIds, isEmpty);
  });

  test('auto ack waits while chat auto ack is disallowed', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter, autoAckAllowed: false);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    notifier
      ..setReadViewportActive(isActive: true)
      ..updateReadViewport(isNearBottom: true);
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, ackId);
    expect(adapter.ackedMessageIds, isEmpty);
  });

  test('auto ack retries HTTP failure after applying local ack', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(1),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
      ],
    )..failAckAttempts = 1;
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    notifier
      ..setReadViewportActive(isActive: true)
      ..updateReadViewport(isNearBottom: true);
    await _flushAsync();
    await Future<void>.delayed(const Duration(seconds: 6));
    await _flushAsync();

    expect(adapter.ackAttempts, greaterThanOrEqualTo(2));
    expect(adapter.ackedMessageIds, contains(latestId));
  });

  test(
    'mark message unread applies local manual ack before HTTP completes',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final previousId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final targetId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(targetId),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: targetId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(
            id: previousId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
      )..holdAck = true;
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      final future = notifier.markMessageUnread(targetId);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, previousId);
      expect(readState?.manual, isTrue);

      adapter.releaseAck(statusCode: 204);
      await future;
    },
  );

  test(
    'mark current channel read clears sticky unread and forces ack',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final unreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(latestId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(1),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: unreadId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      expect(
        container.read(chatViewModelProvider).stickyUnreadMessageId,
        unreadId,
      );

      await notifier.markCurrentChannelRead();
      await _flushAsync();

      expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);
      expect(adapter.ackedMessageIds, [latestId]);
    },
  );

  test(
    'manual read state suppresses auto ack until explicitly marked read',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(latestId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
          manual: const Value(true),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      notifier.setReadViewportActive(isActive: true);
      await _flushAsync();

      var readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, ackId);
      expect(readState?.manual, isTrue);
      expect(adapter.ackedMessageIds, isEmpty);

      await notifier.markCurrentChannelRead();
      await _flushAsync();

      readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, latestId);
      expect(readState?.manual, isFalse);
      expect(adapter.ackedMessageIds, [latestId]);
    },
  );

  test('sending a message clears sticky unread divider', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final priorId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 9));
    final stickyId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: '',
        name: 'general',
        lastMessageId: Value(priorId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(priorId),
        mentionCount: const Value(0),
        manual: const Value(true),
        stickyUnreadMessageId: Value(stickyId),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        _messageJson(id: priorId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    unawaited(notifier.sendStandaloneMessage('hello'));
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.stickyUnreadMessageId, null);
    expect(readState?.manual, isFalse);
    expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);
  });

  group('highlightJumpMessage', () {
    test('sets highlightedMessageId immediately', () {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      final adapter = _ChatAdapter();
      final container = _container(db, adapter);
      addTearDown(() {
        container.dispose();
        unawaited(db.close());
      });
      final notifier = container.read(chatViewModelProvider.notifier);
      notifier.highlightJumpMessage('message-1');
      expect(
        container.read(chatViewModelProvider).highlightedMessageId,
        'message-1',
      );
    });

    test('persists highlight until scroll is confirmed on slow loads', () {
      fakeAsync((FakeAsync async) {
        final db = FluxerDatabase.forTesting(NativeDatabase.memory());
        final adapter = _ChatAdapter();
        final container = _container(db, adapter);
        final notifier = container.read(chatViewModelProvider.notifier);
        notifier.highlightJumpMessage('message-1');
        async.elapse(const Duration(seconds: 10));
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          'message-1',
        );
        container.dispose();
        unawaited(db.close());
      });
    });

    test('clears highlightedMessageId 2 seconds after scroll is confirmed', () {
      fakeAsync((FakeAsync async) {
        final db = FluxerDatabase.forTesting(NativeDatabase.memory());
        final adapter = _ChatAdapter();
        final container = _container(db, adapter);
        final notifier = container.read(chatViewModelProvider.notifier);
        notifier.highlightJumpMessage('message-1');
        async.elapse(const Duration(seconds: 5));
        notifier.extendJumpHighlight('message-1');
        async.elapse(const Duration(milliseconds: 1999));
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          'message-1',
        );
        async.elapse(const Duration(milliseconds: 1));
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          null,
        );
        container.dispose();
        unawaited(db.close());
      });
    });

    test('replaces highlight when jumping to a new message', () {
      fakeAsync((FakeAsync async) {
        final db = FluxerDatabase.forTesting(NativeDatabase.memory());
        final adapter = _ChatAdapter();
        final container = _container(db, adapter);
        final notifier = container.read(chatViewModelProvider.notifier);
        notifier.highlightJumpMessage('message-1');
        notifier.extendJumpHighlight('message-1');
        notifier.highlightJumpMessage('message-2');
        notifier.extendJumpHighlight('message-2');
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          'message-2',
        );
        async.elapse(const Duration(milliseconds: 2000));
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          null,
        );
        container.dispose();
        unawaited(db.close());
      });
    });

    test(
      'switchChannel with targetMessageId highlights the target message',
      () async {
        final db = FluxerDatabase.forTesting(NativeDatabase.memory());
        addTearDown(db.close);
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: 'channel-1',
            guildId: 'guild-1',
            name: 'general',
          ),
        );
        final String targetId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
        final adapter = _ChatAdapter(
          messagesByChannel: <String, List<Map<String, Object?>>>{
            'channel-1': <Map<String, Object?>>[
              _messageJson(
                id: targetId,
                channelId: 'channel-1',
                authorId: 'other',
              ),
            ],
          },
        );
        final container = _container(db, adapter);
        addTearDown(container.dispose);
        final notifier = container.read(chatViewModelProvider.notifier);
        final Future<void> switchFuture = notifier.switchChannel(
          'channel-1',
          targetMessageId: targetId,
        );
        await _flushAsync();
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          targetId,
        );
        await switchFuture;
        await _flushAsync();
        expect(
          container.read(chatViewModelProvider).scrollToMessageSignal?.$1,
          targetId,
        );
      },
    );

    test(
      'switchChannel with same targetMessageId skips reload when target is loaded',
      () async {
        final db = FluxerDatabase.forTesting(NativeDatabase.memory());
        addTearDown(db.close);
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: 'channel-1',
            guildId: 'guild-1',
            name: 'general',
          ),
        );
        final String targetId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
        final adapter = _ChatAdapter(
          messagesByChannel: <String, List<Map<String, Object?>>>{
            'channel-1': <Map<String, Object?>>[
              _messageJson(
                id: targetId,
                channelId: 'channel-1',
                authorId: 'other',
              ),
            ],
          },
        );
        final container = _container(db, adapter);
        addTearDown(container.dispose);
        final notifier = container.read(chatViewModelProvider.notifier);
        await notifier.switchChannel('channel-1', targetMessageId: targetId);
        await _flushAsync();
        final messagesAfterFirstLoad = List.of(
          container.read(chatViewModelProvider).messages,
        );
        await notifier.switchChannel('channel-1', targetMessageId: targetId);
        await _flushAsync();
        final ChatViewState state = container.read(chatViewModelProvider);
        expect(state.messages, messagesAfterFirstLoad);
        expect(state.isLoading, false);
        expect(state.highlightedMessageId, targetId);
        expect(state.scrollToMessageSignal?.$1, targetId);
      },
    );

    test('switchChannel without target clears jump highlight', () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
        ),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-2',
          guildId: 'guild-2',
          name: 'other',
        ),
      );
      final adapter = _ChatAdapter();
      final container = _container(db, adapter);
      addTearDown(container.dispose);
      final notifier = container.read(chatViewModelProvider.notifier);
      notifier.highlightJumpMessage('message-1');
      await notifier.switchChannel('channel-2');
      expect(container.read(chatViewModelProvider).highlightedMessageId, null);
    });
  });

  test('refreshAfterSessionRecovery is no-op without open channel', () async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    final adapter = _ChatAdapter();
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    await container
        .read(chatViewModelProvider.notifier)
        .refreshAfterSessionRecovery();

    expect(container.read(chatViewModelProvider).channelId, isEmpty);
    expect(adapter.messageRequestUris, isEmpty);
  });

  group('read-ack gate reorder', () {
    test('rapid viewport ticks ack the latest message exactly once', () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(latestId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      notifier.setReadViewportActive(isActive: true);
      for (var i = 0; i < 10; i++) {
        notifier.updateReadViewport(isNearBottom: true);
      }
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, latestId);
      expect(adapter.ackedMessageIds, [latestId]);
      expect(adapter.ackAttempts, 1);
    });

    test(
      'manual read state is never auto-acked under rapid viewport ticks',
      () async {
        final db = FluxerDatabase.forTesting(NativeDatabase.memory());
        addTearDown(db.close);
        final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
        final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: 'channel-1',
            guildId: 'guild-1',
            name: 'general',
            lastMessageId: Value(latestId),
          ),
        );
        await db.readStateDao.upsertReadState(
          ReadStatesCompanion(
            channelId: const Value('channel-1'),
            lastMessageId: Value(ackId),
            mentionCount: const Value(0),
            manual: const Value(true),
          ),
        );
        final adapter = _ChatAdapter(
          initialMessages: [
            _messageJson(
              id: latestId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
            _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
          ],
        );
        final container = _container(db, adapter);
        addTearDown(container.dispose);

        final notifier = container.read(chatViewModelProvider.notifier);
        await notifier.switchChannel('channel-1');
        notifier.setReadViewportActive(isActive: true);
        for (var i = 0; i < 10; i++) {
          notifier.updateReadViewport(isNearBottom: true);
        }
        await _flushAsync();

        final readState = await db.readStateDao.getReadState('channel-1');
        expect(readState?.lastMessageId, ackId);
        expect(readState?.manual, isTrue);
        expect(adapter.ackedMessageIds, isEmpty);
        expect(adapter.ackAttempts, 0);
      },
    );
  });

  test(
    'live message received while scrolled into history is dropped',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final incomingId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(latestId),
        ),
      );
      // Channel's newest message is far ahead of the loaded page, so the
      // window sits in history with hasMoreNewerMessages == true.
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: olderId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final loaded = container.read(chatViewModelProvider);
      expect(loaded.hasMoreNewerMessages, isTrue);
      expect(loaded.messages.map((m) => m.id).toList(), [olderId]);

      container
          .read(messageRealtimeBusProvider)
          .emit(
            MessageCreated(
              MessageCreateEvent(
                message: MessageResponseSchema.fromJson(
                  _messageJson(
                    id: incomingId,
                    channelId: 'channel-1',
                    authorId: 'other',
                  ),
                ),
              ),
            ),
          );
      await _flushAsync();

      // Mirrors web ignorePastVisibleWindow: the live message is not appended
      // to the history tail while newer messages remain unloaded.
      expect(
        container
            .read(chatViewModelProvider)
            .messages
            .map((m) => m.id)
            .toList(),
        [olderId],
      );
    },
  );
}

ProviderContainer _container(
  FluxerDatabase db,
  _ChatAdapter adapter, {
  bool foreground = true,
  bool? autoAckAllowed,
}) {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      appUiForegroundProvider.overrideWithValue(foreground),
      if (autoAckAllowed != null)
        chatAutoAckAllowedProvider.overrideWithValue(autoAckAllowed),
      fluxerDioProvider.overrideWithValue(dio),
      fluxerClientProvider.overrideWithValue(client),
      currentUserIdProvider.overrideWithValue('me'),
      ackBatcherProvider.overrideWith((ref) {
        final batcher = AckBatcher(client: client, batchDelay: Duration.zero);
        ref.onDispose(() {
          unawaited(batcher.dispose());
        });
        return batcher;
      }),
    ],
  );
}

Future<void> _flushAsync() async {
  for (var i = 0; i < 8; i++) {
    await pumpEventQueue();
  }
}

class _ChatAdapter implements HttpClientAdapter {
  _ChatAdapter({
    this.initialMessages = const [],
    this.messagesByChannel = const {},
    this.messagesAfterAck = const [],
  });

  final List<Map<String, Object?>> initialMessages;
  final Map<String, List<Map<String, Object?>>> messagesByChannel;
  final List<Map<String, Object?>> messagesAfterAck;
  final List<Uri> messageRequestUris = [];
  final List<String> afterQueries = [];
  final List<String> aroundQueries = [];
  final List<String> ackedMessageIds = [];
  bool holdMessageFetch = false;
  bool holdAck = false;
  Completer<void>? _messageFetchCompleter;
  Completer<int>? _ackCompleter;
  int failAckAttempts = 0;
  int ackAttempts = 0;

  void releaseMessageFetch() {
    holdMessageFetch = false;
    if (_messageFetchCompleter?.isCompleted ?? true) {
      return;
    }
    _messageFetchCompleter!.complete();
  }

  void releaseAck({required int statusCode}) {
    holdAck = false;
    if (_ackCompleter?.isCompleted ?? true) {
      return;
    }
    _ackCompleter!.complete(statusCode);
  }

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final channelMessagesMatch = RegExp(
      r'/channels/([^/]+)/messages$',
    ).firstMatch(options.uri.path);
    if (options.method == 'GET' && channelMessagesMatch != null) {
      final channelId = channelMessagesMatch.group(1)!;
      messageRequestUris.add(options.uri);
      final after = options.uri.queryParameters['after'];
      final around = options.uri.queryParameters['around'];
      if (after != null) {
        afterQueries.add(after);
      }
      if (around != null) {
        aroundQueries.add(around);
      }
      if (holdMessageFetch) {
        _messageFetchCompleter ??= Completer<void>();
        await _messageFetchCompleter!.future;
      }
      final List<Map<String, Object?>> messages;
      if (around != null) {
        messages = messagesByChannel[channelId] ?? initialMessages;
      } else if (after != null) {
        messages = messagesAfterAck;
      } else {
        messages = messagesByChannel[channelId] ?? initialMessages;
      }
      return ResponseBody.fromString(
        jsonEncode(messages),
        200,
        headers: {
          Headers.contentTypeHeader: ['application/json'],
        },
      );
    }

    if (options.method == 'POST' &&
        options.uri.path.endsWith('/read-states/ack-bulk')) {
      ackAttempts++;
      if (holdAck) {
        _ackCompleter ??= Completer<int>();
        final statusCode = await _ackCompleter!.future;
        if (statusCode != 204) {
          return ResponseBody.fromString('failed', statusCode);
        }
      }
      if (failAckAttempts > 0) {
        failAckAttempts--;
        return ResponseBody.fromString('failed', 500);
      }
      final raw = await _readRequestBody(requestStream, options.data);
      if (raw != null && raw.isNotEmpty) {
        final body = jsonDecode(raw) as Map<String, dynamic>;
        final entries = (body['read_states'] as List<dynamic>? ?? const [])
            .cast<Map<String, dynamic>>();
        for (final entry in entries) {
          ackedMessageIds.add(entry['message_id'] as String);
        }
      }
      return ResponseBody.fromString('', 204, statusMessage: 'No Content');
    }

    if (options.method == 'POST' && options.uri.path.endsWith('/ack')) {
      ackAttempts++;
      if (holdAck) {
        _ackCompleter ??= Completer<int>();
        final statusCode = await _ackCompleter!.future;
        if (statusCode != 204) {
          return ResponseBody.fromString('failed', statusCode);
        }
      }
      if (failAckAttempts > 0) {
        failAckAttempts--;
        return ResponseBody.fromString('failed', 500);
      }
      ackedMessageIds.add(options.uri.pathSegments[4]);
      return ResponseBody.fromString('', 204, statusMessage: 'No Content');
    }

    return ResponseBody.fromString('Not found', 404);
  }

  @override
  void close({bool force = false}) {}
}

Future<String?> _readRequestBody(
  Stream<Uint8List>? requestStream,
  dynamic data,
) async {
  if (requestStream != null) {
    final chunks = await requestStream.toList();
    if (chunks.isEmpty) {
      return null;
    }
    final totalLength = chunks.fold<int>(0, (sum, c) => sum + c.length);
    final bytes = Uint8List(totalLength);
    var offset = 0;
    for (final chunk in chunks) {
      bytes.setRange(offset, offset + chunk.length, chunk);
      offset += chunk.length;
    }
    return utf8.decode(bytes);
  }
  if (data is String) {
    return data;
  }
  if (data is Map<String, dynamic>) {
    return jsonEncode(data);
  }
  return null;
}
