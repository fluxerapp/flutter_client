import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_dart/export.dart';

class _BulkAckAdapter implements HttpClientAdapter {
  final List<List<Map<String, Object?>>> recordedBatches = [];
  bool failNext = false;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    expect(options.method, 'POST');
    expect(options.uri.path, '/v1/read-states/ack');
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
}
