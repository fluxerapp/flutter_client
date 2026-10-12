import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/data/attachment_upload_client.dart';
import 'package:fluxer_app/features/chat/data/prepared_attachments.dart';
import 'package:fluxer_app/features/chat/domain/api_attachment_metadata.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_send_cancelled_exception.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_session.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/providers/messages/abandoned_message_sends_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/attachment_upload_client_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/user_upload_limits_provider.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_filename_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart'
    show
        FileUploadValidationError,
        FileUploadValidationResult,
        FileUploadValidator;
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:path/path.dart' as path_lib;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cloud_upload_controller.g.dart';

@Riverpod(keepAlive: true)
class CloudUploadController extends _$CloudUploadController {
  int _nextAttachmentId = 1;
  final Map<int, _AttachmentUpload> _uploads = <int, _AttachmentUpload>{};
  final Map<int, int> _progressPatchedAtMs = <int, int>{};
  final Map<String, int> _sendProgressAtMs = <String, int>{};
  final Map<String, CancelToken> _sendTokens = <String, CancelToken>{};
  final Set<String> _sentSendBodies = <String>{};
  final Set<String> _stagedPaths = <String>{};
  String _channelId = '';

  @override
  CloudComposerAttachments build(String channelId) {
    _channelId = channelId;
    ref.onDispose(() {
      for (final _AttachmentUpload upload in _uploads.values) {
        upload.token.cancel();
      }
      _uploads.clear();
      for (final CancelToken token in _sendTokens.values) {
        token.cancel();
      }
      _sendTokens.clear();
      for (final String path in _stagedPaths.toList()) {
        _deleteStagedPath(path);
      }
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
    final bool directUploads = ref
        .read(instanceRuntimeConfigProvider)
        .presignedAttachmentUploads;
    final FileUploadValidationResult validation = await validator
        .validateAddFiles(
          currentCount: state.items.length,
          newFiles: files.map((ComposerUploadFile f) => f.file).toList(),
          multipartPayloadPreview: directUploads
              ? null
              : const <String, dynamic>{'content': ''},
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
    if (directUploads &&
        ref.read(advancedPreferencesProvider).preuploadMessageAttachments) {
      for (final PendingAttachment attachment in created) {
        unawaited(_startUpload(attachment));
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
    _stagedPaths.add(dest.path);
    return XFile(dest.path, mimeType: mimeType, name: safeName);
  }

  void _discardFiles(Iterable<PendingAttachment> attachments) {
    for (final PendingAttachment attachment in attachments) {
      _uploads.remove(attachment.id)?.token.cancel();
      _progressPatchedAtMs.remove(attachment.id);
      if (_stagedPaths.contains(attachment.file.path)) {
        _deleteStagedPath(attachment.file.path);
      }
    }
  }

  void _deleteStagedPath(String path) {
    _stagedPaths.remove(path);
    try {
      File(path).parent.deleteSync(recursive: true);
    } on FileSystemException catch (e) {
      talker.warning('[CloudUpload] staged file cleanup failed: $e');
    }
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

  void returnClaim(String nonce) {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      return;
    }
    ref.read(messageUploadSessionsProvider.notifier).removeSession(nonce);
    state = CloudComposerAttachments(<PendingAttachment>[
      ...session.attachments,
      ...state.items,
    ]);
  }

  CancelToken sendCancelToken(String nonce) =>
      _sendTokens.putIfAbsent(nonce, CancelToken.new);

  void reportSendProgress(
    String nonce,
    int sentBytes,
    int totalBytes, {
    required bool showProgress,
  }) {
    if (totalBytes <= 0) {
      return;
    }
    if (sentBytes >= totalBytes) {
      _sentSendBodies.add(nonce);
    } else {
      _sentSendBodies.remove(nonce);
    }
    if (!showProgress) {
      return;
    }
    final double progress = sentBytes / totalBytes;
    if (!_shouldPatchProgress(_sendProgressAtMs, nonce, progress)) {
      return;
    }
    ref
        .read(messageUploadSessionsProvider.notifier)
        .updateSendingProgress(nonce, progress * 100);
  }

  void cancelMessageUpload(String nonce) {
    final CancelToken? sendToken = _sendTokens.remove(nonce);
    if (sendToken != null) {
      ref.read(abandonedMessageSendsProvider.notifier).abandon(nonce);
      if (!_sentSendBodies.contains(nonce)) {
        sendToken.cancel();
      }
    }
    removeMessageUpload(nonce);
  }

  void removeMessageUpload(String nonce) {
    _sendTokens.remove(nonce);
    _sentSendBodies.remove(nonce);
    _sendProgressAtMs.remove(nonce);
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      return;
    }
    _discardFiles(session.attachments);
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
    if (!ref.read(instanceRuntimeConfigProvider).presignedAttachmentUploads) {
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
          .updateSessionAttachments(
            nonce,
            session.attachments,
            recomputeSendingProgress: true,
          );
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

  List<PendingAttachment> _requireSessionAttachments(String nonce) {
    final MessageUploadSession? session = ref.read(
      messageUploadSessionsProvider,
    )[nonce];
    if (session == null) {
      throw const MessageUploadSendCancelledException();
    }
    return session.attachments;
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
    for (final PendingAttachment attachment in session.attachments) {
      if (attachment.id == attachmentId) {
        return _startUpload(attachment);
      }
    }
  }

  static bool _isUploaded(PendingAttachment attachment) =>
      attachment.status == PendingAttachmentStatus.sending &&
      attachment.uploadFilename != null &&
      attachment.multipartUploadId == null;

  Future<void> _startUpload(PendingAttachment attachment) {
    final _AttachmentUpload? running = _uploads[attachment.id];
    if (running != null) {
      return running.done;
    }
    if (_isUploaded(attachment)) {
      return Future<void>.value();
    }
    final CancelToken token = CancelToken();
    late final _AttachmentUpload upload;
    upload = _AttachmentUpload(
      token,
      _runUpload(attachment, token).whenComplete(() {
        if (identical(_uploads[attachment.id], upload)) {
          _uploads.remove(attachment.id);
        }
      }),
    );
    _uploads[attachment.id] = upload;
    return upload.done;
  }

  Future<void> _runUpload(
    PendingAttachment attachment,
    CancelToken token,
  ) async {
    final int attachmentId = attachment.id;
    bool live() => !token.isCancelled && _isHeld(attachmentId);
    _patchUpload(
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
      if (!live()) {
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
                _patchUpload(
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
            if (!_shouldPatchProgress(_progressPatchedAtMs, attachmentId, p)) {
              return;
            }
            _patchUpload(
              attachmentId,
              (PendingAttachment a) => a.copyWith(
                status: PendingAttachmentStatus.uploading,
                uploadProgress: p,
              ),
            );
          },
        ),
      );
      if (!live()) {
        return;
      }
      _patchUpload(
        attachmentId,
        (PendingAttachment a) => a.copyWith(
          status: PendingAttachmentStatus.sending,
          uploadProgress: 1,
          multipartUploadId: null,
        ),
      );
    } on Object catch (e, st) {
      if (!live()) {
        return;
      }
      talker.warning('[CloudUpload] upload failed: $e\n$st');
      _patchUpload(
        attachmentId,
        (PendingAttachment a) => a.copyWith(
          status: PendingAttachmentStatus.failed,
          uploadProgress: 0,
        ),
      );
    } finally {
      _progressPatchedAtMs.remove(attachmentId);
    }
  }

  bool _shouldPatchProgress<K>(Map<K, int> marks, K key, double progress) {
    final int now = DateTime.now().millisecondsSinceEpoch;
    final int? last = marks[key];
    if (progress < 1 &&
        last != null &&
        now - last < _kProgressPatchIntervalMs) {
      return false;
    }
    marks[key] = now;
    return true;
  }

  bool _inComposer(int attachmentId) =>
      state.items.any((PendingAttachment e) => e.id == attachmentId);

  MessageUploadSession? _sessionHolding(int attachmentId) {
    for (final MessageUploadSession session
        in ref.read(messageUploadSessionsProvider).values) {
      if (session.channelId == _channelId &&
          session.attachments.any(
            (PendingAttachment e) => e.id == attachmentId,
          )) {
        return session;
      }
    }
    return null;
  }

  bool _isHeld(int attachmentId) =>
      ref.mounted &&
      (_inComposer(attachmentId) || _sessionHolding(attachmentId) != null);

  void _patchUpload(
    int attachmentId,
    PendingAttachment Function(PendingAttachment) updater,
  ) {
    if (!ref.mounted) {
      return;
    }
    if (_inComposer(attachmentId)) {
      _patchAttachment(attachmentId, updater);
      return;
    }
    final MessageUploadSession? session = _sessionHolding(attachmentId);
    if (session == null) {
      return;
    }
    ref
        .read(messageUploadSessionsProvider.notifier)
        .updateSessionAttachments(
          session.nonce,
          session.attachments
              .map(
                (PendingAttachment e) => e.id == attachmentId ? updater(e) : e,
              )
              .toList(),
          recomputeSendingProgress: true,
        );
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
          recomputeSendingProgress: true,
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

  Future<FileUploadValidationResult> applyGallerySelection(
    GallerySelectionChange change,
  ) async {
    final List<PendingAttachment> removed = state.items
        .where(
          (PendingAttachment a) =>
              change.removedAssetIds.contains(a.galleryAssetId),
        )
        .toList();
    for (final PendingAttachment attachment in removed) {
      await removeAttachment(attachment.id);
    }
    return addFiles(change.added);
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
    state = CloudComposerAttachments(
      state.items.where((PendingAttachment e) => e.id != attachmentId).toList(),
    );
    _discardFiles(<PendingAttachment>[att]);
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

  Future<FileUploadValidationResult> claimVoiceMessage({
    required String nonce,
    required XFile file,
    required int duration,
    required String waveform,
  }) async {
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
      if (_stagedPaths.contains(resolved.path)) {
        _deleteStagedPath(resolved.path);
      }
      return validation;
    }
    ref
        .read(messageUploadSessionsProvider.notifier)
        .createSession(
          nonce: nonce,
          channelId: _channelId,
          attachments: <PendingAttachment>[
            PendingAttachment(
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
            ),
          ],
        );
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
}

const int _kProgressPatchIntervalMs = 100;

class _AttachmentUpload {
  _AttachmentUpload(this.token, this.done);

  final CancelToken token;
  final Future<void> done;
}
