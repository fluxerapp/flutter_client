import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path_lib;

class ExpressionPickResult {
  const ExpressionPickResult({required this.name, required this.bytes});

  final String name;
  final Uint8List bytes;
}

// Static helpers for picking expression files from gallery or the file browser.
// ignore: avoid_classes_with_only_static_members
abstract final class ExpressionFilePicker {
  static const List<String> _emojiExtensions = <String>[
    'jpg',
    'jpeg',
    'png',
    'gif',
    'webp',
    'avif',
    'svg',
  ];

  static const List<String> _stickerExtensions = <String>[
    'jpg',
    'jpeg',
    'png',
    'gif',
    'webp',
    'avif',
    'svg',
  ];

  static Future<List<ExpressionPickResult>> pickEmojis() {
    return pickEmojisFromFiles();
  }

  static Future<List<ExpressionPickResult>> pickSticker() {
    return pickStickerFromFiles();
  }

  static Future<List<ExpressionPickResult>> pickEmojisFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> media = await picker.pickMultipleMedia();
    if (media.isEmpty) {
      return const <ExpressionPickResult>[];
    }
    return _resultsFromXFiles(media);
  }

  static Future<List<ExpressionPickResult>> pickStickerFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? media = await picker.pickMedia();
    if (media == null) {
      return const <ExpressionPickResult>[];
    }
    return _resultsFromXFiles(<XFile>[media]);
  }

  static Future<List<ExpressionPickResult>> pickEmojisFromFiles() {
    return _pickFromFilePicker(
      extensions: _emojiExtensions,
      allowMultiple: true,
    );
  }

  static Future<List<ExpressionPickResult>> pickStickerFromFiles() {
    return _pickFromFilePicker(
      extensions: _stickerExtensions,
      allowMultiple: false,
    );
  }

  static Future<List<ExpressionPickResult>> _pickFromFilePicker({
    required List<String> extensions,
    required bool allowMultiple,
  }) async {
    final List<PlatformFile> files;
    if (allowMultiple) {
      files = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: extensions,
      );
    } else {
      final PlatformFile? file = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: extensions,
      );
      files = file == null ? const <PlatformFile>[] : <PlatformFile>[file];
    }
    if (files.isEmpty) {
      return const <ExpressionPickResult>[];
    }
    final List<ExpressionPickResult> picked = <ExpressionPickResult>[];
    for (final PlatformFile file in files) {
      final Uint8List bytes = await file.readAsBytes();
      picked.add(ExpressionPickResult(name: file.name, bytes: bytes));
    }
    return picked;
  }

  static Future<List<ExpressionPickResult>> _resultsFromXFiles(
    List<XFile> files,
  ) async {
    final List<ExpressionPickResult> picked = <ExpressionPickResult>[];
    for (final XFile file in files) {
      final Uint8List bytes = await file.readAsBytes();
      picked.add(
        ExpressionPickResult(name: _filenameFromXFile(file), bytes: bytes),
      );
    }
    return picked;
  }

  static String _filenameFromXFile(XFile file) {
    final String fromName = file.name.trim();
    if (fromName.isNotEmpty) {
      return fromName;
    }
    final String path = file.path.trim();
    if (path.isNotEmpty) {
      return path_lib.basename(path);
    }
    return 'image.jpg';
  }
}
