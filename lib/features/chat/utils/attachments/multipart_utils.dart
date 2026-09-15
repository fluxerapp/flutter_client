import 'dart:convert';

import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';

/// Byte span for one multipart upload part (aligned with server numbering).
({int startInclusive, int endExclusive}) computeMultipartPartByteRange({
  required int partNumberOneBased,
  required int partSizeBytes,
  required int totalFileBytes,
}) {
  final int start = (partNumberOneBased - 1) * partSizeBytes;
  final int end = totalFileBytes < start + partSizeBytes
      ? totalFileBytes
      : start + partSizeBytes;
  return (startInclusive: start, endExclusive: end);
}

int estimateMultipartMessageRequestBytes({
  required Map<String, dynamic> payload,
  required List<({String name, int size, String contentType})> files,
}) {
  final String payloadJson = jsonEncode(payload);
  int totalBytes = utf8.encode(payloadJson).length;
  totalBytes += kMultipartRequestFixedOverheadBytes;
  for (var index = 0; index < files.length; index++) {
    final file = files[index];
    totalBytes += file.size;
    totalBytes += kMultipartRequestFileOverheadBytes;
    totalBytes += utf8.encode(file.name).length;
    totalBytes += utf8.encode(file.contentType).length;
    totalBytes += utf8.encode('$index').length;
  }
  return totalBytes;
}

bool isMultipartMessageRequestTooLarge({
  required Map<String, dynamic> payload,
  required List<({String name, int size, String contentType})> files,
  required int maxRequestBytes,
}) {
  if (files.isEmpty) {
    return false;
  }
  return estimateMultipartMessageRequestBytes(payload: payload, files: files) >
      maxRequestBytes;
}
