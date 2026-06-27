import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_dart/export.dart';

class _BulkAdapter implements HttpClientAdapter {
  final List<List<Map<String, Object?>>> recordedBatches = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
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

ProviderContainer _makeContainer(_BulkAdapter adapter) {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  return ProviderContainer(
    overrides: [
      fluxerDioProvider.overrideWithValue(dio),
      fluxerClientProvider.overrideWithValue(FluxerClient(dio)),
    ],
  );
}

void main() {
  test('flushes pending acks when app moves to background', () async {
    final adapter = _BulkAdapter();
    final container = _makeContainer(adapter);
    addTearDown(container.dispose);

    final batcher = container.read(ackBatcherProvider);
    container.read(appUiForegroundProvider.notifier).setResumed(true);
    batcher.queue(
      channelId: 'c-1',
      messageId: 'm-1',
      immediate: false,
      hadMentions: false,
    );
    expect(adapter.recordedBatches, isEmpty);

    container.read(appUiForegroundProvider.notifier).setResumed(false);
    await Future<void>.delayed(const Duration(milliseconds: 100));

    expect(adapter.recordedBatches, hasLength(1));
    expect(adapter.recordedBatches.first, [
      {'channel_id': 'c-1', 'message_id': 'm-1'},
    ]);
  });

  test('flushes pending acks when gateway disconnects', () async {
    final adapter = _BulkAdapter();
    final container = _makeContainer(adapter);
    addTearDown(container.dispose);

    final batcher = container.read(ackBatcherProvider);
    container.read(gatewayReadyProvider.notifier).setReady();
    batcher.queue(
      channelId: 'c-2',
      messageId: 'm-2',
      immediate: false,
      hadMentions: false,
    );
    expect(adapter.recordedBatches, isEmpty);

    container.read(gatewayReadyProvider.notifier).reset();
    await Future<void>.delayed(const Duration(milliseconds: 50));

    expect(adapter.recordedBatches, hasLength(1));
    expect(adapter.recordedBatches.first, [
      {'channel_id': 'c-2', 'message_id': 'm-2'},
    ]);
  });
}
