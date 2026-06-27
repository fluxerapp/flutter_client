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

Message _msg({
  required String id,
  required String authorId,
  String content = '',
}) => Message(
  id: id,
  channelId: 'channel-1',
  authorId: authorId,
  authorName: 'author',
  content: content,
  timestamp: DateTime.utc(2026, 6, 16, 12),
);

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

  test(
    'own send scrolls once on optimistic insert, not again on delivery',
    () async {
      final (container, _, serverMessageId) = await setUpChannel();
      final notifier = container.read(chatViewModelProvider.notifier);

      final int before = container
          .read(chatViewModelProvider)
          .scrollToBottomSignal;

      await notifier.sendMessage(text: 'hi');

      // Optimistic message inserted, REST still in flight.
      final ChatViewState afterSend = container.read(chatViewModelProvider);
      expect(
        afterSend.messages.last.deliveryState,
        MessageDeliveryState.sending,
      );

      await _flushAsync();

      final ChatViewState delivered = container.read(chatViewModelProvider);
      expect(delivered.messages.last.id, serverMessageId);
      expect(delivered.messages.last.content, 'hi');
      expect(delivered.messages.last.deliveryState, MessageDeliveryState.sent);
      // Exactly one bump: optimistic insert (+1); delivery no longer bumps.
      expect(delivered.scrollToBottomSignal, before + 1);
    },
  );

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

    container
        .read(messageRealtimeBusProvider)
        .emit(
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

  test(
    'rapid duplicate sends during async prep produce a single message',
    () async {
      final (container, adapter, _) = await setUpChannel();
      final notifier = container.read(chatViewModelProvider.notifier);

      // Fire twice back-to-back without awaiting the first: the second call
      // re-enters _sendContent while the first is still mid-preparation, exactly
      // as a repeated send-button tap does while the app lags.
      final Future<void> first = notifier.sendMessage(text: 'hi');
      final Future<void> second = notifier.sendMessage(text: 'hi');
      await Future.wait(<Future<void>>[first, second]);
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      final List<Message> sent = state.messages
          .where((Message m) => m.content == 'hi')
          .toList();
      expect(sent, hasLength(1));
      expect(adapter.messagePostCount, 1);
    },
  );

  test(
    '@silent prefix strips the flag word and suppresses notifications',
    () async {
      final (container, adapter, _) = await setUpChannel();
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: '@silent hi');
      await _flushAsync();

      expect(adapter.lastBody?['content'], 'hi');
      final int flags = (adapter.lastBody?['flags'] as int?) ?? 0;
      expect(flags & 4096, 4096);
    },
  );

  test('tts send forwards tts:true in the request body', () async {
    final (container, adapter, _) = await setUpChannel();
    final notifier = container.read(chatViewModelProvider.notifier);

    await notifier.sendMessage(text: 'hello', tts: true);
    await _flushAsync();

    expect(adapter.lastBody?['tts'], true);
  });

  test('replace command edits the last own message in place', () async {
    final (container, adapter, _) = await setUpChannel();
    final notifier = container.read(chatViewModelProvider.notifier);

    await notifier.sendMessage(text: 'teh');
    await _flushAsync();
    expect(container.read(chatViewModelProvider).messages.last.content, 'teh');

    await notifier.applyComposerReplace(
      source: 'teh',
      replacement: 'the',
      global: false,
    );
    await _flushAsync();

    expect(adapter.lastEditContent, 'the');
    expect(container.read(chatViewModelProvider).messages.last.content, 'the');
  });

  test(
    'starting a reply while editing drops the edited message text',
    () async {
      final (container, _, _) = await setUpChannel();

      container
          .read(chatViewModelProvider.notifier)
          .startEdit(
            _msg(id: 'm-edit', authorId: 'me', content: 'edited body'),
          );
      expect(
        container.read(chatViewModelProvider).editingMessage?.id,
        'm-edit',
      );
      expect(container.read(chatViewModelProvider).messageText, 'edited body');

      container
          .read(chatViewModelProvider.notifier)
          .startReply(_msg(id: 'm-reply', authorId: 'other', content: 'hi'));
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.editingMessage, isNull);
      expect(state.replyingTo?.id, 'm-reply');
      expect(state.messageText, isEmpty);
    },
  );
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
  Map<String, dynamic>? lastBody;
  int messagePostCount = 0;
  String? lastEditContent;

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
      messagePostCount++;
      final String? raw = await _readRequestBody(requestStream, options.data);
      final Map<String, dynamic> body = raw == null || raw.isEmpty
          ? <String, dynamic>{}
          : jsonDecode(raw) as Map<String, dynamic>;
      lastSentNonce = body['nonce'] as String?;
      lastBody = body;
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
    if (options.method == 'PATCH') {
      final RegExpMatch? editMatch = RegExp(
        r'/channels/[^/]+/messages/([^/]+)$',
      ).firstMatch(path);
      if (editMatch != null) {
        final String? raw = await _readRequestBody(requestStream, options.data);
        final RegExpMatch? contentMatch = raw == null
            ? null
            : RegExp(
                r'name="content"\r?\n\r?\n([\s\S]*?)\r?\n--',
              ).firstMatch(raw);
        lastEditContent = contentMatch?.group(1);
        return _json(
          _messageJson(
            id: editMatch.group(1)!,
            channelId: 'channel-1',
            authorId: 'me',
            content: lastEditContent ?? '',
          ),
        );
      }
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
