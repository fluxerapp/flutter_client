import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/foundation.dart';

const String _kEmojiAssetUserAgent =
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
    '(KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36';

const String _kEmojiAssetAcceptHeader = 'image/svg+xml';

const String _kEmojiAssetRefererHeader = 'https://web.fluxer.app/';

const String _kEmojiAssetSecFetchDest = 'image';
const String _kEmojiAssetSecFetchMode = 'no-cors';
const String _kEmojiAssetSecFetchSite = 'cross-site';

const String _kEmojiAssetCacheVersion = '2';

class EmojiAssetCache {
  EmojiAssetCache._();

  static final BaseCacheManager _cacheManager =
      CachedNetworkImageProvider.defaultCacheManager;

  /// Upper bound on emoji held in the in-memory bytes cache.
  @visibleForTesting
  static const int maxMemoryEntries = 256;

  /// Upper bound on total bytes in the in-memory cache.
  @visibleForTesting
  static const int maxMemoryBytes = 4 * 1024 * 1024;

  static final Map<String, Uint8List> _memory = <String, Uint8List>{};
  static int _memoryBytes = 0;
  static final Map<String, Future<Uint8List>> _inFlight =
      <String, Future<Uint8List>>{};

  /// Returns the bytes for [url] if already in memory, without I/O.
  static Uint8List? peekBytes(String url) {
    final bytes = _memory.remove(url);
    if (bytes != null) {
      _memory[url] = bytes;
    }
    return bytes;
  }

  static Future<Uint8List> loadBytes(String url) {
    final cached = peekBytes(url);
    if (cached != null) {
      return SynchronousFuture<Uint8List>(cached);
    }
    return _inFlight[url] ??= _load(url);
  }

  static Future<Uint8List> _load(String url) async {
    try {
      final bytes = await _loadFromDisk(url);
      _remember(url, bytes);
      return bytes;
    } finally {
      unawaited(_inFlight.remove(url));
    }
  }

  static void _remember(String url, Uint8List bytes) {
    final previous = _memory.remove(url);
    if (previous != null) {
      _memoryBytes -= previous.length;
    }
    _memory[url] = bytes;
    _memoryBytes += bytes.length;
    while (_memory.length > 1 &&
        (_memory.length > maxMemoryEntries || _memoryBytes > maxMemoryBytes)) {
      final oldest = _memory.keys.first;
      _memoryBytes -= _memory.remove(oldest)!.length;
    }
  }

  static Future<Uint8List> _loadFromDisk(String url) async {
    final cacheKey = '$_kEmojiAssetCacheVersion:$url';
    final cached = await _cacheManager.getFileFromCache(cacheKey);
    if (cached != null) {
      return cached.file.readAsBytes();
    }

    final bytes = await _fetchBytes(url);
    unawaited(_cacheManager.putFile(url, bytes, key: cacheKey));
    return bytes;
  }

  static Future<Uint8List> _fetchBytes(String url) async {
    final client = HttpClient();
    try {
      final request = await client.getUrl(Uri.parse(url));
      request.headers.set(HttpHeaders.userAgentHeader, _kEmojiAssetUserAgent);
      request.headers.set(HttpHeaders.acceptHeader, _kEmojiAssetAcceptHeader);
      request.headers.set(HttpHeaders.acceptEncodingHeader, 'identity');
      request.headers.set(HttpHeaders.refererHeader, _kEmojiAssetRefererHeader);
      request.headers.set('Sec-Fetch-Dest', _kEmojiAssetSecFetchDest);
      request.headers.set('Sec-Fetch-Mode', _kEmojiAssetSecFetchMode);
      request.headers.set('Sec-Fetch-Site', _kEmojiAssetSecFetchSite);
      final response = await request.close();
      if (response.statusCode != HttpStatus.ok) {
        throw HttpException(
          'Emoji asset load failed: ${response.statusCode}',
          uri: Uri.parse(url),
        );
      }
      final builder = BytesBuilder();
      await response.forEach(builder.add);
      return builder.toBytes();
    } finally {
      client.close();
    }
  }

  @visibleForTesting
  static Future<void> clearCacheForTesting() async {
    _memory.clear();
    _memoryBytes = 0;
    _inFlight.clear();
    await _cacheManager.emptyCache();
  }
}
