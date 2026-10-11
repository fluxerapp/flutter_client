import 'dart:async';
import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/attachment_upload_client.dart';
import 'package:fluxer_app/features/chat/data/prepared_attachments.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_session.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/attachment_upload_client_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/providers/upload/user_upload_limits_provider.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/attachments/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('sending during a pre-upload joins it instead of restarting', () async {
    final _Fixture f = await _Fixture.create();
    f.client.gate = Completer<void>();
    await f.addFile();
    await pumpEventQueue();
    expect(f.client.planRequests, 1);

    f.controller.claimForMessage('nonce-1');
    final Future<PreparedAttachments> prepared = f.controller
        .prepareSessionForSend(nonce: 'nonce-1', favoriteMemePayload: false);
    await pumpEventQueue();
    expect(f.client.planRequests, 1);
    expect(f.progressFor('nonce-1'), 50);

    f.client.gate!.complete();
    final PreparedAttachments ready = await prepared;
    expect(f.client.planRequests, 1);
    expect(ready.attachmentFiles, isNull);
    expect(ready.attachmentMetadata!.single.uploadFilename, 'stored-a.mp4');
  });

  test('cancelling a message cancels the upload it joined', () async {
    final _Fixture f = await _Fixture.create();
    f.client.gate = Completer<void>();
    await f.addFile();
    await pumpEventQueue();

    f.controller.claimForMessage('nonce-1');
    unawaited(
      f.controller
          .prepareSessionForSend(nonce: 'nonce-1', favoriteMemePayload: false)
          .then((_) {}, onError: (Object _) {}),
    );
    await pumpEventQueue();
    f.controller.cancelMessageUpload('nonce-1');

    expect(f.client.tokens.single.isCancelled, isTrue);
  });

  test('a finished pre-upload shows as complete once sent', () async {
    final _Fixture f = await _Fixture.create();
    await f.addFile();
    await pumpEventQueue();

    f.controller.claimForMessage('nonce-1');
    unawaited(
      f.controller.prepareSessionForSend(
        nonce: 'nonce-1',
        favoriteMemePayload: false,
      ),
    );
    await pumpEventQueue();

    expect(f.client.planRequests, 1);
    expect(f.progressFor('nonce-1'), 100);
  });

  test('progress ticks are coalesced', () async {
    final _Fixture f = await _Fixture.create();
    f.client.progressTicks = 500;
    int updates = 0;
    f.container.listen<List<PendingAttachment>>(
      cloudUploadControllerProvider('channel-1').select((s) => s.items),
      (_, _) => updates += 1,
    );
    await f.addFile();
    await pumpEventQueue();

    expect(updates, lessThan(10));
  });

  test('two large files can be added together with direct uploads', () async {
    final _Fixture f = await _Fixture.create(maxFileBytes: 5);
    final FileUploadValidationResult result = await f.controller.addFiles(
      composerUploadFiles(<XFile>[
        f.writeFile('a.mp4', 4),
        f.writeFile('b.mp4', 4),
      ]),
    );

    expect(result.isValid, isTrue);
  });

  test(
    'a photo picker selection swaps unchecked photos for new ones',
    () async {
      final _Fixture f = await _Fixture.create();
      await f.controller.addFiles(<ComposerUploadFile>[
        composerUploadFile(f.writeFile('a.jpg', 1), galleryAssetId: 'asset-a'),
        composerUploadFile(f.writeFile('b.jpg', 1), galleryAssetId: 'asset-b'),
      ]);

      final FileUploadValidationResult result = await f.controller
          .applyGallerySelection((
            added: <ComposerUploadFile>[
              composerUploadFile(
                f.writeFile('c.jpg', 1),
                galleryAssetId: 'asset-c',
              ),
            ],
            removedAssetIds: <String>{'asset-a'},
          ));

      expect(result.isValid, isTrue);
      expect(
        f.composerItems.map((PendingAttachment a) => a.galleryAssetId),
        <String>['asset-b', 'asset-c'],
      );
    },
  );

  test('staged copies are deleted when the upload is discarded', () async {
    final _Fixture f = await _Fixture.create();
    await f.controller.addFiles(<ComposerUploadFile>[
      composerUploadFile(
        f.writeFile('a.mp4', 3),
        displayFilename: 'renamed.mp4',
      ),
    ]);
    final String stagedPath = f.composerItems.single.file.path;
    expect(File(stagedPath).existsSync(), isTrue);

    await f.controller.removeAttachment(f.composerItems.single.id);

    expect(File(stagedPath).existsSync(), isFalse);
  });

  test('staged copies are deleted once the message is sent', () async {
    final _Fixture f = await _Fixture.create();
    await f.controller.addFiles(<ComposerUploadFile>[
      composerUploadFile(
        f.writeFile('a.mp4', 3),
        displayFilename: 'renamed.mp4',
      ),
    ]);
    final String stagedPath = f.composerItems.single.file.path;
    f.controller.claimForMessage('nonce-1');

    f.controller.removeMessageUpload('nonce-1');

    expect(File(stagedPath).existsSync(), isFalse);
  });
}

class _Fixture {
  _Fixture._(this.container, this.client, this.tempDir);

  final ProviderContainer container;
  final _FakeUploadClient client;
  final Directory tempDir;

  CloudUploadController get controller =>
      container.read(cloudUploadControllerProvider('channel-1').notifier);

  List<PendingAttachment> get composerItems =>
      container.read(cloudUploadControllerProvider('channel-1')).items;

  double? progressFor(String nonce) {
    final MessageUploadSession? session = container.read(
      messageUploadSessionsProvider,
    )[nonce];
    return session == null
        ? null
        : computeMessageUploadSendingProgress(session);
  }

  static Future<_Fixture> create({int maxFileBytes = 25 * 1024 * 1024}) async {
    final _FakeUploadClient client = _FakeUploadClient(
      apiDio: Dio(),
      uploadDio: Dio(),
    );
    final ProviderContainer container = ProviderContainer(
      overrides: [
        maxAttachmentFileBytesProvider.overrideWithValue(maxFileBytes),
        attachmentUploadClientProvider.overrideWithValue(client),
      ],
    );
    final Directory tempDir = await Directory.systemTemp.createTemp(
      'cloud_upload_controller_test',
    );
    addTearDown(() {
      final Completer<void>? gate = client.gate;
      if (gate != null && !gate.isCompleted) {
        gate.complete();
      }
      container.dispose();
      unawaited(tempDir.delete(recursive: true));
    });
    return _Fixture._(container, client, tempDir);
  }

  XFile writeFile(String name, int length) {
    final File file = File('${tempDir.path}/$name')
      ..writeAsBytesSync(List<int>.filled(length, 1));
    return XFile(file.path);
  }

  Future<void> addFile() async {
    final FileUploadValidationResult result = await controller.addFiles(
      composerUploadFiles(<XFile>[writeFile('a.mp4', 10)]),
    );
    expect(result.isValid, isTrue);
  }
}

class _FakeUploadClient extends AttachmentUploadClient {
  _FakeUploadClient({required super.apiDio, required super.uploadDio});

  Completer<void>? gate;
  int planRequests = 0;
  int progressTicks = 1;
  final List<CancelToken> tokens = <CancelToken>[];

  @override
  Future<AttachmentUploadPlan> requestAttachmentUploadPlan({
    required String channelId,
    required int attachmentId,
    required String filename,
    required int fileSize,
    required String contentType,
    CancelToken? cancelToken,
  }) async {
    planRequests += 1;
    return SingleAttachmentUploadPlan(
      uploadFilename: 'stored-$filename',
      fileSize: fileSize,
      contentType: contentType,
      uploadUrl: 'https://upload.test/file',
    );
  }

  @override
  Future<void> uploadAttachmentPlan(UploadAttachmentPlanParams params) async {
    tokens.add(params.cancelToken!);
    params.onPlanReady?.call(
      uploadFilename: params.plan.uploadFilename,
      fileSize: params.plan.fileSize,
      contentType: params.plan.contentType,
    );
    final int total = params.plan.fileSize;
    for (int i = 1; i <= progressTicks; i++) {
      params.onProgress?.call(total * i ~/ (progressTicks * 2), total);
    }
    final Completer<void>? pending = gate;
    if (pending != null) {
      await Future.any(<Future<void>>[
        pending.future,
        params.cancelToken!.whenCancel.then((DioException e) => throw e),
      ]);
    }
    params.onProgress?.call(total, total);
  }
}
