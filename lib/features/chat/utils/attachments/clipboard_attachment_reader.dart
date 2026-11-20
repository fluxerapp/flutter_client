import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_filename_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_mime_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';
import 'package:fluxer_clipboard/fluxer_clipboard.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;

const List<String> clipboardAttachmentMimeTypes = <String>[
  'image/png',
  'image/jpeg',
  'image/gif',
  'image/webp',
  'image/heic',
  'image/heif',
  'image/avif',
  'image/tiff',
  'image/bmp',
  'image/svg+xml',
  'image/x-icon',
  'video/mp4',
  'video/quicktime',
  'video/x-m4v',
  'video/webm',
  'video/x-msvideo',
  'video/x-matroska',
  'application/pdf',
  'text/plain',
  'text/html',
  'video/mpeg',
  'video/ogg',
  'video/x-ms-wmv',
  'video/x-flv',
  'video/mp2t',
  'audio/mpeg',
  'audio/mp4',
  'audio/ogg',
  'audio/aac',
  'audio/wav',
  'audio/flac',
  'application/msword',
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  'application/epub+zip',
  'text/markdown',
  'text/csv',
  'application/vnd.ms-excel',
  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  'application/vnd.ms-powerpoint',
  'application/vnd.openxmlformats-officedocument.presentationml.presentation',
  'application/rtf',
  'application/json',
  'application/zip',
  'application/x-tar',
  'application/gzip',
  'application/x-bzip2',
  'application/x-xz',
  'application/x-rar-compressed',
  'application/java-archive',
  'application/x-7z-compressed',
  'application/x-apple-diskimage',
  'application/x-iso9660-image',
  'application/x-debian-package',
  'application/x-rpm',
  'application/vnd.android.package-archive',
  'application/x-msdownload',
  'application/x-msi',
  'image/*',
  'video/*',
  'audio/*',
];

const Set<String> _pngConvertibleMimeTypes = <String>{
  'image/tiff',
  'image/bmp',
};

const Map<String, String> _extraClipboardMimeToExtension = <String, String>{
  'text/plain': 'txt',
  'text/html': 'html',
  'text/markdown': 'md',
  'text/csv': 'csv',
  'image/tiff': 'tif',
  'image/bmp': 'bmp',
  'image/svg+xml': 'svg',
  'image/x-icon': 'ico',
  'image/vnd.microsoft.icon': 'ico',
  'video/x-msvideo': 'avi',
  'video/mpeg': 'mpeg',
  'video/ogg': 'ogg',
  'video/x-ms-wmv': 'wmv',
  'video/x-flv': 'flv',
  'video/mp2t': 'ts',
  'audio/x-wav': 'wav',
  'audio/opus': 'opus',
  'application/msword': 'doc',
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
      'docx',
  'application/epub+zip': 'epub',
  'application/vnd.ms-excel': 'xls',
  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet': 'xlsx',
  'application/vnd.ms-powerpoint': 'ppt',
  'application/vnd.openxmlformats-officedocument.presentationml.presentation':
      'pptx',
  'application/rtf': 'rtf',
  'application/json': 'json',
  'application/x-tar': 'tar',
  'application/gzip': 'gz',
  'application/x-bzip2': 'bz2',
  'application/x-xz': 'xz',
  'application/x-rar-compressed': 'rar',
  'application/java-archive': 'jar',
  'application/x-7z-compressed': '7z',
  'application/x-apple-diskimage': 'dmg',
  'application/x-iso9660-image': 'iso',
  'application/x-debian-package': 'deb',
  'application/x-rpm': 'rpm',
  'application/vnd.android.package-archive': 'apk',
  'application/x-msdownload': 'exe',
  'application/x-msi': 'msi',
};

Future<List<XFile>> readClipboardAttachmentFiles() async {
  final List<NativeClipboardItem> items;
  try {
    items = await readNativeClipboardItems(
      mimeTypes: clipboardAttachmentMimeTypes,
      maxItems: kMaxAttachmentsPerMessage,
    );
  } on Object catch (error, stack) {
    talker.warning('[Clipboard] attachment read failed', error, stack);
    return <XFile>[];
  }
  final List<XFile> result = <XFile>[];
  for (final NativeClipboardItem item in items) {
    final XFile? file = await clipboardItemToXFile(item);
    if (file != null) {
      result.add(file);
    }
  }
  return result;
}

Future<XFile?> clipboardItemToXFile(NativeClipboardItem item) async {
  final String? path = item.path;
  if (path != null && path.isNotEmpty) {
    final String name = resolveClipboardFilename(
      mimeType: item.mimeType,
      fileName: item.name ?? p.basename(path),
    );
    return XFile(path, name: name, mimeType: item.mimeType);
  }
  Uint8List? bytes = item.data;
  if (bytes == null || bytes.isEmpty) {
    return null;
  }
  String? mimeType = item.mimeType?.toLowerCase();
  if (_pngConvertibleMimeTypes.contains(mimeType)) {
    final Uint8List? png = await compute(_encodeAsPng, bytes);
    if (png != null) {
      bytes = png;
      mimeType = 'image/png';
    }
  }
  final String name = resolveClipboardFilename(
    mimeType: mimeType,
    fileName: item.name,
  );
  final ({String name, String? mime}) metadata =
      resolveClipboardAttachmentMetadata(
        bytes: bytes,
        mimeType: mimeType,
        name: name,
      );
  return XFile.fromData(bytes, name: metadata.name, mimeType: metadata.mime);
}

Uint8List? _encodeAsPng(Uint8List bytes) {
  try {
    final img.Image? decoded = img.decodeImage(bytes);
    return decoded == null ? null : img.encodePng(decoded);
  } on Object {
    return null;
  }
}

String resolveClipboardFilename({String? mimeType, String? fileName}) {
  final String? resolvedFileName = fileName?.trim();
  if (resolvedFileName != null && resolvedFileName.isNotEmpty) {
    return _ensureClipboardFilenameExtension(resolvedFileName, mimeType);
  }
  return 'clipboard.${extensionForClipboardMime(mimeType)}';
}

String _ensureClipboardFilenameExtension(String name, String? mimeType) {
  if (_hasKnownFilenameExtension(name)) {
    return name;
  }
  final String ext = extensionForClipboardMime(mimeType);
  if (ext == 'bin') {
    return name;
  }
  return '$name.$ext';
}

bool _hasKnownFilenameExtension(String name) {
  final int dot = name.lastIndexOf('.');
  if (dot <= 0 || dot >= name.length - 1) {
    return false;
  }
  final String ext = name.substring(dot + 1).toLowerCase();
  return ext.isNotEmpty && ext.length <= 12;
}

({String name, String? mime}) resolveClipboardAttachmentMetadata({
  required Uint8List bytes,
  required String? mimeType,
  required String name,
}) {
  final String? mime = (mimeType != null && mimeType.isNotEmpty)
      ? mimeType
      : detectSupportedUploadMimeType(bytes);
  return (
    name: filenameForMimeType(name, mimeType: mime, defaultStem: 'clipboard'),
    mime: mime,
  );
}

String extensionForClipboardMime(String? mimeType) {
  if (mimeType == null || mimeType.isEmpty) {
    return 'bin';
  }
  final String normalized = mimeType.toLowerCase();
  return uploadMimeExtension(normalized) ??
      _extraClipboardMimeToExtension[normalized] ??
      'bin';
}
