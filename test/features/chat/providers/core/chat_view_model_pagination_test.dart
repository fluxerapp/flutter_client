import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
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
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

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

void main() {
  test(
    'loadMore prepends older messages without trimming the newest',
    () async {
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
      final int initialCount = initial.messages.length;
      expect(initialCount, 150);

      await notifier.loadMore();
      await _flushAsync();

      final grown = container.read(chatViewModelProvider);
      // Whole window retained: older prepend, newest never dropped.
      expect(grown.messages.length, 250);
      expect(grown.messages.first.id, oldestId);
      expect(grown.messages.last.id, newestId);
      // Loading older never opens a newer-side gap.
      expect(grown.hasMoreNewerMessages, isFalse);

      // At the live tail, memory reclaims to the cap and keeps the newest.
      notifier.trimToNewestWindow();
      final trimmed = container.read(chatViewModelProvider);
      expect(trimmed.messages.length, kTrimmedMessageWindowSize);
      expect(trimmed.messages.last.id, newestId);
      expect(
        trimmed.messages.first.id,
        all[250 - kTrimmedMessageWindowSize]['id'],
      );
      expect(trimmed.hasMoreMessages, isTrue);
    },
  );

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
        pageLimit: 150,
      );
      final container = _container(db, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      await notifier.loadMore();
      await _flushAsync();

      final state = container.read(chatViewModelProvider);
      expect(state.hasMoreNewerMessages, isTrue);
      expect(state.messages.length, 250);
      notifier.trimToNewestWindow();
      expect(container.read(chatViewModelProvider).messages.length, 250);
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
    final List<Map<String, Object?>> all = _channelMessages('channel-1', 250);
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
    notifier.updateReadViewport(isNearBottom: true);
    final before = container.read(chatViewModelProvider);
    expect(before.hasMoreNewerMessages, isTrue);
    expect(before.messages.length, 250);

    await notifier.refreshAfterSessionRecovery();
    await _flushAsync();

    final after = container.read(chatViewModelProvider);
    expect(after.messages.length, before.messages.length);
    expect(after.messages.first.id, before.messages.first.id);
    expect(after.messages.last.id, before.messages.last.id);
    expect(after.hasMoreNewerMessages, isTrue);
    expect(after.isSyncingMessages, isFalse);
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
    ],
  );
}

Future<void> _flushAsync() async {
  for (var i = 0; i < 8; i++) {
    await pumpEventQueue();
  }
}

class _PaginatingAdapter implements HttpClientAdapter {
  _PaginatingAdapter({required this.messagesByChannel, this.pageLimit = 50});

  final Map<String, List<Map<String, Object?>>> messagesByChannel;
  final int pageLimit;
  bool holdBeforeFetch = false;
  Completer<void>? _beforeCompleter;

  void releaseBeforeFetch() {
    holdBeforeFetch = false;
    final completer = _beforeCompleter;
    _beforeCompleter = null;
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
      final around = options.uri.queryParameters['around'];
      if (before != null && holdBeforeFetch) {
        _beforeCompleter ??= Completer<void>();
        await _beforeCompleter!.future;
      }
      final List<Map<String, Object?>> page;
      if (before != null) {
        final older = all
            .where((m) => _compare(m['id']! as String, before) < 0)
            .toList();
        page = older.length <= pageLimit
            ? older
            : older.sublist(older.length - pageLimit);
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
