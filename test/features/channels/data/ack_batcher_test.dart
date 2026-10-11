import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_dart/export.dart';
import 'package:talker/talker.dart';

class _BulkAckAdapter implements HttpClientAdapter {
  final List<List<Map<String, Object?>>> recordedBatches = [];
  int requestCount = 0;
  bool failNext = false;
  int handshakeFailures = 0;
  final List<ResponseBody> scriptedFailures = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    expect(options.method, 'POST');
    expect(options.uri.path, '/v1/read-states/ack');
    requestCount += 1;
    if (handshakeFailures > 0) {
      handshakeFailures -= 1;
      throw const HandshakeException(
        'Handshake error in client',
        OSError('TLSV1_ALERT_INTERNAL_ERROR'),
      );
    }
    final builder = BytesBuilder();
    if (requestStream != null) {
      await for (final chunk in requestStream) {
        builder.add(chunk);
      }
    }
    final body =
        jsonDecode(utf8.decode(builder.takeBytes())) as Map<String, Object?>;
    final readStates = body['read_states']! as List<Object?>;
    recordedBatches.add(
      readStates.map((e) => Map<String, Object?>.from(e! as Map)).toList(),
    );
    if (scriptedFailures.isNotEmpty) {
      return scriptedFailures.removeAt(0);
    }
    if (failNext) {
      failNext = false;
      return ResponseBody.fromString(
        '{"error":"boom"}',
        503,
        statusMessage: 'Service Unavailable',
      );
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

  @override
  void close({bool force = false}) {}
}

FluxerClient _client(_BulkAckAdapter adapter) {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  return FluxerClient(dio);
}

void main() {
  test(
    'coalesces multiple acks into a single bulk HTTP after the delay',
    () async {
      final adapter = _BulkAckAdapter();
      final batcher = AckBatcher(
        client: _client(adapter),
        batchDelay: const Duration(milliseconds: 80),
      );
      addTearDown(batcher.dispose);

      batcher
        ..queue(
          channelId: 'c-1',
          messageId: 'm-1',
          immediate: false,
          hadMentions: false,
        )
        ..queue(
          channelId: 'c-2',
          messageId: 'm-2',
          immediate: false,
          hadMentions: false,
        );

      expect(adapter.recordedBatches, isEmpty);

      await Future<void>.delayed(const Duration(milliseconds: 150));

      expect(adapter.recordedBatches, hasLength(1));
      expect(adapter.recordedBatches.first, [
        {'channel_id': 'c-1', 'message_id': 'm-1'},
        {'channel_id': 'c-2', 'message_id': 'm-2'},
      ]);
    },
  );

  test('immediate flag flushes on the next event loop tick', () async {
    final adapter = _BulkAckAdapter();
    final batcher = AckBatcher(
      client: _client(adapter),
      batchDelay: const Duration(seconds: 10),
    );
    addTearDown(batcher.dispose);

    batcher.queue(
      channelId: 'c-1',
      messageId: 'm-1',
      immediate: true,
      hadMentions: false,
    );

    await Future<void>.delayed(const Duration(milliseconds: 50));

    expect(adapter.recordedBatches, hasLength(1));
    expect(adapter.recordedBatches.first.single['channel_id'], 'c-1');
  });

  test('chunks more than batchSize acks into multiple HTTPs', () async {
    final adapter = _BulkAckAdapter();
    final batcher = AckBatcher(
      client: _client(adapter),
      batchDelay: const Duration(milliseconds: 50),
      batchSize: 3,
    );
    addTearDown(batcher.dispose);

    for (var i = 0; i < 7; i++) {
      batcher.queue(
        channelId: 'c-$i',
        messageId: 'm-$i',
        immediate: false,
        hadMentions: false,
      );
    }

    await Future<void>.delayed(const Duration(milliseconds: 150));

    final lengths = adapter.recordedBatches.map((b) => b.length).toList();
    expect(lengths, [3, 3, 1]);
  });

  test('flushPending(force: true) sends queued acks immediately', () async {
    final adapter = _BulkAckAdapter();
    final batcher = AckBatcher(
      client: _client(adapter),
      batchDelay: const Duration(seconds: 10),
    );
    addTearDown(batcher.dispose);

    batcher.queue(
      channelId: 'c-1',
      messageId: 'm-1',
      immediate: false,
      hadMentions: false,
    );
    expect(adapter.recordedBatches, isEmpty);

    await batcher.flushPending(force: true);

    expect(adapter.recordedBatches, hasLength(1));
  });

  test(
    'newer messageId for same channel replaces older queued entry',
    () async {
      final adapter = _BulkAckAdapter();
      final batcher = AckBatcher(
        client: _client(adapter),
        batchDelay: const Duration(milliseconds: 50),
      );
      addTearDown(batcher.dispose);

      batcher
        ..queue(
          channelId: 'c-1',
          messageId: '100',
          immediate: false,
          hadMentions: false,
        )
        ..queue(
          channelId: 'c-1',
          messageId: '200',
          immediate: false,
          hadMentions: false,
        );

      await Future<void>.delayed(const Duration(milliseconds: 150));

      expect(adapter.recordedBatches, hasLength(1));
      expect(adapter.recordedBatches.first.single['message_id'], '200');
    },
  );

  test('foreground batching uses shorter delay than background', () async {
    final adapter = _BulkAckAdapter();
    final batcher = AckBatcher(client: _client(adapter));
    addTearDown(batcher.dispose);

    batcher
      ..setForegroundBatching(foreground: true)
      ..queue(
        channelId: 'c-1',
        messageId: 'm-1',
        immediate: false,
        hadMentions: false,
      );

    await Future<void>.delayed(const Duration(milliseconds: 400));
    expect(adapter.recordedBatches, isEmpty);

    await Future<void>.delayed(const Duration(milliseconds: 500));
    expect(adapter.recordedBatches, hasLength(1));
  });

  group('transient failures', () {
    setUp(talker.cleanHistory);

    Iterable<TalkerData> ackErrors() => talker.history.where(
      (TalkerData data) =>
          data.logLevel == LogLevel.error &&
          (data.message ?? '').contains('[AckBatcher]'),
    );

    AckBatcher retryingBatcher(_BulkAckAdapter adapter, Duration base) =>
        AckBatcher(
          client: _client(adapter),
          batchDelay: Duration.zero,
          retryBaseDelay: base,
          random: Random(1),
        );

    void queueImmediate(AckBatcher batcher, String messageId) {
      batcher.queue(
        channelId: 'c-1',
        messageId: messageId,
        immediate: true,
        hadMentions: false,
      );
    }

    test('a TLS handshake failure keeps the ack and re-sends it quietly', () {
      fakeAsync((FakeAsync async) {
        final adapter = _BulkAckAdapter()..handshakeFailures = 1;
        final batcher = retryingBatcher(adapter, const Duration(seconds: 5));
        queueImmediate(batcher, 'm-1');

        async.elapse(const Duration(seconds: 1));
        expect(adapter.requestCount, 1);
        expect(adapter.recordedBatches, isEmpty);

        async.elapse(const Duration(seconds: 6));
        expect(adapter.recordedBatches, [
          [
            {'channel_id': 'c-1', 'message_id': 'm-1'},
          ],
        ]);
        expect(ackErrors(), isEmpty);
        unawaited(batcher.dispose());
        async.flushMicrotasks();
      });
    });

    test('a 503 is logged as a warning and retried', () {
      fakeAsync((FakeAsync async) {
        final adapter = _BulkAckAdapter()..failNext = true;
        final batcher = retryingBatcher(adapter, const Duration(seconds: 5));
        queueImmediate(batcher, 'm-1');

        async.elapse(const Duration(seconds: 7));
        expect(adapter.recordedBatches, hasLength(2));
        expect(adapter.recordedBatches.last.single['message_id'], 'm-1');
        expect(ackErrors(), isEmpty);
        unawaited(batcher.dispose());
        async.flushMicrotasks();
      });
    });

    test('a 429 waits for retry_after before re-sending', () {
      fakeAsync((FakeAsync async) {
        final adapter = _BulkAckAdapter()
          ..scriptedFailures.add(
            ResponseBody.fromString(
              '{"message":"slow down","retry_after":30}',
              429,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            ),
          );
        final batcher = retryingBatcher(adapter, const Duration(seconds: 1));
        queueImmediate(batcher, 'm-1');

        async.elapse(const Duration(seconds: 29));
        expect(adapter.recordedBatches, hasLength(1));

        async.elapse(const Duration(seconds: 2));
        expect(adapter.recordedBatches, hasLength(2));
        expect(ackErrors(), isEmpty);
        unawaited(batcher.dispose());
        async.flushMicrotasks();
      });
    });

    test('a non-transient failure is still reported as an error', () {
      fakeAsync((FakeAsync async) {
        final adapter = _BulkAckAdapter()
          ..scriptedFailures.add(ResponseBody.fromString('{}', 400));
        final batcher = retryingBatcher(adapter, const Duration(seconds: 10));
        queueImmediate(batcher, 'm-1');

        async.elapse(const Duration(seconds: 1));
        expect(ackErrors(), isNotEmpty);
        unawaited(batcher.dispose());
        async.flushMicrotasks();
      });
    });

    test('a rejected ack is dropped instead of re-sent', () {
      fakeAsync((FakeAsync async) {
        final adapter = _BulkAckAdapter()
          ..scriptedFailures.add(ResponseBody.fromString('{}', 400));
        final batcher = retryingBatcher(adapter, const Duration(seconds: 10));
        queueImmediate(batcher, 'm-1');

        async.elapse(const Duration(minutes: 5));
        expect(adapter.requestCount, 1);
        unawaited(batcher.dispose());
        async.flushMicrotasks();
      });
    });

    test('a newer ack queued during the backoff is the one re-sent', () {
      fakeAsync((FakeAsync async) {
        final adapter = _BulkAckAdapter()..handshakeFailures = 1;
        final batcher = retryingBatcher(adapter, const Duration(seconds: 5));
        queueImmediate(batcher, '100');

        async.elapse(const Duration(seconds: 1));
        expect(adapter.requestCount, 1);
        batcher.queue(
          channelId: 'c-1',
          messageId: '200',
          immediate: false,
          hadMentions: false,
        );
        async.elapse(const Duration(seconds: 1));

        expect(adapter.recordedBatches, [
          [
            {'channel_id': 'c-1', 'message_id': '200'},
          ],
        ]);
        unawaited(batcher.dispose());
        async.flushMicrotasks();
      });
    });
  });
}
