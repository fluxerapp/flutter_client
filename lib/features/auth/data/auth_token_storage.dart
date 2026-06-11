import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _kAuthTokenKeyPrefix = 'auth_token_';

abstract interface class AuthTokenStorage {
  Future<void> saveToken({required String userId, required String token});

  Future<String?> readToken(String userId);

  Future<void> deleteToken(String userId);

  Future<void> deleteAllTokens();
}

class SecureAuthTokenStorage implements AuthTokenStorage {
  SecureAuthTokenStorage({FlutterSecureStorage? storage})
    : _storage =
          storage ??
          const FlutterSecureStorage(
            iOptions: IOSOptions(
              accessibility: KeychainAccessibility.first_unlock,
            ),
            mOptions: MacOsOptions(
              accessibility: KeychainAccessibility.first_unlock,
            ),
          );

  final FlutterSecureStorage _storage;

  String _keyFor(String userId) => '$_kAuthTokenKeyPrefix$userId';

  @override
  Future<void> saveToken({
    required String userId,
    required String token,
  }) async {
    await _storage.write(key: _keyFor(userId), value: token);
  }

  @override
  Future<String?> readToken(String userId) {
    return _storage.read(key: _keyFor(userId));
  }

  @override
  Future<void> deleteToken(String userId) {
    return _storage.delete(key: _keyFor(userId));
  }

  @override
  Future<void> deleteAllTokens() {
    return _storage.deleteAll();
  }
}

class MapAuthTokenStorage implements AuthTokenStorage {
  final Map<String, String> tokens = <String, String>{};

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
  Future<void> deleteToken(String userId) async {
    tokens.remove(userId);
  }

  @override
  Future<void> deleteAllTokens() async {
    tokens.clear();
  }
}
