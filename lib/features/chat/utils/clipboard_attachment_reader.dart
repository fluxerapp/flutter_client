import 'dart:async';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:fluxer_app/features/chat/utils/attachment_filename_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachment_mime_utils.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';
import 'package:super_clipboard/super_clipboard.dart';

class _ClipboardFileRead {
  const _ClipboardFileRead({required this.bytes, this.fileName});

  final Uint8List bytes;
  final String? fileName;
}

final List<FileFormat> _clipboardFileFormats = Formats.standardFormats
    .whereType<FileFormat>()
    .toList();

const Set<FileFormat> textClipboardFileFormats = <FileFormat>{
  Formats.plainTextFile,
  Formats.htmlFile,
  Formats.md,
  Formats.csv,
  Formats.json,
  Formats.rtf,
};

bool isTextClipboardFileFormat(FileFormat format) {
  return textClipboardFileFormats.contains(format);
}

const List<FileFormat> _prioritizedClipboardFileFormats = <FileFormat>[
  Formats.png,
  Formats.jpeg,
  Formats.gif,
  Formats.webp,
  Formats.heic,
  Formats.heif,
  Formats.tiff,
  Formats.bmp,
  Formats.svg,
  Formats.ico,
  Formats.mp4,
  Formats.mov,
  Formats.m4v,
  Formats.webm,
  Formats.avi,
  Formats.mkv,
  Formats.pdf,
];

List<DataFormat<Object>> orderClipboardFileFormats(
  List<DataFormat<Object>> available,
) {
  final List<FileFormat> ordered = <FileFormat>[];
  for (final FileFormat format in _prioritizedClipboardFileFormats) {
    if (available.contains(format)) {
      ordered.add(format);
    }
  }
  for (final DataFormat<Object> format in available) {
    if (format is FileFormat && !ordered.contains(format)) {
      ordered.add(format);
    }
  }
  return ordered;
}

bool shouldSkipClipboardFileFormat(
  ClipboardDataReader item,
  FileFormat format,
) {
  if (!isTextClipboardFileFormat(format)) {
    return false;
  }
  return item.canProvide(Formats.plainText) ||
      item.canProvide(Formats.htmlText);
}

Future<_ClipboardFileRead?> _readClipboardFile(
  DataReader reader,
  FileFormat format,
) {
  final Completer<_ClipboardFileRead?> completer =
      Completer<_ClipboardFileRead?>();
  final ReadProgress? progress = reader.getFile(
    format,
    (DataReaderFile file) async {
      try {
        final Uint8List all = await file.readAll();
        if (!completer.isCompleted) {
          completer.complete(
            _ClipboardFileRead(bytes: all, fileName: file.fileName),
          );
        }
      } on Object {
        if (!completer.isCompleted) {
          completer.complete(null);
        }
      }
    },
    onError: (_) {
      if (!completer.isCompleted) {
        completer.complete(null);
      }
    },
  );
  if (progress == null && !completer.isCompleted) {
    completer.complete(null);
  }
  return completer.future;
}

Future<List<XFile>> readClipboardAttachmentFiles() async {
  final SystemClipboard? clipboard = SystemClipboard.instance;
  if (clipboard == null) {
    return <XFile>[];
  }
  final ClipboardReader reader = await clipboard.read();
  final List<XFile> result = <XFile>[];
  for (final ClipboardDataReader item in reader.items) {
    if (result.length >= kMaxAttachmentsPerMessage) {
      break;
    }
    final List<DataFormat<Object>> available = orderClipboardFileFormats(
      item.getFormats(_clipboardFileFormats),
    );
    for (final DataFormat<Object> format in available) {
      if (format is! FileFormat) {
        continue;
      }
      if (shouldSkipClipboardFileFormat(item, format)) {
        continue;
      }
      final _ClipboardFileRead? read = await _readClipboardFile(item, format);
      if (read == null || read.bytes.isEmpty) {
        continue;
      }
      final String? suggestedName = await item.getSuggestedName();
      final String name = resolveClipboardFilename(
        format: format,
        fileName: read.fileName,
        suggestedName: suggestedName,
      );
      final ({String name, String? mime}) metadata =
          resolveClipboardAttachmentMetadata(
            bytes: read.bytes,
            format: format,
            name: name,
          );
      result.add(
        XFile.fromData(
          read.bytes,
          name: metadata.name,
          mimeType: metadata.mime,
        ),
      );
      break;
    }
  }
  return result;
}

String resolveClipboardFilename({
  required FileFormat format,
  String? fileName,
  String? suggestedName,
}) {
  final String? resolvedFileName = fileName?.trim();
  if (resolvedFileName != null && resolvedFileName.isNotEmpty) {
    return _ensureClipboardFilenameExtension(resolvedFileName, format);
  }
  final String? resolvedSuggestedName = suggestedName?.trim();
  if (resolvedSuggestedName != null && resolvedSuggestedName.isNotEmpty) {
    return _ensureClipboardFilenameExtension(resolvedSuggestedName, format);
  }
  return 'clipboard.${extensionForClipboardFormat(format)}';
}

String _ensureClipboardFilenameExtension(String name, FileFormat format) {
  if (_hasKnownFilenameExtension(name)) {
    return name;
  }
  final String ext = extensionForClipboardFormat(format);
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
  required FileFormat format,
  required String name,
}) {
  final String? mime =
      mimeForClipboardFormat(format) ?? detectSupportedUploadMimeType(bytes);
  return (
    name: filenameForMimeType(name, mimeType: mime, defaultStem: 'clipboard'),
    mime: mime,
  );
}

String extensionForClipboardFormat(FileFormat format) {
  for (final _ClipboardFormatInfo info in _clipboardFormatInfos) {
    if (identical(format, info.format)) {
      return info.extension;
    }
  }
  if (format is SimpleFileFormat) {
    final List<PlatformFormat>? mimeTypes = format.mimeTypes;
    if (mimeTypes != null && mimeTypes.isNotEmpty) {
      final String? fromMime = uploadMimeExtension(mimeTypes.first);
      if (fromMime != null) {
        return fromMime;
      }
    }
  }
  return 'bin';
}

String? mimeForClipboardFormat(FileFormat format) {
  for (final _ClipboardFormatInfo info in _clipboardFormatInfos) {
    if (identical(format, info.format)) {
      return info.mimeType;
    }
  }
  if (format is SimpleFileFormat) {
    final List<PlatformFormat>? mimeTypes = format.mimeTypes;
    if (mimeTypes != null && mimeTypes.isNotEmpty) {
      return mimeTypes.first;
    }
  }
  return null;
}

class _ClipboardFormatInfo {
  const _ClipboardFormatInfo({
    required this.format,
    required this.extension,
    required this.mimeType,
  });

  final FileFormat format;
  final String extension;
  final String mimeType;
}

const List<_ClipboardFormatInfo> _clipboardFormatInfos = <_ClipboardFormatInfo>[
  _ClipboardFormatInfo(
    format: Formats.plainTextFile,
    extension: 'txt',
    mimeType: 'text/plain',
  ),
  _ClipboardFormatInfo(
    format: Formats.htmlFile,
    extension: 'html',
    mimeType: 'text/html',
  ),
  _ClipboardFormatInfo(
    format: Formats.jpeg,
    extension: 'jpg',
    mimeType: 'image/jpeg',
  ),
  _ClipboardFormatInfo(
    format: Formats.png,
    extension: 'png',
    mimeType: 'image/png',
  ),
  _ClipboardFormatInfo(
    format: Formats.svg,
    extension: 'svg',
    mimeType: 'image/svg+xml',
  ),
  _ClipboardFormatInfo(
    format: Formats.gif,
    extension: 'gif',
    mimeType: 'image/gif',
  ),
  _ClipboardFormatInfo(
    format: Formats.webp,
    extension: 'webp',
    mimeType: 'image/webp',
  ),
  _ClipboardFormatInfo(
    format: Formats.tiff,
    extension: 'tif',
    mimeType: 'image/tiff',
  ),
  _ClipboardFormatInfo(
    format: Formats.bmp,
    extension: 'bmp',
    mimeType: 'image/bmp',
  ),
  _ClipboardFormatInfo(
    format: Formats.ico,
    extension: 'ico',
    mimeType: 'image/x-icon',
  ),
  _ClipboardFormatInfo(
    format: Formats.heic,
    extension: 'heic',
    mimeType: 'image/heic',
  ),
  _ClipboardFormatInfo(
    format: Formats.heif,
    extension: 'heif',
    mimeType: 'image/heif',
  ),
  _ClipboardFormatInfo(
    format: Formats.mp4,
    extension: 'mp4',
    mimeType: 'video/mp4',
  ),
  _ClipboardFormatInfo(
    format: Formats.mov,
    extension: 'mov',
    mimeType: 'video/quicktime',
  ),
  _ClipboardFormatInfo(
    format: Formats.m4v,
    extension: 'm4v',
    mimeType: 'video/x-m4v',
  ),
  _ClipboardFormatInfo(
    format: Formats.avi,
    extension: 'avi',
    mimeType: 'video/x-msvideo',
  ),
  _ClipboardFormatInfo(
    format: Formats.mpeg,
    extension: 'mpeg',
    mimeType: 'video/mpeg',
  ),
  _ClipboardFormatInfo(
    format: Formats.webm,
    extension: 'webm',
    mimeType: 'video/webm',
  ),
  _ClipboardFormatInfo(
    format: Formats.ogg,
    extension: 'ogg',
    mimeType: 'video/ogg',
  ),
  _ClipboardFormatInfo(
    format: Formats.wmv,
    extension: 'wmv',
    mimeType: 'video/x-ms-wmv',
  ),
  _ClipboardFormatInfo(
    format: Formats.flv,
    extension: 'flv',
    mimeType: 'video/x-flv',
  ),
  _ClipboardFormatInfo(
    format: Formats.mkv,
    extension: 'mkv',
    mimeType: 'video/x-matroska',
  ),
  _ClipboardFormatInfo(
    format: Formats.ts,
    extension: 'ts',
    mimeType: 'video/mp2t',
  ),
  _ClipboardFormatInfo(
    format: Formats.mp3,
    extension: 'mp3',
    mimeType: 'audio/mpeg',
  ),
  _ClipboardFormatInfo(
    format: Formats.m4a,
    extension: 'm4a',
    mimeType: 'audio/mp4',
  ),
  _ClipboardFormatInfo(
    format: Formats.oga,
    extension: 'oga',
    mimeType: 'audio/ogg',
  ),
  _ClipboardFormatInfo(
    format: Formats.aac,
    extension: 'aac',
    mimeType: 'audio/aac',
  ),
  _ClipboardFormatInfo(
    format: Formats.wav,
    extension: 'wav',
    mimeType: 'audio/wav',
  ),
  _ClipboardFormatInfo(
    format: Formats.opus,
    extension: 'opus',
    mimeType: 'audio/opus',
  ),
  _ClipboardFormatInfo(
    format: Formats.flac,
    extension: 'flac',
    mimeType: 'audio/flac',
  ),
  _ClipboardFormatInfo(
    format: Formats.pdf,
    extension: 'pdf',
    mimeType: 'application/pdf',
  ),
  _ClipboardFormatInfo(
    format: Formats.doc,
    extension: 'doc',
    mimeType: 'application/msword',
  ),
  _ClipboardFormatInfo(
    format: Formats.docx,
    extension: 'docx',
    mimeType:
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  ),
  _ClipboardFormatInfo(
    format: Formats.epub,
    extension: 'epub',
    mimeType: 'application/epub+zip',
  ),
  _ClipboardFormatInfo(
    format: Formats.md,
    extension: 'md',
    mimeType: 'text/markdown',
  ),
  _ClipboardFormatInfo(
    format: Formats.csv,
    extension: 'csv',
    mimeType: 'text/csv',
  ),
  _ClipboardFormatInfo(
    format: Formats.xls,
    extension: 'xls',
    mimeType: 'application/vnd.ms-excel',
  ),
  _ClipboardFormatInfo(
    format: Formats.xlsx,
    extension: 'xlsx',
    mimeType:
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  ),
  _ClipboardFormatInfo(
    format: Formats.ppt,
    extension: 'ppt',
    mimeType: 'application/vnd.ms-powerpoint',
  ),
  _ClipboardFormatInfo(
    format: Formats.pptx,
    extension: 'pptx',
    mimeType:
        'application/vnd.openxmlformats-officedocument.presentationml.presentation',
  ),
  _ClipboardFormatInfo(
    format: Formats.rtf,
    extension: 'rtf',
    mimeType: 'application/rtf',
  ),
  _ClipboardFormatInfo(
    format: Formats.json,
    extension: 'json',
    mimeType: 'application/json',
  ),
  _ClipboardFormatInfo(
    format: Formats.zip,
    extension: 'zip',
    mimeType: 'application/zip',
  ),
  _ClipboardFormatInfo(
    format: Formats.tar,
    extension: 'tar',
    mimeType: 'application/x-tar',
  ),
  _ClipboardFormatInfo(
    format: Formats.gzip,
    extension: 'gz',
    mimeType: 'application/gzip',
  ),
  _ClipboardFormatInfo(
    format: Formats.bzip2,
    extension: 'bz2',
    mimeType: 'application/x-bzip2',
  ),
  _ClipboardFormatInfo(
    format: Formats.xz,
    extension: 'xz',
    mimeType: 'application/x-xz',
  ),
  _ClipboardFormatInfo(
    format: Formats.rar,
    extension: 'rar',
    mimeType: 'application/x-rar-compressed',
  ),
  _ClipboardFormatInfo(
    format: Formats.jar,
    extension: 'jar',
    mimeType: 'application/java-archive',
  ),
  _ClipboardFormatInfo(
    format: Formats.sevenZip,
    extension: '7z',
    mimeType: 'application/x-7z-compressed',
  ),
  _ClipboardFormatInfo(
    format: Formats.dmg,
    extension: 'dmg',
    mimeType: 'application/x-apple-diskimage',
  ),
  _ClipboardFormatInfo(
    format: Formats.iso,
    extension: 'iso',
    mimeType: 'application/x-iso9660-image',
  ),
  _ClipboardFormatInfo(
    format: Formats.deb,
    extension: 'deb',
    mimeType: 'application/x-debian-package',
  ),
  _ClipboardFormatInfo(
    format: Formats.rpm,
    extension: 'rpm',
    mimeType: 'application/x-rpm',
  ),
  _ClipboardFormatInfo(
    format: Formats.apk,
    extension: 'apk',
    mimeType: 'application/vnd.android.package-archive',
  ),
  _ClipboardFormatInfo(
    format: Formats.exe,
    extension: 'exe',
    mimeType: 'application/x-msdownload',
  ),
  _ClipboardFormatInfo(
    format: Formats.msi,
    extension: 'msi',
    mimeType: 'application/x-msi',
  ),
  _ClipboardFormatInfo(
    format: Formats.dll,
    extension: 'dll',
    mimeType: 'application/x-msdownload',
  ),
];
