@Tags(['slow'])
library;

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_page_sync.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../../helpers/message_realtime_test_helpers.dart';
import '../../../../helpers/noop_guild_member_hydration_service.dart';
import '../../../../helpers/open_test_database.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Map<String, Object?> _messageJson({
  required String id,
  required String channelId,
  required String authorId,
  String? content,
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
  'content': content ?? 'message $id',
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

const MessagePersistSnapshot _acknowledgedGatewaySnapshot =
    MessagePersistSnapshot(
      mentionsCurrentUser: false,
      isDm: false,
      acknowledgedByGateway: true,
    );

void _setViewportActive(
  ProviderContainer container, {
  required String channelId,
  bool isActive = true,
}) {
  container
      .read(chatReadViewportProvider.notifier)
      .setViewportActive(channelId: channelId, isActive: isActive);
}

void _updateViewport(
  ProviderContainer container, {
  required bool nearLoadedTail,
  String channelId = 'channel-1',
  double distanceFromBottom = 0,
}) {
  final ChatViewState chat = container.read(chatViewModelProvider);
  container
      .read(chatReadViewportProvider.notifier)
      .updateViewport(
        channelId: channelId,
        nearLoadedTail: nearLoadedTail,
        distanceFromBottom: distanceFromBottom,
        sampledTailId: chat.channelId == channelId
            ? newestServerBackedMessageId(chat.messages)
            : null,
      );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<
    (FluxerDatabase, _ChatAdapter, ProviderContainer, ChatViewModel, String)
  >
  setUpDetachedWindow() async {
    final db = openTestDatabase();
    final String olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 9));
    final String ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 10));
    final String firstUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 11));
    final String secondUnreadId = _snowflakeForUtc(
      DateTime.utc(2026, 5, 1, 12),
    );
    final String tailId = _snowflakeForUtc(DateTime.utc(2026, 5, 3, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(tailId),
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
      initialMessages: <Map<String, Object?>>[
        _messageJson(id: tailId, channelId: 'channel-1', authorId: 'other'),
      ],
      aroundMessages: <Map<String, Object?>>[
        _messageJson(
          id: secondUnreadId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
        _messageJson(
          id: firstUnreadId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: olderId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    _setViewportActive(container, channelId: 'channel-1');
    await _flushAsync();
    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isTrue);

    return (db, adapter, container, notifier, ackId);
  }

  test(
    'an around window whose pointer equals its tail acks and allows trimming',
    () async {
      final db = openTestDatabase();
      const int total = 250;
      final List<String> ids = <String>[
        for (int i = 0; i < total; i++)
          _snowflakeForUtc(
            DateTime.utc(2026, 5, 1, 9).add(Duration(minutes: i)),
          ),
      ];
      final String newestId = ids.last;
      final String ackId = ids.first;

      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(newestId),
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
        initialMessages: <Map<String, Object?>>[
          _messageJson(id: newestId, channelId: 'channel-1', authorId: 'other'),
        ],
        aroundMessages: <Map<String, Object?>>[
          for (final String id in ids.reversed)
            _messageJson(id: id, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      _setViewportActive(container, channelId: 'channel-1');
      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      expect(
        container.read(chatViewModelProvider).hasMoreNewerMessages,
        isFalse,
        reason: 'a pointer equal to our fetched tail is treated as the tail',
      );

      expect(
        adapter.ackedMessageIds,
        contains(newestId),
        reason:
            'the channel must auto-ack with no button tap and no manual '
            'pagination; a bogus hasMoreNewerMessages blocks ack indefinitely',
      );

      expect(
        container.read(chatViewModelProvider).messages.length,
        greaterThan(kMaxLoadedMessages),
        reason: 'the window must exceed the cap for trimming to be meaningful',
      );
      notifier.trimToNewestWindow();
      expect(
        container.read(chatViewModelProvider).messages,
        hasLength(kTrimmedMessageWindowSize),
        reason:
            'newest-window trimming must be permitted; a bogus '
            'hasMoreNewerMessages leaves the window unbounded',
      );
    },
  );

  test(
    'a relationship change recounts mentions when the window covers the ack',
    () async {
      final db = openTestDatabase();
      final String ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final String mentionId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(mentionId),
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
        initialMessages: <Map<String, Object?>>[
          <String, Object?>{
            ..._messageJson(
              id: mentionId,
              channelId: 'channel-1',
              authorId: 'spammer',
            ),
            'mentions': <Object?>[
              <String, Object?>{
                'id': 'me',
                'username': 'user-me',
                'discriminator': '0001',
                'global_name': null,
                'avatar': null,
                'avatar_color': null,
                'flags': 0,
              },
            ],
          },
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);
      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      expect(
        (await db.readStateDao.getReadState('channel-1'))?.mentionCount,
        1,
      );

      await db.relationshipDao.upsertRelationships([
        RelationshipsCompanion.insert(userId: 'spammer', type: 2),
      ]);
      await notifier.recomputeMentionsAfterRelationshipChange();

      expect(
        (await db.readStateDao.getReadState('channel-1'))?.mentionCount,
        0,
      );
    },
  );

  test('a relationship change keeps the server mention count when the ack is '
      'older than the loaded window', () async {
    final db = openTestDatabase();
    final String ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 9));
    final List<String> ids = <String>[
      for (int i = 0; i < 120; i++)
        _snowflakeForUtc(DateTime.utc(2026, 5, 6, 9).add(Duration(minutes: i))),
    ];
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(ids.last),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(ackId),
        mentionCount: const Value(3),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: <Map<String, Object?>>[
        for (final String id in ids.reversed)
          _messageJson(id: id, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);
    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    expect(container.read(chatViewModelProvider).hasMoreMessages, isTrue);

    await notifier.recomputeMentionsAfterRelationshipChange();

    expect((await db.readStateDao.getReadState('channel-1'))?.mentionCount, 3);
  });

  test(
    'a relationship change leaves a channel that is not open alone',
    () async {
      final db = openTestDatabase();
      final String ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(3),
        ),
      );
      final container = _container(db, _ChatAdapter());
      addTearDown(container.dispose);

      await container
          .read(chatViewModelProvider.notifier)
          .recomputeMentionsAfterRelationshipChange();

      expect(
        (await db.readStateDao.getReadState('channel-1'))?.mentionCount,
        3,
      );
    },
  );

  test(
    'switchChannel honors loadMessages false when target is provided',
    () async {
      final db = openTestDatabase();
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
    final db = openTestDatabase();
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
    final db = openTestDatabase();
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
    _setViewportActive(container, channelId: 'channel-1');
    await _flushAsync();

    expect(adapter.ackedMessageIds, isEmpty);
    adapter.releaseMessageFetch();
    await load;
  });

  test(
    'cache refresh shows cached messages while syncing from network',
    () async {
      final db = openTestDatabase();
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
      expect(state.messages, hasLength(1));
      expect(state.messages.first.id, cachedId);
      expect(adapter.messageRequestUris, isNotEmpty);

      adapter.releaseMessageFetch();
      await _flushAsync();
      final synced = container.read(chatViewModelProvider);
      expect(synced.isSyncingMessages, isFalse);
      expect(synced.messages, hasLength(1));
      expect(synced.messages.first.id, networkId);
    },
  );

  test('a duplicate switch joins the running one instead of replacing the '
      'window again', () async {
    final db = openTestDatabase();
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
      initialMessages: <Map<String, Object?>>[
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
      ],
    )..holdMessageFetch = true;
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    final Future<void> first = notifier.switchChannel('channel-1');
    await _flushAsync();
    final int epochAfterFirst = container
        .read(chatViewModelProvider)
        .windowEpoch;

    final Future<void> second = notifier.switchChannel('channel-1');
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).windowEpoch,
      epochAfterFirst,
      reason: 'the running switch owns the window',
    );

    adapter.releaseMessageFetch();
    await Future.wait(<Future<void>>[first, second]);
    await _flushAsync();

    expect(container.read(chatViewModelProvider).messages.map((m) => m.id), [
      latestId,
    ]);
  });

  test(
    'auto ack does not run while cache-first messages are loading',
    () async {
      final db = openTestDatabase();
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
      _setViewportActive(container, channelId: 'channel-1');
      await _flushAsync();

      expect(adapter.ackedMessageIds, isEmpty);
      expect(container.read(chatViewModelProvider).isLoading, isFalse);
      expect(container.read(chatViewModelProvider).isSyncingMessages, isTrue);
      adapter.releaseMessageFetch();
      await _flushAsync();
      expect(container.read(chatViewModelProvider).isSyncingMessages, isFalse);
    },
  );

  test('unread channel skips cache-first and shows loading spinner', () async {
    final db = openTestDatabase();
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
    final db = openTestDatabase();
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
    for (var i = 0; i < 20; i++) {
      await _flushAsync();
      final state = container.read(chatViewModelProvider);
      if (state.channelId == 'channel-1' && state.isLoading) {
        expect(state.isSyncingMessages, isFalse);
        expect(state.messages, isEmpty);
        adapter.releaseMessageFetch();
        await load;
        for (var j = 0; j < 20; j++) {
          await _flushAsync();
          if (!container.read(chatViewModelProvider).isLoading) {
            return;
          }
        }
        fail('expected channel load to finish');
      }
    }
    fail('expected loading state for unread channel');
  });

  test(
    'caught-up stale cache waits for the latest page instead of sealing the tail',
    () async {
      final db = openTestDatabase();
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
          lastMessageId: Value(latestId),
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
      final Future<void> load = notifier.switchChannel('channel-1');
      ChatViewState? loadingState;
      for (var i = 0; i < 20; i++) {
        await _flushAsync();
        final ChatViewState state = container.read(chatViewModelProvider);
        if (state.channelId == 'channel-1' && state.isLoading) {
          loadingState = state;
          expect(state.messages, isEmpty);
          adapter.releaseMessageFetch();
          await load;
          break;
        }
      }
      if (loadingState == null) {
        fail('expected loading before latest');
      }
      ChatViewState? settled;
      for (var i = 0; i < 20; i++) {
        await _flushAsync();
        final ChatViewState state = container.read(chatViewModelProvider);
        if (!state.isLoading && !state.isSyncingMessages) {
          settled = state;
          break;
        }
      }
      if (settled == null) {
        fail('expected latest window to settle');
      }
      expect(settled.messages.map((m) => m.id), [cachedId, latestId]);
      expect(settled.hasMoreNewerMessages, isFalse);
    },
  );

  test(
    'cache-first sync removes deleted messages from memory and drift',
    () async {
      final db = openTestDatabase();
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
      final loadingState = container.read(chatViewModelProvider);
      expect(loadingState.isLoading, isFalse);
      expect(loadingState.isSyncingMessages, isTrue);
      expect(loadingState.messages.map((m) => m.id), [
        anchorId,
        deletedId,
        keptId,
      ]);

      adapter.releaseMessageFetch();
      for (var i = 0; i < 30; i++) {
        await _flushAsync();
        final current = container.read(chatViewModelProvider);
        if (!current.isLoading && !current.isSyncingMessages) {
          break;
        }
      }

      final state = container.read(chatViewModelProvider);
      expect(state.isLoading, isFalse);
      expect(state.messages.map((m) => m.id), [anchorId, keptId]);
      expect(await db.messageDao.getMessage(deletedId), null);
      expect(await db.messageDao.getMessage(keptId), isNot(null));
    },
  );

  test(
    'sparse cache-first sync expands to full latest page after network refresh',
    () async {
      final db = openTestDatabase();
      final anchorId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
      final middleId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 11));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
      await db.messageDao.upsertMessages([
        _cachedMessage(id: latestId, channelId: 'channel-1', authorId: 'other'),
      ]);
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
          _messageJson(id: middleId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
        ],
      )..holdMessageFetch = true;
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      final sparseState = container.read(chatViewModelProvider);
      expect(sparseState.isLoading, isFalse);
      expect(sparseState.isSyncingMessages, isTrue);
      expect(sparseState.messages.map((m) => m.id), [latestId]);
      expect(sparseState.hasMoreMessages, isTrue);

      adapter.releaseMessageFetch();
      for (var i = 0; i < 30; i++) {
        await _flushAsync();
        final current = container.read(chatViewModelProvider);
        if (!current.isLoading && !current.isSyncingMessages) {
          break;
        }
      }

      final state = container.read(chatViewModelProvider);
      expect(state.isLoading, isFalse);
      expect(state.isSyncingMessages, isFalse);
      expect(state.messages.map((m) => m.id), [anchorId, middleId, latestId]);
      expect(state.hasMoreMessages, isFalse);
    },
  );

  test(
    'gateway recovery removes deleted message from already loaded channel',
    () async {
      final db = openTestDatabase();
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
        messagesByChannel: <String, List<Map<String, Object?>>>{
          'channel-1': <Map<String, Object?>>[
            _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
            _messageJson(
              id: deletedId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
            _messageJson(
              id: anchorId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
          ],
        },
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      expect(container.read(chatViewModelProvider).messages.map((m) => m.id), [
        anchorId,
        deletedId,
        keptId,
      ]);

      adapter.messagesByChannel['channel-1'] = <Map<String, Object?>>[
        _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
      ];
      container.read(gatewayFullRecoveryProvider.notifier).bump();
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.messages.map((m) => m.id), [anchorId, keptId]);
      expect(await db.messageDao.getMessage(deletedId), null);
    },
  );

  test('RESUMED keeps the open channel without a REST refetch, the gateway '
      'replays the missed events', () async {
    final db = openTestDatabase();
    final anchorId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
    final keptId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
    await db.messageDao.upsertMessages([
      _cachedMessage(id: anchorId, channelId: 'channel-1', authorId: 'other'),
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
      messagesByChannel: <String, List<Map<String, Object?>>>{
        'channel-1': <Map<String, Object?>>[
          _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
        ],
      },
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    final int requestsBeforeResume = adapter.messageRequestUris.length;

    container.read(gatewaySessionRecoveryProvider.notifier).bump();
    await _flushAsync();

    expect(adapter.messageRequestUris, hasLength(requestsBeforeResume));
    expect(container.read(chatViewModelProvider).messages.map((m) => m.id), [
      anchorId,
      keptId,
    ]);
  });

  test(
    'switchChannel reconciles stale same-channel window after recovery',
    () async {
      final db = openTestDatabase();
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
        messagesByChannel: <String, List<Map<String, Object?>>>{
          'channel-1': <Map<String, Object?>>[
            _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
            _messageJson(
              id: deletedId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
            _messageJson(
              id: anchorId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
          ],
        },
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      expect(container.read(chatViewModelProvider).messages.map((m) => m.id), [
        anchorId,
        deletedId,
        keptId,
      ]);

      adapter.messagesByChannel['channel-1'] = <Map<String, Object?>>[
        _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
      ];
      await db.messageDao.upsertMessage(
        _cachedMessage(
          id: deletedId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
      );
      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
              MessageCreateEvent(
                message: MessageResponseSchema.fromJson(
                  _messageJson(
                    id: deletedId,
                    channelId: 'channel-1',
                    authorId: 'other',
                  ),
                ),
              ),
            ),
          );
      await _flushAsync();
      expect(container.read(chatViewModelProvider).messages.map((m) => m.id), [
        anchorId,
        deletedId,
        keptId,
      ]);

      container.read(gatewayFullRecoveryProvider.notifier).bump();
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      expect(container.read(chatViewModelProvider).messages.map((m) => m.id), [
        anchorId,
        keptId,
      ]);
      expect(await db.messageDao.getMessage(deletedId), null);
    },
  );

  test('cache-first sync applies offline edits after reconcile', () async {
    final db = openTestDatabase();
    final anchorId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
    final editedId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 11));
    final keptId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
    await db.messageDao.upsertMessages([
      _cachedMessage(id: anchorId, channelId: 'channel-1', authorId: 'other'),
      MessagesCompanion.insert(
        id: editedId,
        channelId: 'channel-1',
        authorId: 'other',
        content: 'old content',
        timestamp: dateTimeFromUserSnowflakeOrNull(editedId)!,
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
        _messageJson(
          id: editedId,
          channelId: 'channel-1',
          authorId: 'other',
          content: 'edited content',
        ),
        _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
      ],
    )..holdMessageFetch = true;
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    final loadingState = container.read(chatViewModelProvider);
    expect(loadingState.isLoading, isFalse);
    expect(loadingState.isSyncingMessages, isTrue);
    expect(loadingState.messages, hasLength(3));
    expect(
      loadingState.messages
          .firstWhere((message) => message.id == editedId)
          .content,
      'old content',
    );

    adapter.releaseMessageFetch();
    for (var i = 0; i < 30; i++) {
      await _flushAsync();
      final current = container.read(chatViewModelProvider);
      if (!current.isLoading && !current.isSyncingMessages) {
        break;
      }
    }

    final edited = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((message) => message.id == editedId);
    expect(edited.content, 'edited content');
  });

  test(
    'loadMore uses network after gateway recovery instead of stale cache',
    () async {
      final db = openTestDatabase();
      final olderOlderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 8));
      final olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 9));
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 10));
      final firstUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 11));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 12));
      await db.messageDao.upsertMessages([
        _cachedMessage(
          id: olderOlderId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
        _cachedMessage(id: olderId, channelId: 'channel-1', authorId: 'other'),
        _cachedMessage(id: ackId, channelId: 'channel-1', authorId: 'other'),
        _cachedMessage(
          id: firstUnreadId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
        _cachedMessage(id: latestId, channelId: 'channel-1', authorId: 'other'),
      ]);
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
        ],
        aroundMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(
            id: firstUnreadId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: olderId, channelId: 'channel-1', authorId: 'other'),
        ],
        messagesBefore: [
          _messageJson(
            id: olderOlderId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      adapter.beforeQueries.clear();
      container.read(gatewayFullRecoveryProvider.notifier).bump();
      await _flushAsync();

      await notifier.loadMore();
      await _flushAsync();

      expect(adapter.beforeQueries, [olderId]);
    },
  );

  test('gateway bump forces channel refresh even within ttl window', () async {
    final db = openTestDatabase();
    final anchorId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
    final keptId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
    final channel2MessageId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 13));
    await db.messageDao.upsertMessages([
      _cachedMessage(id: anchorId, channelId: 'channel-1', authorId: 'other'),
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
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-2',
        guildId: 'guild-1',
        name: 'other',
        lastMessageId: Value(channel2MessageId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(keptId),
        mentionCount: const Value(0),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-2'),
        lastMessageId: Value(channel2MessageId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      messagesByChannel: <String, List<Map<String, Object?>>>{
        'channel-1': <Map<String, Object?>>[
          _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
        ],
        'channel-2': <Map<String, Object?>>[
          _messageJson(
            id: channel2MessageId,
            channelId: 'channel-2',
            authorId: 'other',
          ),
        ],
      },
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    expect(container.read(chatViewModelProvider).messages, isNotEmpty);

    await notifier.switchChannel('channel-2');
    await _flushAsync();
    container.read(gatewayFullRecoveryProvider.notifier).bump();
    await notifier.switchChannel('channel-1');
    for (var i = 0; i < 30; i++) {
      await _flushAsync();
      final current = container.read(chatViewModelProvider);
      if (!current.isLoading && !current.isSyncingMessages) {
        break;
      }
    }

    final state = container.read(chatViewModelProvider);
    expect(state.isSyncingMessages, isFalse);
    expect(state.messages.map((message) => message.id), [anchorId, keptId]);
    expect(adapter.messageRequestUris.length, greaterThanOrEqualTo(2));
  });

  test(
    'failed cache-first sync surfaces an error instead of stale cache',
    () async {
      final db = openTestDatabase();
      final anchorId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
      final keptId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
      await db.messageDao.upsertMessages([
        _cachedMessage(id: anchorId, channelId: 'channel-1', authorId: 'other'),
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
      )..failMessageFetch = true;
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      for (var i = 0; i < 30; i++) {
        await _flushAsync();
        final current = container.read(chatViewModelProvider);
        if (!current.isLoading && !current.isSyncingMessages) {
          break;
        }
      }

      final state = container.read(chatViewModelProvider);
      expect(state.messages, hasLength(2));
      expect(state.messageLoadFailed, isFalse);
      expect(state.errorMessage, 'Failed to sync messages');
    },
  );

  group('transient message sync failures', () {
    Future<
      ({
        FluxerDatabase db,
        _ChatAdapter adapter,
        String anchorId,
        String keptId,
      })
    >
    cachedChannel() async {
      final db = openTestDatabase();
      final anchorId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
      final keptId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
      await db.messageDao.upsertMessages([
        _cachedMessage(id: anchorId, channelId: 'channel-1', authorId: 'other'),
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
      );
      return (db: db, adapter: adapter, anchorId: anchorId, keptId: keptId);
    }

    Future<void> settle(ProviderContainer container) async {
      for (var i = 0; i < 30; i++) {
        await _flushAsync();
        final current = container.read(chatViewModelProvider);
        if (!current.isLoading && !current.isSyncingMessages) {
          return;
        }
      }
    }

    Future<void> settleAfterFailure(
      ProviderContainer container,
      _ChatAdapter adapter,
    ) async {
      while (adapter.transientMessageFetchFailures > 0 ||
          container.read(chatViewModelProvider).isSyncingMessages) {
        await pumpEventQueue();
      }
    }

    Future<void> waitForRequests(_ChatAdapter adapter, int count) async {
      for (
        var i = 0;
        i < 60 && adapter.messageRequestUris.length < count;
        i++
      ) {
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
    }

    test('keeps the cached window without a toast and retries', () async {
      final fixture = await cachedChannel();
      fixture.adapter.transientMessageFetchFailures = 1;
      final container = _container(fixture.db, fixture.adapter);
      addTearDown(container.dispose);

      await container
          .read(chatViewModelProvider.notifier)
          .switchChannel('channel-1');
      await settleAfterFailure(container, fixture.adapter);

      final afterFailure = container.read(chatViewModelProvider);
      expect(afterFailure.messages, hasLength(2));
      expect(afterFailure.messageLoadFailed, isFalse);
      expect(afterFailure.errorMessage, null);
      final int requestsAfterFailure =
          fixture.adapter.messageRequestUris.length;

      await waitForRequests(fixture.adapter, requestsAfterFailure + 1);
      await settle(container);

      final recovered = container.read(chatViewModelProvider);
      expect(
        fixture.adapter.messageRequestUris,
        hasLength(requestsAfterFailure + 1),
      );
      expect(recovered.errorMessage, null);
      expect(recovered.messages.map((message) => message.id), [
        fixture.anchorId,
        fixture.keptId,
      ]);
    });

    test('re-runs immediately when the gateway session recovers', () async {
      final fixture = await cachedChannel();
      fixture.adapter.transientMessageFetchFailures = 1;
      final container = _container(fixture.db, fixture.adapter);
      addTearDown(container.dispose);

      await container
          .read(chatViewModelProvider.notifier)
          .switchChannel('channel-1');
      await settleAfterFailure(container, fixture.adapter);
      final int requestsAfterFailure =
          fixture.adapter.messageRequestUris.length;

      container.read(gatewaySessionRecoveryProvider.notifier).bump();
      await settle(container);

      expect(
        fixture.adapter.messageRequestUris,
        hasLength(requestsAfterFailure + 1),
      );
      expect(container.read(chatViewModelProvider).errorMessage, null);
    });

    test('an empty channel recovers on its own after the retry', () async {
      final db = openTestDatabase();
      final messageId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(
            id: messageId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
      )..transientMessageFetchFailures = 1;
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      await container
          .read(chatViewModelProvider.notifier)
          .switchChannel('channel-1');
      expect(container.read(chatViewModelProvider).messageLoadFailed, isTrue);
      expect(container.read(chatViewModelProvider).errorMessage, null);

      await waitForRequests(adapter, 2);
      await settle(container);

      final recovered = container.read(chatViewModelProvider);
      expect(recovered.messageLoadFailed, isFalse);
      expect(recovered.messages.map((message) => message.id), [messageId]);
    });
  });

  test(
    'app foreground resume removes deleted message from open channel',
    () async {
      final db = openTestDatabase();
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
        messagesByChannel: <String, List<Map<String, Object?>>>{
          'channel-1': <Map<String, Object?>>[
            _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
            _messageJson(
              id: deletedId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
            _messageJson(
              id: anchorId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
          ],
        },
      );
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = adapter;
      final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
      final container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          fluxerDioProvider.overrideWithValue(dio),
          fluxerClientProvider.overrideWithValue(client),
          currentUserIdProvider.overrideWithValue('me'),
          ackBatcherProvider.overrideWith((ref) {
            final batcher = AckBatcher(
              client: client,
              batchDelay: Duration.zero,
            );
            ref.onDispose(() {
              unawaited(batcher.dispose());
            });
            return batcher;
          }),
          guildMemberHydrationServiceProvider.overrideWithValue(
            NoopGuildMemberHydrationService(database: db),
          ),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      expect(container.read(chatViewModelProvider).messages.map((m) => m.id), [
        anchorId,
        deletedId,
        keptId,
      ]);

      adapter.messagesByChannel['channel-1'] = <Map<String, Object?>>[
        _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
      ];
      container.read(appUiForegroundProvider.notifier).setResumed(false);
      container.read(appUiForegroundProvider.notifier).setResumed(true);
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.messages.map((m) => m.id), [anchorId, keptId]);
      expect(await db.messageDao.getMessage(deletedId), null);
    },
  );

  // Tail deletes made while the app was closed are never replayed: https://feedback.fluxer.com/p/1863
  test(
    'first open of a fully cached channel fetches the latest page',
    () async {
      final db = openTestDatabase();
      final List<String> liveIds = <String>[
        for (int minute = 0; minute < 50; minute++)
          _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10, minute)),
      ];
      final String deletedTailId = _snowflakeForUtc(
        DateTime.utc(2026, 5, 16, 10, 50),
      );
      final String channel2MessageId = _snowflakeForUtc(
        DateTime.utc(2026, 5, 16, 11),
      );
      await db.messageDao.upsertMessages([
        for (final String id in <String>[...liveIds, deletedTailId])
          _cachedMessage(id: id, channelId: 'channel-1', authorId: 'other'),
        _cachedMessage(
          id: channel2MessageId,
          channelId: 'channel-2',
          authorId: 'other',
        ),
      ]);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(deletedTailId),
        ),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-2',
          guildId: 'guild-1',
          name: 'other',
          lastMessageId: Value(channel2MessageId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(deletedTailId),
          mentionCount: const Value(0),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-2'),
          lastMessageId: Value(channel2MessageId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        messagesByChannel: <String, List<Map<String, Object?>>>{
          'channel-1': <Map<String, Object?>>[
            for (final String id in liveIds.reversed)
              _messageJson(id: id, channelId: 'channel-1', authorId: 'other'),
          ],
          'channel-2': <Map<String, Object?>>[
            _messageJson(
              id: channel2MessageId,
              channelId: 'channel-2',
              authorId: 'other',
            ),
          ],
        },
      );
      int anchorlessRequests(String channelId) => adapter.messageRequestUris
          .where(
            (Uri uri) =>
                uri.path.endsWith('/channels/$channelId/messages') &&
                uri.queryParameters['around'] == null &&
                uri.queryParameters['before'] == null &&
                uri.queryParameters['after'] == null,
          )
          .length;
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.messages.map((m) => m.id), liveIds);
      expect(await db.messageDao.getMessage(deletedTailId), null);
      expect(adapter.aroundQueries, isEmpty);
      expect(anchorlessRequests('channel-1'), 1);

      await notifier.switchChannel('channel-2');
      await _flushAsync();
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      expect(anchorlessRequests('channel-1'), 1);
    },
  );

  test('app foreground resume near tail loads newer messages', () async {
    final db = openTestDatabase();
    final anchorId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
    final keptId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
    final newId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 13));
    await db.messageDao.upsertMessages([
      _cachedMessage(id: anchorId, channelId: 'channel-1', authorId: 'other'),
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
      messagesByChannel: <String, List<Map<String, Object?>>>{
        'channel-1': <Map<String, Object?>>[
          _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
        ],
      },
    );
    final container = _container(db, adapter, overrideForeground: false);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    _setViewportActive(container, channelId: 'channel-1');
    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();

    adapter.messagesByChannel['channel-1'] = <Map<String, Object?>>[
      _messageJson(id: newId, channelId: 'channel-1', authorId: 'other'),
      _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
      _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
    ];
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(newId),
      ),
    );
    container.read(appUiForegroundProvider.notifier).setResumed(false);
    container.read(appUiForegroundProvider.notifier).setResumed(true);
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.messages.map((m) => m.id), [anchorId, keptId, newId]);
    expect(state.hasMoreNewerMessages, isFalse);
  });

  test(
    'app foreground resume while scrolled up marks newer messages',
    () async {
      final db = openTestDatabase();
      final anchorId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
      final keptId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
      final newId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 13));
      await db.messageDao.upsertMessages([
        _cachedMessage(id: anchorId, channelId: 'channel-1', authorId: 'other'),
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
        messagesByChannel: <String, List<Map<String, Object?>>>{
          'channel-1': <Map<String, Object?>>[
            _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
            _messageJson(
              id: anchorId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
          ],
        },
      );
      final container = _container(db, adapter, overrideForeground: false);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      _setViewportActive(container, channelId: 'channel-1');
      _updateViewport(container, nearLoadedTail: false);
      await _flushAsync();

      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(newId),
        ),
      );
      await db.messageDao.upsertMessages([
        _cachedMessage(id: newId, channelId: 'channel-1', authorId: 'other'),
      ]);
      adapter.messagesByChannel['channel-1']!.insert(
        0,
        _messageJson(id: newId, channelId: 'channel-1', authorId: 'other'),
      );
      container.read(appUiForegroundProvider.notifier).setResumed(false);
      container.read(appUiForegroundProvider.notifier).setResumed(true);
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.messages.map((m) => m.id), [anchorId, keptId]);
      expect(state.hasMoreNewerMessages, isTrue);
    },
  );

  test(
    'session recovery resync runs after in-flight foreground reconcile',
    () async {
      final db = openTestDatabase();
      final anchorId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 10));
      final keptId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 12));
      final newId = _snowflakeForUtc(DateTime.utc(2026, 5, 16, 13));
      await db.messageDao.upsertMessages([
        _cachedMessage(id: anchorId, channelId: 'channel-1', authorId: 'other'),
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
        messagesByChannel: <String, List<Map<String, Object?>>>{
          'channel-1': <Map<String, Object?>>[
            _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
            _messageJson(
              id: anchorId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
          ],
        },
      );
      final container = _container(db, adapter, overrideForeground: false);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      _setViewportActive(container, channelId: 'channel-1');
      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();
      adapter.holdMessageFetch = true;

      container.read(appUiForegroundProvider.notifier).setResumed(false);
      container.read(appUiForegroundProvider.notifier).setResumed(true);
      await _flushAsync();
      expect(container.read(chatViewModelProvider).isSyncingMessages, isTrue);

      adapter.messagesByChannel['channel-1'] = <Map<String, Object?>>[
        _messageJson(id: newId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: keptId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: anchorId, channelId: 'channel-1', authorId: 'other'),
      ];
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(newId),
        ),
      );
      container.read(gatewayFullRecoveryProvider.notifier).bump();
      await _flushAsync();

      adapter.releaseMessageFetch();
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.messages.map((m) => m.id), [anchorId, keptId, newId]);
      expect(state.isSyncingMessages, isFalse);
    },
  );

  test('cache miss keeps loading state until network returns', () async {
    final db = openTestDatabase();
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

  test(
    'superseded same-channel switch does not strand empty channel',
    () async {
      final db = openTestDatabase();
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
      final Future<void> firstLoad = notifier.switchChannel('channel-1');
      await _flushAsync();

      final ChatViewState loadingState = container.read(chatViewModelProvider);
      expect(loadingState.channelId, 'channel-1');
      expect(loadingState.isLoading, isTrue);
      expect(loadingState.messages, isEmpty);

      final Future<void> secondLoad = notifier.switchChannel('channel-1');
      await _flushAsync();

      final ChatViewState supersededState = container.read(
        chatViewModelProvider,
      );
      expect(supersededState.channelId, 'channel-1');
      expect(
        supersededState.isLoading || supersededState.messages.isNotEmpty,
        isTrue,
        reason: 'must not strand empty idle channel during supersede',
      );

      adapter.releaseMessageFetch();
      await Future.wait(<Future<void>>[firstLoad, secondLoad]);
      await _flushAsync();

      final ChatViewState loadedState = container.read(chatViewModelProvider);
      expect(loadedState.isLoading, isFalse);
      expect(loadedState.messages, isNotEmpty);
      expect(loadedState.messages.last.id, latestId);
    },
  );

  test('stale channel fetch does not overwrite active channel state', () async {
    final db = openTestDatabase();
    final channel1CachedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
    final channel1NetworkId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final channel2MessageId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 20));
    await db.messageDao.upsertMessages([
      _cachedMessage(
        id: channel1CachedId,
        channelId: 'channel-1',
        authorId: 'other',
      ),
      _cachedMessage(
        id: channel2MessageId,
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
        lastMessageId: Value(channel2MessageId),
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
        lastMessageId: Value(channel2MessageId),
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
            id: channel2MessageId,
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
    expect(container.read(chatViewModelProvider).messages.map((m) => m.id), [
      channel2MessageId,
    ]);
    expect(container.read(chatViewModelProvider).isSyncingMessages, isTrue);

    adapter.releaseMessageFetch();
    for (var i = 0; i < 30; i++) {
      await _flushAsync();
      final current = container.read(chatViewModelProvider);
      if (!current.isLoading && !current.isSyncingMessages) {
        break;
      }
    }

    final state = container.read(chatViewModelProvider);
    expect(state.channelId, 'channel-2');
    expect(state.messages.last.id, channel2MessageId);
    expect(state.messages.any((m) => m.id == channel1NetworkId), isFalse);
  });

  test(
    'opening unread channel fetches around ack and sets sticky divider without auto-scrolling',
    () async {
      final db = openTestDatabase();
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
      await notifier.switchChannel('channel-1');
      _setViewportActive(container, channelId: 'channel-1');
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
      expect(adapter.aroundQueries, [ackId]);
      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, ackId);
      expect(adapter.ackedMessageIds, isEmpty);
    },
  );

  test('auto ack preserves sticky unread divider after ack advances', () async {
    final db = openTestDatabase();
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
    _setViewportActive(container, channelId: 'channel-1');
    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, latestId);
    expect(
      container.read(chatViewModelProvider).stickyUnreadMessageId,
      unreadId,
    );
  });

  test('server ack echo does not clear sticky unread divider', () async {
    final db = openTestDatabase();
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

    notifier.applyExternalAck('channel-1', manual: false);
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).stickyUnreadMessageId,
      unreadId,
    );
  });

  test('manual external ack clears sticky unread divider', () async {
    final db = openTestDatabase();
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

    notifier.applyExternalAck('channel-1', manual: true);
    await _flushAsync();

    expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);
  });

  test(
    'auto ack does not preserve sticky unread divider for own messages',
    () async {
      final db = openTestDatabase();
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
      _setViewportActive(container, channelId: 'channel-1');
      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, ownId);
      expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);
    },
  );

  Future<
    ({FluxerDatabase db, ProviderContainer container, _ChatAdapter adapter})
  >
  openReadChannelAtTail(String tailId) async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(tailId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(tailId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: <Map<String, Object?>>[
        _messageJson(id: tailId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);
    await container
        .read(chatViewModelProvider.notifier)
        .switchChannel('channel-1');
    _setViewportActive(container, channelId: 'channel-1');
    await _flushAsync();
    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    await container
        .read(chatViewModelProvider.notifier)
        .flushScheduledReadAckRetryForTest();
    await _flushAsync();
    expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);
    return (db: db, container: container, adapter: adapter);
  }

  void emitLiveMessage(ProviderContainer container, String id) {
    container
        .read(messageRealtimeBusProvider)
        .emit(
          testMessageCreated(
            MessageCreateEvent(
              message: MessageResponseSchema.fromJson(
                _messageJson(id: id, channelId: 'channel-1', authorId: 'other'),
              ),
            ),
          ),
        );
  }

  test('returning to the tail after messages arrived while scrolled away sets '
      'the sticky divider on the first of them', () async {
    final String tailId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final String firstAwayId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final String secondAwayId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
    final opened = await openReadChannelAtTail(tailId);
    final ProviderContainer container = opened.container;

    _updateViewport(container, nearLoadedTail: false, distanceFromBottom: 4000);
    await _flushAsync();
    emitLiveMessage(container, firstAwayId);
    emitLiveMessage(container, secondAwayId);
    await _flushAsync();
    expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);

    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    await container
        .read(chatViewModelProvider.notifier)
        .flushScheduledReadAckRetryForTest();
    await _flushAsync();

    final readState = await opened.db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, secondAwayId);
    expect(
      container.read(chatViewModelProvider).stickyUnreadMessageId,
      firstAwayId,
    );
  });

  test('leaving the tail while a tail ack is in flight keeps the snapshot '
      'for the return', () async {
    final String tailId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final String liveId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final String awayId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
    final opened = await openReadChannelAtTail(tailId);
    final ProviderContainer container = opened.container;
    final notifier = container.read(chatViewModelProvider.notifier);

    emitLiveMessage(container, liveId);
    await _flushAsync();
    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();

    final Future<void> inFlight = notifier.flushScheduledReadAckRetryForTest();
    _updateViewport(container, nearLoadedTail: false, distanceFromBottom: 4000);
    await inFlight;
    await _flushAsync();
    expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);

    emitLiveMessage(container, awayId);
    await _flushAsync();
    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    await notifier.flushScheduledReadAckRetryForTest();
    await _flushAsync();

    final readState = await opened.db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, awayId);
    expect(container.read(chatViewModelProvider).stickyUnreadMessageId, awayId);
  });

  test('a message acked at the tail without leaving it sets no sticky '
      'divider', () async {
    final String tailId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final String liveId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final opened = await openReadChannelAtTail(tailId);
    final ProviderContainer container = opened.container;

    emitLiveMessage(container, liveId);
    await _flushAsync();
    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    await container
        .read(chatViewModelProvider.notifier)
        .flushScheduledReadAckRetryForTest();
    await _flushAsync();

    final readState = await opened.db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, liveId);
    expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);
  });

  test('unread channel loads a page around the ack', () async {
    final db = openTestDatabase();
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
        _messageJson(id: boundaryId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    _setViewportActive(container, channelId: 'channel-1');
    await _flushAsync();

    expect(adapter.aroundQueries, [ackId]);
    expect(adapter.afterQueries, isEmpty);
    final state = container.read(chatViewModelProvider);
    expect(state.messages.map((message) => message.id), [
      ackId,
      boundaryId,
      latestId,
    ]);
    expect(state.stickyUnreadMessageId, boundaryId);
    expect(state.hasMoreNewerMessages, isFalse);
  });

  test('unread channel with large gap fetches around the ack', () async {
    final db = openTestDatabase();
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

    expect(adapter.aroundQueries, [ackId]);
    expect(adapter.afterQueries, isEmpty);
    final state = container.read(chatViewModelProvider);
    expect(state.messages.map((message) => message.id), [latestId]);
    expect(state.hasMoreNewerMessages, isFalse);
  });

  test(
    'deep unread open loads around ack window and preserves older pagination',
    () async {
      final db = openTestDatabase();
      final olderOlderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 8));
      final olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 9));
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 10));
      final firstUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 11));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 12));
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
        ],
        aroundMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(
            id: firstUnreadId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: olderId, channelId: 'channel-1', authorId: 'other'),
        ],
        messagesBefore: [
          _messageJson(
            id: olderOlderId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      expect(adapter.aroundQueries, [ackId]);
      expect(adapter.afterQueries, isEmpty);
      var state = container.read(chatViewModelProvider);
      expect(state.messages.map((message) => message.id), [
        olderId,
        ackId,
        firstUnreadId,
        latestId,
      ]);
      expect(state.stickyUnreadMessageId, firstUnreadId);
      expect(state.hasMoreMessages, isTrue);
      expect(state.hasMoreNewerMessages, isFalse);

      await notifier.loadMore();
      await _flushAsync();

      expect(adapter.beforeQueries, [olderId]);
      state = container.read(chatViewModelProvider);
      expect(state.messages.map((message) => message.id), [
        olderOlderId,
        olderId,
        ackId,
        firstUnreadId,
        latestId,
      ]);
      expect(state.hasMoreMessages, isFalse);
    },
  );

  test('same-channel reveal round-trip keeps the loaded window without '
      'refetching', () async {
    final db = openTestDatabase();
    final olderOlderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 8));
    final olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 9));
    final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 10));
    final firstUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 11));
    final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 12));
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
      ],
      aroundMessages: [
        _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(
          id: firstUnreadId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: olderId, channelId: 'channel-1', authorId: 'other'),
      ],
      messagesBefore: [
        _messageJson(
          id: olderOlderId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    await notifier.loadMore();
    await _flushAsync();

    final expectedWindow = [
      olderOlderId,
      olderId,
      ackId,
      firstUnreadId,
      latestId,
    ];
    var state = container.read(chatViewModelProvider);
    expect(state.messages.map((message) => message.id), expectedWindow);
    final windowBeforeReveal = state.messages;
    final requestsBeforeReveal = adapter.messageRequestUris.length;

    await notifier.switchChannel('channel-1');
    await _flushAsync();

    state = container.read(chatViewModelProvider);
    expect(
      identical(state.messages, windowBeforeReveal),
      isTrue,
      reason: 'same-channel re-entry must not rebuild the message window',
    );
    expect(state.messages.map((message) => message.id), expectedWindow);
    expect(state.isLoading, isFalse);
    expect(state.isSyncingMessages, isFalse);
    expect(adapter.messageRequestUris.length, requestsBeforeReveal);
  });

  test(
    'channel change still loads fresh despite a loaded same-channel window',
    () async {
      final db = openTestDatabase();
      final olderOlderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 8));
      final olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 9));
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 10));
      final firstUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 11));
      final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 12));
      final channelTwoMessageId = _snowflakeForUtc(
        DateTime.utc(2026, 5, 2, 12),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(latestId),
        ),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-2',
          guildId: 'guild-1',
          name: 'other',
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
        ],
        messagesByChannel: <String, List<Map<String, Object?>>>{
          'channel-2': <Map<String, Object?>>[
            _messageJson(
              id: channelTwoMessageId,
              channelId: 'channel-2',
              authorId: 'other',
            ),
          ],
        },
        aroundMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(
            id: firstUnreadId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: olderId, channelId: 'channel-1', authorId: 'other'),
        ],
        messagesBefore: [
          _messageJson(
            id: olderOlderId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      await notifier.loadMore();
      await _flushAsync();

      var state = container.read(chatViewModelProvider);
      expect(state.messages.map((message) => message.id), [
        olderOlderId,
        olderId,
        ackId,
        firstUnreadId,
        latestId,
      ]);
      final requestsBeforeSwitch = adapter.messageRequestUris.length;

      await notifier.switchChannel('channel-2');
      await _flushAsync();

      state = container.read(chatViewModelProvider);
      expect(state.channelId, 'channel-2');
      expect(state.messages.map((message) => message.id), [
        channelTwoMessageId,
      ]);
      expect(state.isLoading, isFalse);
      expect(state.isSyncingMessages, isFalse);
      expect(
        adapter.messageRequestUris.length,
        greaterThan(requestsBeforeSwitch),
      );
      expect(adapter.messageRequestUris.last.path, contains('channel-2'));
    },
  );

  test(
    'deep unread open keeps newer tail unloaded when around page stops before latest',
    () async {
      final db = openTestDatabase();
      final olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 9));
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 10));
      final firstUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 11));
      final secondUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 12));
      final tailId = _snowflakeForUtc(DateTime.utc(2026, 5, 3, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(tailId),
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
          _messageJson(id: tailId, channelId: 'channel-1', authorId: 'other'),
        ],
        aroundMessages: [
          _messageJson(
            id: secondUnreadId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
          _messageJson(
            id: firstUnreadId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
          _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: olderId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      expect(adapter.aroundQueries, [ackId]);
      expect(adapter.afterQueries, isEmpty);
      final state = container.read(chatViewModelProvider);
      expect(state.messages.map((message) => message.id), [
        olderId,
        ackId,
        firstUnreadId,
        secondUnreadId,
      ]);
      expect(state.stickyUnreadMessageId, firstUnreadId);
      expect(state.hasMoreMessages, isTrue);
      expect(state.hasMoreNewerMessages, isTrue);
    },
  );

  test(
    'boundary fetch is skipped when ack is older than the loaded window',
    () async {
      final db = openTestDatabase();
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
      _setViewportActive(container, channelId: 'channel-1');
      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      expect(adapter.afterQueries, isEmpty);
      expect(
        container.read(chatViewModelProvider).messages.map((m) => m.id),
        isNot(contains(unreadId)),
      );
    },
  );

  test('detached window near its loaded edge never auto-acks', () async {
    final (db, adapter, container, _, ackId) = await setUpDetachedWindow();

    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, ackId);
    expect(adapter.ackedMessageIds, isEmpty);
    expect(adapter.ackAttempts, 0);
  });

  test('active viewport is ineligible while newer messages remain', () async {
    final (_, adapter, container, _, _) = await setUpDetachedWindow();

    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();

    final viewport = container.read(chatReadViewportProvider);
    expect(viewport.nearLoadedTail, isTrue);
    expect(
      isAutoAckEligible(
        viewport: viewport,
        channelId: 'channel-1',
        hasMoreNewerMessages: container
            .read(chatViewModelProvider)
            .hasMoreNewerMessages,
        currentTailId: newestServerBackedMessageId(
          container.read(chatViewModelProvider).messages,
        ),
      ),
      isFalse,
    );
    expect(adapter.ackedMessageIds, isEmpty);
  });

  test('reaching the live tail rechecks unchanged viewport geometry', () async {
    final (db, adapter, container, notifier, _) = await setUpDetachedWindow();
    final String tailId = adapter.initialMessages.single['id']! as String;

    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    expect(adapter.ackedMessageIds, isEmpty);

    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    expect(adapter.ackedMessageIds, isEmpty);

    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, tailId);
    expect(adapter.ackedMessageIds, [tailId]);
    expect(adapter.ackAttempts, 1);
  });

  test('terminal newer page does not ack on a stale near-tail claim', () async {
    final db = openTestDatabase();
    final String olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 9));
    final String ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 10));
    final String firstUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 1, 11));
    final String secondUnreadId = _snowflakeForUtc(
      DateTime.utc(2026, 5, 1, 12),
    );
    final String tailId = _snowflakeForUtc(DateTime.utc(2026, 5, 3, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(tailId),
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
      initialMessages: <Map<String, Object?>>[
        _messageJson(id: tailId, channelId: 'channel-1', authorId: 'other'),
      ],
      aroundMessages: <Map<String, Object?>>[
        _messageJson(
          id: secondUnreadId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
        _messageJson(
          id: firstUnreadId,
          channelId: 'channel-1',
          authorId: 'other',
        ),
        _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: olderId, channelId: 'channel-1', authorId: 'other'),
      ],
      messagesAfterAck: <Map<String, Object?>>[
        _messageJson(id: tailId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);
    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    _setViewportActive(container, channelId: 'channel-1');
    await _flushAsync();
    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isTrue);

    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    expect(adapter.ackedMessageIds, isEmpty);

    await notifier.loadNewer();
    await _flushAsync();
    final state = container.read(chatViewModelProvider);
    expect(state.hasMoreNewerMessages, isFalse);
    expect(state.messages.last.id, tailId);
    expect(
      adapter.ackedMessageIds,
      isEmpty,
      reason:
          'a near-tail claim measured against the pre-append window must '
          'not authorize acking the appended tail',
    );
    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, ackId);

    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    expect(adapter.ackedMessageIds, [tailId]);
  });

  test('a direct ack call rejects a token-less near-tail claim', () async {
    final db = openTestDatabase();
    final String priorId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final String tailId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(tailId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(priorId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: <Map<String, Object?>>[
        _messageJson(id: tailId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: priorId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);
    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    _setViewportActive(container, channelId: 'channel-1');
    await _flushAsync();

    container
        .read(chatReadViewportProvider.notifier)
        .updateViewport(
          channelId: 'channel-1',
          nearLoadedTail: true,
          distanceFromBottom: 0,
          sampledTailId: null,
        );
    await _flushAsync();
    await notifier.ackCurrentChannel();
    await _flushAsync();
    expect(adapter.ackAttempts, 0);
    expect(adapter.ackedMessageIds, isEmpty);
    var readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, priorId);

    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, tailId);
    expect(adapter.ackedMessageIds, [tailId]);
  });

  test(
    'a pointer ahead of the visible tail is acked without a probe (web parity)',
    () async {
      final db = openTestDatabase();
      final String priorId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final String tailId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final String racedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(tailId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(priorId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: <Map<String, Object?>>[
          _messageJson(id: tailId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: priorId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);
      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      _setViewportActive(container, channelId: 'channel-1');
      await _flushAsync();

      // Orphaned pointer past the loaded tail used to stay unread: https://feedback.fluxer.com/p/1909
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(racedId),
        ),
      );
      adapter.initialMessages.insert(
        0,
        _messageJson(id: racedId, channelId: 'channel-1', authorId: 'other'),
      );

      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, racedId);
      expect(adapter.ackedMessageIds, [racedId]);
    },
  );

  test(
    'viewport edge during a load acks only after post-install republication',
    () async {
      final db = openTestDatabase();
      final String priorId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final String latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
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
          lastMessageId: Value(priorId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: <Map<String, Object?>>[
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: priorId, channelId: 'channel-1', authorId: 'other'),
        ],
      )..holdMessageFetch = true;
      addTearDown(adapter.releaseMessageFetch);
      final container = _container(db, adapter);
      addTearDown(container.dispose);
      final notifier = container.read(chatViewModelProvider.notifier);

      final Future<void> switching = notifier.switchChannel('channel-1');
      await _flushAsync();
      expect(container.read(chatViewModelProvider).isLoading, isTrue);
      _setViewportActive(container, channelId: 'channel-1');
      await _flushAsync();
      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();
      expect(adapter.ackAttempts, 0);

      adapter.releaseMessageFetch();
      await switching;
      await _flushAsync();
      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, latestId);
      expect(adapter.ackedMessageIds, [latestId]);
      expect(adapter.ackAttempts, 1);
    },
  );

  test('auto-ack acks the newest loaded message id', () async {
    final db = openTestDatabase();
    final String priorId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final String visibleTailId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(visibleTailId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(priorId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: <Map<String, Object?>>[
        _messageJson(id: visibleTailId, channelId: 'channel-1', authorId: 'me'),
        _messageJson(id: priorId, channelId: 'channel-1', authorId: 'me'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    _setViewportActive(container, channelId: 'channel-1');
    await _flushAsync();
    final state = container.read(chatViewModelProvider);
    expect(state.hasMoreNewerMessages, isFalse);
    expect(state.messages.last.id, visibleTailId);

    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, state.messages.last.id);
    expect(adapter.ackedMessageIds, <String>[state.messages.last.id]);
  });

  test(
    'at-tail ack with orphaned channel pointer acks the pointer id',
    () async {
      final db = openTestDatabase();
      final String visibleTailId = _snowflakeForUtc(
        DateTime.utc(2026, 5, 6, 12),
      );
      final String orphanedPointer = _snowflakeForUtc(
        DateTime.utc(2026, 5, 6, 14),
      );
      final String priorAck = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(orphanedPointer),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(priorAck),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: <Map<String, Object?>>[
          _messageJson(
            id: visibleTailId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      _setViewportActive(container, channelId: 'channel-1');
      await _flushAsync();

      expect(await notifier.jumpToLatestMessages(), isTrue);
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.hasMoreNewerMessages, isFalse);
      expect(state.messages.last.id, visibleTailId);

      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, orphanedPointer);
      expect(adapter.ackedMessageIds, <String>[orphanedPointer]);
    },
  );

  test('not-at-tail with real newer history does not auto-ack', () async {
    final db = openTestDatabase();
    final List<String> historyIds = <String>[
      for (var i = 0; i < 50; i++)
        _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10, 0, i)),
    ];
    final String realNewerId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final String priorAck = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 9));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(realNewerId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(priorAck),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: [
        for (final String id in historyIds)
          _messageJson(id: id, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    _setViewportActive(container, channelId: 'channel-1');
    await _flushAsync();

    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isTrue);

    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, priorAck);
    expect(adapter.ackedMessageIds, isEmpty);
  });

  test('a tail arriving during an in-flight ack is eventually acked', () async {
    final db = openTestDatabase();
    final String priorId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
    final String tailId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
    final String liveId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(tailId),
      ),
    );
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: const Value('channel-1'),
        lastMessageId: Value(priorId),
        mentionCount: const Value(0),
      ),
    );
    final adapter = _ChatAdapter(
      initialMessages: <Map<String, Object?>>[
        _messageJson(id: tailId, channelId: 'channel-1', authorId: 'other'),
        _messageJson(id: priorId, channelId: 'channel-1', authorId: 'other'),
      ],
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    _setViewportActive(container, channelId: 'channel-1');
    await _flushAsync();
    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    expect(adapter.ackedMessageIds, <String>[tailId]);

    final Future<void> inFlight = notifier.ackCurrentChannel();
    container
        .read(messageRealtimeBusProvider)
        .emit(
          testMessageCreated(
            MessageCreateEvent(
              message: MessageResponseSchema.fromJson(
                _messageJson(
                  id: liveId,
                  channelId: 'channel-1',
                  authorId: 'other',
                ),
              ),
            ),
          ),
        );
    await inFlight;
    await _flushAsync();
    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    await container
        .read(chatViewModelProvider.notifier)
        .flushScheduledReadAckRetryForTest();
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, liveId);
    expect(adapter.ackedMessageIds.last, liveId);
  });

  test(
    'opening a read channel does not ack until a viewport measurement arrives',
    () async {
      final db = openTestDatabase();
      final String priorId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final String latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
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
          lastMessageId: Value(priorId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: <Map<String, Object?>>[
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'me'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      _setViewportActive(container, channelId: 'channel-1');
      await _flushAsync();

      var readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, priorId);
      expect(adapter.ackedMessageIds, isEmpty);

      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, latestId);
      expect(adapter.ackedMessageIds, <String>[latestId]);
    },
  );

  test('auto ack waits while app UI is not foreground', () async {
    final db = openTestDatabase();
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
    _setViewportActive(container, channelId: 'channel-1');
    await _flushAsync();
    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();

    final readState = await db.readStateDao.getReadState('channel-1');
    expect(readState?.lastMessageId, ackId);
    expect(adapter.ackedMessageIds, isEmpty);
  });

  test(
    'opening a DM clears unread after its newest message was deleted',
    () async {
      final db = openTestDatabase();
      final priorId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final deletedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: '12345',
          lastMessageId: Value(deletedId),
          lastMessageTime: Value(dateTimeFromUserSnowflakeOrNull(deletedId)!),
          unreadCount: const Value(1),
        ),
      ]);
      await db.messageDao.upsertMessage(
        _cachedMessage(id: priorId, channelId: 'dm-1', authorId: '12345'),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('dm-1'),
          lastMessageId: Value(priorId),
          mentionCount: const Value(1),
        ),
      );
      final adapter = _ChatAdapter(
        messagesByChannel: {
          'dm-1': [
            _messageJson(id: priorId, channelId: 'dm-1', authorId: '12345'),
          ],
        },
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('dm-1');
      _setViewportActive(container, channelId: 'dm-1');
      _updateViewport(container, channelId: 'dm-1', nearLoadedTail: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('dm-1');
      final dm = await db.dmChannelDao.getDmChannelById('dm-1');
      expect(adapter.ackedMessageIds, <String>[deletedId]);
      expect(readState?.mentionCount, 0);
      expect(dm?.unreadCount, 0);
    },
  );

  test(
    'opening a guild channel clears unread after its newest message was deleted',
    () async {
      final db = openTestDatabase();
      final priorId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final deletedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(deletedId),
        ),
      );
      await db.messageDao.upsertMessage(
        _cachedMessage(id: priorId, channelId: 'channel-1', authorId: 'other'),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(priorId),
          mentionCount: const Value(0),
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
      _setViewportActive(container, channelId: 'channel-1');
      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      final channel = await db.channelDao.getChannelById('channel-1');
      expect(channel?.lastMessageId, deletedId);
      expect(readState?.lastMessageId, deletedId);
      expect(adapter.ackedMessageIds, <String>[deletedId]);
      expect(
        container.read(chatViewModelProvider).hasMoreNewerMessages,
        isFalse,
      );
      final latestForUnread = await resolveLatestMessageIdForUnreadDisplay(
        db,
        'channel-1',
        channelLastMessageId: deletedId,
        ackLastMessageId: readState?.lastMessageId,
      );
      expect(
        hasUnreadByReadState(
          channelLastMessageId: latestForUnread,
          ackLastMessageId: readState?.lastMessageId,
          fallbackAckMs: 0,
          mentionCount: 0,
          isGuildChannel: true,
        ),
        isFalse,
      );
    },
  );

  test(
    'opening an empty channel clears unread after only message was deleted',
    () async {
      final db = openTestDatabase();
      final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
      final deletedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(deletedId),
        ),
      );
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: const Value('channel-1'),
          lastMessageId: Value(ackId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter();
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      _setViewportActive(container, channelId: 'channel-1');
      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, deletedId);
      expect(readState?.mentionCount, 0);
      expect(adapter.ackedMessageIds, <String>[deletedId]);
      expect(
        hasUnreadByReadState(
          channelLastMessageId: deletedId,
          ackLastMessageId: readState?.lastMessageId,
          fallbackAckMs: 0,
          mentionCount: 0,
          isGuildChannel: true,
        ),
        isFalse,
      );
    },
  );

  test(
    'opening an empty DM clears unread after all messages were deleted',
    () async {
      final db = openTestDatabase();
      final deletedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: '12345',
          lastMessageId: Value(deletedId),
          lastMessageTime: Value(dateTimeFromUserSnowflakeOrNull(deletedId)!),
          unreadCount: const Value(1),
        ),
      ]);
      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('dm-1'),
          lastMessageId: Value(null),
          mentionCount: Value(0),
        ),
      );
      final adapter = _ChatAdapter(messagesByChannel: {'dm-1': []});
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('dm-1');
      _setViewportActive(container, channelId: 'dm-1');
      _updateViewport(container, channelId: 'dm-1', nearLoadedTail: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('dm-1');
      final dm = await db.dmChannelDao.getDmChannelById('dm-1');
      expect(container.read(chatViewModelProvider).messages, isEmpty);
      expect(adapter.ackedMessageIds, <String>[deletedId]);
      expect(readState?.lastMessageId, deletedId);
      expect(dm?.unreadCount, 0);
    },
  );

  test(
    'opening a DM with no message left clears its pending mentions',
    () async {
      final db = openTestDatabase();
      final dmId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: dmId,
          recipientId: '12345',
          lastMessageTime: Value(DateTime.utc(2026, 5, 6, 10)),
          unreadCount: const Value(1),
        ),
      ]);
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion(
          channelId: Value(dmId),
          lastMessageId: const Value(null),
          mentionCount: const Value(1),
        ),
      );
      final adapter = _ChatAdapter(messagesByChannel: {dmId: []});
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel(dmId);
      _setViewportActive(container, channelId: dmId);
      _updateViewport(container, channelId: dmId, nearLoadedTail: true);
      await _flushAsync();
      await container.read(ackBatcherProvider).flushPending(force: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState(dmId);
      final dm = await db.dmChannelDao.getDmChannelById(dmId);
      expect(adapter.ackedMessageIds, <String>[dmId]);
      expect(readState?.lastMessageId, dmId);
      expect(readState?.mentionCount, 0);
      expect(dm?.unreadCount, 0);
    },
  );

  test(
    'reopening an emptied DM acks the deleted tail READY still points at',
    () async {
      final db = openTestDatabase();
      final dmId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
      final deletedId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      await GatewayEventHandler(database: db, currentUserId: 'me').handle(
        ReadyEvent(
          sessionId: 'session-1',
          user: UserPrivateResponse.fromJson(<String, Object?>{
            'id': 'me',
            'username': 'me',
            'discriminator': '0001',
            'global_name': null,
            'avatar': null,
            'avatar_color': null,
            'flags': 0,
            'is_staff': false,
            'acls': <String>[],
            'traits': <String>[],
            'email': null,
            'bio': null,
            'pronouns': null,
            'accent_color': null,
            'banner': null,
            'banner_color': null,
            'mfa_enabled': false,
            'verified': true,
            'has_verified_phone': false,
            'premium_type': null,
            'premium_since': null,
            'premium_until': null,
            'premium_will_cancel': false,
            'premium_billing_cycle': null,
            'premium_lifetime_sequence': null,
            'premium_badge_hidden': false,
            'premium_badge_masked': false,
            'premium_badge_timestamp_hidden': false,
            'premium_badge_sequence_hidden': false,
            'premium_purchase_disabled': false,
            'premium_enabled_override': false,
            'premium_discriminator': false,
            'premium_perks_disabled': false,
            'password_last_changed_at': null,
            'required_actions': <String>[],
            'nsfw_allowed': true,
            'has_dismissed_premium_onboarding': false,
            'has_ever_purchased': false,
            'has_unread_gift_inventory': false,
            'unread_gift_inventory_count': 0,
            'pending_bulk_message_deletion': null,
          }),
          guilds: const [],
          rawGuilds: const [],
          privateChannels: <ChannelResponse>[
            ChannelResponse.fromJson(<String, Object?>{
              'id': dmId,
              'type': 1,
              'last_message_id': deletedId,
              'recipients': <Map<String, Object?>>[
                <String, Object?>{
                  'id': '12345',
                  'username': 'user-12345',
                  'discriminator': '0001',
                  'global_name': null,
                  'avatar': null,
                  'avatar_color': null,
                  'flags': 0,
                },
              ],
            }),
          ],
          relationships: const [],
          readStates: <GatewayReadState>[
            GatewayReadState(id: dmId, lastMessageId: dmId),
          ],
          presences: const [],
        ),
      );
      expect(
        (await db.dmChannelDao.getDmChannelById(dmId))?.lastMessageId,
        deletedId,
      );
      final adapter = _ChatAdapter(messagesByChannel: {dmId: []});
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel(dmId);
      _setViewportActive(container, channelId: dmId);
      await _flushAsync();
      _updateViewport(container, channelId: dmId, nearLoadedTail: true);
      await _flushAsync();
      await container.read(ackBatcherProvider).flushPending(force: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState(dmId);
      final dm = await db.dmChannelDao.getDmChannelById(dmId);
      expect(container.read(chatViewModelProvider).messages, isEmpty);
      expect(adapter.ackedMessageIds, <String>[deletedId]);
      expect(readState?.lastMessageId, deletedId);
      expect(dm?.lastMessageId, deletedId);
      expect(dm?.unreadCount, 0);
    },
  );

  test('auto ack retries HTTP failure after applying local ack', () async {
    final db = openTestDatabase();
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
    _setViewportActive(container, channelId: 'channel-1');
    _updateViewport(container, nearLoadedTail: true);
    await _flushAsync();
    await container.read(ackBatcherProvider).flushPending(force: true);
    await _flushAsync();

    expect(adapter.ackAttempts, greaterThanOrEqualTo(2));
    expect(adapter.ackedMessageIds, contains(latestId));
  });

  test(
    'mark message unread applies local manual ack before HTTP completes',
    () async {
      final db = openTestDatabase();
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
      final db = openTestDatabase();
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
      final db = openTestDatabase();
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
      _setViewportActive(container, channelId: 'channel-1');
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
    final db = openTestDatabase();
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
      final db = openTestDatabase();
      final adapter = _ChatAdapter();
      final container = _container(db, adapter);
      addTearDown(container.dispose);
      container
          .read(chatViewModelProvider.notifier)
          .highlightJumpMessage('message-1');
      expect(
        container.read(chatViewModelProvider).highlightedMessageId,
        'message-1',
      );
    });

    test('persists highlight until scroll is confirmed on slow loads', () {
      fakeAsync((FakeAsync async) {
        final db = openTestDatabase();
        final adapter = _ChatAdapter();
        final container = _container(db, adapter);
        container
            .read(chatViewModelProvider.notifier)
            .highlightJumpMessage('message-1');
        async.elapse(const Duration(seconds: 10));
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          'message-1',
        );
        container.dispose();
        async.flushTimers();
      });
    });

    test('clears highlightedMessageId 2 seconds after scroll is confirmed', () {
      fakeAsync((FakeAsync async) {
        final db = openTestDatabase();
        final adapter = _ChatAdapter();
        final container = _container(db, adapter);
        final notifier = container.read(chatViewModelProvider.notifier)
          ..highlightJumpMessage('message-1');
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
        async.flushTimers();
      });
    });

    test('replaces highlight when jumping to a new message', () {
      fakeAsync((FakeAsync async) {
        final db = openTestDatabase();
        final adapter = _ChatAdapter();
        final container = _container(db, adapter);
        container.read(chatViewModelProvider.notifier)
          ..highlightJumpMessage('message-1')
          ..extendJumpHighlight('message-1')
          ..highlightJumpMessage('message-2')
          ..extendJumpHighlight('message-2');
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
        async.flushTimers();
      });
    });

    test(
      'switchChannel with targetMessageId highlights the target message',
      () async {
        final db = openTestDatabase();
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
        final db = openTestDatabase();
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

    test(
      'a targeted switchChannel still highlights when a latest load is in flight',
      () async {
        final db = openTestDatabase();
        final String targetId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: 'channel-1',
            guildId: 'guild-1',
            name: 'general',
            lastMessageId: Value<String?>(targetId),
          ),
        );
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
        )..holdMessageFetch = true;
        final container = _container(db, adapter);
        addTearDown(container.dispose);
        final notifier = container.read(chatViewModelProvider.notifier);
        unawaited(notifier.switchChannel('channel-1'));
        await _flushAsync();
        expect(container.read(chatViewModelProvider).isLoading, isTrue);

        unawaited(
          notifier.switchChannel('channel-1', targetMessageId: targetId),
        );
        await _flushAsync();
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          targetId,
        );

        adapter.releaseMessageFetch();
        await _flushAsync();
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          targetId,
        );
        expect(
          container.read(chatViewModelProvider).scrollToMessageSignal?.$1,
          targetId,
        );
      },
    );

    test(
      'an untargeted switchChannel does not clear an in-flight jump highlight',
      () async {
        final db = openTestDatabase();
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
        )..holdMessageFetch = true;
        final container = _container(db, adapter);
        addTearDown(container.dispose);
        final notifier = container.read(chatViewModelProvider.notifier);
        unawaited(
          notifier.switchChannel('channel-1', targetMessageId: targetId),
        );
        await _flushAsync();
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          targetId,
        );

        unawaited(notifier.switchChannel('channel-1'));
        await _flushAsync();
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          targetId,
        );

        adapter.releaseMessageFetch();
        await _flushAsync();
        expect(
          container.read(chatViewModelProvider).highlightedMessageId,
          targetId,
        );
      },
    );

    test(
      'switchChannel keeps both edges open when around omits the target',
      () async {
        final db = openTestDatabase();
        final String missingTargetId = _snowflakeForUtc(
          DateTime.utc(2026, 5, 6, 12),
        );
        final String olderId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
        final String newerId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
        final String liveTailId = _snowflakeForUtc(
          DateTime.utc(2026, 5, 6, 20),
        );
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: 'channel-1',
            guildId: 'guild-1',
            name: 'general',
            lastMessageId: Value(liveTailId),
          ),
        );
        final adapter = _ChatAdapter(
          aroundMessages: <Map<String, Object?>>[
            _messageJson(
              id: olderId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
            _messageJson(
              id: newerId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
          ],
        );
        final container = _container(db, adapter);
        addTearDown(container.dispose);
        final notifier = container.read(chatViewModelProvider.notifier);
        await notifier.switchChannel(
          'channel-1',
          targetMessageId: missingTargetId,
        );
        await _flushAsync();

        final ChatViewState state = container.read(chatViewModelProvider);
        expect(adapter.aroundQueries, <String>[missingTargetId]);
        expect(state.messages.map((m) => m.id), <String>[olderId, newerId]);
        expect(state.messages.any((m) => m.id == missingTargetId), isFalse);
        expect(
          state.hasMoreMessages,
          isTrue,
          reason: 'missing around target keeps older pagination open',
        );
        expect(
          state.hasMoreNewerMessages,
          isTrue,
          reason: 'missing around target keeps newer pagination open',
        );
        expect(state.scrollToMessageSignal?.$1, missingTargetId);
        expect(
          resolveJumpScrollTargetId(
            jumpTargetId: missingTargetId,
            messageIds: state.messages.map((m) => m.id),
          ),
          newerId,
          reason: 'scroll settles on the next newer neighbour',
        );
      },
    );

    test('switchChannel without target clears jump highlight', () async {
      final db = openTestDatabase();
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
      container
          .read(chatViewModelProvider.notifier)
          .highlightJumpMessage('message-1');
      await container
          .read(chatViewModelProvider.notifier)
          .switchChannel('channel-2');
      expect(container.read(chatViewModelProvider).highlightedMessageId, null);
      await _flushAsync();
    });
  });

  test('refreshAfterSessionRecovery is no-op without open channel', () async {
    final db = openTestDatabase();
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
    test('becoming eligible acks exactly once', () async {
      final db = openTestDatabase();
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
      _setViewportActive(container, channelId: 'channel-1');
      await _flushAsync();
      _updateViewport(container, nearLoadedTail: true);
      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, latestId);
      expect(adapter.ackedMessageIds, [latestId]);
      expect(adapter.ackAttempts, 1);
    });

    test(
      'manual read state is never auto-acked under rapid viewport ticks',
      () async {
        final db = openTestDatabase();
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
        _setViewportActive(container, channelId: 'channel-1');
        for (var i = 0; i < 10; i++) {
          _updateViewport(container, nearLoadedTail: true);
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
      final db = openTestDatabase();
      final List<String> historyIds = <String>[
        for (var i = 0; i < 50; i++)
          _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10, 0, i)),
      ];
      final String latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
      final String incomingId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
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
          lastMessageId: Value(historyIds.first),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
        ],
        aroundMessages: [
          for (final String id in historyIds.reversed)
            _messageJson(id: id, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final loaded = container.read(chatViewModelProvider);
      expect(loaded.hasMoreNewerMessages, isTrue);
      expect(loaded.messages.map((m) => m.id).toList(), historyIds);

      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
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

      expect(
        container
            .read(chatViewModelProvider)
            .messages
            .map((m) => m.id)
            .toList(),
        historyIds,
      );
    },
  );

  group('gateway auto-ack watermark', () {
    test('acked create appends with its watermark in the same state', () async {
      final db = openTestDatabase();
      final String baseId = _snowflakeForUtc(DateTime.utc(2026, 5, 7, 10));
      final String incomingId = _snowflakeForUtc(DateTime.utc(2026, 5, 7, 11));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(baseId),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: <Map<String, Object?>>[
          _messageJson(id: baseId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      await container
          .read(chatViewModelProvider.notifier)
          .switchChannel('channel-1');
      await _flushAsync();
      final List<ChatViewState> appendedStates = <ChatViewState>[];
      final subscription = container.listen<ChatViewState>(
        chatViewModelProvider,
        (_, ChatViewState next) {
          if (next.messages.any((message) => message.id == incomingId)) {
            appendedStates.add(next);
          }
        },
      );
      addTearDown(subscription.close);

      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
              MessageCreateEvent(
                message: MessageResponseSchema.fromJson(
                  _messageJson(
                    id: incomingId,
                    channelId: 'channel-1',
                    authorId: 'other',
                  ),
                ),
              ),
              snapshot: _acknowledgedGatewaySnapshot,
            ),
          );
      await _flushAsync();

      expect(appendedStates, isNotEmpty);
      for (final ChatViewState appendedState in appendedStates) {
        expect(appendedState.pendingAutoAckMessageId, incomingId);
      }
      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.messages.last.id, incomingId);
      expect(state.pendingAutoAckMessageId, incomingId);
    });

    test('batched acked creates keep the newest watermark', () async {
      final db = openTestDatabase();
      final String baseId = _snowflakeForUtc(DateTime.utc(2026, 5, 8, 10));
      final List<String> incomingIds = <String>[
        _snowflakeForUtc(DateTime.utc(2026, 5, 8, 11)),
        _snowflakeForUtc(DateTime.utc(2026, 5, 8, 12)),
        _snowflakeForUtc(DateTime.utc(2026, 5, 8, 13)),
      ];
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(baseId),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: <Map<String, Object?>>[
          _messageJson(id: baseId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      await container
          .read(chatViewModelProvider.notifier)
          .switchChannel('channel-1');
      await _flushAsync();
      final bus = container.read(messageRealtimeBusProvider);
      for (final String incomingId in incomingIds) {
        bus.emit(
          testMessageCreated(
            MessageCreateEvent(
              message: MessageResponseSchema.fromJson(
                _messageJson(
                  id: incomingId,
                  channelId: 'channel-1',
                  authorId: 'other',
                ),
              ),
            ),
            snapshot: _acknowledgedGatewaySnapshot,
          ),
        );
      }
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(
        state.messages.map((message) => message.id),
        containsAll(incomingIds),
      );
      expect(state.pendingAutoAckMessageId, incomingIds.last);
    });

    test('unacknowledged create leaves the watermark unset', () async {
      final db = openTestDatabase();
      final String baseId = _snowflakeForUtc(DateTime.utc(2026, 5, 9, 10));
      final String incomingId = _snowflakeForUtc(DateTime.utc(2026, 5, 9, 11));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(baseId),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: <Map<String, Object?>>[
          _messageJson(id: baseId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      await container
          .read(chatViewModelProvider.notifier)
          .switchChannel('channel-1');
      await _flushAsync();
      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
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

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.messages.last.id, incomingId);
      expect(state.pendingAutoAckMessageId, null);
    });

    test('switching channels resets the watermark', () async {
      final db = openTestDatabase();
      final String baseId = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 10));
      final String incomingId = _snowflakeForUtc(DateTime.utc(2026, 5, 10, 11));
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(baseId),
        ),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-2',
          guildId: 'guild-1',
          name: 'other',
        ),
      );
      final adapter = _ChatAdapter(
        messagesByChannel: <String, List<Map<String, Object?>>>{
          'channel-1': <Map<String, Object?>>[
            _messageJson(id: baseId, channelId: 'channel-1', authorId: 'other'),
          ],
          'channel-2': <Map<String, Object?>>[],
        },
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);
      final ChatViewModel notifier = container.read(
        chatViewModelProvider.notifier,
      );

      await notifier.switchChannel('channel-1');
      await _flushAsync();
      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
              MessageCreateEvent(
                message: MessageResponseSchema.fromJson(
                  _messageJson(
                    id: incomingId,
                    channelId: 'channel-1',
                    authorId: 'other',
                  ),
                ),
              ),
              snapshot: _acknowledgedGatewaySnapshot,
            ),
          );
      await _flushAsync();
      expect(
        container.read(chatViewModelProvider).pendingAutoAckMessageId,
        incomingId,
      );

      await notifier.switchChannel('channel-2');
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.channelId, 'channel-2');
      expect(state.pendingAutoAckMessageId, null);
    });
  });

  group('pre-ack sticky snapshot', () {
    test(
      'ack snapshots first unread before advancing a late-synced read state',
      () async {
        final db = openTestDatabase();
        final oldestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 10));
        final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
        final firstUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
        final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
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
            _messageJson(
              id: latestId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
            _messageJson(
              id: firstUnreadId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
            _messageJson(id: ackId, channelId: 'channel-1', authorId: 'other'),
            _messageJson(
              id: oldestId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
          ],
        );
        final container = _container(db, adapter);
        addTearDown(container.dispose);

        final notifier = container.read(chatViewModelProvider.notifier);
        await notifier.switchChannel('channel-1');
        await _flushAsync();
        expect(
          container.read(chatViewModelProvider).stickyUnreadMessageId,
          null,
        );

        await db.readStateDao.upsertReadState(
          ReadStatesCompanion(
            channelId: const Value('channel-1'),
            lastMessageId: Value(ackId),
            mentionCount: const Value(0),
          ),
        );
        _setViewportActive(container, channelId: 'channel-1');
        _updateViewport(container, nearLoadedTail: true);
        await _flushAsync();

        final readState = await db.readStateDao.getReadState('channel-1');
        expect(readState?.lastMessageId, latestId);
        expect(
          container.read(chatViewModelProvider).stickyUnreadMessageId,
          firstUnreadId,
        );
      },
    );

    test(
      'first ack consumes the one-shot arm so later acks add no divider',
      () async {
        final db = openTestDatabase();
        final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
        final firstUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
        final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
        final incomingId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 14));
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
            _messageJson(
              id: latestId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
            _messageJson(
              id: firstUnreadId,
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
        _setViewportActive(container, channelId: 'channel-1');
        _updateViewport(container, nearLoadedTail: true);
        await _flushAsync();

        var readState = await db.readStateDao.getReadState('channel-1');
        expect(readState?.lastMessageId, latestId);
        expect(
          container.read(chatViewModelProvider).stickyUnreadMessageId,
          firstUnreadId,
        );

        notifier.clearStickyUnread();

        await db.messageDao.upsertMessage(
          _cachedMessage(
            id: incomingId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        );
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: 'channel-1',
            guildId: 'guild-1',
            name: 'general',
            lastMessageId: Value(incomingId),
          ),
        );

        container
            .read(messageRealtimeBusProvider)
            .emit(
              testMessageCreated(
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
        expect(
          container.read(chatViewModelProvider).messages.map((m) => m.id),
          contains(incomingId),
        );
        _updateViewport(container, nearLoadedTail: true);

        for (var i = 0; i < 50; i++) {
          await Future<void>.delayed(const Duration(milliseconds: 100));
          readState = await db.readStateDao.getReadState('channel-1');
          if (readState?.lastMessageId == incomingId) {
            break;
          }
        }
        expect(readState?.lastMessageId, incomingId);
        expect(
          container.read(chatViewModelProvider).stickyUnreadMessageId,
          null,
        );
      },
    );

    test('ack does not snapshot a divider on a fully read channel', () async {
      final db = openTestDatabase();
      final previousId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
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
          lastMessageId: Value(latestId),
          mentionCount: const Value(0),
        ),
      );
      final adapter = _ChatAdapter(
        initialMessages: [
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(
            id: previousId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      _setViewportActive(container, channelId: 'channel-1');
      _updateViewport(container, nearLoadedTail: true);
      await _flushAsync();

      final readState = await db.readStateDao.getReadState('channel-1');
      expect(readState?.lastMessageId, latestId);
      expect(container.read(chatViewModelProvider).stickyUnreadMessageId, null);
    });

    test(
      'markCurrentChannelRead disarms the snapshot for subsequent acks',
      () async {
        final db = openTestDatabase();
        final ackId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 11));
        final firstUnreadId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 12));
        final latestId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 13));
        final incomingId = _snowflakeForUtc(DateTime.utc(2026, 5, 6, 14));
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
            _messageJson(
              id: latestId,
              channelId: 'channel-1',
              authorId: 'other',
            ),
            _messageJson(
              id: firstUnreadId,
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
        await _flushAsync();
        expect(
          container.read(chatViewModelProvider).stickyUnreadMessageId,
          firstUnreadId,
        );

        await notifier.markCurrentChannelRead();
        await _flushAsync();
        expect(
          container.read(chatViewModelProvider).stickyUnreadMessageId,
          null,
        );

        await db.messageDao.upsertMessage(
          _cachedMessage(
            id: incomingId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        );
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: 'channel-1',
            guildId: 'guild-1',
            name: 'general',
            lastMessageId: Value(incomingId),
          ),
        );
        container
            .read(messageRealtimeBusProvider)
            .emit(
              testMessageCreated(
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
        _setViewportActive(container, channelId: 'channel-1');
        _updateViewport(container, nearLoadedTail: true);
        await _flushAsync();

        final readState = await db.readStateDao.getReadState('channel-1');
        expect(readState?.lastMessageId, incomingId);
        expect(
          container.read(chatViewModelProvider).stickyUnreadMessageId,
          null,
        );
      },
    );
  });
}

ProviderContainer _container(
  FluxerDatabase db,
  _ChatAdapter adapter, {
  bool foreground = true,
  bool overrideForeground = true,
}) {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      if (overrideForeground)
        appUiForegroundProvider.overrideWithValue(foreground),
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
      guildMemberHydrationServiceProvider.overrideWithValue(
        NoopGuildMemberHydrationService(database: db),
      ),
    ],
  );
}

Future<void> _flushAsync() async {
  for (var i = 0; i < 8; i++) {
    await pumpEventQueue();
  }
  SchedulerBinding.instance.handleBeginFrame(Duration.zero);
  SchedulerBinding.instance.handleDrawFrame();
  for (var i = 0; i < 8; i++) {
    await pumpEventQueue();
  }
}

class _ChatAdapter implements HttpClientAdapter {
  _ChatAdapter({
    this.initialMessages = const [],
    this.messagesByChannel = const {},
    this.messagesAfterAck = const [],
    this.messagesBefore = const [],
    this.aroundMessages,
  });

  final List<Map<String, Object?>> initialMessages;
  final Map<String, List<Map<String, Object?>>> messagesByChannel;
  final List<Map<String, Object?>> messagesAfterAck;
  final List<Map<String, Object?>> messagesBefore;
  final List<Map<String, Object?>>? aroundMessages;
  final List<Uri> messageRequestUris = [];
  final List<String> afterQueries = [];
  final List<String> beforeQueries = [];
  final List<String> aroundQueries = [];
  final List<String> ackedMessageIds = [];
  bool holdMessageFetch = false;
  bool failMessageFetch = false;
  int transientMessageFetchFailures = 0;
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
      final before = options.uri.queryParameters['before'];
      final around = options.uri.queryParameters['around'];
      if (after != null) {
        afterQueries.add(after);
      }
      if (before != null) {
        beforeQueries.add(before);
      }
      if (around != null) {
        aroundQueries.add(around);
      }
      if (holdMessageFetch) {
        _messageFetchCompleter ??= Completer<void>();
        await _messageFetchCompleter!.future;
      }
      if (failMessageFetch) {
        return ResponseBody.fromString('failed', 500);
      }
      if (transientMessageFetchFailures > 0) {
        transientMessageFetchFailures -= 1;
        return ResponseBody.fromString('unavailable', 503);
      }
      final List<Map<String, Object?>> messages;
      if (around != null) {
        messages =
            aroundMessages ?? messagesByChannel[channelId] ?? initialMessages;
      } else if (after != null) {
        messages = messagesAfterAck;
      } else if (before != null) {
        messages = messagesBefore;
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
        options.uri.path.endsWith('/read-states/ack')) {
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
      return ResponseBody.fromString(
        '{"read_states":[],"read_state_proto":""}',
        200,
        statusMessage: 'OK',
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
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
