import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluxer_app/core/app_lock/app_lock_config.dart';
import 'package:fluxer_app/core/app_lock/app_lock_pin_hasher.dart';
import 'package:fluxer_app/core/platform/fluxer_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AppLockSecretStore {
  Future<String?> read(String key);

  Future<void> write(String key, String value);

  Future<void> delete(String key);
}

class SecureAppLockSecretStore implements AppLockSecretStore {
  SecureAppLockSecretStore({FlutterSecureStorage? storage})
    : _storage = storage ?? createFluxerSecureStorage();

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) =>
      runFluxerSecureStorage(() => _storage.read(key: key));

  @override
  Future<void> write(String key, String value) =>
      runFluxerSecureStorage(() => _storage.write(key: key, value: value));

  @override
  Future<void> delete(String key) =>
      runFluxerSecureStorage(() => _storage.delete(key: key));
}

abstract interface class AppLockInstallMarker {
  Future<bool> isMarked();

  Future<void> mark();
}

class SharedPreferencesAppLockInstallMarker implements AppLockInstallMarker {
  static const String _key = 'app_lock.installed';

  @override
  Future<bool> isMarked() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_key) ?? false;
  }

  @override
  Future<void> mark() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_key, true);
  }
}

class AppLockSnapshot {
  const AppLockSnapshot({
    this.timeout = AppLockTimeout.oneMinute,
    this.pinCredential,
    this.biometricEnabled = false,
    this.failedAttempts = 0,
    this.cooldownUntil,
  });

  final AppLockTimeout timeout;
  final AppLockPinCredential? pinCredential;
  final bool biometricEnabled;
  final int failedAttempts;
  final DateTime? cooldownUntil;

  bool get hasPin => pinCredential != null;

  AppLockSnapshot copyWith({
    AppLockTimeout? timeout,
    AppLockPinCredential? pinCredential,
    bool? biometricEnabled,
    int? failedAttempts,
    DateTime? cooldownUntil,
    bool clearCooldown = false,
  }) {
    return AppLockSnapshot(
      timeout: timeout ?? this.timeout,
      pinCredential: pinCredential ?? this.pinCredential,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
      failedAttempts: failedAttempts ?? this.failedAttempts,
      cooldownUntil: clearCooldown
          ? null
          : (cooldownUntil ?? this.cooldownUntil),
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
    'timeout': timeout.name,
    'pinHash': pinCredential?.hash,
    'pinSalt': pinCredential?.salt,
    'biometric': biometricEnabled,
    'failedAttempts': failedAttempts,
    'cooldownUntil': cooldownUntil?.millisecondsSinceEpoch,
  };

  factory AppLockSnapshot.fromJson(Map<String, Object?> json) {
    final String? hash = json['pinHash'] as String?;
    final String? salt = json['pinSalt'] as String?;
    final int? cooldownUntilMs = json['cooldownUntil'] as int?;
    return AppLockSnapshot(
      timeout:
          _enumByName(AppLockTimeout.values, json['timeout'] as String?) ??
          AppLockTimeout.oneMinute,
      pinCredential: hash != null && salt != null
          ? AppLockPinCredential(hash: hash, salt: salt)
          : null,
      biometricEnabled: json['biometric'] == true,
      failedAttempts: json['failedAttempts'] as int? ?? 0,
      cooldownUntil: cooldownUntilMs == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(cooldownUntilMs),
    );
  }

  static T? _enumByName<T extends Enum>(List<T> values, String? name) {
    for (final T value in values) {
      if (value.name == name) {
        return value;
      }
    }
    return null;
  }
}

class AppLockStore {
  AppLockStore(this._secrets);

  static const String _key = 'app_lock.v2';

  final AppLockSecretStore _secrets;

  Future<AppLockSnapshot> read() async {
    final String? raw = await _secrets.read(_key);
    if (raw == null) {
      return const AppLockSnapshot();
    }
    try {
      final Object? decoded = jsonDecode(raw);
      return decoded is Map<String, Object?>
          ? AppLockSnapshot.fromJson(decoded)
          : const AppLockSnapshot();
    } on FormatException {
      return const AppLockSnapshot();
    }
  }

  Future<void> write(AppLockSnapshot snapshot) =>
      _secrets.write(_key, jsonEncode(snapshot.toJson()));

  Future<void> clear() => _secrets.delete(_key);
}
