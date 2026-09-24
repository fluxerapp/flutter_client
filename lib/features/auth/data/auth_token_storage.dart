import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  String _apiBaseKeyFor(String userId) => '$_kAuthApiBaseKeyPrefix$userId';

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
  Future<void> saveApiBaseUrl({
    required String userId,
    required String apiBaseUrl,
  }) {
    return _storage.write(key: _apiBaseKeyFor(userId), value: apiBaseUrl);
  }

  @override
  Future<String?> readApiBaseUrl(String userId) {
    return _storage.read(key: _apiBaseKeyFor(userId));
  }

  @override
  Future<void> deleteToken(String userId) async {
    await _storage.delete(key: _keyFor(userId));
    await _storage.delete(key: _apiBaseKeyFor(userId));
  }

  @override
  Future<void> deleteAllTokens() {
    return _storage.deleteAll();
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
  Future<void> deleteAllTokens() async {
    tokens.clear();
    apiBaseUrls.clear();
  }
}
