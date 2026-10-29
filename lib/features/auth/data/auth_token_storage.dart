import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluxer_app/core/platform/fluxer_secure_storage.dart';
import 'package:fluxer_app/core/talker.dart';

const String _kAuthTokenKeyPrefix = 'auth_token_';
const String _kAuthApiBaseKeyPrefix = 'auth_api_base_';

abstract interface class AuthTokenStorage {
  Future<void> saveToken({required String userId, required String token});

  Future<String?> readToken(String userId);

  Future<void> saveApiBaseUrl({
    required String userId,
    required String apiBaseUrl,
  });

  Future<String?> readApiBaseUrl(String userId);

  Future<void> deleteToken(String userId);

  Future<List<({String userId, String apiBaseUrl})>> readAccountApiBases();
}

class AuthTokenStorageException implements Exception {
  AuthTokenStorageException([this.cause]);

  final Object? cause;
}

class SecureAuthTokenStorage implements AuthTokenStorage {
  SecureAuthTokenStorage({FlutterSecureStorage? storage})
    : _storage = storage ?? createFluxerSecureStorage();

  final FlutterSecureStorage _storage;

  String _keyFor(String userId) => '$_kAuthTokenKeyPrefix$userId';

  String _apiBaseKeyFor(String userId) => '$_kAuthApiBaseKeyPrefix$userId';

  @override
  Future<void> saveToken({
    required String userId,
    required String token,
  }) async {
    await _write(_keyFor(userId), token);
  }

  @override
  Future<String?> readToken(String userId) {
    return _read(_keyFor(userId));
  }

  @override
  Future<void> saveApiBaseUrl({
    required String userId,
    required String apiBaseUrl,
  }) {
    return _write(_apiBaseKeyFor(userId), apiBaseUrl);
  }

  @override
  Future<String?> readApiBaseUrl(String userId) {
    return _read(_apiBaseKeyFor(userId));
  }

  @override
  Future<void> deleteToken(String userId) async {
    await _delete(_keyFor(userId));
    await _delete(_apiBaseKeyFor(userId));
  }

  @override
  Future<List<({String userId, String apiBaseUrl})>>
  readAccountApiBases() async {
    final Map<String, String> stored = await _readAll();
    final List<({String userId, String apiBaseUrl})> accounts =
        <({String userId, String apiBaseUrl})>[];
    for (final MapEntry<String, String> entry in stored.entries) {
      if (!entry.key.startsWith(_kAuthApiBaseKeyPrefix)) {
        continue;
      }
      final String userId = entry.key.substring(_kAuthApiBaseKeyPrefix.length);
      if (userId.isEmpty || entry.value.isEmpty) {
        continue;
      }
      final String? token = stored['$_kAuthTokenKeyPrefix$userId'];
      if (token == null || token.isEmpty) {
        continue;
      }
      accounts.add((userId: userId, apiBaseUrl: entry.value));
    }
    return accounts;
  }

  Future<void> _write(String key, String value) async {
    try {
      await runFluxerSecureStorage<void>(
        () => _storage.write(key: key, value: value),
      );
    } on PlatformException catch (error, stackTrace) {
      talker.error('[SecureAuthTokenStorage] write failed', error, stackTrace);
      throw AuthTokenStorageException(error);
    }
  }

  Future<String?> _read(String key) async {
    try {
      return await runFluxerSecureStorage<String?>(
        () => _storage.read(key: key),
      );
    } on PlatformException catch (error, stackTrace) {
      talker.warning('[SecureAuthTokenStorage] read failed', error, stackTrace);
      return null;
    }
  }

  Future<void> _delete(String key) async {
    try {
      await runFluxerSecureStorage<void>(() => _storage.delete(key: key));
    } on PlatformException catch (error, stackTrace) {
      talker.warning(
        '[SecureAuthTokenStorage] delete failed',
        error,
        stackTrace,
      );
    }
  }

  Future<Map<String, String>> _readAll() async {
    try {
      return await runFluxerSecureStorage<Map<String, String>>(
        _storage.readAll,
      );
    } on PlatformException catch (error, stackTrace) {
      talker.warning(
        '[SecureAuthTokenStorage] readAll failed',
        error,
        stackTrace,
      );
      return <String, String>{};
    }
  }
}

class MapAuthTokenStorage implements AuthTokenStorage {
  final Map<String, String> tokens = <String, String>{};
  final Map<String, String> apiBaseUrls = <String, String>{};

  @override
  Future<void> saveToken({
    required String userId,
    required String token,
  }) async {
    tokens[userId] = token;
  }

  @override
  Future<String?> readToken(String userId) async {
    return tokens[userId];
  }

  @override
  Future<void> saveApiBaseUrl({
    required String userId,
    required String apiBaseUrl,
  }) async {
    apiBaseUrls[userId] = apiBaseUrl;
  }

  @override
  Future<String?> readApiBaseUrl(String userId) async {
    return apiBaseUrls[userId];
  }

  @override
  Future<void> deleteToken(String userId) async {
    tokens.remove(userId);
    apiBaseUrls.remove(userId);
  }

  @override
  Future<List<({String userId, String apiBaseUrl})>>
  readAccountApiBases() async {
    final List<({String userId, String apiBaseUrl})> accounts =
        <({String userId, String apiBaseUrl})>[];
    for (final MapEntry<String, String> entry in apiBaseUrls.entries) {
      final String? token = tokens[entry.key];
      if (token == null || token.isEmpty || entry.value.isEmpty) {
        continue;
      }
      accounts.add((userId: entry.key, apiBaseUrl: entry.value));
    }
    return accounts;
  }
}
