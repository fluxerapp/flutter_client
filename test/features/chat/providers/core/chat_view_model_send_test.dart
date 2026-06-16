import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
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
  String content = 'message',
  String? nonce,
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
  'content': content,
  'timestamp': dateTimeFromUserSnowflakeOrNull(id)!.toIso8601String(),
  'pinned': false,
  'mention_everyone': false,
  'mentions': <Object?>[],
  'mention_roles': <Object?>[],
  'nonce': ?nonce,
};

void main() {
  Future<(ProviderContainer, _SendAdapter, String)> setUpChannel() async {
    final db = FluxerDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(id: 'channel-1', guildId: '', name: 'dm'),
    );
    final serverMessageId = _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12));
    final adapter = _SendAdapter(serverMessageId: serverMessageId);
    final container = _container(db, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    return (container, adapter, serverMessageId);
  }

  test('own send scrolls once on optimistic insert, not again on delivery', () async {
    final (container, _, serverMessageId) = await setUpChannel();
    final notifier = container.read(chatViewModelProvider.notifier);

    final int before = container.read(chatViewModelProvider).scrollToBottomSignal;

    await notifier.sendMessage(text: 'hi');

    // Optimistic message inserted, REST still in flight.
    final ChatViewState afterSend = container.read(chatViewModelProvider);
    expect(afterSend.messages.last.deliveryState, MessageDeliveryState.sending);

    await _flushAsync();

    final ChatViewState delivered = container.read(chatViewModelProvider);
    expect(delivered.messages.last.id, serverMessageId);
    expect(delivered.messages.last.content, 'hi');
    expect(delivered.messages.last.deliveryState, MessageDeliveryState.sent);
    // Exactly one bump: optimistic insert (+1); delivery no longer bumps.
    expect(delivered.scrollToBottomSignal, before + 1);
  });

  test('gateway echo for an already-delivered message is coalesced', () async {
    final (container, _, serverMessageId) = await setUpChannel();
    final notifier = container.read(chatViewModelProvider.notifier);

    await notifier.sendMessage(text: 'hi');
    await _flushAsync();

    final ChatViewState delivered = container.read(chatViewModelProvider);
    final Message deliveredMessage = delivered.messages.last;
    expect(deliveredMessage.deliveryState, MessageDeliveryState.sent);
    expect(deliveredMessage.clientNonce, isNotNull);
    final List<Message> before = delivered.messages;

    container.read(messageRealtimeBusProvider).emit(
      MessageCreated(
        MessageCreateEvent(
          message: MessageResponseSchema.fromJson(
            _messageJson(
              id: serverMessageId,
              channelId: 'channel-1',
              authorId: 'me',
              content: 'hi',
              nonce: deliveredMessage.clientNonce,
            ),
          ),
        ),
      ),
    );
    await _flushAsync();

    final List<Message> after = container.read(chatViewModelProvider).messages;
    expect(identical(before, after), isTrue);
  });
}

ProviderContainer _container(FluxerDatabase db, _SendAdapter adapter) {
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

class _SendAdapter implements HttpClientAdapter {
  _SendAdapter({required this.serverMessageId});

  final String serverMessageId;
  String? lastSentNonce;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final String path = options.uri.path;
    final bool isMessages = RegExp(
      r'/channels/([^/]+)/messages$',
    ).hasMatch(path);
    if (options.method == 'GET' && isMessages) {
      return _json(const <Map<String, Object?>>[]);
    }
    if (options.method == 'POST' && isMessages) {
      final String? raw = await _readRequestBody(requestStream, options.data);
      final Map<String, dynamic> body = raw == null || raw.isEmpty
          ? <String, dynamic>{}
          : jsonDecode(raw) as Map<String, dynamic>;
      lastSentNonce = body['nonce'] as String?;
      return _json(
        _messageJson(
          id: serverMessageId,
          channelId: 'channel-1',
          authorId: 'me',
          content: body['content'] as String? ?? '',
          nonce: lastSentNonce,
        ),
      );
    }
    if (options.method == 'POST' &&
        (path.endsWith('/ack') || path.endsWith('/read-states/ack-bulk'))) {
      return ResponseBody.fromString('', 204, statusMessage: 'No Content');
    }
    return ResponseBody.fromString('Not found', 404);
  }

  ResponseBody _json(Object data) => ResponseBody.fromString(
    jsonEncode(data),
    200,
    headers: {
      Headers.contentTypeHeader: ['application/json'],
    },
  );

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
