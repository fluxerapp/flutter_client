@Tags(['slow'])
library;

import 'dart:async';

import 'package:drift/drift.dart';
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
  test('refreshAfterSessionRecovery preserves a scrolled-up window', () async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(paginationSnowflakeForIndex(999)),
      ),
    );
    final List<Map<String, Object?>> all = paginationChannelMessages(
      'channel-1',
      350,
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
    await notifier.loadMore();
    await paginationFlushAsync();
    notifier.trimAroundVisible(
      container.read(chatViewModelProvider).messages.first.id,
    );
    await paginationFlushAsync();

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
    await paginationFlushAsync();

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
        lastMessageId: Value(paginationSnowflakeForIndex(999)),
      ),
    );
    final List<Map<String, Object?>> all = paginationChannelMessages(
      'channel-1',
      350,
    );
    final adapter = PaginatingAdapter(
      messagesByChannel: {'channel-1': all},
      pageLimit: 150,
    );
    final container = paginationContainer(db, adapter);
    addTearDown(container.dispose);
    addTearDown(adapter.releaseBeforeFetch);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await paginationFlushAsync();
    await notifier.loadMore();
    await paginationFlushAsync();
    notifier.trimAroundVisible(
      container.read(chatViewModelProvider).messages.first.id,
    );
    await paginationFlushAsync();

    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isTrue);

    adapter.holdBeforeFetch = true;
    final Future<void> olderLoad = notifier.loadMore();
    await paginationFlushAsync();

    expect(container.read(chatViewModelProvider).isLoadingMore, isTrue);
    expect(await notifier.jumpToLatestMessages(), isTrue);
    await paginationFlushAsync();
    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isFalse);
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      all.last['id'],
    );

    adapter.releaseBeforeFetch();
    await olderLoad;
    await paginationFlushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      all.last['id'],
      reason: 'the superseded older page must not rebuild the old window',
    );
  });

  test('jumpToLatestMessages preempts an in-flight newer page', () async {
    final db = openTestDatabase();
    final List<Map<String, Object?>> all = paginationChannelMessages(
      'channel-1',
      500,
    );
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
    addTearDown(adapter.releaseAfterFetch);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1', targetMessageId: targetId);
    await paginationFlushAsync();

    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isTrue);

    adapter.holdAfterFetch = true;
    final Future<void> newerLoad = notifier.loadNewer();
    await paginationFlushAsync();

    expect(container.read(chatViewModelProvider).isLoadingNewer, isTrue);
    expect(await notifier.jumpToLatestMessages(), isTrue);
    await paginationFlushAsync();
    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isFalse);
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      all.last['id'],
    );

    adapter.releaseAfterFetch();
    await newerLoad;
    await paginationFlushAsync();
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
    final List<Map<String, Object?>> all = paginationChannelMessages(
      'channel-1',
      350,
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
    await notifier.loadMore();
    await paginationFlushAsync();
    notifier.trimAroundVisible(
      container.read(chatViewModelProvider).messages.first.id,
    );
    await paginationFlushAsync();

    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isTrue);

    await notifier.jumpToLatestMessages();
    await paginationFlushAsync();

    expect(adapter.lastLimit, '50');
  });

  test('held loadMore returns superseded with its entry epoch after a '
      'same-channel network refresh', () async {
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
      pageLimit: 150,
    );
    final container = paginationContainer(db, adapter);
    addTearDown(() {
      adapter.releaseBeforeFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await paginationFlushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(opened.hasMoreMessages, isTrue);
    final int entryEpoch = opened.windowEpoch;
    final Set<String> stalePageIds = {
      for (final Map<String, Object?> m in all.sublist(0, 150))
        m['id']! as String,
    };

    adapter.holdBeforeFetch = true;
    final Future<PageLoadResult> staleLoad = notifier.loadMore();
    await paginationFlushAsync();
    expect(adapter.beforeFetchHeld, isTrue);

    await notifier.refreshAfterSessionRecovery();
    await paginationFlushAsync();

    final ChatViewState refreshed = container.read(chatViewModelProvider);
    expect(refreshed.channelId, 'channel-1');
    expect(
      refreshed.windowEpoch,
      greaterThan(entryEpoch),
      reason: 'the refresh install is a wholesale replacement: epoch bumps',
    );

    adapter.releaseBeforeFetch();
    final PageLoadResult result = await staleLoad;
    await paginationFlushAsync();

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

  test('held loadMore returns superseded after a same-channel target open - '
      'channelId alone is not the supersession key', () async {
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
      pageLimit: 150,
    );
    final container = paginationContainer(db, adapter);
    addTearDown(() {
      adapter.releaseBeforeFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await paginationFlushAsync();

    final int entryEpoch = container.read(chatViewModelProvider).windowEpoch;
    final String targetId = all[20]['id']! as String;

    adapter.holdBeforeFetch = true;
    final Future<PageLoadResult> staleLoad = notifier.loadMore();
    await paginationFlushAsync();
    expect(adapter.beforeFetchHeld, isTrue);

    await notifier.switchChannel('channel-1', targetMessageId: targetId);
    await paginationFlushAsync();

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
    await paginationFlushAsync();

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

  test(
    'held loadNewer returns superseded when a refresh preserves the identical '
    'newest boundary',
    () async {
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
        pageLimit: 30,
      );
      final container = paginationContainer(db, adapter);
      addTearDown(() {
        adapter.releaseAfterFetch();
        container.dispose();
      });

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel(
        'channel-1',
        targetMessageId: all[100]['id']! as String,
      );
      await paginationFlushAsync();

      final ChatViewState opened = container.read(chatViewModelProvider);
      expect(opened.hasMoreNewerMessages, isTrue);
      final int entryEpoch = opened.windowEpoch;
      final String boundary = opened.messages.last.id;

      adapter.holdAfterFetch = true;
      final Future<PageLoadResult> staleLoad = notifier.loadNewer();
      await paginationFlushAsync();
      expect(adapter.afterFetchHeld, isTrue);

      await notifier.refreshAfterSessionRecovery();
      await paginationFlushAsync();

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
      await paginationFlushAsync();

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
      final List<Map<String, Object?>> all = paginationChannelMessages(
        'channel-1',
        120,
      );
      final String olderId = all[20]['id']! as String;
      final adapter = PaginatingAdapter(messagesByChannel: {'channel-1': all})
        ..beforeFetchFailuresRemaining = 1;
      final container = paginationContainer(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();

      final String oldestBeforeLoad = container
          .read(chatViewModelProvider)
          .messages
          .first
          .id;

      await notifier.loadMore();
      await paginationFlushAsync();

      final ChatViewState afterFailure = container.read(chatViewModelProvider);
      expect(afterFailure.isLoadingMore, isFalse);
      expect(afterFailure.messages.first.id, oldestBeforeLoad);

      await notifier.loadMore();
      await paginationFlushAsync();

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
    final String networkId = paginationSnowflakeForIndex(5);
    final adapter = PaginatingAdapter(
      messagesByChannel: {
        'channel-1': [
          paginationMessageJson(
            id: networkId,
            channelId: 'channel-1',
            authorId: 'other',
          ),
        ],
      },
    );
    final Completer<void> hydrateHold = Completer<void>();
    final container = paginationContainer(
      db,
      adapter,
      hydrationService: HoldingGuildMemberHydrationService(
        database: db,
        hold: hydrateHold,
      ),
    );
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    final Future<void> load = notifier.switchChannel('channel-1');
    await paginationFlushAsync();

    final ChatViewState state = container.read(chatViewModelProvider);
    expect(state.messages, hasLength(1));
    expect(state.messages.first.id, networkId);
    expect(hydrateHold.isCompleted, isFalse);

    hydrateHold.complete();
    await load;
    await paginationFlushAsync();
  });
}
