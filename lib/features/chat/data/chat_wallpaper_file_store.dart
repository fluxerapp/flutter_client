import 'dart:io' show Directory, File;
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path_lib;
import 'package:path_provider/path_provider.dart';

const int kChatWallpaperMaxEdge = 1920;

Uint8List? encodeChatWallpaperJpeg(Uint8List bytes) {
  if (bytes.isEmpty) {
    return null;
  }
  final img.Image? decoded = img.decodeImage(bytes);
  if (decoded == null) {
    return null;
  }
  img.Image output = decoded;
  final int longest = math.max(decoded.width, decoded.height);
  if (longest > kChatWallpaperMaxEdge) {
    final double scale = kChatWallpaperMaxEdge / longest;
    output = img.copyResize(
      decoded,
      width: math.max(1, (decoded.width * scale).round()),
      height: math.max(1, (decoded.height * scale).round()),
      interpolation: img.Interpolation.linear,
    );
  }
  return Uint8List.fromList(img.encodeJpg(output, quality: 80));
}

Future<Uint8List?> prepareChatWallpaperBytes(Uint8List bytes) {
  return compute(encodeChatWallpaperJpeg, bytes);
}

class ChatWallpaperFileStore {
  const ChatWallpaperFileStore();

  Future<String?> pathForUser(String userId) async {
    if (kIsWeb) {
      return null;
    }
    try {
      final Directory dir = await getApplicationDocumentsDirectory();
      return path_lib.join(dir.path, 'chat_wallpaper', '$userId.jpg');
    } on Object {
      return null;
    }
  }

  Future<String?> existingPathForUser(String userId) async {
    final String? path = await pathForUser(userId);
    if (path == null) {
      return null;
    }
    try {
      if (File(path).existsSync()) {
        return path;
      }
    } on Object {
      return null;
    }
    return null;
  }

  Future<String?> saveForUser({
    required String userId,
    required Uint8List bytes,
  }) async {
    final String? path = await pathForUser(userId);
    if (path == null) {
      return null;
    }
    try {
      final File file = File(path);
      await file.parent.create(recursive: true);
      await file.writeAsBytes(bytes, flush: true);
      await FileImage(file).evict();
      return path;
    } on Object {
      return null;
    }
  }
}
