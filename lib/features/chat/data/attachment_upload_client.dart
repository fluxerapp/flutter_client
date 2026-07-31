import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/multipart_utils.dart';
import 'package:fluxer_dart/export.dart';

sealed class AttachmentUploadPlan {
  const AttachmentUploadPlan({
    required this.id,
    required this.filename,
    required this.uploadFilename,
    required this.fileSize,
    required this.contentType,
  });

  final int id;
  final String filename;
  final String uploadFilename;
  final int fileSize;
  final String contentType;
}

class SingleAttachmentUploadPlan extends AttachmentUploadPlan {
  const SingleAttachmentUploadPlan({
    required super.id,
    required super.filename,
    required super.uploadFilename,
    required super.fileSize,
    required super.contentType,
    required this.uploadUrl,
  });

  final String uploadUrl;
}

class MultipartAttachmentUploadPartPlan {
  const MultipartAttachmentUploadPartPlan({
    required this.partNumber,
    required this.uploadUrl,
  });

  final int partNumber;
  final String uploadUrl;
}

class MultipartAttachmentUploadPlan extends AttachmentUploadPlan {
  const MultipartAttachmentUploadPlan({
    required super.id,
    required super.filename,
    required super.uploadFilename,
    required super.fileSize,
    required super.contentType,
    required this.uploadId,
    required this.partSize,
    required this.parts,
  });

  final String uploadId;
  final int partSize;
  final List<MultipartAttachmentUploadPartPlan> parts;
}

class UploadAttachmentPlanParams {
  const UploadAttachmentPlanParams({
    required this.channelId,
    required this.file,
    required this.plan,
    this.cancelToken,
    this.onPlanReady,
    this.onProgress,
  });

  final String channelId;
  final XFile file;
  final AttachmentUploadPlan plan;
  final CancelToken? cancelToken;
  final void Function({
    required String uploadFilename,
    required int fileSize,
    required String contentType,
    String? uploadId,
  })?
  onPlanReady;
  final void Function(int uploadedBytes, int totalBytes)? onProgress;
}

class AttachmentUploadRemoteState {
  const AttachmentUploadRemoteState({
    required this.uploadFilename,
    required this.fileSize,
    required this.contentType,
    this.uploadId,
  });

  final String uploadFilename;
  final int fileSize;
  final String contentType;
  final String? uploadId;
}

class AttachmentUploadClient {
  AttachmentUploadClient({
    required this._channelsApi,
    required this._uploadDio,
    this._multipartConcurrency = kMultipartUploadConcurrency,
  });

  final ChannelsApi _channelsApi;
  final Dio _uploadDio;
  final int _multipartConcurrency;

  Future<AttachmentUploadPlan> requestAttachmentUploadPlan({
    required String channelId,
    required int attachmentId,
    required String filename,
    required int fileSize,
    required String contentType,
    CancelToken? cancelToken,
  }) async {
    final PresignedAttachmentUploadResponse response = await _channelsApi
        .requestPresignedMessageAttachmentUploads(
          channelId: channelId,
          body: PresignedAttachmentUploadRequest(
            attachments: <PresignedAttachmentUploadRequestItem>[
              PresignedAttachmentUploadRequestItem(
                id: attachmentId,
                filename: filename,
                fileSize: fileSize,
                contentType: contentType,
              ),
            ],
          ),
        );
    if (response.attachments.isEmpty) {
      throw StateError('Missing attachment upload plan');
    }
    final PresignedAttachmentUploadResponseItem raw =
        response.attachments.single;
    return _planFromSdk(raw);
  }

  AttachmentUploadPlan _planFromSdk(PresignedAttachmentUploadResponseItem raw) {
    return switch (raw) {
      final PresignedAttachmentUploadResponseItemSinglepart s =>
        SingleAttachmentUploadPlan(
          id: s.id,
          filename: s.filename,
          uploadFilename: s.uploadFilename,
          fileSize: s.fileSize,
          contentType: s.contentType,
          uploadUrl: s.uploadUrl,
        ),
      final PresignedAttachmentUploadResponseItemMultipart m =>
        MultipartAttachmentUploadPlan(
          id: m.id,
          filename: m.filename,
          uploadFilename: m.uploadFilename,
          fileSize: m.fileSize,
          contentType: m.contentType,
          uploadId: m.uploadId,
          partSize: m.partSize,
          parts: m.parts
              .map(
                (MultipartPresignedAttachmentUploadResponseItemParts e) =>
                    MultipartAttachmentUploadPartPlan(
                      partNumber: e.partNumber,
                      uploadUrl: e.uploadUrl,
                    ),
              )
              .toList(),
        ),
    };
  }

  Future<AttachmentUploadRemoteState> uploadAttachmentPlan(
    UploadAttachmentPlanParams params,
  ) async {
    final AttachmentUploadPlan plan = params.plan;
    if (plan is MultipartAttachmentUploadPlan) {
      await _uploadMultipartAttachmentPlan(params, plan);
    } else if (plan is SingleAttachmentUploadPlan) {
      await _uploadSingleAttachmentPlan(params, plan);
    }
    return AttachmentUploadRemoteState(
      uploadFilename: plan.uploadFilename,
      fileSize: plan.fileSize,
      contentType: plan.contentType,
      uploadId: plan is MultipartAttachmentUploadPlan ? plan.uploadId : null,
    );
  }

  Future<void> _uploadSingleAttachmentPlan(
    UploadAttachmentPlanParams params,
    SingleAttachmentUploadPlan plan,
  ) async {
    params.onPlanReady?.call(
      uploadFilename: plan.uploadFilename,
      fileSize: plan.fileSize,
      contentType: plan.contentType,
      uploadId: null,
    );
    final String normalizedType = _normalizedContentType(params.file);
    final int totalBytes = await params.file.length();
    await _uploadDio.put<dynamic>(
      plan.uploadUrl,
      data: params.file.openRead(),
      cancelToken: params.cancelToken,
      options: Options(
        contentType: normalizedType,
        headers: <String, dynamic>{Headers.contentLengthHeader: totalBytes},
      ),
      onSendProgress: (int sent, int total) {
        params.onProgress?.call(sent, total);
      },
    );
    params.onProgress?.call(totalBytes, totalBytes);
  }

  Future<void> _uploadMultipartAttachmentPlan(
    UploadAttachmentPlanParams params,
    MultipartAttachmentUploadPlan plan,
  ) async {
    params.onPlanReady?.call(
      uploadFilename: plan.uploadFilename,
      fileSize: plan.fileSize,
      contentType: plan.contentType,
      uploadId: plan.uploadId,
    );
    final XFile file = params.file;
    final int totalBytes = await file.length();
    final String normalizedType = _normalizedContentType(file);
    final List<MultipartAttachmentUploadPartPlan> parts = plan.parts;
    final List<int> loadedByPart = List<int>.filled(parts.length, 0);
    void reportProgress() {
      final int sum = loadedByPart.fold<int>(0, (int a, int b) => a + b);
      params.onProgress?.call(sum, totalBytes);
    }

    await _runWithConcurrency(parts, _multipartConcurrency, (
      MultipartAttachmentUploadPartPlan part,
      int index,
    ) async {
      final ({int startInclusive, int endExclusive}) range =
          computeMultipartPartByteRange(
            partNumberOneBased: part.partNumber,
            partSizeBytes: plan.partSize,
            totalFileBytes: totalBytes,
          );
      final int chunkLength = range.endExclusive - range.startInclusive;
      final RandomAccessFile raf = await File(file.path).open();
      try {
        await raf.setPosition(range.startInclusive);
        final Uint8List chunk = await raf.read(chunkLength);
        await _uploadDio.put<dynamic>(
          part.uploadUrl,
          data: chunk,
          cancelToken: params.cancelToken,
          options: Options(
            contentType: normalizedType,
            headers: <String, dynamic>{
              Headers.contentLengthHeader: chunk.length,
            },
          ),
          onSendProgress: (int sent, int chunkTotal) {
            loadedByPart[index] = sent < chunk.length ? sent : chunk.length;
            reportProgress();
          },
        );
        loadedByPart[index] = chunk.length;
        reportProgress();
      } finally {
        await raf.close();
      }
    });

    await _channelsApi.completeMultipartMessageAttachmentUploads(
      channelId: params.channelId,
      body: CompleteMultipartAttachmentUploadRequest(
        uploads: <CompleteMultipartAttachmentUploadItem>[
          CompleteMultipartAttachmentUploadItem(
            uploadFilename: plan.uploadFilename,
            uploadId: plan.uploadId,
          ),
        ],
      ),
    );
    params.onProgress?.call(totalBytes, totalBytes);
  }

  Future<void> _runWithConcurrency<TItem>(
    List<TItem> items,
    int concurrency,
    Future<void> Function(TItem item, int index) worker,
  ) async {
    int nextIndex = 0;
    Future<void> runWorker() async {
      while (true) {
        final int index = nextIndex;
        nextIndex += 1;
        if (index >= items.length) {
          return;
        }
        await worker(items[index], index);
      }
    }

    final int workerCount = concurrency < 1
        ? 1
        : (concurrency > items.length ? items.length : concurrency);
    await Future.wait(
      List<Future<void>>.generate(workerCount, (_) => runWorker()),
    );
  }

  String _normalizedContentType(XFile file) {
    return file.mimeType?.trim().isNotEmpty ?? false
        ? file.mimeType!.trim()
        : 'application/octet-stream';
  }
}
