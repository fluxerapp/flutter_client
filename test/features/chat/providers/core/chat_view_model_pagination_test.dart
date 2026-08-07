@Tags(['slow'])
library;

import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/message_page_sync.dart';

import '../../../../helpers/chat_view_model_pagination_test_harness.dart';
import '../../../../helpers/open_test_database.dart';

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
    final List<Map<String, Object?>> loaded = paginationChannelMessages(
      'channel-1',
      kMaxLoadedMessages,
    );
    final adapter = PaginatingAdapter(
      messagesByChannel: {'channel-1': loaded},
      pageLimit: kMaxLoadedMessages,
    );
    final container = paginationContainer(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await paginationFlushAsync();

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
    final List<Map<String, Object?>> all = paginationChannelMessages(
      'channel-1',
      250,
    );
    final String oldestId = all.first['id']! as String;
    final String newestId = all.last['id']! as String;
    final adapter = PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 150,
    );
    final container = paginationContainer(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await paginationFlushAsync();

    final initial = container.read(chatViewModelProvider);
    expect(initial.messages.last.id, newestId);
    expect(initial.hasMoreNewerMessages, isFalse);
    expect(initial.messages, hasLength(150));

    await notifier.loadMore();
    await paginationFlushAsync();

    // Installs never trim: a directional trim landing mid-fling teleports
    // the viewport. The full merge stays attached to the tail.
    final merged = container.read(chatViewModelProvider);
    expect(merged.messages, hasLength(250));
    expect(merged.hasMoreNewerMessages, isFalse);

    // The scroll-end around-trim (the widget's settle path) bounds the
    // window around the reader and re-opens the dropped newer side.
    notifier.trimAroundVisible(oldestId);
    await paginationFlushAsync();

    final bounded = container.read(chatViewModelProvider);
    expect(bounded.messages, hasLength(kTrimmedMessageWindowSize));
    expect(bounded.messages.first.id, oldestId);
    expect(bounded.messages.last.id, all[kTrimmedMessageWindowSize - 1]['id']);
    expect(bounded.messages.last.id, isNot(newestId));
    expect(bounded.hasMoreNewerMessages, isTrue);
  });

  test('recovery reconcile defers while the user is scrolling', () async {
    final db = openTestDatabase();
    final List<Map<String, Object?>> all = paginationChannelMessages(
      'channel-1',
      250,
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(all.last['id']! as String),
      ),
    );
    final adapter = PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 150,
    );
    final container = paginationContainer(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await paginationFlushAsync();
    final int fetchesAfterOpen = adapter.messageFetchCount;
    final int epochBefore = container.read(chatViewModelProvider).windowEpoch;

    // A wholesale swap under an active fling resets the pagination pumps
    // and thrashes the window - the reconcile must wait for the scroll end.
    notifier.setUserScrollActive(channelId: 'channel-1', active: true);
    await notifier.refreshAfterSessionRecovery();
    await paginationFlushAsync();
    expect(adapter.messageFetchCount, fetchesAfterOpen);
    expect(container.read(chatViewModelProvider).windowEpoch, epochBefore);

    notifier.setUserScrollActive(channelId: 'channel-1', active: false);
    await paginationFlushAsync();
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
    final List<Map<String, Object?>> all = paginationChannelMessages(
      'channel-1',
      600,
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    final adapter = PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 150,
    );
    final container = paginationContainer(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await paginationFlushAsync();
    expect(container.read(chatViewModelProvider).messages, hasLength(150));

    await notifier.loadMore();
    await paginationFlushAsync();
    await notifier.loadMore();
    await paginationFlushAsync();
    expect(container.read(chatViewModelProvider).messages, hasLength(450));
    expect(adapter.beforeFetchCount, 2);

    // 450 >= the hard cap: pause instead of installing - a directional trim
    // here would teleport a mid-fling viewport.
    final PageLoadResult capped = await notifier.loadMore();
    await paginationFlushAsync();
    expect(capped.status, PageLoadStatus.skipped);
    expect(adapter.beforeFetchCount, 2, reason: 'no request at the cap');
    expect(container.read(chatViewModelProvider).messages, hasLength(450));

    // The scroll-end around-trim shrinks the window; loads resume.
    notifier.trimAroundVisible(
      container.read(chatViewModelProvider).messages.first.id,
    );
    await paginationFlushAsync();
    expect(
      container.read(chatViewModelProvider).messages,
      hasLength(kTrimmedMessageWindowSize),
    );
    await notifier.loadMore();
    await paginationFlushAsync();
    expect(adapter.beforeFetchCount, 3, reason: 'the paused edge resumes');
  });

  test('trimToNewestWindow is a no-op while newer messages remain', () async {
    final db = openTestDatabase();
    final List<Map<String, Object?>> all = paginationChannelMessages(
      'channel-1',
      500,
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(all.last['id']! as String),
      ),
    );
    final adapter = PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 250,
    );
    final container = paginationContainer(db, adapter);
    addTearDown(container.dispose);

    // Open around a mid-history message: a detached window whose "newest"
    // row is history, so trimming to it would discard the live tail's claim.
    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      'channel-1',
      targetMessageId: all[250]['id']! as String,
    );
    await paginationFlushAsync();

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
      final String newMessageId = paginationSnowflakeForIndex(
        kMaxLoadedMessages,
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
      paginationEmitCreatedMessage(container, id: newMessageId);
      await paginationFlushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.messages, hasLength(kMaxLoadedMessages + 1));
      expect(state.messages.first.id, oldestSeededId);
      expect(state.messages.last.id, newMessageId);
    },
  );

  test('realtime create at live tail trims to newest window', () async {
    final (container, notifier, _) = await setUpLoadedLiveTailWindow();
    final String newMessageId = paginationSnowflakeForIndex(kMaxLoadedMessages);
    final String firstRetainedId = paginationSnowflakeForIndex(
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
    paginationEmitCreatedMessage(container, id: newMessageId);
    await paginationFlushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.messages, hasLength(kTrimmedMessageWindowSize));
    expect(state.messages.first.id, firstRetainedId);
    expect(state.messages.last.id, newMessageId);
    expect(state.hasMoreMessages, isTrue);
  });

  test('trimToNewestWindow trims a live-tail window past the cap', () async {
    final (container, notifier, _) = await setUpLoadedLiveTailWindow();
    final String newMessageId = paginationSnowflakeForIndex(kMaxLoadedMessages);

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
    paginationEmitCreatedMessage(container, id: newMessageId);
    await paginationFlushAsync();
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
      final String firstNewMessageId = paginationSnowflakeForIndex(
        kMaxLoadedMessages,
      );
      final String secondNewMessageId = paginationSnowflakeForIndex(
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
      paginationEmitCreatedMessage(container, id: firstNewMessageId);
      paginationEmitCreatedMessage(container, id: secondNewMessageId);
      await paginationFlushAsync();

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
    final List<Map<String, Object?>> channel1 = paginationChannelMessages(
      'channel-1',
      100,
    );
    final List<Map<String, Object?>> channel2 = paginationChannelMessages(
      'channel-2',
      5,
      baseIndex: 100000,
    );
    final Set<String> channel1Ids = {
      for (final m in channel1) m['id']! as String,
    };
    final adapter = PaginatingAdapter(
      messagesByChannel: {'channel-1': channel1, 'channel-2': channel2},
      pageLimit: 40,
    );
    final container = paginationContainer(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await paginationFlushAsync();

    // Hold only the older-page fetch so the channel-2 switch can complete.
    adapter.holdBeforeFetch = true;
    final Future<void> staleLoad = notifier.loadMore();
    await paginationFlushAsync();

    await notifier.switchChannel('channel-2');
    await paginationFlushAsync();
    expect(container.read(chatViewModelProvider).channelId, 'channel-2');

    adapter.releaseBeforeFetch();
    await staleLoad;
    await paginationFlushAsync();

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
      final List<Map<String, Object?>> all = paginationChannelMessages(
        'channel-1',
        300,
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all.last['id']! as String),
        ),
      );
      final adapter = PaginatingAdapter(
        messagesByChannel: {'channel-1': all},
        pageLimit: 40,
      );
      final container = paginationContainer(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();

      final Set<String> stalePageIds = {
        for (final message in all.sublist(220, 260)) message['id']! as String,
      };
      adapter.holdBeforeFetch = true;
      final Future<void> staleLoad = notifier.loadMore();
      await paginationFlushAsync();

      final String targetId = all[50]['id']! as String;
      await notifier.goToRepliedMessage(
        channelId: 'channel-1',
        messageId: targetId,
      );
      await paginationFlushAsync();
      expect(
        container.read(chatViewModelProvider).messages.map((m) => m.id),
        contains(targetId),
      );

      adapter.releaseBeforeFetch();
      await staleLoad;
      await paginationFlushAsync();

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
      final List<Map<String, Object?>> messages = paginationChannelMessages(
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
      final adapter = PaginatingAdapter(
        messagesByChannel: {'channel-1': messages},
      );
      final container = paginationContainer(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();

      final String missingId = paginationSnowflakeForIndex(999);
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
    final List<Map<String, Object?>> channel1 = paginationChannelMessages(
      'channel-1',
      100,
    );
    final List<Map<String, Object?>> channel2 = paginationChannelMessages(
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
    final adapter = PaginatingAdapter(
      messagesByChannel: {'channel-1': channel1, 'channel-2': channel2},
      pageLimit: 10,
    )..holdAroundFetch = true;
    final container = paginationContainer(db, adapter);
    addTearDown(() {
      adapter.releaseAroundFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await paginationFlushAsync();

    final Future<void> staleJump = notifier.goToRepliedMessage(
      channelId: 'channel-1',
      messageId: channel1[10]['id']! as String,
    );
    await paginationFlushAsync();
    expect(adapter.aroundFetchCount, 1);

    await notifier.switchChannel('channel-2');
    await paginationFlushAsync();
    adapter.releaseAroundFetch();
    await staleJump;
    await paginationFlushAsync();

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
    final List<Map<String, Object?>> all = paginationChannelMessages(
      'channel-1',
      1000,
    );
    final String targetId = all[149]['id']! as String;
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(all.last['id']! as String),
      ),
    );
    final adapter = PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 150,
    );
    final container = paginationContainer(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1', targetMessageId: targetId);
    await paginationFlushAsync();

    final before = container.read(chatViewModelProvider);
    expect(before.hasMoreNewerMessages, isTrue);
    expect(before.messages, isNotEmpty);

    await notifier.refreshAfterSessionRecovery();
    await paginationFlushAsync();

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
      final List<Map<String, Object?>> all = paginationChannelMessages(
        'channel-1',
        500,
      );
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
          paginationCachedMessage(
            id: message['id']! as String,
            channelId: 'channel-1',
          ),
        );
      }
      final adapter = PaginatingAdapter(
        messagesByChannel: {'channel-1': all},
        pageLimit: 30,
      );
      final container = paginationContainer(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1', targetMessageId: targetId);
      await paginationFlushAsync();

      var state = container.read(chatViewModelProvider);
      expect(state.hasMoreNewerMessages, isTrue);

      for (var i = 0; i < 8; i++) {
        if (!state.hasMoreMessages) {
          break;
        }
        await notifier.loadMore();
        await paginationFlushAsync();
        state = container.read(chatViewModelProvider);
      }
      expect(state.hasMoreNewerMessages, isTrue);
      expect(state.messages.length, lessThanOrEqualTo(kMaxLoadedMessages));

      final String tailBefore = state.messages.last.id;
      await notifier.loadNewer();
      await paginationFlushAsync();

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
      final List<Map<String, Object?>> all = paginationChannelMessages(
        'channel-1',
        350,
      );
      final String trueLatestId = all.last['id']! as String;
      final adapter = PaginatingAdapter(messagesByChannel: {'channel-1': all});
      final container = paginationContainer(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      // Open around a message deep in history: the window cannot reach the tail.
      await notifier.switchChannel(
        'channel-1',
        targetMessageId: all[100]['id']! as String,
      );
      await paginationFlushAsync();

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
      await paginationFlushAsync();

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
    final List<Map<String, Object?>> all = paginationChannelMessages(
      'channel-1',
      350,
    );
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
    final adapter = PaginatingAdapter(messagesByChannel: {'channel-1': all});
    final container = paginationContainer(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1', targetMessageId: target);
    await paginationFlushAsync();

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
      final List<Map<String, Object?>> all = paginationChannelMessages(
        'channel-1',
        350,
      );
      // Pointer well behind the real newest message: stale, but present.
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all[300]['id']! as String),
        ),
      );
      final adapter = PaginatingAdapter(messagesByChannel: {'channel-1': all});
      final container = paginationContainer(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      // No targetMessageId: this is a direct latest load, not a detached window.
      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();

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
      final List<Map<String, Object?>> all = paginationChannelMessages(
        'channel-1',
        350,
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all.last['id']! as String),
        ),
      );
      final adapter = PaginatingAdapter(messagesByChannel: {'channel-1': all});
      final container = paginationContainer(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();

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
      final List<Map<String, Object?>> all = paginationChannelMessages(
        'channel-1',
        350,
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all.last['id']! as String),
        ),
      );
      final adapter = PaginatingAdapter(messagesByChannel: {'channel-1': all});
      final container = paginationContainer(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      ChatViewState st() => container.read(chatViewModelProvider);

      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();

      final String targetA = all[20]['id']! as String;
      final String targetB = all[60]['id']! as String;
      expect(st().messages.map((e) => e.id).contains(targetA), isFalse);
      expect(st().messages.map((e) => e.id).contains(targetB), isFalse);

      // A is a ROUTE LOAD, not a jump: switchChannel owns isLoading via
      // _switchedChannelState, and that is the flag the preempt can strand.
      adapter.holdAroundFetch = true;
      unawaited(notifier.switchChannel('channel-1', targetMessageId: targetA));
      await paginationFlushAsync();
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
      await paginationFlushAsync();
      adapter.releaseAroundFetch();
      await jumpB;
      await paginationFlushAsync();
      await paginationFlushAsync();

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
      final List<Map<String, Object?>> all = paginationChannelMessages(
        'channel-1',
        60,
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          lastMessageId: Value(all.last['id']! as String),
        ),
      );
      final adapter = PaginatingAdapter(messagesByChannel: {'channel-1': all});
      final container = paginationContainer(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();

      // A target that does not exist, so the around page comes back empty.
      await notifier.goToRepliedMessage(channelId: 'channel-1', messageId: '1');
      await paginationFlushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(
        state.isLoading,
        isFalse,
        reason: 'an empty result must not leave the channel busy',
      );
      expect(state.isSyncingMessages, isFalse);
    },
  );
}
