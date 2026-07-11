import 'package:cross_file/cross_file.dart';

import 'package:fluxer_app/features/chat/utils/multipart_utils.dart';

enum FileUploadValidationError {
  noFiles,
  tooManyAttachments,
  fileTooLarge,
  multipartRequestTooLarge,
}

class FileUploadValidationResult {
  const FileUploadValidationResult.success() : isValid = true, error = null;

  const FileUploadValidationResult.failure(FileUploadValidationError err)
    : isValid = false,
      error = err;

  final bool isValid;
  final FileUploadValidationError? error;
}

class FileUploadValidator {
  const FileUploadValidator({
    required this.maxAttachments,
    required this.maxFileBytes,
    required this.maxMultipartRequestBytes,
  });

  final int maxAttachments;
  final int maxFileBytes;
  final int maxMultipartRequestBytes;

  Future<FileUploadValidationResult> validateAddFiles({
    required int currentCount,
    required List<XFile> newFiles,
    Map<String, dynamic>? multipartPayloadPreview,
  }) async {
    if (newFiles.isEmpty) {
      return const FileUploadValidationResult.failure(
        FileUploadValidationError.noFiles,
      );
    }
    if (currentCount + newFiles.length > maxAttachments) {
      return const FileUploadValidationResult.failure(
        FileUploadValidationError.tooManyAttachments,
      );
    }
    for (final XFile x in newFiles) {
      final int len = await x.length();
      if (len > maxFileBytes) {
        return const FileUploadValidationResult.failure(
          FileUploadValidationError.fileTooLarge,
        );
      }
    }
    if (multipartPayloadPreview != null) {
      final descriptors = <({String name, int size, String contentType})>[];
      for (final XFile x in newFiles) {
        final int len = await x.length();
        descriptors.add((
          name: x.name,
          size: len,
          contentType: resolveContentTypeForUpload(
            filename: x.name,
            mimeType: x.mimeType,
          ),
        ));
      }
      if (isMultipartMessageRequestTooLarge(
        payload: multipartPayloadPreview,
        files: descriptors,
        maxRequestBytes: maxMultipartRequestBytes,
      )) {
        return const FileUploadValidationResult.failure(
          FileUploadValidationError.multipartRequestTooLarge,
        );
      }
    }
    return const FileUploadValidationResult.success();
  }

  static String resolveContentTypeForUpload({
    required String filename,
    String? mimeType,
  }) {
    final String? trimmedMime = mimeType?.trim();
    if (trimmedMime != null &&
        trimmedMime.isNotEmpty &&
        trimmedMime.toLowerCase() != 'application/octet-stream') {
      return trimmedMime;
    }
    return guessContentTypeFromName(filename);
  }

  static String guessContentTypeFromName(String name) {
    final String lower = name.toLowerCase();
    if (lower.endsWith('.png')) {
      return 'image/png';
    }
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) {
      return 'image/jpeg';
    }
    if (lower.endsWith('.gif')) {
      return 'image/gif';
    }
    if (lower.endsWith('.webp')) {
      return 'image/webp';
    }
    if (lower.endsWith('.pdf')) {
      return 'application/pdf';
    }
    return 'application/octet-stream';
  }
}
