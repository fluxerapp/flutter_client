/// Realtime events that race a wholesale window replacement.
///
/// Every window swap (the initial load, an around load, a jump to latest)
/// fetches a REST page, computes a merged list from a snapshot of the state it
/// read on entry, awaits member hydration, and only then assigns the result.
/// A gateway create, edit or delete landing inside that gap is applied to a
/// state the swap is about to overwrite, so without care it is silently lost.
/// These tests drive the races through public behaviour only: switchChannel,
/// jumpToLatestMessages and the realtime bus.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show ChannelsCompanion, FluxerDatabase;
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
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
const String _channelId = 'channel-1';

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

/// Builds [count] message ids for the channel, ascending, oldest first.
List<Map<String, Object?>> _channelMessages(int count) => [
  for (var i = 0; i < count; i++)
    _messageJson(
      id: _snowflakeForIndex(i),
      channelId: _channelId,
      authorId: 'other',
    ),
];

void _emitCreatedMessage(ProviderContainer container, {required String id}) {
  container
      .read(messageRealtimeBusProvider)
      .emit(
        testMessageCreated(
          MessageCreateEvent(
            message: MessageResponseSchema.fromJson(
              _messageJson(id: id, channelId: _channelId, authorId: 'other'),
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

void _emitUpdatedMessage(
  ProviderContainer container, {
  required String id,
  required String content,
}) {
  final Map<String, Object?> json = _messageJson(
    id: id,
    channelId: _channelId,
    authorId: 'other',
  )..['content'] = content;
  container
      .read(messageRealtimeBusProvider)
      .emit(
        MessageUpdated(
          MessageUpdateEvent(message: MessageResponseSchema.fromJson(json)),
        ),
      );
}

void _emitDeletedMessage(ProviderContainer container, {required String id}) {
  container
      .read(messageRealtimeBusProvider)
      .emit(
        MessageDeleted(
          MessageDeleteEvent(channelId: _channelId, messageId: id),
        ),
      );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<FluxerDatabase> seedChannel({String? lastMessageId}) async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: _channelId,
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(lastMessageId),
      ),
    );
    return db;
  }

  /// Opens the channel, pages backwards past the trim cap, then applies the
  /// scroll-end around-trim (the widget's settle path) near the oldest row,
  /// which drops the newest side and detaches the window from the live tail.
  Future<void> detachWindow(ChatViewModel notifier, ProviderContainer c) async {
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    for (var i = 0; i < 8; i++) {
      if (c.read(chatViewModelProvider).messages.length > kMaxLoadedMessages) {
        break;
      }
      await notifier.loadMore();
      await _flushAsync();
    }
    final List<Message> loaded = c.read(chatViewModelProvider).messages;
    if (loaded.length <= kMaxLoadedMessages) {
      fail('window never exceeded the trim cap');
    }
    notifier.trimAroundVisible(loaded.first.id);
    await _flushAsync();
    if (!c.read(chatViewModelProvider).hasMoreNewerMessages) {
      fail('window never detached from the live tail');
    }
  }

  test('a gateway create during jump to latest survives the swap', () async {
    // Regression: while detached, _nextMessagesFor discards every incoming
    // create. jumpToLatestMessages awaits a REST page and then swaps the
    // window, so a create landing between the two was dropped by BOTH paths
    // and lost for good.
    final db = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String raceId = _snowflakeForIndex(500);
    adapter.holdLatestFetch = true;
    final Future<bool> jump = notifier.jumpToLatestMessages();
    await _flushAsync();

    // Arrives after the REST snapshot was taken, before the window swap.
    _emitCreatedMessage(container, id: raceId);
    await _flushAsync();

    adapter.releaseLatestFetch();
    expect(await jump, isTrue);
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(
      state.messages.map((Message m) => m.id),
      contains(raceId),
      reason: 'a create racing the window swap must not be dropped',
    );
    expect(
      state.messages.last.id,
      raceId,
      reason: 'the raced create is the newest row',
    );

    // Contiguity must still describe the real window, so the next append lands.
    _emitCreatedMessage(container, id: _snowflakeForIndex(501));
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      _snowflakeForIndex(501),
    );
  });

  test('a gateway create during the initial load survives the swap', () async {
    // The common path, not an exotic one: _refreshMessagesFromNetwork computes
    // its merged list from a snapshot and then awaits member hydration. A
    // create landing in that gap appends itself to state.messages and would be
    // overwritten by the stale snapshot.
    final db = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(20));
    final hydration = _HoldableHydrationService(database: db)..hold = true;
    final container = _container(db, adapter, hydration: hydration);
    addTearDown(() {
      hydration.release();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    final Future<void> open = notifier.switchChannel(_channelId);
    await _flushAsync();

    final String raceId = _snowflakeForIndex(900);
    _emitCreatedMessage(container, id: raceId);
    await _flushAsync();

    hydration.release();
    await open;
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(
      state.messages.map((Message m) => m.id),
      contains(raceId),
      reason: 'a create racing the load must not be overwritten',
    );
    expect(state.messages.last.id, raceId);
    expect(state.hasMoreNewerMessages, isFalse);

    // Contiguity must still describe the real window so the next append lands.
    _emitCreatedMessage(container, id: _snowflakeForIndex(901));
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      _snowflakeForIndex(901),
    );
  });

  test('an edit during the initial load is not rolled back', () async {
    // The REST page carries the OLD revision. Applying the edit and then
    // assigning the stale merged list silently reverts it.
    final db = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(20));
    final hydration = _HoldableHydrationService(database: db)..hold = true;
    final container = _container(db, adapter, hydration: hydration);
    addTearDown(() {
      hydration.release();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    final Future<void> open = notifier.switchChannel(_channelId);
    await _flushAsync();

    final String editedId = _snowflakeForIndex(10);
    _emitUpdatedMessage(container, id: editedId, content: 'edited in flight');
    await _flushAsync();

    hydration.release();
    await open;
    await _flushAsync();

    final Message edited = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.id == editedId);
    expect(
      edited.content,
      'edited in flight',
      reason: 'the fetched page must not restore the pre-edit revision',
    );
  });

  test('a delete during the initial load is not resurrected', () async {
    // The REST page was fetched BEFORE the delete, so the stale merged list
    // still contains the row.
    final db = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(20));
    final hydration = _HoldableHydrationService(database: db)..hold = true;
    final container = _container(db, adapter, hydration: hydration);
    addTearDown(() {
      hydration.release();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    final Future<void> open = notifier.switchChannel(_channelId);
    await _flushAsync();

    final String deletedId = _snowflakeForIndex(10);
    _emitDeletedMessage(container, id: deletedId);
    await _flushAsync();

    hydration.release();
    await open;
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(deletedId)),
      reason: 'a page fetched before the delete must not resurrect the row',
    );
  });

  test(
    'an edit then delete during a jump to present resolves as deleted',
    () async {
      // Ordering matters: replaying the delete before the edit would leave a
      // live, edited message behind.
      final db = await seedChannel();
      final adapter = _MessageApiAdapter(messages: _channelMessages(400));
      final hydration = _HoldableHydrationService(database: db);
      final container = _container(db, adapter, hydration: hydration);
      addTearDown(() {
        hydration.release();
        container.dispose();
      });

      final notifier = container.read(chatViewModelProvider.notifier);
      await detachWindow(notifier, container);

      final String targetId = _snowflakeForIndex(399);
      hydration.hold = true;
      final Future<bool> jump = notifier.jumpToLatestMessages();
      await _flushAsync();

      _emitUpdatedMessage(container, id: targetId, content: 'edited mid-jump');
      await _flushAsync();
      _emitDeletedMessage(container, id: targetId);
      await _flushAsync();

      hydration.release();
      expect(await jump, isTrue);
      await _flushAsync();

      expect(
        container.read(chatViewModelProvider).messages.map((Message m) => m.id),
        isNot(contains(targetId)),
        reason: 'the later delete must win over the earlier edit',
      );
    },
  );

  test('a gateway create during an around load stays out of history', () async {
    // A create belongs BEYOND a detached window, never spliced into the middle
    // of history. Dropping it is correct, but only if the newer side stays
    // open so the user can still reach it.
    // The channel pointer sits at the live tail, which is how a detached
    // around window is recognised as detached.
    final db = await seedChannel(lastMessageId: _snowflakeForIndex(199));
    final adapter = _MessageApiAdapter(messages: _channelMessages(200));
    final hydration = _HoldableHydrationService(database: db)..hold = true;
    final container = _container(db, adapter, hydration: hydration);
    addTearDown(() {
      hydration.release();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    // Anchor deep in history so there is a REAL gap between the window and
    // the live tail. Splicing a create onto this window would produce a list
    // that looks contiguous while ~75 messages are missing from the middle.
    final Future<void> open = notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(100),
    );
    await _flushAsync();

    final String raceId = _snowflakeForIndex(900);
    _emitCreatedMessage(container, id: raceId);
    await _flushAsync();

    hydration.release();
    await open;
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(
      state.messages.map((Message m) => m.id),
      isNot(contains(raceId)),
      reason: 'a live create must not be spliced into a detached window',
    );
    expect(
      state.messages.last.id,
      // Around page limit 50 => newer quota 25 beyond the target at 100.
      _snowflakeForIndex(125),
      reason: 'the window must still end where the around page ended',
    );
    expect(
      state.hasMoreNewerMessages,
      isTrue,
      reason: 'the newer side must stay open so the create is reachable',
    );
  });
}

ProviderContainer _container(
  FluxerDatabase db,
  _MessageApiAdapter adapter, {
  NoopGuildMemberHydrationService? hydration,
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
        hydration ?? NoopGuildMemberHydrationService(database: db),
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

/// Blocks inside the member-hydration await, the last await a window
/// replacement performs before it assigns the new message list.
class _HoldableHydrationService extends NoopGuildMemberHydrationService {
  _HoldableHydrationService({required super.database});

  bool hold = false;
  Completer<void>? _gate;

  @override
  Future<void> hydrateMembers({
    required String guildId,
    required Iterable<String> userIds,
    void Function(String userId)? onMemberFetched,
  }) async {
    if (!hold) {
      return;
    }
    _gate ??= Completer<void>();
    await _gate!.future;
  }

  void release() {
    hold = false;
    final Completer<void>? gate = _gate;
    _gate = null;
    if (gate != null && !gate.isCompleted) {
      gate.complete();
    }
  }
}

/// Models the message endpoint closely enough for window-swap work: `around`
/// on an unknown id still returns the window it would have sorted into, and
/// the latest page can be held open so a gateway event lands mid-swap.
class _MessageApiAdapter implements HttpClientAdapter {
  _MessageApiAdapter({required this.messages});

  final List<Map<String, Object?>> messages;

  bool holdLatestFetch = false;

  Completer<void>? _latestCompleter;

  void releaseLatestFetch() {
    holdLatestFetch = false;
    final completer = _latestCompleter;
    _latestCompleter = null;
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
    if (RegExp(
      r'/channels/[^/]+/messages/[^/]+/ack$',
    ).hasMatch(options.uri.path)) {
      return ResponseBody.fromString('{}', 200, headers: _jsonHeaders);
    }
    final match = RegExp(
      r'/channels/([^/]+)/messages$',
    ).firstMatch(options.uri.path);
    if (options.method != 'GET' || match == null) {
      return ResponseBody.fromString('Not found', 404);
    }
    final before = options.uri.queryParameters['before'];
    final after = options.uri.queryParameters['after'];
    final around = options.uri.queryParameters['around'];
    final int limit =
        int.tryParse(options.uri.queryParameters['limit'] ?? '') ?? 30;

    if (before == null && after == null && around == null && holdLatestFetch) {
      _latestCompleter ??= Completer<void>();
      await _latestCompleter!.future;
    }

    final List<Map<String, Object?>> page;
    if (before != null) {
      final older = messages
          .where((m) => _compare(m['id']! as String, before) < 0)
          .toList();
      page = older.length <= limit
          ? older
          : older.sublist(older.length - limit);
    } else if (after != null) {
      final newer = messages
          .where((m) => _compare(m['id']! as String, after) > 0)
          .toList();
      page = newer.length <= limit ? newer : newer.sublist(0, limit);
    } else if (around != null) {
      // Unknown anchor (deleted): serve the window it would have sorted into.
      var anchorIndex = messages.indexWhere((m) => m['id'] == around);
      if (anchorIndex == -1) {
        anchorIndex = messages.indexWhere(
          (m) => _compare(m['id']! as String, around) > 0,
        );
        if (anchorIndex == -1) {
          anchorIndex = messages.length - 1;
        }
      }
      final int halfLimit = limit ~/ 2;
      final int end = (anchorIndex + halfLimit + 1).clamp(0, messages.length);
      final int start = (end - limit).clamp(0, messages.length);
      page = messages.sublist(start, end);
    } else {
      page = messages.length <= limit
          ? messages
          : messages.sublist(messages.length - limit);
    }
    // The real API returns newest-first; the repository reverses to ascending.
    return ResponseBody.fromString(
      jsonEncode(page.reversed.toList()),
      200,
      headers: _jsonHeaders,
    );
  }

  static const Map<String, List<String>> _jsonHeaders = {
    Headers.contentTypeHeader: ['application/json'],
  };

  int _compare(String a, String b) => int.parse(a).compareTo(int.parse(b));

  @override
  void close({bool force = false}) {}
}
