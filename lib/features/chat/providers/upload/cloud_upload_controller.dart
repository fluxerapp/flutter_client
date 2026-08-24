import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/data/attachment_upload_client.dart';
import 'package:fluxer_app/features/chat/data/prepared_attachments.dart';
import 'package:fluxer_app/features/chat/domain/api_attachment_metadata.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_send_cancelled_exception.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_session.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/attachment_upload_client_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/user_upload_limits_provider.dart';
import 'package:fluxer_app/features/chat/utils/attachment_filename_utils.dart';
import 'package:fluxer_app/features/chat/utils/composer_upload_file.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart'
    show
        FileUploadValidationError,
        FileUploadValidationResult,
        FileUploadValidator;
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:path/path.dart' as path_lib;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cloud_upload_controller.g.dart';

@Riverpod(keepAlive: true)
class CloudUploadController extends _$CloudUploadController {
  int _nextAttachmentId = 1;
  final Map<int, CancelToken> _activeUploadControllers = <int, CancelToken>{};
  String _channelId = '';

  @override
  CloudComposerAttachments build(String channelId) {
    _channelId = channelId;
    ref.onDispose(() {
      for (final CancelToken c in _activeUploadControllers.values) {
        c.cancel();
      }
      _activeUploadControllers.clear();
    });
    return CloudComposerAttachments.empty;
  }

  Future<FileUploadValidationResult> addFiles(
    List<ComposerUploadFile> files,
  ) async {
    if (files.isEmpty) {
      return const FileUploadValidationResult.failure(
        FileUploadValidationError.noFiles,
      );
    }
    final int maxFileBytes = ref.read(maxAttachmentFileBytesProvider);
    final FileUploadValidator validator = FileUploadValidator(
      maxAttachments: kMaxAttachmentsPerMessage,
      maxFileBytes: maxFileBytes,
      maxMultipartRequestBytes: maxFileBytes,
    );
    final FileUploadValidationResult validation = await validator
        .validateAddFiles(
          currentCount: state.items.length,
          newFiles: files.map((ComposerUploadFile f) => f.file).toList(),
          multipartPayloadPreview: const <String, dynamic>{'content': ''},
        );
    if (!validation.isValid) {
      return validation;
    }
    final List<PendingAttachment> created = <PendingAttachment>[];
    for (final ComposerUploadFile uploadFile in files) {
      final XFile resolved = await _ensureResolvableFile(
        uploadFile.file,
        uploadFilename: uploadFile.displayFilename,
      );
      final int length = await resolved.length();
      final String contentType =
          FileUploadValidator.resolveContentTypeForUpload(
            filename: resolved.name,
            mimeType: resolved.mimeType,
          );
      created.add(
        PendingAttachment(
          id: _nextAttachmentId++,
          channelId: _channelId,
          file: resolved,
          filename: resolved.name,
          size: length,
          contentType: contentType,
          status: PendingAttachmentStatus.pending,
          uploadProgress: 0,
          galleryAssetId: uploadFile.galleryAssetId,
        ),
      );
    }
    state = CloudComposerAttachments(<PendingAttachment>[
      ...state.items,
      ...created,
    ]);
    if (ref.read(advancedPreferencesProvider).preuploadMessageAttachments) {
      for (final PendingAttachment attachment in created) {
        unawaited(_ensureComposerAttachmentUploaded(attachment.id));
      }
    }
    return const FileUploadValidationResult.success();
  }

  Future<XFile> _ensureResolvableFile(
    XFile file, {
    String? uploadFilename,
  }) async {
    final String safeName = resolveUploadFilename(
      file: file,
      explicitName: uploadFilename,
    );
    final String path = file.path.trim();
    if (path.isNotEmpty && File(path).existsSync()) {
      final String onDiskBasename = path_lib.basename(path);
      if (onDiskBasename == safeName) {
        return XFile(path, mimeType: file.mimeType, name: safeName);
      }
      return _stageUploadFile(
        safeName: safeName,
        mimeType: file.mimeType,
        write: (File dest) => File(path).copy(dest.path),
      );
    }
    final Uint8List bytes = await file.readAsBytes();
    return _stageUploadFile(
      safeName: safeName,
      mimeType: file.mimeType,
      write: (File dest) => dest.writeAsBytes(bytes, flush: true),
    );
  }

  Future<XFile> _stageUploadFile({
    required String safeName,
    required String? mimeType,
    required Future<void> Function(File dest) write,
  }) async {
    final Directory dir = await Directory.systemTemp.createTemp('upload_');
    final File dest = File('${dir.path}/$safeName');
    await write(dest);
    return XFile(dest.path, mimeType: mimeType, name: safeName);
  }

  List<PendingAttachment> claimForMessage(String nonce) {
    if (state.items.isEmpty) {
      return const <PendingAttachment>[];
    }
    final List<PendingAttachment> claimed = List<PendingAttachment>.from(
      state.items,
    );
    state = CloudComposerAttachments.empty;
    ref
        .read(messageUploadSessionsProvider.notifier)
        .createSession(
          nonce: nonce,
          channelId: _channelId,
          attachments: claimed,
        );
    return claimed;
  }

  void restoreToComposer(String nonce) {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      return;
    }
    for (final int attachmentId in session.attachments.map(
      (PendingAttachment a) => a.id,
    )) {
      _activeUploadControllers.remove(attachmentId)?.cancel();
    }
    state = CloudComposerAttachments(<PendingAttachment>[
      ...state.items,
      ...session.attachments.map(
        (PendingAttachment a) => a.copyWith(
          status: PendingAttachmentStatus.pending,
          uploadProgress: 0,
          uploadFilename: null,
          multipartUploadId: null,
          fileSizePlan: null,
          contentTypePlan: null,
        ),
      ),
    ]);
    ref.read(messageUploadSessionsProvider.notifier).removeSession(nonce);
  }

  void cancelMessageUpload(String nonce) {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      return;
    }
    for (final PendingAttachment attachment in session.attachments) {
      _activeUploadControllers.remove(attachment.id)?.cancel();
    }
    ref.read(messageUploadSessionsProvider.notifier).removeSession(nonce);
  }

  void removeMessageUpload(String nonce) {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      return;
    }
    for (final PendingAttachment attachment in session.attachments) {
      _activeUploadControllers.remove(attachment.id)?.cancel();
    }
    ref.read(messageUploadSessionsProvider.notifier).removeSession(nonce);
  }

  Future<PreparedAttachments> prepareSessionForSend({
    required String nonce,
    required bool favoriteMemePayload,
  }) async {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      throw const MessageUploadSendCancelledException();
    }
    if (session.attachments.isEmpty) {
      return PreparedAttachments.empty;
    }
    if (favoriteMemePayload) {
      return PreparedAttachments(
        attachmentMetadata: _mapApi(session.attachments),
        attachmentFiles: session.attachments
            .map((PendingAttachment e) => e.file)
            .toList(),
      );
    }
    try {
      ref
          .read(messageUploadSessionsProvider.notifier)
          .updateSendingProgress(nonce, 0);
      await Future.wait<void>(
        session.attachments.map(
          (PendingAttachment a) =>
              _ensureSessionAttachmentUploaded(nonce, a.id),
        ),
      );
      final List<PendingAttachment> latest = _requireSessionAttachments(nonce);
      final bool anyFailed = latest.any(
        (PendingAttachment e) => e.status == PendingAttachmentStatus.failed,
      );
      if (anyFailed) {
        _fallbackResetSessionUploadsForMultipartSend(nonce);
        final List<PendingAttachment> reset = _requireSessionAttachments(nonce);
        return PreparedAttachments(
          attachmentMetadata: _mapApi(reset),
          attachmentFiles: reset.map((PendingAttachment e) => e.file).toList(),
        );
      }
      final List<PendingAttachment> ready = _requireSessionAttachments(nonce);
      return PreparedAttachments(attachmentMetadata: _mapApi(ready));
    } on MessageUploadSendCancelledException {
      rethrow;
    } on Object catch (e, st) {
      talker.warning('[CloudUpload] prepareSessionForSend error: $e\n$st');
      _fallbackResetSessionUploadsForMultipartSend(nonce);
      final List<PendingAttachment>? reset = ref
          .read(messageUploadSessionsProvider)[nonce]
          ?.attachments;
      if (reset == null) {
        throw const MessageUploadSendCancelledException();
      }
      return PreparedAttachments(
        attachmentMetadata: _mapApi(reset),
        attachmentFiles: reset.map((PendingAttachment e) => e.file).toList(),
      );
    }
  }

  MessageUploadSession _requireSession(String nonce) {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      throw const MessageUploadSendCancelledException();
    }
    return session;
  }

  List<PendingAttachment> _requireSessionAttachments(String nonce) {
    return _requireSession(nonce).attachments;
  }

  Future<void> _ensureComposerAttachmentUploaded(int attachmentId) async {
    if (!ref.mounted) {
      return;
    }
    final int index = state.items.indexWhere(
      (PendingAttachment e) => e.id == attachmentId,
    );
    if (index == -1) {
      return;
    }
    final PendingAttachment attachment = state.items[index];
    if (attachment.status == PendingAttachmentStatus.sending &&
        attachment.uploadFilename != null &&
        attachment.multipartUploadId == null) {
      return;
    }
    final CancelToken? existing = _activeUploadControllers[attachmentId];
    existing?.cancel();
    final CancelToken token = CancelToken();
    _activeUploadControllers[attachmentId] = token;
    _patchAttachment(
      attachmentId,
      (PendingAttachment a) => a.copyWith(
        status: PendingAttachmentStatus.uploading,
        uploadProgress: 0,
      ),
    );
    try {
      final AttachmentUploadClient client = ref.read(
        attachmentUploadClientProvider,
      );
      final AttachmentUploadPlan plan = await client
          .requestAttachmentUploadPlan(
            channelId: _channelId,
            attachmentId: attachment.id,
            filename: attachment.filename,
            fileSize: attachment.size,
            contentType: attachment.contentType,
            cancelToken: token,
          );
      if (!ref.mounted ||
          !state.items.any((PendingAttachment e) => e.id == attachmentId)) {
        return;
      }
      await client.uploadAttachmentPlan(
        UploadAttachmentPlanParams(
          channelId: _channelId,
          file: attachment.file,
          plan: plan,
          cancelToken: token,
          onPlanReady:
              ({
                required String uploadFilename,
                required int fileSize,
                required String contentType,
                String? uploadId,
              }) {
                _patchAttachment(
                  attachmentId,
                  (PendingAttachment a) => a.copyWith(
                    uploadFilename: uploadFilename,
                    fileSizePlan: fileSize,
                    contentTypePlan: contentType,
                    multipartUploadId: uploadId,
                  ),
                );
              },
          onProgress: (int uploadedBytes, int totalBytes) {
            final int effectiveTotal = totalBytes > 0
                ? totalBytes
                : attachment.size;
            final double p = effectiveTotal > 0
                ? (uploadedBytes / effectiveTotal).clamp(0.0, 1.0)
                : 0;
            _patchAttachment(
              attachmentId,
              (PendingAttachment a) => a.copyWith(
                status: PendingAttachmentStatus.uploading,
                uploadProgress: p,
              ),
            );
          },
        ),
      );
      if (!ref.mounted ||
          !state.items.any((PendingAttachment e) => e.id == attachmentId)) {
        return;
      }
      _patchAttachment(
        attachmentId,
        (PendingAttachment a) => a.copyWith(
          status: PendingAttachmentStatus.sending,
          uploadProgress: 1,
          multipartUploadId: null,
        ),
      );
    } on Object catch (e, st) {
      if (!ref.mounted ||
          !state.items.any((PendingAttachment e) => e.id == attachmentId)) {
        return;
      }
      talker.warning('[CloudUpload] composer upload failed: $e\n$st');
      _patchAttachment(
        attachmentId,
        (PendingAttachment a) => a.copyWith(
          status: PendingAttachmentStatus.failed,
          uploadProgress: 0,
        ),
      );
    } finally {
      _activeUploadControllers.remove(attachmentId);
    }
  }

  Future<void> _ensureSessionAttachmentUploaded(
    String nonce,
    int attachmentId,
  ) async {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      return;
    }
    final int index = session.attachments.indexWhere(
      (PendingAttachment e) => e.id == attachmentId,
    );
    if (index == -1) {
      return;
    }
    final PendingAttachment attachment = session.attachments[index];
    if (attachment.status == PendingAttachmentStatus.sending &&
        attachment.uploadFilename != null &&
        attachment.multipartUploadId == null) {
      return;
    }
    final CancelToken? existing = _activeUploadControllers[attachmentId];
    existing?.cancel();
    final CancelToken token = CancelToken();
    _activeUploadControllers[attachmentId] = token;
    _patchSessionAttachment(
      nonce,
      attachmentId,
      (PendingAttachment a) => a.copyWith(
        status: PendingAttachmentStatus.uploading,
        uploadProgress: 0,
      ),
    );
    try {
      final AttachmentUploadClient client = ref.read(
        attachmentUploadClientProvider,
      );
      final AttachmentUploadPlan plan = await client
          .requestAttachmentUploadPlan(
            channelId: _channelId,
            attachmentId: attachment.id,
            filename: attachment.filename,
            fileSize: attachment.size,
            contentType: attachment.contentType,
            cancelToken: token,
          );
      if (ref.read(messageUploadSessionsProvider)[nonce] == null) {
        return;
      }
      await client.uploadAttachmentPlan(
        UploadAttachmentPlanParams(
          channelId: _channelId,
          file: attachment.file,
          plan: plan,
          cancelToken: token,
          onPlanReady:
              ({
                required String uploadFilename,
                required int fileSize,
                required String contentType,
                String? uploadId,
              }) {
                _patchSessionAttachment(
                  nonce,
                  attachmentId,
                  (PendingAttachment a) => a.copyWith(
                    uploadFilename: uploadFilename,
                    fileSizePlan: fileSize,
                    contentTypePlan: contentType,
                    multipartUploadId: uploadId,
                  ),
                );
              },
          onProgress: (int uploadedBytes, int totalBytes) {
            final int effectiveTotal = totalBytes > 0
                ? totalBytes
                : attachment.size;
            final double p = effectiveTotal > 0
                ? (uploadedBytes / effectiveTotal).clamp(0.0, 1.0)
                : 0;
            _patchSessionAttachment(
              nonce,
              attachmentId,
              (PendingAttachment a) => a.copyWith(
                status: PendingAttachmentStatus.uploading,
                uploadProgress: p,
              ),
            );
          },
        ),
      );
      if (ref.read(messageUploadSessionsProvider)[nonce] == null) {
        return;
      }
      _patchSessionAttachment(
        nonce,
        attachmentId,
        (PendingAttachment a) => a.copyWith(
          status: PendingAttachmentStatus.sending,
          uploadProgress: 1,
          multipartUploadId: null,
        ),
      );
    } on Object catch (e, st) {
      if (ref.read(messageUploadSessionsProvider)[nonce] == null) {
        return;
      }
      talker.warning('[CloudUpload] session upload failed: $e\n$st');
      _patchSessionAttachment(
        nonce,
        attachmentId,
        (PendingAttachment a) => a.copyWith(
          status: PendingAttachmentStatus.failed,
          uploadProgress: 0,
        ),
      );
    } finally {
      _activeUploadControllers.remove(attachmentId);
    }
  }

  void _patchSessionAttachment(
    String nonce,
    int attachmentId,
    PendingAttachment Function(PendingAttachment) updater,
  ) {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      return;
    }
    final List<PendingAttachment> next = session.attachments
        .map((PendingAttachment e) => e.id == attachmentId ? updater(e) : e)
        .toList();
    ref
        .read(messageUploadSessionsProvider.notifier)
        .updateSessionAttachments(nonce, next, recomputeSendingProgress: true);
  }

  void _fallbackResetSessionUploadsForMultipartSend(String nonce) {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      return;
    }
    ref
        .read(messageUploadSessionsProvider.notifier)
        .updateSessionAttachments(
          nonce,
          session.attachments
              .map(
                (PendingAttachment a) => a.copyWith(
                  status: PendingAttachmentStatus.pending,
                  uploadProgress: 0,
                  uploadFilename: null,
                  multipartUploadId: null,
                  fileSizePlan: null,
                  contentTypePlan: null,
                ),
              )
              .toList(),
        );
  }

  void _patchAttachment(
    int attachmentId,
    PendingAttachment Function(PendingAttachment) updater,
  ) {
    if (!ref.mounted) {
      return;
    }
    state = CloudComposerAttachments(
      state.items
          .map((PendingAttachment e) => e.id == attachmentId ? updater(e) : e)
          .toList(),
    );
  }

  Future<void> removeAttachment(int attachmentId) async {
    PendingAttachment? att;
    for (final PendingAttachment e in state.items) {
      if (e.id == attachmentId) {
        att = e;
        break;
      }
    }
    if (att == null) {
      return;
    }
    final CancelToken? c = _activeUploadControllers.remove(attachmentId);
    c?.cancel();
    state = CloudComposerAttachments(
      state.items.where((PendingAttachment e) => e.id != attachmentId).toList(),
    );
  }

  void updateAttachment(
    int attachmentId, {
    required String filename,
    required String? description,
    required int flags,
  }) {
    _patchAttachment(attachmentId, (PendingAttachment a) {
      return a.copyWith(
        filename: filename,
        description: description == null || description.isEmpty
            ? null
            : description,
        flags: flags,
      );
    });
  }

  void reorderAttachments(int oldIndex, int newIndex) {
    if (oldIndex < 0 ||
        oldIndex >= state.items.length ||
        newIndex < 0 ||
        newIndex >= state.items.length) {
      return;
    }
    final List<PendingAttachment> next = List<PendingAttachment>.from(
      state.items,
    );
    final PendingAttachment item = next.removeAt(oldIndex);
    next.insert(newIndex, item);
    state = CloudComposerAttachments(next);
  }

  Future<FileUploadValidationResult> addVoiceMessage({
    required XFile file,
    required int duration,
    required String waveform,
  }) async {
    if (state.items.isNotEmpty) {
      return const FileUploadValidationResult.failure(
        FileUploadValidationError.tooManyAttachments,
      );
    }
    final int maxFileBytes = ref.read(maxAttachmentFileBytesProvider);
    final FileUploadValidator validator = FileUploadValidator(
      maxAttachments: 1,
      maxFileBytes: maxFileBytes,
      maxMultipartRequestBytes: maxFileBytes,
    );
    final XFile resolved = await _ensureResolvableFile(file);
    final int length = await resolved.length();
    final FileUploadValidationResult validation = await validator
        .validateAddFiles(
          currentCount: 0,
          newFiles: <XFile>[resolved],
          multipartPayloadPreview: const <String, dynamic>{'content': ''},
        );
    if (!validation.isValid) {
      return validation;
    }
    final PendingAttachment created = PendingAttachment(
      id: _nextAttachmentId++,
      channelId: _channelId,
      file: resolved,
      filename: resolved.name,
      size: length,
      contentType: 'audio/wav',
      status: PendingAttachmentStatus.pending,
      uploadProgress: 0,
      duration: duration,
      waveform: waveform,
    );
    state = CloudComposerAttachments(<PendingAttachment>[created]);
    return const FileUploadValidationResult.success();
  }

  List<ApiAttachmentMetadata> _mapApi(List<PendingAttachment> list) {
    return List<ApiAttachmentMetadata>.generate(list.length, (int i) {
      final PendingAttachment a = list[i];
      final int flagsOut = a.flags;
      return ApiAttachmentMetadata(
        id: '$i',
        filename: a.filename,
        title: a.filename,
        uploadFilename: a.uploadFilename,
        fileSize: a.fileSizePlan ?? a.size,
        contentType: a.contentTypePlan ?? a.contentType,
        description: a.description,
        flags: flagsOut != 0 ? flagsOut : null,
        duration: a.duration,
        waveform: a.waveform,
      );
    });
  }

  void clearComposerAttachments() {
    for (final CancelToken c in _activeUploadControllers.values) {
      c.cancel();
    }
    _activeUploadControllers.clear();
    state = CloudComposerAttachments.empty;
  }
}
