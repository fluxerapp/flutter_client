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

MessageResponseSchema _ownMessage({required String id, String? nonce}) {
  return MessageResponseSchema.fromJson(<String, Object?>{
    'id': id,
    'channel_id': 'channel-1',
    'author': <String, Object?>{
      'id': 'me',
      'username': 'user-me',
      'discriminator': '0001',
      'global_name': null,
      'avatar': null,
      'avatar_color': null,
      'flags': 0,
    },
    'type': 0,
    'flags': 0,
    'tts': false,
    'content': '',
    'nonce': nonce,
    'timestamp': DateTime.utc(2026, 10, 12).toIso8601String(),
    'pinned': false,
    'mention_everyone': false,
    'mentions': <Object?>[],
    'mention_roles': <Object?>[],
  });
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

  test('cancelling a send whose request already went out deletes the message '
      'the server creates from it', () async {
    final (:container, :adapter) = _container();
    addTearDown(container.dispose);
    container.read(cloudUploadControllerProvider('channel-1').notifier)
      ..sendCancelToken('late-nonce')
      ..cancelMessageUpload('late-nonce');

    final AbandonedMessageSends abandoned = container.read(
      abandonedMessageSendsProvider.notifier,
    );
    expect(
      abandoned.reclaim(_ownMessage(id: '42', nonce: 'late-nonce')),
      isTrue,
    );
    await _flushAsync();
    expect(adapter.requests, <String>[
      'DELETE /v1/channels/channel-1/messages/42',
    ]);
    expect(
      abandoned.reclaim(_ownMessage(id: '43', nonce: 'late-nonce')),
      isFalse,
    );
  });

  test(
    'cancelling before the request went out leaves later sends alone',
    () async {
      final (:container, :adapter) = _container();
      addTearDown(container.dispose);
      container
          .read(cloudUploadControllerProvider('channel-1').notifier)
          .cancelMessageUpload('early-nonce');

      expect(
        container
            .read(abandonedMessageSendsProvider.notifier)
            .reclaim(_ownMessage(id: '42', nonce: 'early-nonce')),
        isFalse,
      );
      await _flushAsync();
      expect(adapter.requests, isEmpty);
    },
  );
}
