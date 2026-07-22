import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../../helpers/message_realtime_test_helpers.dart';
import '../../../../helpers/noop_guild_member_hydration_service.dart';
import '../../../../helpers/open_test_database.dart';

const int _kMinuteMs = 60 * 1000;

String _snowflakeForIndex(int index) {
  final int millis =
      DateTime.utc(2026).millisecondsSinceEpoch + index * _kMinuteMs;
  final int internal = (millis - kSnowflakeEpochMs) << 22;
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

/// Builds [count] message ids for [channelId] starting at [baseIndex]
/// (ascending, oldest first); distinct base indexes keep channels disjoint.
List<Map<String, Object?>> _channelMessages(
  String channelId,
  int count, {
  int baseIndex = 0,
}) => [
  for (var i = 0; i < count; i++)
    _messageJson(
      id: _snowflakeForIndex(baseIndex + i),
      channelId: channelId,
      authorId: 'other',
    ),
];

MessagesCompanion _cachedMessage({
  required String id,
  required String channelId,
}) => MessagesCompanion.insert(
  id: id,
  channelId: channelId,
  authorId: 'other',
  content: 'message $id',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
);

void _emitCreatedMessage(ProviderContainer container, {required String id}) {
  container
      .read(messageRealtimeBusProvider)
      .emit(
        testMessageCreated(
          MessageCreateEvent(
            message: MessageResponseSchema.fromJson(
              _messageJson(id: id, channelId: 'channel-1', authorId: 'other'),
            ),
          ),
          snapshot: const MessagePersistSnapshot(
            mentionsCurrentUser: false,
            isDm: false,
            guildStorageId: null,
            acknowledgedByGateway: true,
          ),
        ),
      );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<(ProviderContainer, ChatViewModel, List<Map<String, Object?>>)>
  setUpLoadedLiveTailWindow() async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    final List<Map<String, Object?>> loaded = _channelMessages(
      'channel-1',
      kMaxLoadedMessages,
    );
    final adapter = _PaginatingAdapter(
      messagesByChannel: {'channel-1': loaded},
      pageLimit: kMaxLoadedMessages,
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.messages, hasLength(kMaxLoadedMessages));
    expect(state.messages.first.id, loaded.first['id']);
    expect(state.hasMoreNewerMessages, isFalse);
    return (container, notifier, loaded);
  }

  test('loadMore keeps a bounded oldest-side window', () async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    final List<Map<String, Object?>> all = _channelMessages('channel-1', 250);
    final String oldestId = all.first['id']! as String;
    final String newestId = all.last['id']! as String;
    final adapter = _PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 150,
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();

    final initial = container.read(chatViewModelProvider);
    expect(initial.messages.last.id, newestId);
    expect(initial.hasMoreNewerMessages, isFalse);
    expect(initial.messages, hasLength(150));

    await notifier.loadMore();
    await _flushAsync();

    final bounded = container.read(chatViewModelProvider);
    expect(bounded.messages.length, lessThanOrEqualTo(kMaxLoadedMessages));
    expect(bounded.messages, hasLength(kTrimmedMessageWindowSize));
    expect(bounded.messages.first.id, oldestId);
    expect(bounded.messages.last.id, all[kTrimmedMessageWindowSize - 1]['id']);
    expect(bounded.messages.last.id, isNot(newestId));
    expect(bounded.hasMoreNewerMessages, isTrue);
  });

  test(
    'trimToNewestWindow is a no-op while newer history is unloaded',
    () async {
      final db = openTestDatabase();
      // The channel's newest message is far ahead of what we load, so the loaded
      // window sits in history with hasMoreNewerMessages == true.
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(_snowflakeForIndex(999)),
        ),
      );
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 250);
      final adapter = _PaginatingAdapter(
        messagesByChannel: {'channel-1': all},
        pageLimit: 250,
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.hasMoreNewerMessages, isTrue);
      // Above the cap, so only the hasMoreNewerMessages guard protects it.
      expect(state.messages, hasLength(250));
      final messagesBeforeTrim = state.messages;

      notifier.trimToNewestWindow();

      expect(
        container.read(chatViewModelProvider).messages,
        same(messagesBeforeTrim),
      );
    },
  );

  test(
    'realtime create while scrolled up preserves loaded older messages',
    () async {
      final (container, notifier, loaded) = await setUpLoadedLiveTailWindow();
      final String oldestSeededId = loaded.first['id']! as String;
      final String newMessageId = _snowflakeForIndex(kMaxLoadedMessages);

      container
          .read(chatReadViewportProvider.notifier)
          .updateViewport(
            channelId: 'channel-1',
            nearLoadedTail: false,
            distanceFromBottom: 1000,
            viewportHeight: 600,
          );
      _emitCreatedMessage(container, id: newMessageId);
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.messages, hasLength(kMaxLoadedMessages + 1));
      expect(state.messages.first.id, oldestSeededId);
      expect(state.messages.last.id, newMessageId);
    },
  );

  test('realtime create at live tail trims to newest window', () async {
    final (container, notifier, _) = await setUpLoadedLiveTailWindow();
    final String newMessageId = _snowflakeForIndex(kMaxLoadedMessages);
    final String firstRetainedId = _snowflakeForIndex(
      kMaxLoadedMessages + 1 - kTrimmedMessageWindowSize,
    );

    container
        .read(chatReadViewportProvider.notifier)
        .updateViewport(
          channelId: 'channel-1',
          nearLoadedTail: true,
          distanceFromBottom: 0,
          viewportHeight: 600,
        );
    _emitCreatedMessage(container, id: newMessageId);
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.messages, hasLength(kTrimmedMessageWindowSize));
    expect(state.messages.first.id, firstRetainedId);
    expect(state.messages.last.id, newMessageId);
    expect(state.hasMoreMessages, isTrue);
  });

  test('trimToNewestWindow trims a live-tail window past the cap', () async {
    final (container, notifier, _) = await setUpLoadedLiveTailWindow();
    final String newMessageId = _snowflakeForIndex(kMaxLoadedMessages);

    container
        .read(chatReadViewportProvider.notifier)
        .updateViewport(
          channelId: 'channel-1',
          nearLoadedTail: false,
          distanceFromBottom: 1000,
          viewportHeight: 600,
        );
    _emitCreatedMessage(container, id: newMessageId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages,
      hasLength(kMaxLoadedMessages + 1),
    );

    notifier.trimToNewestWindow();

    final state = container.read(chatViewModelProvider);
    expect(state.messages, hasLength(kTrimmedMessageWindowSize));
    expect(state.messages.last.id, newMessageId);
    expect(state.hasMoreMessages, isTrue);
  });

  test(
    'batched realtime creates while scrolled up preserve loaded older messages',
    () async {
      final (container, notifier, loaded) = await setUpLoadedLiveTailWindow();
      final String oldestSeededId = loaded.first['id']! as String;
      final String firstNewMessageId = _snowflakeForIndex(kMaxLoadedMessages);
      final String secondNewMessageId = _snowflakeForIndex(
        kMaxLoadedMessages + 1,
      );

      container
          .read(chatReadViewportProvider.notifier)
          .updateViewport(
            channelId: 'channel-1',
            nearLoadedTail: false,
            distanceFromBottom: 1000,
            viewportHeight: 600,
          );
      _emitCreatedMessage(container, id: firstNewMessageId);
      _emitCreatedMessage(container, id: secondNewMessageId);
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.messages, hasLength(kMaxLoadedMessages + 2));
      expect(state.messages.first.id, oldestSeededId);
      expect(state.messages.last.id, secondNewMessageId);
    },
  );

  test('loadMore drops a stale older page after a channel switch', () async {
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
    final List<Map<String, Object?>> channel1 = _channelMessages(
      'channel-1',
      100,
    );
    final List<Map<String, Object?>> channel2 = _channelMessages(
      'channel-2',
      5,
      baseIndex: 100000,
    );
    final Set<String> channel1Ids = {
      for (final m in channel1) m['id']! as String,
    };
    final adapter = _PaginatingAdapter(
      messagesByChannel: {'channel-1': channel1, 'channel-2': channel2},
      pageLimit: 40,
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();

    // Hold only the older-page fetch so the channel-2 switch can complete.
    adapter.holdBeforeFetch = true;
    final Future<void> staleLoad = notifier.loadMore();
    await _flushAsync();

    await notifier.switchChannel('channel-2');
    await _flushAsync();
    expect(container.read(chatViewModelProvider).channelId, 'channel-2');

    adapter.releaseBeforeFetch();
    await staleLoad;
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.channelId, 'channel-2');
    // Channel-1's in-flight older page must not splice into channel-2.
    final Set<String> loadedIds = state.messages.map((m) => m.id).toSet();
    expect(loadedIds.intersection(channel1Ids), isEmpty);
    expect(state.isLoadingMore, isFalse);
  });

  test(
    'stale older page after a same-channel window replacement is discarded',
    () async {
      final db = openTestDatabase();
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 300);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all.last['id']! as String),
        ),
      );
      final adapter = _PaginatingAdapter(
        messagesByChannel: {'channel-1': all},
        pageLimit: 40,
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final Set<String> stalePageIds = {
        for (final message in all.sublist(220, 260)) message['id']! as String,
      };
      adapter.holdBeforeFetch = true;
      final Future<void> staleLoad = notifier.loadMore();
      await _flushAsync();

      final String targetId = all[50]['id']! as String;
      await notifier.goToRepliedMessage(
        channelId: 'channel-1',
        messageId: targetId,
      );
      await _flushAsync();
      expect(
        container.read(chatViewModelProvider).messages.map((m) => m.id),
        contains(targetId),
      );

      adapter.releaseBeforeFetch();
      await staleLoad;
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      final Set<String> loadedIds = state.messages.map((m) => m.id).toSet();
      expect(loadedIds.intersection(stalePageIds), isEmpty);
      expect(state.isLoadingMore, isFalse);
    },
  );

  test(
    'empty reply-jump page clears syncing and allows another attempt',
    () async {
      final db = openTestDatabase();
      final List<Map<String, Object?>> messages = _channelMessages(
        'channel-1',
        5,
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(messages.last['id']! as String),
        ),
      );
      final adapter = _PaginatingAdapter(
        messagesByChannel: {'channel-1': messages},
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final String missingId = _snowflakeForIndex(999);
      await notifier.goToRepliedMessage(
        channelId: 'channel-1',
        messageId: missingId,
      );
      expect(container.read(chatViewModelProvider).isSyncingMessages, isFalse);
      expect(adapter.aroundFetchCount, 1);

      await notifier.goToRepliedMessage(
        channelId: 'channel-1',
        messageId: missingId,
      );
      expect(container.read(chatViewModelProvider).isSyncingMessages, isFalse);
      expect(adapter.aroundFetchCount, 2);
    },
  );

  test('reply-jump page never lands after a channel switch', () async {
    final db = openTestDatabase();
    final List<Map<String, Object?>> channel1 = _channelMessages(
      'channel-1',
      100,
    );
    final List<Map<String, Object?>> channel2 = _channelMessages(
      'channel-2',
      5,
      baseIndex: 100000,
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(channel1.last['id']! as String),
      ),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-2',
        guildId: 'guild-2',
        name: 'other',
        lastMessageId: Value(channel2.last['id']! as String),
      ),
    );
    final adapter = _PaginatingAdapter(
      messagesByChannel: {'channel-1': channel1, 'channel-2': channel2},
      pageLimit: 10,
    )..holdAroundFetch = true;
    final container = _container(db, adapter);
    addTearDown(() {
      adapter.releaseAroundFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();

    final Future<void> staleJump = notifier.goToRepliedMessage(
      channelId: 'channel-1',
      messageId: channel1[10]['id']! as String,
    );
    await _flushAsync();
    expect(adapter.aroundFetchCount, 1);

    await notifier.switchChannel('channel-2');
    await _flushAsync();
    adapter.releaseAroundFetch();
    await staleJump;
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.channelId, 'channel-2');
    expect(state.isSyncingMessages, isFalse);
    final Set<String> loadedIds = state.messages.map((m) => m.id).toSet();
    final Set<String> channel1Ids = {
      for (final message in channel1) message['id']! as String,
    };
    expect(loadedIds.intersection(channel1Ids), isEmpty);
  });

  test('session recovery keeps a detached window intact', () async {
    final db = openTestDatabase();
    final List<Map<String, Object?>> all = _channelMessages('channel-1', 1000);
    final String targetId = all[149]['id']! as String;
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(all.last['id']! as String),
      ),
    );
    final adapter = _PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 150,
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1', targetMessageId: targetId);
    await _flushAsync();

    final before = container.read(chatViewModelProvider);
    expect(before.hasMoreNewerMessages, isTrue);
    expect(before.messages, isNotEmpty);

    await notifier.refreshAfterSessionRecovery();
    await _flushAsync();

    final after = container.read(chatViewModelProvider);
    expect(after.messages, same(before.messages));
    expect(after.messages.length, before.messages.length);
    expect(after.messages.first.id, before.messages.first.id);
    expect(after.messages.last.id, before.messages.last.id);
    expect(after.hasMoreNewerMessages, isTrue);
    expect(after.isSyncingMessages, isFalse);
  });

  test(
    'loadNewer keeps paging after a contiguity-truncated cache page',
    () async {
      final db = openTestDatabase();
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 500);
      final String targetId = all[100]['id']! as String;
      final String latestId = all.last['id']! as String;
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(latestId),
        ),
      );
      for (final Map<String, Object?> message in all) {
        await db.messageDao.upsertMessage(
          _cachedMessage(id: message['id']! as String, channelId: 'channel-1'),
        );
      }
      final adapter = _PaginatingAdapter(
        messagesByChannel: {'channel-1': all},
        pageLimit: 30,
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1', targetMessageId: targetId);
      await _flushAsync();

      var state = container.read(chatViewModelProvider);
      expect(state.hasMoreNewerMessages, isTrue);

      for (var i = 0; i < 8; i++) {
        if (!state.hasMoreMessages) {
          break;
        }
        await notifier.loadMore();
        await _flushAsync();
        state = container.read(chatViewModelProvider);
      }
      expect(state.hasMoreNewerMessages, isTrue);
      expect(state.messages.length, lessThanOrEqualTo(kMaxLoadedMessages));

      final String tailBefore = state.messages.last.id;
      await notifier.loadNewer();
      await _flushAsync();

      final ChatViewState after = container.read(chatViewModelProvider);
      expect(after.hasMoreNewerMessages, isTrue);
      expect(
        int.parse(after.messages.last.id),
        greaterThan(int.parse(tailBefore)),
      );
      expect(adapter.afterFetchCount, greaterThan(0));
    },
  );

  test('refreshAfterSessionRecovery preserves a scrolled-up window', () async {
    final db = openTestDatabase();
    // Newest message far ahead so the loaded window stays in history.
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(_snowflakeForIndex(999)),
      ),
    );
    final List<Map<String, Object?>> all = _channelMessages('channel-1', 350);
    final adapter = _PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 150,
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    await notifier.loadMore();
    await _flushAsync();

    // Near-bottom viewport isolates the hasMoreNewerMessages guard.
    container
        .read(chatReadViewportProvider.notifier)
        .updateViewport(
          channelId: 'channel-1',
          nearLoadedTail: true,
          distanceFromBottom: 0,
          viewportHeight: 0,
        );
    final before = container.read(chatViewModelProvider);
    expect(before.hasMoreNewerMessages, isTrue);
    expect(before.messages, hasLength(kTrimmedMessageWindowSize));

    await notifier.refreshAfterSessionRecovery();
    await _flushAsync();

    final after = container.read(chatViewModelProvider);
    expect(after.messages, same(before.messages));
    expect(after.messages.length, before.messages.length);
    expect(after.messages.first.id, before.messages.first.id);
    expect(after.messages.last.id, before.messages.last.id);
    expect(after.hasMoreNewerMessages, isTrue);
    expect(after.isSyncingMessages, isFalse);
  });

  test(
    'jumpToLatestMessages returns false while an older page is loading',
    () async {
      final db = openTestDatabase();
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(_snowflakeForIndex(999)),
        ),
      );
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 350);
      final adapter = _PaginatingAdapter(
        messagesByChannel: {'channel-1': all},
        pageLimit: 150,
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);
      addTearDown(adapter.releaseBeforeFetch);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      await notifier.loadMore();
      await _flushAsync();

      expect(
        container.read(chatViewModelProvider).hasMoreNewerMessages,
        isTrue,
      );

      adapter.holdBeforeFetch = true;
      final Future<void> olderLoad = notifier.loadMore();
      await _flushAsync();

      expect(container.read(chatViewModelProvider).isLoadingMore, isTrue);
      expect(await notifier.jumpToLatestMessages(), isFalse);

      adapter.releaseBeforeFetch();
      await olderLoad;
      await _flushAsync();
    },
  );

  test(
    'jumpToLatestMessages returns false while a newer page is loading',
    () async {
      final db = openTestDatabase();
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 500);
      final String targetId = all[100]['id']! as String;
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all.last['id']! as String),
        ),
      );
      for (final Map<String, Object?> message in all) {
        await db.messageDao.upsertMessage(
          _cachedMessage(id: message['id']! as String, channelId: 'channel-1'),
        );
      }
      final adapter = _PaginatingAdapter(
        messagesByChannel: {'channel-1': all},
        pageLimit: 30,
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);
      addTearDown(adapter.releaseAfterFetch);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1', targetMessageId: targetId);
      await _flushAsync();

      expect(
        container.read(chatViewModelProvider).hasMoreNewerMessages,
        isTrue,
      );

      adapter.holdAfterFetch = true;
      final Future<void> newerLoad = notifier.loadNewer();
      await _flushAsync();

      expect(container.read(chatViewModelProvider).isLoadingNewer, isTrue);
      expect(await notifier.jumpToLatestMessages(), isFalse);

      adapter.releaseAfterFetch();
      await newerLoad;
      await _flushAsync();
    },
  );

  test('jumpToLatestMessages requests the jump-to-present page size', () async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(_snowflakeForIndex(999)),
      ),
    );
    final List<Map<String, Object?>> all = _channelMessages('channel-1', 250);
    final adapter = _PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 250,
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    await notifier.loadMore();
    await _flushAsync();

    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isTrue);

    await notifier.jumpToLatestMessages();
    await _flushAsync();

    expect(adapter.lastLimit, '50');
  });
}

ProviderContainer _container(FluxerDatabase db, _PaginatingAdapter adapter) {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      appUiForegroundProvider.overrideWithValue(true),
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

class _PaginatingAdapter implements HttpClientAdapter {
  _PaginatingAdapter({required this.messagesByChannel, this.pageLimit = 50});

  final Map<String, List<Map<String, Object?>>> messagesByChannel;
  final int pageLimit;
  bool holdBeforeFetch = false;
  bool holdAfterFetch = false;
  bool holdAroundFetch = false;
  int aroundFetchCount = 0;
  int afterFetchCount = 0;
  String? lastLimit;
  Completer<void>? _beforeCompleter;
  Completer<void>? _afterCompleter;
  Completer<void>? _aroundCompleter;

  void releaseBeforeFetch() {
    holdBeforeFetch = false;
    final completer = _beforeCompleter;
    _beforeCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  void releaseAfterFetch() {
    holdAfterFetch = false;
    final completer = _afterCompleter;
    _afterCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  void releaseAroundFetch() {
    holdAroundFetch = false;
    final completer = _aroundCompleter;
    _aroundCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final match = RegExp(
      r'/channels/([^/]+)/messages$',
    ).firstMatch(options.uri.path);
    if (options.method == 'GET' && match != null) {
      final channelId = match.group(1)!;
      final all = messagesByChannel[channelId] ?? const [];
      final before = options.uri.queryParameters['before'];
      final after = options.uri.queryParameters['after'];
      final around = options.uri.queryParameters['around'];
      lastLimit = options.uri.queryParameters['limit'];
      if (around != null) {
        aroundFetchCount++;
        if (holdAroundFetch) {
          _aroundCompleter ??= Completer<void>();
          await _aroundCompleter!.future;
        }
      }
      if (before != null && holdBeforeFetch) {
        _beforeCompleter ??= Completer<void>();
        await _beforeCompleter!.future;
      }
      if (after != null && holdAfterFetch) {
        _afterCompleter ??= Completer<void>();
        await _afterCompleter!.future;
      }
      final List<Map<String, Object?>> page;
      if (before != null) {
        final older = all
            .where((m) => _compare(m['id']! as String, before) < 0)
            .toList();
        page = older.length <= pageLimit
            ? older
            : older.sublist(older.length - pageLimit);
      } else if (after != null) {
        afterFetchCount++;
        final newer = all
            .where((m) => _compare(m['id']! as String, after) > 0)
            .toList();
        page = newer.length <= pageLimit ? newer : newer.sublist(0, pageLimit);
      } else if (around != null) {
        final aroundIndex = all.indexWhere((m) => m['id'] == around);
        if (aroundIndex == -1) {
          page = const [];
        } else {
          final halfLimit = pageLimit ~/ 2;
          final end = (aroundIndex + halfLimit + 1).clamp(0, all.length);
          final start = (end - pageLimit).clamp(0, all.length);
          page = all.sublist(start, end);
        }
      } else {
        page = all.length <= pageLimit
            ? all
            : all.sublist(all.length - pageLimit);
      }
      // The real API returns newest-first; the repository reverses to ascending.
      final result = page.reversed.toList();
      return ResponseBody.fromString(
        jsonEncode(result),
        200,
        headers: {
          Headers.contentTypeHeader: ['application/json'],
        },
      );
    }
    return ResponseBody.fromString('Not found', 404);
  }

  int _compare(String a, String b) => int.parse(a).compareTo(int.parse(b));

  @override
  void close({bool force = false}) {}
}
