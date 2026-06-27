import 'dart:async';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:super_clipboard/super_clipboard.dart';

Future<Uint8List?> _readFileAll(DataReader reader, FileFormat format) {
  final Completer<Uint8List?> completer = Completer<Uint8List?>();
  final ReadProgress? progress = reader.getFile(
    format,
    (DataReaderFile file) async {
      try {
        final Uint8List all = await file.readAll();
        if (!completer.isCompleted) {
          completer.complete(all);
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

Future<List<XFile>> readClipboardImageFiles() async {
  final SystemClipboard? clipboard = SystemClipboard.instance;
  if (clipboard == null) {
    return <XFile>[];
  }
  final ClipboardReader reader = await clipboard.read();
  final List<FileFormat> formats = <FileFormat>[
    Formats.png,
    Formats.jpeg,
    Formats.gif,
    Formats.webp,
    Formats.bmp,
    Formats.tiff,
    Formats.heic,
  ];
  final List<XFile> result = <XFile>[];
  for (final ClipboardDataReader item in reader.items) {
    for (final FileFormat format in formats) {
      if (!item.canProvide(format)) {
        continue;
      }
      final Uint8List? bytes = await _readFileAll(item, format);
      if (bytes == null || bytes.isEmpty) {
        continue;
      }
      final String ext = _extensionForFormat(format);
      final String mime = _mimeForFormat(format);
      result.add(XFile.fromData(bytes, name: 'clipboard.$ext', mimeType: mime));
      return result;
    }
  }
  return result;
}

String _extensionForFormat(FileFormat format) {
  if (identical(format, Formats.png)) {
    return 'png';
  }
  if (identical(format, Formats.jpeg)) {
    return 'jpg';
  }
  if (identical(format, Formats.gif)) {
    return 'gif';
  }
  if (identical(format, Formats.webp)) {
    return 'webp';
  }
  if (identical(format, Formats.bmp)) {
    return 'bmp';
  }
  if (identical(format, Formats.tiff)) {
    return 'tif';
  }
  if (identical(format, Formats.heic)) {
    return 'heic';
  }
  return 'bin';
}

String _mimeForFormat(FileFormat format) {
  if (identical(format, Formats.png)) {
    return 'image/png';
  }
  if (identical(format, Formats.jpeg)) {
    return 'image/jpeg';
  }
  if (identical(format, Formats.gif)) {
    return 'image/gif';
  }
  if (identical(format, Formats.webp)) {
    return 'image/webp';
  }
  if (identical(format, Formats.bmp)) {
    return 'image/bmp';
  }
  if (identical(format, Formats.tiff)) {
    return 'image/tiff';
  }
  if (identical(format, Formats.heic)) {
    return 'image/heic';
  }
  return 'application/octet-stream';
}
