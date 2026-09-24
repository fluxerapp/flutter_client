import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;

const int _kMaxPushImageBytes = 5 * 1024 * 1024;
const int kPushAvatarMaxEdge = 160;
const int kPushPictureMaxEdge = 720;

const Duration _kPushImageTimeout = Duration(seconds: 8);

Future<String?> downloadPushNotificationImage(
  String rawUrl, {
  int maxEdge = kPushPictureMaxEdge,
}) async {
  final Uri? uri = Uri.tryParse(rawUrl.trim());
  if (uri == null || (uri.scheme != 'https' && uri.scheme != 'http')) {
    return null;
  }
  final HttpClient client = HttpClient();
  try {
    final HttpClientRequest request = await client
        .getUrl(uri)
        .timeout(_kPushImageTimeout);
    final HttpClientResponse response = await request.close().timeout(
      _kPushImageTimeout,
    );
    if (response.statusCode != 200) {
      await response.drain<void>();
      return null;
    }
    final BytesBuilder builder = BytesBuilder(copy: false);
    await for (final List<int> chunk in response.timeout(_kPushImageTimeout)) {
      if (builder.length + chunk.length > _kMaxPushImageBytes) {
        return null;
      }
      builder.add(chunk);
    }
    final Uint8List bytes = builder.takeBytes();
    if (bytes.isEmpty) {
      return null;
    }
    final Uint8List? encoded = encodePushNotificationImage(
      bytes,
      maxEdge: maxEdge,
    );
    if (encoded == null || encoded.isEmpty) {
      return null;
    }
    final Directory dir = await Directory.systemTemp.createTemp('fluxer_push_');
    final File file = File('${dir.path}/image.jpg');
    await file.writeAsBytes(encoded, flush: true);
    return file.path;
  } on Object {
    return null;
  } finally {
    client.close(force: true);
  }
}

String? pushAuthorAvatarUrl(Map<String, String> payload) {
  final String? raw =
      _httpUrl(payload['author_avatar_url']) ?? _httpUrl(payload['icon']);
  if (raw == null) {
    return null;
  }
  return pushNotificationStaticImageUrl(raw, size: kPushAvatarMaxEdge);
}

String pushNotificationStaticImageUrl(String raw, {required int size}) {
  final Uri? uri = Uri.tryParse(raw);
  if (uri == null) {
    return raw;
  }
  final List<MapEntry<String, String>> kept = <MapEntry<String, String>>[];
  uri.queryParameters.forEach((String key, String value) {
    final String name = key.toLowerCase();
    if (name == 'format' ||
        name == 'fmt' ||
        name == 'animated' ||
        name == 'size') {
      return;
    }
    kept.add(MapEntry<String, String>(key, value));
  });
  return uri
      .replace(
        queryParameters: <String, String>{
          for (final MapEntry<String, String> entry in kept)
            entry.key: entry.value,
          'format': 'png',
          'animated': 'false',
          'size': '$size',
        },
      )
      .toString();
}

Uint8List? encodePushNotificationImage(
  Uint8List bytes, {
  required int maxEdge,
}) {
  final img.Image? decoded = img.decodeImage(bytes);
  if (decoded == null) {
    return null;
  }
  img.Image image = decoded;
  if (image.width > maxEdge || image.height > maxEdge) {
    if (image.width >= image.height) {
      image = img.copyResize(image, width: maxEdge);
    } else {
      image = img.copyResize(image, height: maxEdge);
    }
  }
  return Uint8List.fromList(img.encodeJpg(image, quality: 80));
}

String? pushAttachmentImageUrl(Map<String, String> payload) {
  if (_mediaDisabled(payload)) {
    return null;
  }
  return _httpUrl(payload['image_url']) ?? _httpUrl(payload['image']);
}

bool _mediaDisabled(Map<String, String> payload) {
  final String? value = payload['has_media']?.toLowerCase();
  return value == 'false' || value == '0';
}

String? _httpUrl(String? raw) {
  if (raw == null || raw.isEmpty) {
    return null;
  }
  final Uri? uri = Uri.tryParse(raw);
  if (uri == null || (uri.scheme != 'https' && uri.scheme != 'http')) {
    return null;
  }
  return raw;
}
