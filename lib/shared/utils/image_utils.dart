import 'dart:convert';
import 'dart:io' show Platform;
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path_lib;

typedef AnimationCheckResult = ({bool isAnimated, String? format});

const int _kMaxImageSizeBytes = 10 * 1024 * 1024;

// Preserves the existing image utility API used by profile settings.
// ignore: avoid_classes_with_only_static_members
abstract final class ImageUtils {
  static Future<({Uint8List bytes, String name})?> pickImage() {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      return _pickImageFromGallery();
    }
    return _pickImageFromFilePicker();
  }

  static Future<({Uint8List bytes, String name})?>
  _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    final Uint8List bytes = await image.readAsBytes();
    return (bytes: bytes, name: _filenameFromXFile(image));
  }

  static Future<({Uint8List bytes, String name})?>
  _pickImageFromFilePicker() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'avif'],
      withData: true,
    );
    if (result == null || result.files.isEmpty) {
      return null;
    }
    final file = result.files.first;
    final bytes = file.bytes;
    if (bytes == null) {
      return null;
    }
    return (bytes: bytes, name: file.name);
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

  static bool isOverSizeLimit(Uint8List bytes) {
    return bytes.length > _kMaxImageSizeBytes;
  }

  static String detectMimeType(Uint8List bytes) {
    if (bytes.length >= 4 &&
        bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4E &&
        bytes[3] == 0x47) {
      return 'image/png';
    }
    if (bytes.length >= 4 &&
        bytes[0] == 0x47 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46 &&
        bytes[3] == 0x38) {
      return 'image/gif';
    }
    if (bytes.length >= 3 &&
        bytes[0] == 0xFF &&
        bytes[1] == 0xD8 &&
        bytes[2] == 0xFF) {
      return 'image/jpeg';
    }
    if (bytes.length >= 12 &&
        bytes[0] == 0x52 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46 &&
        bytes[3] == 0x46 &&
        bytes[8] == 0x57 &&
        bytes[9] == 0x45 &&
        bytes[10] == 0x42 &&
        bytes[11] == 0x50) {
      return 'image/webp';
    }
    if (_isAvif(bytes)) {
      return 'image/avif';
    }
    return 'application/octet-stream';
  }

  static AnimationCheckResult checkAnimated(Uint8List bytes) {
    final mime = detectMimeType(bytes);
    if (mime == 'image/gif' && _isAnimatedGif(bytes)) {
      return (isAnimated: true, format: 'gif');
    }
    if (mime == 'image/png' && _isAnimatedPng(bytes)) {
      return (isAnimated: true, format: 'apng');
    }
    if (mime == 'image/webp' && _isAnimatedWebp(bytes)) {
      return (isAnimated: true, format: 'webp');
    }
    if (mime == 'image/avif' && _isAnimatedAvif(bytes)) {
      return (isAnimated: true, format: 'avif');
    }
    return (isAnimated: false, format: null);
  }

  static String toDataUri(Uint8List bytes) {
    final mime = detectMimeType(bytes);
    final encoded = base64Encode(bytes);
    return 'data:$mime;base64,$encoded';
  }

  static bool _isAvif(Uint8List bytes) {
    if (bytes.length < 12) {
      return false;
    }
    if (bytes[4] != 0x66 ||
        bytes[5] != 0x74 ||
        bytes[6] != 0x79 ||
        bytes[7] != 0x70) {
      return false;
    }
    final brand = String.fromCharCodes(bytes.sublist(8, 12));
    return brand == 'avif' || brand == 'avis';
  }

  static bool _isAnimatedGif(Uint8List bytes) {
    var count = 0;
    for (var i = 0; i < bytes.length - 1; i++) {
      if (bytes[i] == 0x21 && bytes[i + 1] == 0xF9) {
        count++;
        if (count > 1) {
          return true;
        }
      }
    }
    return false;
  }

  static bool _isAnimatedPng(Uint8List bytes) {
    for (var i = 0; i < bytes.length - 3; i++) {
      if (bytes[i] == 0x61 &&
          bytes[i + 1] == 0x63 &&
          bytes[i + 2] == 0x54 &&
          bytes[i + 3] == 0x4C) {
        return true;
      }
    }
    return false;
  }

  static bool _isAnimatedWebp(Uint8List bytes) {
    for (var i = 0; i < bytes.length - 3; i++) {
      if (bytes[i] == 0x41 &&
          bytes[i + 1] == 0x4E &&
          bytes[i + 2] == 0x49 &&
          bytes[i + 3] == 0x4D) {
        return true;
      }
    }
    return false;
  }

  static bool _isAnimatedAvif(Uint8List bytes) {
    if (bytes.length < 12) {
      return false;
    }
    final major = String.fromCharCodes(bytes.sublist(8, 12));
    if (major == 'avis') {
      return true;
    }
    if (bytes.length < 16) {
      return false;
    }
    final boxSize =
        (bytes[0] << 24) | (bytes[1] << 16) | (bytes[2] << 8) | bytes[3];
    final limit = boxSize < bytes.length ? boxSize : bytes.length;
    for (var i = 16; i + 3 < limit; i += 4) {
      final brand = String.fromCharCodes(bytes.sublist(i, i + 4));
      if (brand == 'avis') {
        return true;
      }
    }
    return false;
  }
}
