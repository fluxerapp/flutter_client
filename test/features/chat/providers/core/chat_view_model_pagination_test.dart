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
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/utils/message_page_sync.dart';
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

  test('a scroll-end trim bounds the window around the reader', () async {
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

    // Installs never trim: a directional trim landing mid-fling teleports
    // the viewport. The full merge stays attached to the tail.
    final merged = container.read(chatViewModelProvider);
    expect(merged.messages, hasLength(250));
    expect(merged.hasMoreNewerMessages, isFalse);

    // The scroll-end around-trim (the widget's settle path) bounds the
    // window around the reader and re-opens the dropped newer side.
    notifier.trimAroundVisible(oldestId);
    await _flushAsync();

    final bounded = container.read(chatViewModelProvider);
    expect(bounded.messages, hasLength(kTrimmedMessageWindowSize));
    expect(bounded.messages.first.id, oldestId);
    expect(bounded.messages.last.id, all[kTrimmedMessageWindowSize - 1]['id']);
    expect(bounded.messages.last.id, isNot(newestId));
    expect(bounded.hasMoreNewerMessages, isTrue);
  });

  test('recovery reconcile defers while the user is scrolling', () async {
    final db = openTestDatabase();
    final List<Map<String, Object?>> all = _channelMessages('channel-1', 250);
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
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    final int fetchesAfterOpen = adapter.messageFetchCount;
    final int epochBefore = container.read(chatViewModelProvider).windowEpoch;

    // A wholesale swap under an active fling resets the pagination pumps
    // and thrashes the window - the reconcile must wait for the scroll end.
    notifier.setUserScrollActive(channelId: 'channel-1', active: true);
    await notifier.refreshAfterSessionRecovery();
    await _flushAsync();
    expect(adapter.messageFetchCount, fetchesAfterOpen);
    expect(container.read(chatViewModelProvider).windowEpoch, epochBefore);

    notifier.setUserScrollActive(channelId: 'channel-1', active: false);
    await _flushAsync();
    expect(
      adapter.messageFetchCount,
      greaterThan(fetchesAfterOpen),
      reason: 'the deferred reconcile fires at scroll end',
    );
    expect(
      container.read(chatViewModelProvider).windowEpoch,
      greaterThan(epochBefore),
      reason: 'the reconcile install is a wholesale replacement',
    );
  });
  test('page loads pause at the in-memory cap until a trim shrinks the '
      'window', () async {
    final db = openTestDatabase();
    final List<Map<String, Object?>> all = _channelMessages('channel-1', 600);
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    final adapter = _PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 150,
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    expect(container.read(chatViewModelProvider).messages, hasLength(150));

    await notifier.loadMore();
    await _flushAsync();
    await notifier.loadMore();
    await _flushAsync();
    expect(container.read(chatViewModelProvider).messages, hasLength(450));
    expect(adapter.beforeFetchCount, 2);

    // 450 >= the hard cap: pause instead of installing - a directional trim
    // here would teleport a mid-fling viewport.
    final PageLoadResult capped = await notifier.loadMore();
    await _flushAsync();
    expect(capped.status, PageLoadStatus.skipped);
    expect(adapter.beforeFetchCount, 2, reason: 'no request at the cap');
    expect(container.read(chatViewModelProvider).messages, hasLength(450));

    // The scroll-end around-trim shrinks the window; loads resume.
    notifier.trimAroundVisible(
      container.read(chatViewModelProvider).messages.first.id,
    );
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages,
      hasLength(kTrimmedMessageWindowSize),
    );
    await notifier.loadMore();
    await _flushAsync();
    expect(adapter.beforeFetchCount, 3, reason: 'the paused edge resumes');
  });

  test('trimToNewestWindow is a no-op while newer messages remain', () async {
    final db = openTestDatabase();
    final List<Map<String, Object?>> all = _channelMessages('channel-1', 500);
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
      pageLimit: 250,
    );
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    // Open around a mid-history message: a detached window whose "newest"
    // row is history, so trimming to it would discard the live tail's claim.
    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      'channel-1',
      targetMessageId: all[250]['id']! as String,
    );
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.hasMoreNewerMessages, isTrue);
    // Above the cap, so only the newer-messages guard protects it.
    expect(state.messages.length, greaterThan(kMaxLoadedMessages));
    final messagesBeforeTrim = state.messages;

    notifier.trimToNewestWindow();

    expect(
      container.read(chatViewModelProvider).messages,
      same(messagesBeforeTrim),
    );
  });

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
            sampledTailId: newestServerBackedMessageId(
              container.read(chatViewModelProvider).messages,
            ),
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
          sampledTailId: newestServerBackedMessageId(
            container.read(chatViewModelProvider).messages,
          ),
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
          sampledTailId: newestServerBackedMessageId(
            container.read(chatViewModelProvider).messages,
          ),
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
            sampledTailId: newestServerBackedMessageId(
              container.read(chatViewModelProvider).messages,
            ),
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

  // A window built with around= is detached by construction. When the channel
  // pointer is missing the old code read that as "no newer messages", so
  // jump-to-latest early-returned into a plain scroll and stranded the user at
  // the bottom of the loaded history with no way back to the present.
  test(
    'jump to latest escapes an around window with no channel pointer',
    () async {
      final db = openTestDatabase();
      // Deliberately NO lastMessageId: the pointer is unknown.
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
        ),
      );
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 350);
      final String trueLatestId = all.last['id']! as String;
      final adapter = _PaginatingAdapter(messagesByChannel: {'channel-1': all});
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      // Open around a message deep in history: the window cannot reach the tail.
      await notifier.switchChannel(
        'channel-1',
        targetMessageId: all[100]['id']! as String,
      );
      await _flushAsync();

      final ChatViewState detached = container.read(chatViewModelProvider);
      expect(
        detached.messages.last.id,
        isNot(trueLatestId),
        reason: 'the around window must not already contain the present',
      );
      expect(
        detached.hasMoreNewerMessages,
        isTrue,
        reason:
            'an unknown pointer must fail open, not claim we are at the tail',
      );

      expect(await notifier.jumpToLatestMessages(), isTrue);
      await _flushAsync();

      expect(
        container.read(chatViewModelProvider).messages.last.id,
        trueLatestId,
        reason: 'jump to latest must reach the present, not the loaded bottom',
      );
    },
  );

  // Side (a). The compared id comes from a page just fetched from the network
  // while the pointer is a cached local value, so reaching the pointer proves
  // the POINTER is stale, not that we are at the tail. A detached window must
  // therefore fail open here exactly as it does for an unknown pointer.
  test('a stale pointer does not decide the tail for a detached window', () async {
    final db = openTestDatabase();
    final List<Map<String, Object?>> all = _channelMessages('channel-1', 350);
    final String target = all[100]['id']! as String;
    final String trueLatestId = all.last['id']! as String;
    // Pointer parked ON the jump target, so the around window loaded around it
    // extends NEWER than the pointer: stale, but present.
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(target),
      ),
    );
    final adapter = _PaginatingAdapter(messagesByChannel: {'channel-1': all});
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1', targetMessageId: target);
    await _flushAsync();

    final ChatViewState state = container.read(chatViewModelProvider);
    expect(
      state.messages.map((e) => e.id).contains(trueLatestId),
      isFalse,
      reason: 'the window must be genuinely detached from the present',
    );
    expect(
      int.parse(state.messages.last.id) > int.parse(target),
      isTrue,
      reason: 'the window must extend newer than the pointer, ie stale',
    );
    expect(
      state.hasMoreNewerMessages,
      isTrue,
      reason:
          'newer messages do exist, and a stale pointer must not be trusted to '
          'say otherwise for a window that is detached by construction',
    );
  });

  // Side (b), the other half of the same rule: without it, (a) could be
  // satisfied by hardcoding true. A direct latest page genuinely IS the tail,
  // so the same stale comparison must still report no newer messages there.
  test(
    'a stale pointer still reports the tail for a direct latest load',
    () async {
      final db = openTestDatabase();
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 350);
      // Pointer well behind the real newest message: stale, but present.
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all[300]['id']! as String),
        ),
      );
      final adapter = _PaginatingAdapter(messagesByChannel: {'channel-1': all});
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      // No targetMessageId: this is a direct latest load, not a detached window.
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(
        state.messages.last.id,
        all.last['id']! as String,
        reason: 'a direct latest load must sit on the real newest message',
      );
      expect(
        state.hasMoreNewerMessages,
        isFalse,
        reason:
            'a latest page IS the tail, so failing open here would cost a fetch '
            'for nothing',
      );
    },
  );

  // Case (c). Equality returns false regardless of how the window was built, so
  // the healthy direct-latest case is unchanged by the fail-open above.
  test(
    'a pointer equal to the tail of a direct latest load reports the tail',
    () async {
      final db = openTestDatabase();
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 350);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all.last['id']! as String),
        ),
      );
      final adapter = _PaginatingAdapter(messagesByChannel: {'channel-1': all});
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(
        state.messages.last.id,
        all.last['id']! as String,
        reason: 'the window must sit on the real newest message',
      );
      expect(
        state.hasMoreNewerMessages,
        isFalse,
        reason: 'an accurate pointer on a tail-built window means no newer',
      );
    },
  );

  // Mutation (h) guard. Tapping B while A's around-load is still in flight used
  // to hit a silent drop: B highlighted, then A completed, scrolled to A and
  // overwrote the window. The user landed on the message they did NOT ask for.
  test(
    'a jump requested mid-load preempts the in-flight one and lands',
    () async {
      final db = openTestDatabase();
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 350);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all.last['id']! as String),
        ),
      );
      final adapter = _PaginatingAdapter(messagesByChannel: {'channel-1': all});
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      ChatViewState st() => container.read(chatViewModelProvider);

      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final String targetA = all[20]['id']! as String;
      final String targetB = all[60]['id']! as String;
      expect(st().messages.map((e) => e.id).contains(targetA), isFalse);
      expect(st().messages.map((e) => e.id).contains(targetB), isFalse);

      // A is a ROUTE LOAD, not a jump: switchChannel owns isLoading via
      // _switchedChannelState, and that is the flag the preempt can strand.
      adapter.holdAroundFetch = true;
      unawaited(notifier.switchChannel('channel-1', targetMessageId: targetA));
      await _flushAsync();
      expect(
        adapter.aroundFetchHeld,
        isTrue,
        reason: 'A must genuinely be in flight when B preempts it',
      );
      expect(
        st().isLoading,
        isTrue,
        reason: 'and it must have taken ownership of isLoading',
      );

      // The user taps B while A is still loading. This must NOT be dropped.
      final Future<void> jumpB = notifier.goToRepliedMessage(
        channelId: 'channel-1',
        messageId: targetB,
      );
      await _flushAsync();
      adapter.releaseAroundFetch();
      await jumpB;
      await _flushAsync();
      await _flushAsync();

      final ChatViewState finalState = st();
      expect(
        finalState.messages.map((e) => e.id).contains(targetB),
        isTrue,
        reason:
            'B must LAND: its window has to be applied, not just highlighted',
      );
      expect(
        finalState.scrollToMessageSignal?.$1,
        targetB,
        reason: 'and the view must be told to scroll to B, not to A',
      );
      // Flag ownership: the preempted switch set isLoading and can no longer
      // reach its own clearing paths, so the winner must clear both or the
      // channel is wedged busy with no exit.
      expect(
        finalState.isLoading,
        isFalse,
        reason:
            'a stuck isLoading kills the jump button, freezes the sync dedupe '
            'and locks out the stranded-empty recovery: a permanent spinner',
      );
      expect(finalState.isSyncingMessages, isFalse);
    },
  );

  // The failure path of the same preempt: B preempts A and then comes back
  // empty. The flags must still clear, or the stranded-empty recovery that
  // would rescue the channel is itself locked out by isLoading.
  test(
    'a preempting jump that returns nothing still releases the channel',
    () async {
      final db = openTestDatabase();
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 60);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all.last['id']! as String),
        ),
      );
      final adapter = _PaginatingAdapter(messagesByChannel: {'channel-1': all});
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      // A target that does not exist, so the around page comes back empty.
      await notifier.goToRepliedMessage(channelId: 'channel-1', messageId: '1');
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(
        state.isLoading,
        isFalse,
        reason: 'an empty result must not leave the channel busy',
      );
      expect(state.isSyncingMessages, isFalse);
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
    // Detach the widget-settle way: the scroll-end around-trim near the
    // oldest row drops the tail side.
    notifier.trimAroundVisible(
      container.read(chatViewModelProvider).messages.first.id,
    );
    await _flushAsync();

    // Near-bottom viewport isolates the hasMoreNewerMessages guard.
    container
        .read(chatReadViewportProvider.notifier)
        .updateViewport(
          channelId: 'channel-1',
          nearLoadedTail: true,
          distanceFromBottom: 0,
          viewportHeight: 0,
          sampledTailId: newestServerBackedMessageId(
            container.read(chatViewModelProvider).messages,
          ),
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

  test('jumpToLatestMessages preempts an in-flight older page', () async {
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
    notifier.trimAroundVisible(
      container.read(chatViewModelProvider).messages.first.id,
    );
    await _flushAsync();

    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isTrue);

    adapter.holdBeforeFetch = true;
    final Future<void> olderLoad = notifier.loadMore();
    await _flushAsync();

    expect(container.read(chatViewModelProvider).isLoadingMore, isTrue);
    // The jump is the only escape hatch out of a detached window, so it
    // must not be refused by pagination that it is about to supersede.
    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isFalse);
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      all.last['id'],
    );

    adapter.releaseBeforeFetch();
    await olderLoad;
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      all.last['id'],
      reason: 'the superseded older page must not rebuild the old window',
    );
  });

  test('jumpToLatestMessages preempts an in-flight newer page', () async {
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

    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isTrue);

    adapter.holdAfterFetch = true;
    final Future<void> newerLoad = notifier.loadNewer();
    await _flushAsync();

    expect(container.read(chatViewModelProvider).isLoadingNewer, isTrue);
    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isFalse);
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      all.last['id'],
    );

    adapter.releaseAfterFetch();
    await newerLoad;
    await _flushAsync();
  });

  test('jumpToLatestMessages requests the jump-to-present page size', () async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    // Detach by paging back past the cap, then applying the scroll-end
    // around-trim near the oldest row. The channel watermark deliberately
    // stays unset: it may only confirm the tail, never manufacture "has
    // newer".
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
    notifier.trimAroundVisible(
      container.read(chatViewModelProvider).messages.first.id,
    );
    await _flushAsync();

    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isTrue);

    await notifier.jumpToLatestMessages();
    await _flushAsync();

    expect(adapter.lastLimit, '50');
  });

  // (g) Epoch on refresh: a same-channel session-recovery refresh replaces the
  // window wholesale (its commit bumps windowEpoch) while an older page is on
  // the wire. The released page must come back superseded, carrying the epoch
  // captured at request entry, and must merge nothing into the refreshed
  // window.
  test('held loadMore returns superseded with its entry epoch after a '
      'same-channel network refresh', () async {
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
      pageLimit: 150,
    );
    final container = _container(db, adapter);
    addTearDown(() {
      adapter.releaseBeforeFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(opened.hasMoreMessages, isTrue);
    final int entryEpoch = opened.windowEpoch;
    // The window holds the newest 150 rows; the held older page will carry
    // the 150 rows below it.
    final Set<String> stalePageIds = {
      for (final Map<String, Object?> m in all.sublist(0, 150))
        m['id']! as String,
    };

    adapter.holdBeforeFetch = true;
    final Future<PageLoadResult> staleLoad = notifier.loadMore();
    await _flushAsync();
    expect(adapter.beforeFetchHeld, isTrue);

    await notifier.refreshAfterSessionRecovery();
    await _flushAsync();

    final ChatViewState refreshed = container.read(chatViewModelProvider);
    expect(refreshed.channelId, 'channel-1');
    expect(
      refreshed.windowEpoch,
      greaterThan(entryEpoch),
      reason: 'the refresh install is a wholesale replacement: epoch bumps',
    );

    adapter.releaseBeforeFetch();
    final PageLoadResult result = await staleLoad;
    await _flushAsync();

    expect(result.status, PageLoadStatus.superseded);
    expect(result.edge, PaginationEdge.older);
    expect(result.channelId, 'channel-1');
    expect(
      result.windowEpoch,
      entryEpoch,
      reason: 'the result carries the stale epoch captured at request entry',
    );

    final ChatViewState after = container.read(chatViewModelProvider);
    expect(after.windowEpoch, refreshed.windowEpoch);
    expect(
      after.messages,
      same(refreshed.messages),
      reason: 'the stale older page merged nothing into the refreshed window',
    );
    expect(
      after.messages.map((m) => m.id).toSet().intersection(stalePageIds),
      isEmpty,
    );
    expect(after.isLoadingMore, isFalse);
  });

  // (h) Epoch on a same-channel blank: switchChannel with a target on the SAME
  // channel blanks the window with channelId unchanged, so a supersession
  // check keyed on channelId alone would let the held page land. The epoch is
  // the key.
  test('held loadMore returns superseded after a same-channel target open - '
      'channelId alone is not the supersession key', () async {
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
      pageLimit: 150,
    );
    final container = _container(db, adapter);
    addTearDown(() {
      adapter.releaseBeforeFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();

    final int entryEpoch = container.read(chatViewModelProvider).windowEpoch;
    // Deep in history, outside the loaded newest-150 window, so the target
    // open takes the blank-and-load-around path instead of an in-memory
    // scroll.
    final String targetId = all[20]['id']! as String;

    adapter.holdBeforeFetch = true;
    final Future<PageLoadResult> staleLoad = notifier.loadMore();
    await _flushAsync();
    expect(adapter.beforeFetchHeld, isTrue);

    await notifier.switchChannel('channel-1', targetMessageId: targetId);
    await _flushAsync();

    final ChatViewState jumped = container.read(chatViewModelProvider);
    expect(
      jumped.channelId,
      'channel-1',
      reason: 'the channel never changed across the race',
    );
    expect(jumped.windowEpoch, greaterThan(entryEpoch));
    expect(jumped.messages.map((m) => m.id), contains(targetId));

    adapter.releaseBeforeFetch();
    final PageLoadResult result = await staleLoad;
    await _flushAsync();

    expect(result.status, PageLoadStatus.superseded);
    expect(result.channelId, 'channel-1');
    expect(result.windowEpoch, entryEpoch);

    final ChatViewState after = container.read(chatViewModelProvider);
    expect(after.channelId, 'channel-1');
    expect(
      after.messages,
      same(jumped.messages),
      reason: 'the stale older page merged nothing into the target window',
    );
    expect(after.isLoadingMore, isFalse);
  });

  // (i) The epoch catches what applyNewerPage's boundary supersession alone
  // cannot: a refresh that preserves the loaded window keeps the IDENTICAL
  // newest-boundary id the held request was issued with, so the boundary check
  // would accept the stale page into the replaced window.
  test(
    'held loadNewer returns superseded when a refresh preserves the identical '
    'newest boundary',
    () async {
      final db = openTestDatabase();
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 500);
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
        pageLimit: 30,
      );
      final container = _container(db, adapter);
      addTearDown(() {
        adapter.releaseAfterFetch();
        container.dispose();
      });

      // A detached window around a mid-history target: hasMoreNewer is true,
      // so loadNewer really goes to the wire.
      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel(
        'channel-1',
        targetMessageId: all[100]['id']! as String,
      );
      await _flushAsync();

      final ChatViewState opened = container.read(chatViewModelProvider);
      expect(opened.hasMoreNewerMessages, isTrue);
      final int entryEpoch = opened.windowEpoch;
      final String boundary = opened.messages.last.id;

      adapter.holdAfterFetch = true;
      final Future<PageLoadResult> staleLoad = notifier.loadNewer();
      await _flushAsync();
      expect(adapter.afterFetchHeld, isTrue);

      // The window-preserving refresh replaces the window wholesale but keeps
      // its rows, so the newest boundary id is byte-identical to the cursor
      // the held request was issued with.
      await notifier.refreshAfterSessionRecovery();
      await _flushAsync();

      final ChatViewState refreshed = container.read(chatViewModelProvider);
      expect(refreshed.windowEpoch, greaterThan(entryEpoch));
      expect(
        refreshed.messages.last.id,
        boundary,
        reason: 'the refresh preserved the exact boundary the request named',
      );
      expect(refreshed.hasMoreNewerMessages, isTrue);

      adapter.releaseAfterFetch();
      final PageLoadResult result = await staleLoad;
      await _flushAsync();

      expect(result.status, PageLoadStatus.superseded);
      expect(result.edge, PaginationEdge.newer);
      expect(result.requestCursor, boundary);
      expect(result.windowEpoch, entryEpoch);

      final ChatViewState after = container.read(chatViewModelProvider);
      expect(
        after.messages,
        same(refreshed.messages),
        reason:
            'the stale page merged NOTHING: the post-release window is the '
            'refreshed install, byte-identical',
      );
      expect(after.messages.last.id, boundary);
      expect(after.isLoadingNewer, isFalse);
    },
  );

  test(
    'loadMore clears loading and allows retry after network failure',
    () async {
      final db = openTestDatabase();
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
        ),
      );
      final List<Map<String, Object?>> all = _channelMessages('channel-1', 120);
      final String olderId = all[20]['id']! as String;
      final adapter = _PaginatingAdapter(messagesByChannel: {'channel-1': all})
        ..beforeFetchFailuresRemaining = 1;
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final String oldestBeforeLoad = container
          .read(chatViewModelProvider)
          .messages
          .first
          .id;

      await notifier.loadMore();
      await _flushAsync();

      final ChatViewState afterFailure = container.read(chatViewModelProvider);
      expect(afterFailure.isLoadingMore, isFalse);
      expect(afterFailure.messages.first.id, oldestBeforeLoad);

      await notifier.loadMore();
      await _flushAsync();

      final ChatViewState afterRetry = container.read(chatViewModelProvider);
      expect(afterRetry.isLoadingMore, isFalse);
      expect(afterRetry.messages.first.id, olderId);
      expect(afterRetry.messages.first.id, isNot(oldestBeforeLoad));
    },
  );

  test('publishes network messages before guild hydrate completes', () async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    final String networkId = _snowflakeForIndex(5);
    final adapter = _PaginatingAdapter(
      messagesByChannel: {
        'channel-1': [
          _messageJson(
            id: networkId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
      },
    );
    final Completer<void> hydrateHold = Completer<void>();
    final container = _container(
      db,
      adapter,
      hydrationService: _HoldingGuildMemberHydrationService(
        database: db,
        hold: hydrateHold,
      ),
    );
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    final Future<void> load = notifier.switchChannel('channel-1');
    await _flushAsync();

    final ChatViewState state = container.read(chatViewModelProvider);
    expect(state.messages, hasLength(1));
    expect(state.messages.first.id, networkId);
    expect(hydrateHold.isCompleted, isFalse);

    hydrateHold.complete();
    await load;
    await _flushAsync();
  });
}

ProviderContainer _container(
  FluxerDatabase db,
  _PaginatingAdapter adapter, {
  GuildMemberHydrationService? hydrationService,
}) {
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
        hydrationService ?? NoopGuildMemberHydrationService(database: db),
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
  int beforeFetchFailuresRemaining = 0;
  int aroundFetchCount = 0;
  int afterFetchCount = 0;
  int beforeFetchCount = 0;
  int messageFetchCount = 0;
  String? lastLimit;
  Completer<void>? _beforeCompleter;
  Completer<void>? _afterCompleter;
  Completer<void>? _aroundCompleter;

  /// True while a hold is actually engaged, so a test can PIN the interleaving
  /// instead of assuming the race happened.
  bool get beforeFetchHeld => _beforeCompleter != null;

  bool get aroundFetchHeld => _aroundCompleter != null;

  bool get afterFetchHeld => _afterCompleter != null;

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
      messageFetchCount++;
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
        beforeFetchCount++;
        if (beforeFetchFailuresRemaining > 0) {
          beforeFetchFailuresRemaining--;
          throw DioException(
            requestOptions: options,
            type: DioExceptionType.badResponse,
            response: Response(requestOptions: options, statusCode: 500),
          );
        }
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

class _HoldingGuildMemberHydrationService
    extends NoopGuildMemberHydrationService {
  _HoldingGuildMemberHydrationService({
    required super.database,
    required this.hold,
  });

  final Completer<void> hold;

  @override
  Future<void> hydrateMembers({
    required String guildId,
    required Iterable<String> userIds,
    void Function(String userId)? onMemberFetched,
  }) async {
    await hold.future;
  }
}
