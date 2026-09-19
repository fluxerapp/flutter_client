import 'dart:io' show Directory, File;
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path_lib;
import 'package:path_provider/path_provider.dart';

const int kChatWallpaperMaxEdge = 1920;
const int kChatWallpaperLuminanceSampleEdge = 32;

class ChatWallpaperEncodedImage {
  const ChatWallpaperEncodedImage({
    required this.bytes,
    required this.luminance,
  });

  final Uint8List bytes;
  final double luminance;
}

ChatWallpaperEncodedImage? encodeChatWallpaperJpeg(Uint8List bytes) {
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
  return ChatWallpaperEncodedImage(
    bytes: Uint8List.fromList(img.encodeJpg(output, quality: 80)),
    luminance: sampleChatWallpaperImageLuminance(output),
  );
}

double? sampleChatWallpaperLuminance(Uint8List bytes) {
  if (bytes.isEmpty) {
    return null;
  }
  final img.Image? decoded = img.decodeImage(bytes);
  if (decoded == null) {
    return null;
  }
  return sampleChatWallpaperImageLuminance(decoded);
}

double sampleChatWallpaperImageLuminance(img.Image image) {
  final int longest = math.max(image.width, image.height);
  img.Image sample = image;
  if (longest > kChatWallpaperLuminanceSampleEdge) {
    final double scale = kChatWallpaperLuminanceSampleEdge / longest;
    sample = img.copyResize(
      image,
      width: math.max(1, (image.width * scale).round()),
      height: math.max(1, (image.height * scale).round()),
      interpolation: img.Interpolation.average,
    );
  }
  double sum = 0;
  int count = 0;
  for (final img.Pixel pixel in sample) {
    if (pixel.aNormalized <= 0) {
      continue;
    }
    final double r = _srgbToLinear(pixel.rNormalized);
    final double g = _srgbToLinear(pixel.gNormalized);
    final double b = _srgbToLinear(pixel.bNormalized);
    sum += 0.2126 * r + 0.7152 * g + 0.0722 * b;
    count += 1;
  }
  if (count == 0) {
    return 0;
  }
  return (sum / count).clamp(0.0, 1.0);
}

double _srgbToLinear(num channel) {
  final double c = channel.toDouble().clamp(0.0, 1.0);
  if (c <= 0.04045) {
    return c / 12.92;
  }
  return math.pow((c + 0.055) / 1.055, 2.4).toDouble();
}

Future<ChatWallpaperEncodedImage?> prepareChatWallpaperBytes(
  Uint8List bytes,
) async {
  final List<Object>? payload = await compute(
    _encodeChatWallpaperJpegPayload,
    bytes,
  );
  if (payload == null || payload.length < 2) {
    return null;
  }
  return ChatWallpaperEncodedImage(
    bytes: payload[0] as Uint8List,
    luminance: payload[1] as double,
  );
}

List<Object>? _encodeChatWallpaperJpegPayload(Uint8List bytes) {
  final ChatWallpaperEncodedImage? encoded = encodeChatWallpaperJpeg(bytes);
  if (encoded == null) {
    return null;
  }
  return <Object>[encoded.bytes, encoded.luminance];
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

  Future<double?> sampleExistingLuminance(String userId) async {
    final String? path = await existingPathForUser(userId);
    if (path == null) {
      return null;
    }
    try {
      final Uint8List bytes = await File(path).readAsBytes();
      return await compute(sampleChatWallpaperLuminance, bytes);
    } on Object {
      return null;
    }
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
