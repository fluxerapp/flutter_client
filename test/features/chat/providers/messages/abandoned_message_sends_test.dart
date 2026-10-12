import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/abandoned_message_sends_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../helpers/open_test_database.dart';

class _RecordingAdapter implements HttpClientAdapter {
  final List<String> requests = <String>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add('${options.method} ${options.uri.path}');
    return ResponseBody.fromString('', 204, statusMessage: 'No Content');
  }

  @override
  void close({bool force = false}) {}
}

({ProviderContainer container, _RecordingAdapter adapter}) _container() {
  final _RecordingAdapter adapter = _RecordingAdapter();
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  final ProviderContainer container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
      fluxerDioProvider.overrideWithValue(dio),
      fluxerClientProvider.overrideWithValue(
        FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1'),
      ),
    ],
  );
  return (container: container, adapter: adapter);
}

Future<void> _flushAsync() async {
  for (var i = 0; i < 12; i++) {
    await pumpEventQueue();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('cancelling once the request body went out keeps the request and '
      'deletes the created message exactly once', () async {
    final (:container, :adapter) = _container();
    addTearDown(container.dispose);
    final CloudUploadController uploads = container.read(
      cloudUploadControllerProvider('channel-1').notifier,
    );
    final CancelToken token = uploads.sendCancelToken('late-nonce');
    uploads
      ..reportSendProgress('late-nonce', 10, 10, showProgress: false)
      ..cancelMessageUpload('late-nonce');
    expect(token.isCancelled, isFalse);

    final AbandonedMessageSends abandoned = container.read(
      abandonedMessageSendsProvider.notifier,
    );
    expect(abandoned.isAbandoned('late-nonce'), isTrue);
    await Future.wait(<Future<void>>[
      abandoned.reclaim(
        nonce: 'late-nonce',
        channelId: 'channel-1',
        messageId: '42',
      ),
      abandoned.reclaim(
        nonce: 'late-nonce',
        channelId: 'channel-1',
        messageId: '42',
      ),
    ]);
    await _flushAsync();
    expect(adapter.requests, <String>[
      'DELETE /v1/channels/channel-1/messages/42',
    ]);
  });

  test('cancelling mid body aborts the request', () {
    final (:container, adapter: _) = _container();
    addTearDown(container.dispose);
    final CloudUploadController uploads = container.read(
      cloudUploadControllerProvider('channel-1').notifier,
    );
    final CancelToken token = uploads.sendCancelToken('mid-nonce');
    uploads
      ..reportSendProgress('mid-nonce', 4, 10, showProgress: false)
      ..cancelMessageUpload('mid-nonce');
    expect(token.isCancelled, isTrue);
  });

  test(
    'cancelling before the request went out leaves later sends alone',
    () async {
      final (:container, :adapter) = _container();
      addTearDown(container.dispose);
      container
          .read(cloudUploadControllerProvider('channel-1').notifier)
          .cancelMessageUpload('early-nonce');

      final AbandonedMessageSends abandoned = container.read(
        abandonedMessageSendsProvider.notifier,
      );
      expect(abandoned.isAbandoned('early-nonce'), isFalse);
      await abandoned.reclaim(
        nonce: 'early-nonce',
        channelId: 'channel-1',
        messageId: '42',
      );
      await _flushAsync();
      expect(adapter.requests, isEmpty);
    },
  );
}
