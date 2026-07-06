import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/chat/data/attachment_upload_client.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_send_cancelled_exception.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/attachment_upload_client_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/providers/upload/user_upload_limits_provider.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

PendingAttachment _pendingAttachment({
  required int id,
  required String filename,
}) {
  return PendingAttachment(
    id: id,
    channelId: 'channel-1',
    file: XFile.fromData(Uint8List.fromList(<int>[1, 2, 3]), name: filename),
    filename: filename,
    size: 3,
    contentType: 'image/png',
    status: PendingAttachmentStatus.pending,
    uploadProgress: 0,
  );
}

class _BlockingAttachmentUploadClient extends AttachmentUploadClient {
  _BlockingAttachmentUploadClient({
    required super.channelsApi,
    required super.uploadDio,
    required this.uploadBlock,
  });

  final Completer<void> uploadBlock;

  @override
  Future<AttachmentUploadPlan> requestAttachmentUploadPlan({
    required String channelId,
    required int attachmentId,
    required String filename,
    required int fileSize,
    required String contentType,
    CancelToken? cancelToken,
  }) async {
    await uploadBlock.future;
    return SingleAttachmentUploadPlan(
      id: attachmentId,
      filename: filename,
      uploadFilename: 'stored-$filename',
      fileSize: fileSize,
      contentType: contentType,
      uploadUrl: 'https://upload.test/file',
    );
  }

  @override
  Future<AttachmentUploadRemoteState> uploadAttachmentPlan(
    UploadAttachmentPlanParams params,
  ) async {
    params.onPlanReady?.call(
      uploadFilename: params.plan.uploadFilename,
      fileSize: params.plan.fileSize,
      contentType: params.plan.contentType,
    );
    return AttachmentUploadRemoteState(
      uploadFilename: params.plan.uploadFilename,
      fileSize: params.plan.fileSize,
      contentType: params.plan.contentType,
    );
  }
}

ProviderContainer _uploadContainer({
  required AttachmentUploadClient uploadClient,
}) {
  return ProviderContainer(
    overrides: [
      attachmentUploadClientProvider.overrideWithValue(uploadClient),
      maxAttachmentFileBytesProvider.overrideWithValue(25 * 1024 * 1024),
    ],
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('CloudUploadController.prepareSessionForSend', () {
    test('throws when upload session was cancelled before prepare', () async {
      const String nonce = 'cancelled-nonce';
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container
          .read(messageUploadSessionsProvider.notifier)
          .createSession(
            nonce: nonce,
            channelId: 'channel-1',
            attachments: <PendingAttachment>[
              _pendingAttachment(id: 1, filename: 'a.png'),
              _pendingAttachment(id: 2, filename: 'b.png'),
            ],
          );
      container
          .read(cloudUploadControllerProvider('channel-1').notifier)
          .cancelMessageUpload(nonce);
      await expectLater(
        container
            .read(cloudUploadControllerProvider('channel-1').notifier)
            .prepareSessionForSend(nonce: nonce, favoriteMemePayload: false),
        throwsA(isA<MessageUploadSendCancelledException>()),
      );
    });

    test('throws when upload session is removed mid-flight', () async {
      const String nonce = 'mid-flight-nonce';
      final Completer<void> uploadBlock = Completer<void>();
      final ProviderContainer container = _uploadContainer(
        uploadClient: _BlockingAttachmentUploadClient(
          channelsApi: ChannelsApi(Dio()),
          uploadDio: Dio(),
          uploadBlock: uploadBlock,
        ),
      );
      addTearDown(container.dispose);
      container
          .read(messageUploadSessionsProvider.notifier)
          .createSession(
            nonce: nonce,
            channelId: 'channel-1',
            attachments: <PendingAttachment>[
              _pendingAttachment(id: 1, filename: 'a.png'),
              _pendingAttachment(id: 2, filename: 'b.png'),
            ],
          );
      final Future<Object?> prepareFuture = container
          .read(cloudUploadControllerProvider('channel-1').notifier)
          .prepareSessionForSend(nonce: nonce, favoriteMemePayload: false);
      await pumpEventQueue();
      container
          .read(messageUploadSessionsProvider.notifier)
          .removeSession(nonce);
      uploadBlock.complete();
      await expectLater(
        prepareFuture,
        throwsA(isA<MessageUploadSendCancelledException>()),
      );
    });
  });

  group('ChatViewModel cancelSendingMessage with attachments', () {
    test(
      'does not post message when multi-attachment upload is cancelled',
      () async {
        final Completer<void> uploadBlock = Completer<void>();
        final db = openTestDatabase();
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(id: 'channel-1', guildId: '', name: 'dm'),
        );
        final _AttachmentSendAdapter adapter = _AttachmentSendAdapter(
          serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
        );
        final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
          ..httpClientAdapter = adapter;
        final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
        final ProviderContainer container = ProviderContainer(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            appUiForegroundProvider.overrideWithValue(true),
            fluxerDioProvider.overrideWithValue(dio),
            fluxerClientProvider.overrideWithValue(client),
            currentUserIdProvider.overrideWithValue('me'),
            maxAttachmentFileBytesProvider.overrideWithValue(25 * 1024 * 1024),
            attachmentUploadClientProvider.overrideWithValue(
              _BlockingAttachmentUploadClient(
                channelsApi: ChannelsApi(dio),
                uploadDio: Dio(),
                uploadBlock: uploadBlock,
              ),
            ),
            ackBatcherProvider.overrideWith((Ref ref) {
              final batcher = AckBatcher(
                client: client,
                batchDelay: Duration.zero,
              );
              ref.onDispose(() {
                unawaited(batcher.dispose());
              });
              return batcher;
            }),
          ],
        );
        addTearDown(container.dispose);
        final ChatViewModel notifier = container.read(
          chatViewModelProvider.notifier,
        );
        await notifier.switchChannel('channel-1');
        await _flushAsync();
        final Directory tempDir = await Directory.systemTemp.createTemp(
          'fluxer_upload_cancel_test',
        );
        addTearDown(() => tempDir.delete(recursive: true));
        final File fileA = File('${tempDir.path}/a.png')
          ..writeAsBytesSync(<int>[1]);
        final File fileB = File('${tempDir.path}/b.png')
          ..writeAsBytesSync(<int>[2]);
        final FileUploadValidationResult validation = await container
            .read(cloudUploadControllerProvider('channel-1').notifier)
            .addFiles(<XFile>[XFile(fileA.path), XFile(fileB.path)]);
        expect(validation.isValid, isTrue);
        unawaited(notifier.sendMessage(text: ''));
        await pumpEventQueue();
        final ChatViewState sendingState = container.read(
          chatViewModelProvider,
        );
        expect(sendingState.messages, isNotEmpty);
        final Message optimistic = sendingState.messages.last;
        expect(optimistic.isSending, isTrue);
        notifier.cancelSendingMessage(optimistic.id);
        uploadBlock.complete();
        await _flushAsync();
        expect(adapter.messagePostCount, 0);
        final ChatViewState finalState = container.read(chatViewModelProvider);
        expect(finalState.messages.where((Message m) => m.isSending), isEmpty);
      },
    );
  });
}

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Future<void> _flushAsync() async {
  for (var i = 0; i < 12; i++) {
    await pumpEventQueue();
  }
}

class _AttachmentSendAdapter implements HttpClientAdapter {
  _AttachmentSendAdapter({required this.serverMessageId});

  final String serverMessageId;
  int messagePostCount = 0;

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
      return _json(<String, Object?>{
        'id': serverMessageId,
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
        'timestamp': DateTime.utc(2026, 6, 16, 12).toIso8601String(),
        'pinned': false,
        'mention_everyone': false,
        'mentions': <Object?>[],
        'mention_roles': <Object?>[],
      });
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
