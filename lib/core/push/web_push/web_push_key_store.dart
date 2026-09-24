import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluxer_app/core/push/web_push/web_push_codec.dart';
import 'package:fluxer_app/core/push/web_push/web_push_crypto.dart';

const String kWebPushKeysPrefix = 'web_push_keys_';

const String kWebPushVoipKeysPrefix = 'web_push_voip_keys_';

const String _kLegacyRawPrefix = 'web_push_legacy_raw_';

class WebPushAccountKeys {
  const WebPushAccountKeys({
    required this.userId,
    required this.publicKey,
    required this.authSecret,
    this.privateKey,
  });

  final String userId;
  final String publicKey;
  final String authSecret;
  final String? privateKey;

  bool get canDecrypt => privateKey != null && privateKey!.isNotEmpty;
}

class WebPushKeyStore {
  WebPushKeyStore({
    FlutterSecureStorage? storage,
    this.keyPrefix = kWebPushKeysPrefix,
  }) : _storage =
           storage ??
           const FlutterSecureStorage(
             iOptions: IOSOptions(
               accessibility: KeychainAccessibility.first_unlock,
             ),
             aOptions: AndroidOptions(resetOnError: false),
             mOptions: MacOsOptions(
               accessibility: KeychainAccessibility.first_unlock,
             ),
           );

  final FlutterSecureStorage _storage;
  final String keyPrefix;

  String _storageKey(String userId) => '$keyPrefix$userId';

  Future<WebPushAccountKeys> ensureKeys(String userId) async {
    final WebPushAccountKeys? existing = await read(userId);
    if (existing != null && existing.canDecrypt) {
      return existing;
    }
    final WebPushKeyPair generated = generateWebPushKeyPair();
    final WebPushAccountKeys keys = WebPushAccountKeys(
      userId: userId,
      publicKey: encodeWebPushKey(generated.publicKey),
      privateKey: encodeWebPushKey(generated.privateKey),
      authSecret: encodeWebPushKey(generated.authSecret),
    );
    await write(keys);
    return keys;
  }

  Future<void> write(WebPushAccountKeys keys) {
    return _storage.write(
      key: _storageKey(keys.userId),
      value: jsonEncode(<String, String>{
        'public_key': keys.publicKey,
        'auth_secret': keys.authSecret,
        if (keys.privateKey != null) 'private_key': keys.privateKey!,
      }),
    );
  }

  Future<WebPushAccountKeys?> read(String userId) async {
    final String? raw = await _storage.read(key: _storageKey(userId));
    if (raw == null) {
      return null;
    }
    return _parse(userId, raw);
  }

  Future<List<WebPushAccountKeys>> readAll() async {
    final Map<String, String> stored = await _storage.readAll();
    final List<WebPushAccountKeys> keys = <WebPushAccountKeys>[];
    for (final MapEntry<String, String> entry in stored.entries) {
      if (!entry.key.startsWith(keyPrefix)) {
        continue;
      }
      final String userId = entry.key.substring(keyPrefix.length);
      if (userId.isEmpty || userId.contains('web_push_')) {
        continue;
      }
      final WebPushAccountKeys? parsed = _parse(userId, entry.value);
      if (parsed != null) {
        keys.add(parsed);
      }
    }
    return keys;
  }

  Future<void> delete(String userId) {
    return _storage.delete(key: _storageKey(userId));
  }

  Future<bool> isLegacyRawCleared({
    required String platform,
    required String userId,
  }) async {
    final String? value = await _storage.read(
      key: '$_kLegacyRawPrefix${platform}_$userId',
    );
    return value == '1';
  }

  Future<void> markLegacyRawCleared({
    required String platform,
    required String userId,
  }) {
    return _storage.write(
      key: '$_kLegacyRawPrefix${platform}_$userId',
      value: '1',
    );
  }
}

WebPushAccountKeys? _parse(String userId, String raw) {
  try {
    final Object? decoded = jsonDecode(raw);
    if (decoded is! Map) {
      return null;
    }
    final Map<String, Object?> json = Map<String, Object?>.from(decoded);
    final Object? publicKey = json['public_key'];
    final Object? authSecret = json['auth_secret'];
    if (publicKey is! String || authSecret is! String) {
      return null;
    }
    final Object? privateKey = json['private_key'];
    return WebPushAccountKeys(
      userId: userId,
      publicKey: publicKey,
      authSecret: authSecret,
      privateKey: privateKey is String && privateKey.isNotEmpty
          ? privateKey
          : null,
    );
  } on FormatException {
    return null;
  }
}
