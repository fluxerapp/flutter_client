import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/app_lock/app_lock_config.dart';
import 'package:fluxer_app/core/app_lock/app_lock_pin_hasher.dart';
import 'package:fluxer_app/core/app_lock/app_lock_store.dart';

class _MemorySecretStore implements AppLockSecretStore {
  final Map<String, String> values = <String, String>{};

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async {
    values[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    values.remove(key);
  }
}

void main() {
  group('AppLockStore', () {
    test('returns a disabled default when nothing is stored', () async {
      final AppLockStore store = AppLockStore(_MemorySecretStore());

      final AppLockSnapshot snapshot = await store.read();

      expect(snapshot.hasPin, isFalse);
      expect(snapshot.biometricEnabled, isFalse);
      expect(snapshot.timeout, AppLockTimeout.oneMinute);
    });

    test('round-trips PIN, biometric flag and timeout together', () async {
      final _MemorySecretStore secrets = _MemorySecretStore();
      final AppLockStore store = AppLockStore(secrets);

      await store.write(
        const AppLockSnapshot(
          timeout: AppLockTimeout.fifteenMinutes,
          pinCredential: AppLockPinCredential(hash: 'h', salt: 's'),
          biometricEnabled: true,
        ),
      );
      final AppLockSnapshot snapshot = await store.read();

      expect(snapshot.hasPin, isTrue);
      expect(snapshot.biometricEnabled, isTrue);
      expect(snapshot.timeout, AppLockTimeout.fifteenMinutes);
      expect(snapshot.pinCredential?.hash, 'h');
      expect(snapshot.pinCredential?.salt, 's');
    });

    test('copyWith keeps the PIN when only the timeout changes', () {
      const AppLockSnapshot base = AppLockSnapshot(
        pinCredential: AppLockPinCredential(hash: 'h', salt: 's'),
      );

      final AppLockSnapshot changed = base.copyWith(
        timeout: AppLockTimeout.oneHour,
      );

      expect(changed.hasPin, isTrue);
      expect(changed.timeout, AppLockTimeout.oneHour);
    });

    test('recovers from corrupted stored data', () async {
      final _MemorySecretStore secrets = _MemorySecretStore()
        ..values['app_lock.v2'] = 'not json';
      final AppLockStore store = AppLockStore(secrets);

      final AppLockSnapshot snapshot = await store.read();

      expect(snapshot.hasPin, isFalse);
    });

    test('clear removes the stored configuration', () async {
      final _MemorySecretStore secrets = _MemorySecretStore();
      final AppLockStore store = AppLockStore(secrets);
      await store.write(const AppLockSnapshot(biometricEnabled: true));

      await store.clear();

      expect(secrets.values, isEmpty);
    });
  });
}
