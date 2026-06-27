import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/push/push_notification_path_resolver.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:path_provider/path_provider.dart';

const String _cacheFileName = 'fcm_tap_payloads.json';
const String _latestKey = 'latest';
const int _maxEntries = 32;

typedef _PayloadStore = Map<String, Map<String, String>>;

/// Persists FCM navigation payloads when messages arrive so hybrid
/// notification+data taps can resolve paths after Android strips data.
final class FcmTapPayloadCache {
  FcmTapPayloadCache._();

  static Future<void> save({
    required Map<String, String> payload,
    String? gcmMessageId,
  }) async {
    final Map<String, String> normalized = normalizePushTapPayload(payload);
    if (!_isNavigable(normalized)) {
      return;
    }
    await _writePayload(normalized, gcmMessageId: gcmMessageId);
  }

  static Future<Map<String, String>> enrich({
    required Map<String, String> mappedPayload,
    String? gcmMessageId,
    Map<String, String> tapData = const <String, String>{},
  }) async {
    final Map<String, String> normalized = normalizePushTapPayload(
      mappedPayload,
    );
    if (_isNavigable(normalized)) {
      return normalized;
    }
    final Map<String, String>? cached = await _readPayload(
      gcmMessageId: gcmMessageId,
      tapData: tapData,
    );
    if (cached != null) {
      _log('restored tap payload from cache');
      return cached;
    }
    _log('no cached payload for gcmId=$gcmMessageId tapData=$tapData');
    return normalized;
  }

  static bool _isNavigable(Map<String, String> payload) {
    return resolvePushNotificationPath(payload) != null;
  }

  static void _log(String message) {
    if (kDebugMode) {
      debugPrint('[FcmTapPayloadCache] $message');
    }
  }

  static Future<void> _writePayload(
    Map<String, String> payload, {
    String? gcmMessageId,
  }) async {
    try {
      final _PayloadStore store = await _loadStore();
      _indexPayload(store, payload, gcmMessageId: gcmMessageId);
      await _saveStore(_trimStore(store));
    } on Object catch (e, st) {
      _log('save failed: $e\n$st');
    }
  }

  static Future<Map<String, String>?> _readPayload({
    String? gcmMessageId,
    Map<String, String> tapData = const <String, String>{},
  }) async {
    try {
      final _PayloadStore store = await _loadStore();
      return _resolvePayload(
        store,
        gcmMessageId: gcmMessageId,
        tapData: tapData,
      );
    } on Object catch (e, st) {
      _log('lookup failed: $e\n$st');
      return null;
    }
  }

  static void _indexPayload(
    _PayloadStore store,
    Map<String, String> payload, {
    String? gcmMessageId,
  }) {
    final String? gcmId = _nonEmpty(gcmMessageId);
    if (gcmId != null) {
      store['gcm:$gcmId'] = payload;
    }
    final String? messageId = _nonEmpty(payload['message_id']);
    if (messageId != null) {
      store['msg:$messageId'] = payload;
    }
    store[_latestKey] = payload;
  }

  static Map<String, String>? _resolvePayload(
    _PayloadStore store, {
    String? gcmMessageId,
    Map<String, String> tapData = const <String, String>{},
  }) {
    for (final String key in _lookupKeys(gcmMessageId, tapData)) {
      final Map<String, String>? hit = store[key];
      if (hit != null) {
        return hit;
      }
    }
    return store[_latestKey];
  }

  static List<String> _lookupKeys(
    String? gcmMessageId,
    Map<String, String> tapData,
  ) {
    final List<String> keys = <String>[];
    final String? gcmId = _nonEmpty(gcmMessageId);
    if (gcmId != null) {
      keys.add('gcm:$gcmId');
    }
    final String? messageId = _nonEmpty(tapData['message_id']);
    if (messageId != null) {
      keys.add('msg:$messageId');
    }
    return keys;
  }

  static _PayloadStore _trimStore(_PayloadStore store) {
    if (store.length <= _maxEntries) {
      return store;
    }
    final List<String> keys = store.keys.toList()..remove(_latestKey);
    while (store.length > _maxEntries && keys.isNotEmpty) {
      store.remove(keys.removeAt(0));
    }
    return store;
  }

  static Future<File> _cacheFile() async {
    final Directory dir = await getApplicationSupportDirectory();
    return File('${dir.path}/$_cacheFileName');
  }

  static Future<_PayloadStore> _loadStore() async {
    final File file = await _cacheFile();
    if (!file.existsSync()) {
      return <String, Map<String, String>>{};
    }
    final String raw = await file.readAsString();
    if (raw.isEmpty) {
      return <String, Map<String, String>>{};
    }
    return _parseStore(jsonDecode(raw));
  }

  static _PayloadStore _parseStore(Object? decoded) {
    if (decoded is! Map<String, dynamic>) {
      return <String, Map<String, String>>{};
    }
    final _PayloadStore store = <String, Map<String, String>>{};
    for (final MapEntry<String, dynamic> entry in decoded.entries) {
      final Object? value = entry.value;
      if (value is Map) {
        store[entry.key] = Map<String, String>.from(value);
      }
    }
    return store;
  }

  static Future<void> _saveStore(_PayloadStore store) async {
    final File file = await _cacheFile();
    await file.writeAsString(jsonEncode(store));
  }

  static String? _nonEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return value;
  }
}
