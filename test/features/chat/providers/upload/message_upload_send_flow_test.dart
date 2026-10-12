import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/chat/data/attachment_upload_client.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_session.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/attachment_upload_client_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/providers/upload/user_upload_limits_provider.dart';
import 'package:fluxer_app/features/chat/utils/attachments/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../../helpers/message_realtime_test_helpers.dart';
import '../../../../helpers/noop_guild_member_hydration_service.dart';
import '../../../../helpers/open_test_database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('sending clears the composer files in the same frame', () async {
    final _Harness h = await _Harness.create();
    await h.stageFile();

    unawaited(h.notifier.sendMessage(text: 'pic'));

    expect(h.composerItems, isEmpty);
    await _flushAsync();
    expect(h.adapter.messagePostCount, 1);
  });

  test('a second send while the first is preparing is not dropped', () async {
    final _Harness h = await _Harness.create();

    unawaited(h.notifier.sendMessage(text: 'first'));
    unawaited(h.notifier.sendMessage(text: 'second'));
    await _flushAsync();

    expect(h.adapter.messagePostCount, 2);
    expect(h.deliveredRows.map((Message m) => m.content), <String>[
      'first',
      'second',
    ]);
  });

  test('a send that throws gives the files back to the composer', () async {
    final _Harness h = await _Harness.create();
    await h.stageFile();
    await h.container.read(fluxerDatabaseProvider).executor.close();

    await h.notifier.sendMessage(text: 'pic');
    await _flushAsync();

    expect(h.composerItems, hasLength(1));
    expect(h.sessions, isEmpty);
    expect(h.adapter.messagePostCount, 0);
  });

  test('a voice message leaves staged composer files alone', () async {
    final _Harness h = await _Harness.create();
    await h.stageFile();
    final File voice = File('${h.tempDir.path}/voice.wav')
      ..writeAsBytesSync(<int>[1, 2, 3, 4]);

    await h.notifier.sendVoiceMessage(
      filePath: voice.path,
      duration: 1,
      waveform: 'AA==',
    );
    await _flushAsync();

    expect(h.composerItems, hasLength(1));
    expect(h.adapter.messagePostCount, 1);
  });

  test('the app is kept alive only while an upload is sending', () async {
    final _Harness h = await _Harness.create();
    final List<String> calls = <String>[];
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('fluxer_app/upload_keep_alive'),
          (MethodCall call) async {
            calls.add(call.method);
            return null;
          },
        );
    addTearDown(
      () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
            const MethodChannel('fluxer_app/upload_keep_alive'),
            null,
          ),
    );
    h.adapter.holdPost = true;
    await h.stageFile();

    unawaited(h.notifier.sendMessage(text: 'pic'));
    await _flushAsync();
    expect(calls, <String>['start']);

    h.adapter.releasePost();
    await _flushAsync();
    expect(calls, <String>['start', 'stop']);
  });

  test('each upload asks again to keep the app alive', () async {
    final _Harness h = await _Harness.create();
    final List<String> calls = <String>[];
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('fluxer_app/upload_keep_alive'),
          (MethodCall call) async {
            calls.add(call.method);
            return null;
          },
        );
    addTearDown(
      () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
            const MethodChannel('fluxer_app/upload_keep_alive'),
            null,
          ),
    );
    h.adapter.holdPost = true;
    await h.stageFile();
    unawaited(h.notifier.sendMessage(text: 'first'));
    await _flushAsync();
    await h.stageFile();
    unawaited(h.notifier.sendMessage(text: 'second'));
    await _flushAsync();
    expect(calls, <String>['start', 'start']);

    h.adapter.releasePost();
    await _flushAsync();
    expect(calls, <String>['start', 'start', 'stop']);
  });

  test('a lost response settles when MESSAGE_CREATE arrives later', () async {
    final _Harness h = await _Harness.create();
    h.adapter.outcomes.add(_PostOutcome.createdThenConnectionLost);
    await h.stageFile();

    unawaited(h.notifier.sendMessage(text: 'pic'));
    await _flushAsync();

    expect(h.composerItems, isEmpty);
    final Message local = h.localRows.single;
    expect(local.deliveryState, MessageDeliveryState.failed);

    h.emitCreate(nonce: local.clientNonce!, content: 'pic');
    await _flushAsync();

    expect(h.localRows, isEmpty);
    expect(h.deliveredRows, hasLength(1));
    expect(h.composerItems, isEmpty);
    expect(h.sessions, isEmpty);
  });

  test('a failed POST after MESSAGE_CREATE leaves one delivered row', () async {
    final _Harness h = await _Harness.create();
    h.adapter
      ..outcomes.add(_PostOutcome.createdThenConnectionLost)
      ..holdPost = true;
    await h.stageFile();

    unawaited(h.notifier.sendMessage(text: 'pic'));
    await _flushAsync();
    final Message local = h.localRows.single;
    h.emitCreate(nonce: local.clientNonce!, content: 'pic');
    await _flushAsync();
    h.adapter.releasePost();
    await _flushAsync();

    expect(h.localRows, isEmpty);
    expect(h.deliveredRows, hasLength(1));
    expect(h.composerItems, isEmpty);
    expect(h.sessions, isEmpty);
  });

  for (final bool gatewayFirst in <bool>[true, false]) {
    test(
      'MESSAGE_CREATE ${gatewayFirst ? 'before' : 'after'} the HTTP response '
      'reconciles exactly once',
      () async {
        final _Harness h = await _Harness.create();
        h.adapter.holdPost = true;
        await h.stageFile();

        unawaited(h.notifier.sendMessage(text: 'pic'));
        await _flushAsync();
        final String nonce = h.localRows.single.clientNonce!;
        if (gatewayFirst) {
          h.emitCreate(nonce: nonce, content: 'pic');
          await _flushAsync();
          h.adapter.releasePost();
        } else {
          h.adapter.releasePost();
          await _flushAsync();
          h.emitCreate(nonce: nonce, content: 'pic');
        }
        await _flushAsync();

        expect(h.localRows, isEmpty);
        expect(h.deliveredRows, hasLength(1));
        expect(h.sessions, isEmpty);
      },
    );
  }

  test('a send whose upload session disappears drops the card', () async {
    final _Harness h = await _Harness.create();
    h.uploadClient.block = Completer<void>();
    await h.stageFile();

    unawaited(h.notifier.sendMessage(text: ''));
    await _flushAsync();
    final String nonce = h.localRows.single.clientNonce!;
    h.container
        .read(messageUploadSessionsProvider.notifier)
        .removeSession(nonce);
    h.uploadClient.block!.complete();
    await _flushAsync();

    expect(h.localRows, isEmpty);
    expect(h.adapter.messagePostCount, 0);
  });

  test('cancelling a fully sent fallback upload deletes the message', () async {
    final _Harness h = await _Harness.create();
    h.uploadClient.fail = true;
    h.adapter.holdPost = true;
    await h.stageFile();

    unawaited(h.notifier.sendMessage(text: ''));
    await _flushAsync();

    expect(h.adapter.lastMultipart, isTrue);
    final Message local = h.localRows.single;
    final MessageUploadSession session = h.container.read(
      messageUploadSessionsProvider,
    )[local.clientNonce]!;
    expect(computeMessageUploadSendingProgress(session), 100);

    h.notifier.cancelSendingMessage(local.id);
    await _flushAsync();

    expect(h.adapter.postCancelled, isFalse);
    expect(h.localRows, isEmpty);
    expect(h.adapter.deletedPaths, isEmpty);

    h.adapter.releasePost();
    await _flushAsync();

    expect(h.adapter.deletedPaths, <String>[
      '/v1/channels/channel-1/messages/${h.adapter.serverMessageId}',
    ]);
    expect(h.deliveredRows, isEmpty);
  });

  test('the X on a failed upload message removes it', () async {
    final _Harness h = await _Harness.create();
    h.adapter.outcomes.add(_PostOutcome.serverError);
    await h.stageFile();

    unawaited(h.notifier.sendMessage(text: ''));
    await _flushAsync();
    final Message failed = h.localRows.single;
    expect(failed.deliveryState, MessageDeliveryState.failed);

    h.notifier.cancelSendingMessage(failed.id);
    await _flushAsync();

    expect(h.localRows, isEmpty);
    expect(h.sessions, isEmpty);
  });

  test('a failed upload message survives a reload', () async {
    final _Harness h = await _Harness.create();
    h.adapter.outcomes.add(_PostOutcome.serverError);
    await h.stageFile();

    unawaited(h.notifier.sendMessage(text: ''));
    await _flushAsync();
    final String failedId = h.localRows.single.id;

    await h.notifier.reloadCurrentChannel();
    await _flushAsync();

    expect(h.localRows.map((Message m) => m.id), <String>[failedId]);
    expect(h.localRows.single.deliveryState, MessageDeliveryState.failed);
  });

  test(
    'a reload between MESSAGE_CREATE and the response leaves one row',
    () async {
      final _Harness h = await _Harness.create();
      h.adapter.holdPost = true;
      await h.stageFile();

      unawaited(h.notifier.sendMessage(text: 'pic'));
      await _flushAsync();
      final String nonce = h.localRows.single.clientNonce!;
      h.emitCreate(nonce: nonce, content: 'pic');
      await _flushAsync();
      h.adapter.history = <Object?>[
        _messageJson(
          id: h.adapter.serverMessageId,
          content: 'pic',
          nonce: nonce,
        ),
        h.earlierMessage(),
      ];
      await h.notifier.reloadCurrentChannel();
      await _flushAsync();
      h.adapter.releasePost();
      await _flushAsync();

      expect(h.localRows, isEmpty);
      expect(
        h.deliveredRows.where((Message m) => m.clientNonce == nonce),
        hasLength(1),
      );
      expect(h.sessions, isEmpty);
    },
  );

  test('retrying a failed attachment message resends its files', () async {
    final _Harness h = await _Harness.create();
    h.adapter.outcomes.add(_PostOutcome.serverError);
    await h.stageFile();

    unawaited(h.notifier.sendMessage(text: 'pic'));
    await _flushAsync();
    final Message failed = h.localRows.single;
    expect(failed.deliveryState, MessageDeliveryState.failed);

    await h.notifier.retryMessageSend(failed.id);
    await _flushAsync();

    expect(h.adapter.messagePostCount, 2);
    final List<dynamic> attachments =
        h.adapter.lastBody!['attachments'] as List<dynamic>;
    expect(attachments, hasLength(1));
    expect(h.localRows, isEmpty);
    expect(h.deliveredRows, hasLength(1));
    expect(h.sessions, isEmpty);
  });
}

enum _PostOutcome { ok, createdThenConnectionLost, serverError }

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Future<void> _flushAsync() async {
  for (var i = 0; i < 12; i++) {
    await pumpEventQueue();
  }
  SchedulerBinding.instance.handleBeginFrame(Duration.zero);
  SchedulerBinding.instance.handleDrawFrame();
  for (var i = 0; i < 12; i++) {
    await pumpEventQueue();
  }
}

Map<String, Object?> _messageJson({
  required String id,
  required String content,
  required String? nonce,
}) => <String, Object?>{
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
  'content': content,
  'timestamp': dateTimeFromUserSnowflakeOrNull(id)!.toIso8601String(),
  'pinned': false,
  'mention_everyone': false,
  'mentions': <Object?>[],
  'mention_roles': <Object?>[],
  'attachments': <Object?>[],
  'nonce': ?nonce,
};

class _Harness {
  _Harness._({
    required this.container,
    required this.adapter,
    required this.uploadClient,
    required this.tempDir,
  });

  final ProviderContainer container;
  final _PostAdapter adapter;
  final _FakeUploadClient uploadClient;
  final Directory tempDir;

  ChatViewModel get notifier => container.read(chatViewModelProvider.notifier);

  List<Message> get _rows => container.read(chatViewModelProvider).messages;

  List<Message> get localRows => _rows
      .where(
        (Message m) =>
            m.deliveryState == MessageDeliveryState.sending ||
            m.deliveryState == MessageDeliveryState.failed,
      )
      .toList();

  List<Message> get deliveredRows => _rows
      .where((Message m) => m.deliveryState == MessageDeliveryState.sent)
      .toList();

  List<Object> get composerItems =>
      container.read(cloudUploadControllerProvider('channel-1')).items;

  Map<String, Object> get sessions =>
      container.read(messageUploadSessionsProvider);

  static Future<_Harness> create() async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(id: 'channel-1', guildId: '', name: 'dm-1'),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(id: 'channel-2', guildId: '', name: 'dm-2'),
    );
    final _PostAdapter adapter = _PostAdapter(
      serverMessageId: _snowflakeForUtc(DateTime.now().toUtc()),
    );
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    final FluxerClient client = FluxerClient(
      dio,
      baseUrl: 'https://api.fluxer.app/v1',
    );
    final _FakeUploadClient uploadClient = _FakeUploadClient(
      apiDio: dio,
      uploadDio: Dio(),
    );
    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        appUiForegroundProvider.overrideWithValue(true),
        fluxerDioProvider.overrideWithValue(dio),
        fluxerClientProvider.overrideWithValue(client),
        currentUserIdProvider.overrideWithValue('me'),
        maxAttachmentFileBytesProvider.overrideWithValue(25 * 1024 * 1024),
        attachmentUploadClientProvider.overrideWithValue(uploadClient),
        guildMemberHydrationServiceProvider.overrideWithValue(
          NoopGuildMemberHydrationService(database: db),
        ),
        ackBatcherProvider.overrideWith((Ref ref) {
          final AckBatcher batcher = AckBatcher(
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
    final Directory tempDir = await Directory.systemTemp.createTemp(
      'fluxer_upload_flow_test',
    );
    final _Harness harness = _Harness._(
      container: container,
      adapter: adapter,
      uploadClient: uploadClient,
      tempDir: tempDir,
    );
    addTearDown(() {
      adapter.releasePost();
      container.dispose();
      unawaited(tempDir.delete(recursive: true));
    });
    await harness.notifier.switchChannel('channel-1');
    await _flushAsync();
    return harness;
  }

  Future<void> stageFile() async {
    final File file = File('${tempDir.path}/a.png')
      ..writeAsBytesSync(<int>[1, 2, 3]);
    final result = await container
        .read(cloudUploadControllerProvider('channel-1').notifier)
        .addFiles(composerUploadFiles(<XFile>[XFile(file.path)]));
    expect(result.isValid, isTrue);
    await _flushAsync();
  }

  Map<String, Object?> earlierMessage() => _messageJson(
    id: _snowflakeForUtc(
      DateTime.now().toUtc().subtract(const Duration(minutes: 5)),
    ),
    content: 'earlier',
    nonce: null,
  );

  void emitCreate({required String nonce, required String content}) {
    container
        .read(messageRealtimeBusProvider)
        .emit(
          testMessageCreated(
            MessageCreateEvent(
              message: MessageResponseSchema.fromJson(
                _messageJson(
                  id: adapter.serverMessageId,
                  content: content,
                  nonce: nonce,
                ),
              ),
            ),
          ),
        );
  }
}

class _FakeUploadClient extends AttachmentUploadClient {
  _FakeUploadClient({required super.apiDio, required super.uploadDio});

  Completer<void>? block;
  bool fail = false;

  @override
  Future<AttachmentUploadPlan> requestAttachmentUploadPlan({
    required String channelId,
    required int attachmentId,
    required String filename,
    required int fileSize,
    required String contentType,
    CancelToken? cancelToken,
  }) async {
    await block?.future;
    if (fail) {
      throw StateError('presign unavailable');
    }
    return SingleAttachmentUploadPlan(
      uploadFilename: 'stored-$filename',
      fileSize: fileSize,
      contentType: contentType,
      uploadUrl: 'https://upload.test/file',
    );
  }

  @override
  Future<void> uploadAttachmentPlan(UploadAttachmentPlanParams params) async {
    params.onPlanReady?.call(
      uploadFilename: params.plan.uploadFilename,
      fileSize: params.plan.fileSize,
      contentType: params.plan.contentType,
    );
    params.onProgress?.call(params.plan.fileSize, params.plan.fileSize);
  }
}

class _PostAdapter implements HttpClientAdapter {
  _PostAdapter({required this.serverMessageId});

  final String serverMessageId;
  final List<_PostOutcome> outcomes = <_PostOutcome>[];
  int messagePostCount = 0;
  Map<String, dynamic>? lastBody;
  bool lastMultipart = false;
  bool postCancelled = false;
  final List<String> deletedPaths = <String>[];
  bool holdPost = false;
  List<Object?> history = const <Object?>[];
  Completer<void>? _postGate;

  void releasePost() {
    holdPost = false;
    final Completer<void>? gate = _postGate;
    _postGate = null;
    if (gate != null && !gate.isCompleted) {
      gate.complete();
    }
  }

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
      return _json(history);
    }
    if (options.method == 'POST' && isMessages) {
      messagePostCount++;
      final List<int> raw = (await requestStream!.toList())
          .expand((Uint8List chunk) => chunk)
          .toList();
      final bool multipart = options.data is FormData;
      lastMultipart = multipart;
      final Map<String, dynamic> body = multipart
          ? <String, dynamic>{}
          : jsonDecode(utf8.decode(raw)) as Map<String, dynamic>;
      lastBody = body;
      if (holdPost) {
        _postGate ??= Completer<void>();
        await Future.any(<Future<void>>[
          _postGate!.future,
          if (cancelFuture != null)
            cancelFuture.then((_) => postCancelled = true),
        ]);
      }
      final _PostOutcome outcome = outcomes.isEmpty
          ? _PostOutcome.ok
          : outcomes.removeAt(0);
      switch (outcome) {
        case _PostOutcome.createdThenConnectionLost:
          throw const SocketException('Connection reset by peer');
        case _PostOutcome.serverError:
          return ResponseBody.fromString(
            jsonEncode(<String, Object?>{
              'code': 'INTERNAL_SERVER_ERROR',
              'message': 'boom',
            }),
            500,
            headers: {
              Headers.contentTypeHeader: ['application/json'],
            },
          );
        case _PostOutcome.ok:
          return _json(
            _messageJson(
              id:
                  (BigInt.parse(serverMessageId) +
                          BigInt.from(messagePostCount - 1))
                      .toString(),
              content: body['content'] as String? ?? '',
              nonce: body['nonce'] as String?,
            ),
          );
      }
    }
    if (options.method == 'DELETE' &&
        RegExp(r'/channels/[^/]+/messages/[^/]+$').hasMatch(path)) {
      deletedPaths.add(path);
      return ResponseBody.fromString('', 204);
    }
    if (options.method == 'POST' &&
        (path.endsWith('/ack') || path.endsWith('/read-states/ack-bulk'))) {
      return ResponseBody.fromString('', 204);
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
