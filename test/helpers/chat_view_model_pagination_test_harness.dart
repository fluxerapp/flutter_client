import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

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
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import 'message_realtime_test_helpers.dart';
import 'noop_guild_member_hydration_service.dart';

const int _kMinuteMs = 60 * 1000;

String paginationSnowflakeForIndex(int index) {
  final int millis =
      DateTime.utc(2026).millisecondsSinceEpoch + index * _kMinuteMs;
  final int internal = (millis - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Map<String, Object?> paginationMessageJson({
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

List<Map<String, Object?>> paginationChannelMessages(
  String channelId,
  int count, {
  int baseIndex = 0,
}) => [
  for (var i = 0; i < count; i++)
    paginationMessageJson(
      id: paginationSnowflakeForIndex(baseIndex + i),
      channelId: channelId,
      authorId: 'other',
    ),
];

MessagesCompanion paginationCachedMessage({
  required String id,
  required String channelId,
}) => MessagesCompanion.insert(
  id: id,
  channelId: channelId,
  authorId: 'other',
  content: 'message $id',
  timestamp: dateTimeFromUserSnowflakeOrNull(id)!,
);

void paginationEmitCreatedMessage(
  ProviderContainer container, {
  required String id,
}) {
  container
      .read(messageRealtimeBusProvider)
      .emit(
        testMessageCreated(
          MessageCreateEvent(
            message: MessageResponseSchema.fromJson(
              paginationMessageJson(
                id: id,
                channelId: 'channel-1',
                authorId: 'other',
              ),
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

ProviderContainer paginationContainer(
  FluxerDatabase db,
  PaginatingAdapter adapter, {
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

Future<void> paginationFlushAsync() async {
  for (var i = 0; i < 8; i++) {
    await pumpEventQueue();
  }
  SchedulerBinding.instance.handleBeginFrame(Duration.zero);
  SchedulerBinding.instance.handleDrawFrame();
  for (var i = 0; i < 8; i++) {
    await pumpEventQueue();
  }
}

class PaginatingAdapter implements HttpClientAdapter {
  PaginatingAdapter({required this.messagesByChannel, this.pageLimit = 50});

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

class HoldingGuildMemberHydrationService
    extends NoopGuildMemberHydrationService {
  HoldingGuildMemberHydrationService({
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
