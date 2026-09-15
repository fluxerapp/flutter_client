import 'dart:typed_data';

import 'package:fluxer_app/shared/utils/image_utils.dart';

const Map<String, String> kSupportedUploadMimeToExtension = <String, String>{
  'image/jpeg': 'jpg',
  'image/jpg': 'jpg',
  'image/png': 'png',
  'image/gif': 'gif',
  'image/webp': 'webp',
  'image/heic': 'heic',
  'image/heif': 'heif',
  'image/avif': 'avif',
  'video/mp4': 'mp4',
  'video/webm': 'webm',
  'video/quicktime': 'mov',
  'video/x-m4v': 'm4v',
  'video/x-matroska': 'mkv',
  'application/pdf': 'pdf',
  'audio/mpeg': 'mp3',
  'audio/wav': 'wav',
  'audio/ogg': 'ogg',
  'audio/mp4': 'm4a',
  'audio/flac': 'flac',
  'audio/aac': 'aac',
  'application/zip': 'zip',
};

String? uploadMimeExtension(String? mimeType) {
  if (mimeType == null || mimeType.isEmpty) {
    return null;
  }
  return kSupportedUploadMimeToExtension[mimeType.toLowerCase()];
}

String attachmentExtensionForMime(String? mimeType) {
  final String? extension = uploadMimeExtension(mimeType);
  return extension == null ? '' : '.$extension';
}

String? detectSupportedUploadMimeType(Uint8List bytes) {
  final String imageMime = ImageUtils.detectMimeType(bytes);
  if (uploadMimeExtension(imageMime) != null) {
    return imageMime;
  }
  if (_hasPrefix(bytes, <int>[0x25, 0x50, 0x44, 0x46])) {
    return 'application/pdf';
  }
  if (_hasPrefix(bytes, <int>[0x50, 0x4B, 0x03, 0x04])) {
    return 'application/zip';
  }
  if (bytes.length >= 12 &&
      _hasPrefix(bytes.sublist(4, 8), <int>[0x66, 0x74, 0x79, 0x70])) {
    return 'video/mp4';
  }
  if (_hasPrefix(bytes, <int>[0x1A, 0x45, 0xDF, 0xA3])) {
    return 'video/webm';
  }
  if (bytes.length >= 12 &&
      _hasPrefix(bytes.sublist(0, 4), <int>[0x52, 0x49, 0x46, 0x46]) &&
      _hasPrefix(bytes.sublist(8, 12), <int>[0x57, 0x41, 0x56, 0x45])) {
    return 'audio/wav';
  }
  if (_hasPrefix(bytes, <int>[0x4F, 0x67, 0x67, 0x53])) {
    return 'audio/ogg';
  }
  if (_hasPrefix(bytes, <int>[0x66, 0x4C, 0x61, 0x43])) {
    return 'audio/flac';
  }
  if (_isMp3(bytes)) {
    return 'audio/mpeg';
  }
  return null;
}

bool _hasPrefix(Uint8List bytes, List<int> prefix) {
  if (bytes.length < prefix.length) {
    return false;
  }
  for (int i = 0; i < prefix.length; i++) {
    if (bytes[i] != prefix[i]) {
      return false;
    }
  }
  return true;
}

bool _isMp3(Uint8List bytes) {
  if (_hasPrefix(bytes, <int>[0x49, 0x44, 0x33])) {
    return true;
  }
  return bytes.length >= 2 && bytes[0] == 0xFF && (bytes[1] & 0xE0) == 0xE0;
}
