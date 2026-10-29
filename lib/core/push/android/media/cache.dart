import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/push/android/media/instance_urls.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

const int _kMaxPushImageBytes = 5 * 1024 * 1024;
const int kPushAvatarMaxEdge = 160;
const int kPushPictureMaxEdge = 720;
const int kPushMediaCacheMaxBytes = 65 * 1024 * 1024;
const int kPushMediaCacheMaxEntries = 128;

const Duration _kPushImageTimeout = Duration(seconds: 8);

final Sha256 _pushMediaCacheSha256 = Sha256();

Future<String?> downloadPushNotificationImage(String rawUrl) {
  return _downloadPushNotificationMedia(
    rawUrl,
    fileName: 'image.jpg',
    encode: (Uint8List bytes) =>
        encodePushNotificationImage(bytes, maxEdge: kPushPictureMaxEdge),
  );
}

Future<String?> downloadPushNotificationAvatar(String rawUrl) {
  return _downloadPushNotificationMedia(
    rawUrl,
    fileName: 'avatar.png',
    encode: (Uint8List bytes) =>
        encodePushNotificationAvatar(bytes, size: kPushAvatarMaxEdge),
  );
}

Future<String?> _downloadPushNotificationMedia(
  String rawUrl, {
  required String fileName,
  required Uint8List? Function(Uint8List bytes) encode,
}) async {
  final Uri? uri = Uri.tryParse(rawUrl.trim());
  if (uri == null || (uri.scheme != 'https' && uri.scheme != 'http')) {
    return null;
  }
  final String cacheKey = uri.toString();
  final String cachedName = await _pushMediaCacheFileName(cacheKey, fileName);
  final File cachedFile = await _pushMediaCacheFile(cachedName);
  if (cachedFile.existsSync() && cachedFile.lengthSync() > 0) {
    return cachedFile.path;
  }
  File? staging;
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
    final Uint8List? encoded = encode(bytes);
    if (encoded == null || encoded.isEmpty) {
      return null;
    }
    await cachedFile.parent.create(recursive: true);
    staging = File('${cachedFile.path}.part');
    await staging.writeAsBytes(encoded, flush: true);
    if (cachedFile.existsSync()) {
      await cachedFile.delete();
    }
    await staging.rename(cachedFile.path);
    staging = null;
    await prunePushNotificationMediaCache();
    return cachedFile.path;
  } on Object {
    return null;
  } finally {
    client.close(force: true);
    final File? leftover = staging;
    if (leftover != null && leftover.existsSync()) {
      try {
        await leftover.delete();
      } on Object {
        // Failed download
      }
    }
  }
}

Future<void> prunePushNotificationMediaCache() async {
  try {
    final Directory cache = await _pushMediaCacheDirectory();
    if (!cache.existsSync()) {
      return;
    }
    for (final FileSystemEntity entry in cache.listSync()) {
      if (entry is! File || !entry.path.endsWith('.part')) {
        continue;
      }
      try {
        await entry.delete();
      } on Object {
        // Stale partial file
      }
    }
    final List<File> files = cache.listSync().whereType<File>().toList();
    if (files.isEmpty) {
      return;
    }
    files.sort(
      (File left, File right) =>
          left.lastModifiedSync().compareTo(right.lastModifiedSync()),
    );
    int totalBytes = 0;
    for (final File file in files) {
      totalBytes += file.lengthSync();
    }
    int remaining = files.length;
    for (final File file in files) {
      if (totalBytes <= kPushMediaCacheMaxBytes &&
          remaining <= kPushMediaCacheMaxEntries) {
        break;
      }
      final int size = file.lengthSync();
      if (file.existsSync()) {
        await file.delete();
      }
      totalBytes -= size;
      remaining--;
    }
  } on Object {
    return;
  }
}

Future<Directory> _pushMediaCacheDirectory() async {
  final Directory root = await getApplicationSupportDirectory();
  return Directory('${root.path}/push_notification_media');
}

Future<File> _pushMediaCacheFile(String name) async {
  final Directory cache = await _pushMediaCacheDirectory();
  return File('${cache.path}/$name');
}

Future<String> _pushMediaCacheFileName(String cacheKey, String leafName) async {
  final Hash digest = await _pushMediaCacheSha256.hash(utf8.encode(cacheKey));
  final String hex = digest.bytes
      .map((int byte) => byte.toRadixString(16).padLeft(2, '0'))
      .join();
  final int dot = leafName.lastIndexOf('.');
  final String ext = dot >= 0 ? leafName.substring(dot + 1) : 'bin';
  return '$hex.$ext';
}

String? pushAuthorAvatarUrl(
  Map<String, String> payload, {
  required PushMediaInstanceUrls endpoints,
}) {
  final String? explicit = _httpUrl(payload['author_avatar_url']);
  if (explicit != null) {
    return resolvePushAvatarDownloadUrl(
      alignPushMediaUrlWithInstance(explicit, endpoints),
    );
  }
  final String? icon = _httpUrl(payload['icon']);
  if (icon != null) {
    final String aligned = alignPushMediaUrlWithInstance(icon, endpoints);
    final Uri? uri = Uri.tryParse(aligned);
    if (uri != null && looksLikePushAuthorAvatarUrl(uri)) {
      return resolvePushAvatarDownloadUrl(aligned);
    }
  }
  final String? authorId = pushAuthorIdFromPayload(payload);
  if (authorId == null) {
    return null;
  }
  return FluxerMediaUrl.defaultAvatar(
    userId: authorId,
    staticCdn: endpoints.staticCdn,
  );
}

String resolvePushAvatarDownloadUrl(String raw) {
  final Uri? uri = Uri.tryParse(raw);
  if (uri != null && isFluxerStaticDefaultAvatarUrl(uri)) {
    return raw;
  }
  return pushNotificationStaticImageUrl(raw, size: kPushAvatarMaxEdge);
}

bool looksLikePushAuthorAvatarUrl(Uri uri) {
  if (isFluxerStaticDefaultAvatarUrl(uri)) {
    return true;
  }
  return pushAuthorIdFromAvatarUrl(uri.toString()) != null;
}

String alignPushMediaUrlWithInstance(
  String raw,
  PushMediaInstanceUrls endpoints,
) {
  final Uri? uri = Uri.tryParse(raw);
  if (uri == null) {
    return raw;
  }
  if (isFluxerStaticDefaultAvatarUrl(uri)) {
    final String indexFile = uri.pathSegments[1];
    final Uri staticBase = Uri.parse(endpoints.staticCdn);
    if (_pushMediaHostsMatch(uri, staticBase)) {
      return raw;
    }
    return '${endpoints.staticCdn}/avatars/$indexFile';
  }
  final Uri mediaBase = Uri.parse(endpoints.mediaBaseUrl);
  if (_pushMediaHostsMatch(uri, mediaBase)) {
    return raw;
  }
  final Uri defaultMedia = Uri.parse(InstanceEndpoints.defaultMedia);
  final Uri defaultStatic = Uri.parse(InstanceEndpoints.defaultStaticCdn);
  if (_pushMediaHostsMatch(uri, defaultMedia)) {
    return _replaceUriAuthority(uri, mediaBase).toString();
  }
  if (_pushMediaHostsMatch(uri, defaultStatic)) {
    final Uri staticBase = Uri.parse(endpoints.staticCdn);
    return _replaceUriAuthority(uri, staticBase).toString();
  }
  return raw;
}

Uri _replaceUriAuthority(Uri source, Uri authority) {
  return source.replace(
    scheme: authority.scheme,
    host: authority.host,
    port: authority.hasPort ? authority.port : null,
  );
}

bool _pushMediaHostsMatch(Uri left, Uri right) {
  return left.scheme == right.scheme &&
      left.host == right.host &&
      _pushMediaEffectivePort(left) == _pushMediaEffectivePort(right);
}

int _pushMediaEffectivePort(Uri uri) {
  if (uri.hasPort) {
    return uri.port;
  }
  return uri.scheme == 'https' ? 443 : 80;
}

Future<void> clearPushNotificationMediaCache() async {
  try {
    final Directory cache = await _pushMediaCacheDirectory();
    if (cache.existsSync()) {
      await cache.delete(recursive: true);
    }
  } on Object {
    return;
  }
}

String? pushAuthorIdFromPayload(Map<String, String> payload) {
  final String? authorId = _nonEmpty(payload['author_id']);
  if (authorId != null) {
    return authorId;
  }
  final String? avatarUrl =
      _httpUrl(payload['author_avatar_url']) ?? _httpUrl(payload['icon']);
  if (avatarUrl == null) {
    return null;
  }
  return pushAuthorIdFromAvatarUrl(avatarUrl);
}

String? pushAuthorIdFromAvatarUrl(String raw) {
  final Uri? uri = Uri.tryParse(raw);
  if (uri == null) {
    return null;
  }
  final List<String> parts = uri.pathSegments;
  final int avatarsIndex = parts.indexOf('avatars');
  if (avatarsIndex < 0 || avatarsIndex + 1 >= parts.length) {
    return null;
  }
  final String candidate = parts[avatarsIndex + 1];
  if (candidate.isEmpty || candidate.contains('.')) {
    return null;
  }
  return candidate;
}

bool isFluxerStaticDefaultAvatarUrl(Uri uri) {
  final List<String> segments = uri.pathSegments;
  if (segments.length != 2 || segments.first != 'avatars') {
    return false;
  }
  final Match? match = RegExp(r'^(\d+)\.png$').firstMatch(segments[1]);
  if (match == null) {
    return false;
  }
  final int? index = int.tryParse(match.group(1)!);
  if (index == null ||
      index < 0 ||
      index >= FluxerMediaUrl.defaultAvatarCount) {
    return false;
  }
  return true;
}

String pushNotificationStaticImageUrl(String raw, {required int size}) {
  final Uri? uri = Uri.tryParse(raw);
  if (uri == null) {
    return raw;
  }
  if (isFluxerStaticDefaultAvatarUrl(uri)) {
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

Uint8List? encodePushNotificationAvatar(Uint8List bytes, {required int size}) {
  final img.Image? decoded = img.decodeImage(bytes);
  if (decoded == null) {
    return null;
  }
  final img.Image square = img.copyResizeCropSquare(
    decoded.convert(numChannels: 4),
    size: math.min(size, math.min(decoded.width, decoded.height)),
    interpolation: img.Interpolation.average,
  );
  return Uint8List.fromList(img.encodePng(img.copyCropCircle(square)));
}

String? pushAttachmentImageUrl(
  Map<String, String> payload, {
  required PushMediaInstanceUrls endpoints,
}) {
  if (_mediaDisabled(payload)) {
    return null;
  }
  final String? raw =
      _httpUrl(payload['image_url']) ?? _httpUrl(payload['image']);
  if (raw == null) {
    return null;
  }
  return alignPushMediaUrlWithInstance(raw, endpoints);
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

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
