import 'dart:math';

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/app_lock/app_lock_biometric_authenticator.dart';
import 'package:fluxer_app/core/app_lock/app_lock_config.dart';
import 'package:fluxer_app/core/app_lock/app_lock_controller.dart';
import 'package:fluxer_app/core/app_lock/app_lock_pin_hasher.dart';
import 'package:fluxer_app/core/app_lock/app_lock_store.dart';
import 'package:riverpod/src/framework.dart' show Override;

class _MemorySecretStore implements AppLockSecretStore {
  final Map<String, String> values = <String, String>{};
  bool unavailable = false;

  @override
  Future<String?> read(String key) async {
    if (unavailable) {
      throw StateError('keychain locked');
    }
    return values[key];
  }

  @override
  Future<void> write(String key, String value) async {
    values[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    values.remove(key);
  }
}

class _FakeBiometricAuthenticator implements AppLockBiometricAuthenticator {
  List<AppLockBiometricKind> kinds = const <AppLockBiometricKind>[
    AppLockBiometricKind.face,
  ];
  bool succeeds = true;

  @override
  Future<List<AppLockBiometricKind>> availableKinds() async => kinds;

  @override
  Future<AppLockBiometricResult> authenticate({required String reason}) async =>
      succeeds ? AppLockBiometricResult.success : AppLockBiometricResult.failed;
}

class _SeededRandom implements Random {
  int _next = 0;

  @override
  int nextInt(int max) {
    _next = (_next * 31 + 7) % 256;
    return _next % max;
  }

  @override
  bool nextBool() => nextInt(2) == 1;

  @override
  double nextDouble() => nextInt(1 << 20) / (1 << 20);
}

class _MemoryInstallMarker implements AppLockInstallMarker {
  _MemoryInstallMarker({this.marked = true});

  bool marked;

  @override
  Future<bool> isMarked() async => marked;

  @override
  Future<void> mark() async {
    marked = true;
  }
}

class _Harness {
  _Harness({
    _FakeBiometricAuthenticator? biometric,
    _MemorySecretStore? secrets,
    _MemoryInstallMarker? installMarker,
  }) : biometric = biometric ?? _FakeBiometricAuthenticator(),
       secrets = secrets ?? _MemorySecretStore(),
       installMarker = installMarker ?? _MemoryInstallMarker() {
    container = ProviderContainer(
      overrides: <Override>[
        appLockSecretStoreProvider.overrideWithValue(this.secrets),
        appLockInstallMarkerProvider.overrideWithValue(this.installMarker),
        appLockPinHasherProvider.overrideWithValue(
          AppLockPinHasher(random: _SeededRandom(), iterations: 1000),
        ),
        appLockBiometricAuthenticatorProvider.overrideWithValue(this.biometric),
      ],
    );
  }

  final _FakeBiometricAuthenticator biometric;
  final _MemorySecretStore secrets;
  final _MemoryInstallMarker installMarker;
  late final ProviderContainer container;

  AppLockController get controller =>
      container.read(appLockControllerProvider.notifier);

  AppLockState get state => container.read(appLockControllerProvider);

  _Harness reloaded() {
    return _Harness(
      biometric: biometric,
      secrets: _MemorySecretStore()..values.addAll(secrets.values),
    );
  }

  Future<int> storedAttempts() async =>
      (await AppLockStore(secrets).read()).failedAttempts;

  void dispose() => container.dispose();
}

void main() {
  group('appLockCooldownForFailedAttempts', () {
    test('no cooldown for the first four failed attempts', () {
      for (int attempts = 1; attempts <= 4; attempts++) {
        expect(appLockCooldownForFailedAttempts(attempts), Duration.zero);
      }
    });

    test('doubles from 30 seconds on every further failed attempt', () {
      expect(appLockCooldownForFailedAttempts(5), const Duration(seconds: 30));
      expect(appLockCooldownForFailedAttempts(6), const Duration(minutes: 1));
      expect(appLockCooldownForFailedAttempts(7), const Duration(minutes: 2));
      expect(appLockCooldownForFailedAttempts(8), const Duration(minutes: 4));
      expect(
        appLockCooldownForFailedAttempts(15),
        const Duration(seconds: 30 * 1024),
      );
    });

    test('keeps growing for long runs of failed attempts', () {
      Duration previous = Duration.zero;
      for (int attempts = 5; attempts <= 200; attempts++) {
        final Duration next = appLockCooldownForFailedAttempts(attempts);
        expect(next >= previous, isTrue);
        previous = next;
      }
      expect(
        appLockCooldownForFailedAttempts(30),
        greaterThan(appLockCooldownForFailedAttempts(20)),
      );
    });
  });

  group('AppLockController', () {
    late DateTime now;
    late _Harness harness;

    setUp(() {
      now = DateTime(2026, 11, 9, 12);
      harness = _Harness();
    });

    tearDown(() => harness.dispose());

    Future<T> atNow<T>(Future<T> Function() body) {
      return withClock(Clock(() => now), body);
    }

    void lifecycle(AppLifecycleState state) {
      withClock(
        Clock(() => now),
        () => harness.controller.onLifecycleChanged(state),
      );
    }

    test('drops a lock left behind by a previous install', () async {
      await atNow(() => harness.controller.setPin('123456'));

      final _Harness reinstalled = _Harness(
        secrets: _MemorySecretStore()..values.addAll(harness.secrets.values),
        installMarker: _MemoryInstallMarker(marked: false),
      );
      addTearDown(reinstalled.dispose);
      await atNow(() => reinstalled.controller.load());

      expect(reinstalled.state.enabled, isFalse);
      expect(reinstalled.state.isLocked, isFalse);
      expect(reinstalled.secrets.values, isEmpty);
      expect(reinstalled.installMarker.marked, isTrue);
    });

    test('stays disabled when nothing is stored', () async {
      await atNow(() => harness.controller.load());

      expect(harness.state.loaded, isTrue);
      expect(harness.state.enabled, isFalse);
      expect(harness.state.isLocked, isFalse);
    });

    test('retries loading on resume when storage was unavailable', () async {
      await atNow(() => harness.controller.setPin('123456'));

      final _Harness reloaded = harness.reloaded();
      addTearDown(reloaded.dispose);
      reloaded.secrets.unavailable = true;
      await atNow(() => reloaded.controller.load());
      expect(reloaded.state.loaded, isFalse);

      reloaded.secrets.unavailable = false;
      await atNow(() async {
        reloaded.controller.onLifecycleChanged(AppLifecycleState.resumed);
        await pumpEventQueue();
      });
      expect(reloaded.state.loaded, isTrue);
      expect(reloaded.state.isLocked, isTrue);
    });

    test('starts locked on load when a PIN is configured', () async {
      await atNow(() => harness.controller.setPin('123456'));

      final _Harness reloaded = harness.reloaded();
      addTearDown(reloaded.dispose);
      await atNow(() => reloaded.controller.load());

      expect(reloaded.state.enabled, isTrue);
      expect(reloaded.state.isLocked, isTrue);
    });

    test('unlocks with the right PIN and rejects a wrong one', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.load());

      expect(
        await atNow(() => harness.controller.unlockWithPin('000000')),
        AppLockUnlockResult.wrongPin,
      );
      expect(harness.state.isLocked, isTrue);
      expect(await harness.storedAttempts(), 1);

      expect(
        await atNow(() => harness.controller.unlockWithPin('123456')),
        AppLockUnlockResult.unlocked,
      );
      expect(harness.state.isLocked, isFalse);
      expect(await harness.storedAttempts(), 0);
    });

    test('blocks PIN attempts during the cooldown window', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.load());

      for (int i = 0; i < 5; i++) {
        await atNow(() => harness.controller.unlockWithPin('000000'));
      }
      expect(await harness.storedAttempts(), 5);

      expect(
        await atNow(() => harness.controller.unlockWithPin('123456')),
        AppLockUnlockResult.coolingDown,
      );

      now = now.add(const Duration(seconds: 31));
      expect(
        await atNow(() => harness.controller.unlockWithPin('123456')),
        AppLockUnlockResult.unlocked,
      );
    });

    test('failed attempts and cooldown survive an app restart', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.load());
      for (int i = 0; i < 5; i++) {
        await atNow(() => harness.controller.unlockWithPin('000000'));
      }

      final _Harness reloaded = harness.reloaded();
      addTearDown(reloaded.dispose);
      await atNow(() => reloaded.controller.load());

      expect(await reloaded.storedAttempts(), 5);
      expect(
        await atNow(() => reloaded.controller.unlockWithPin('123456')),
        AppLockUnlockResult.coolingDown,
      );

      now = now.add(const Duration(seconds: 31));
      expect(
        await atNow(() => reloaded.controller.unlockWithPin('000000')),
        AppLockUnlockResult.wrongPin,
      );
      expect(await reloaded.storedAttempts(), 6);
      expect(reloaded.state.remainingCooldown(now), const Duration(minutes: 1));
    });

    test('a successful unlock clears the stored attempts', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.load());
      await atNow(() => harness.controller.unlockWithPin('000000'));
      await atNow(() => harness.controller.unlockWithPin('123456'));

      final _Harness reloaded = harness.reloaded();
      addTearDown(reloaded.dispose);
      await atNow(() => reloaded.controller.load());

      expect(await reloaded.storedAttempts(), 0);
      expect(reloaded.state.cooldownUntil, isNull);
    });

    test('locks again after the timeout elapses in the background', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.unlockWithPin('123456'));
      await atNow(
        () => harness.controller.setTimeout(AppLockTimeout.oneMinute),
      );

      lifecycle(AppLifecycleState.paused);
      now = now.add(const Duration(seconds: 30));
      lifecycle(AppLifecycleState.resumed);
      expect(harness.state.isLocked, isFalse);

      lifecycle(AppLifecycleState.paused);
      now = now.add(const Duration(minutes: 1));
      lifecycle(AppLifecycleState.resumed);
      expect(harness.state.isLocked, isTrue);
    });

    test('immediate timeout locks on every background', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.unlockWithPin('123456'));
      await atNow(
        () => harness.controller.setTimeout(AppLockTimeout.immediately),
      );

      lifecycle(AppLifecycleState.hidden);
      expect(harness.state.isLocked, isTrue);
      lifecycle(AppLifecycleState.resumed);
      expect(harness.state.isLocked, isTrue);
    });

    test('losing focus does not start the timeout', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.unlockWithPin('123456'));
      await atNow(
        () => harness.controller.setTimeout(AppLockTimeout.immediately),
      );

      lifecycle(AppLifecycleState.inactive);
      expect(harness.state.isPrivacyCovered, isFalse);
      now = now.add(const Duration(minutes: 5));
      lifecycle(AppLifecycleState.resumed);
      expect(harness.state.isLocked, isFalse);
    });

    test('a native pause covers the app until it resumes', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.unlockWithPin('123456'));

      harness.controller.coverForPrivacy();
      expect(harness.state.isPrivacyCovered, isTrue);

      lifecycle(AppLifecycleState.resumed);
      expect(harness.state.isPrivacyCovered, isFalse);
      expect(harness.state.isLocked, isFalse);
    });

    test('losing focus covers the app on iOS', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.unlockWithPin('123456'));

      lifecycle(AppLifecycleState.inactive);
      expect(harness.state.isPrivacyCovered, isTrue);
      expect(harness.state.isLocked, isFalse);

      lifecycle(AppLifecycleState.resumed);
      expect(harness.state.isPrivacyCovered, isFalse);
    });

    test(
      'biometric unlock succeeds only when the authenticator agrees',
      () async {
        await atNow(() => harness.controller.setPin('123456'));
        await atNow(
          () => harness.controller.setBiometricEnabled(enabled: true),
        );

        final _Harness reloaded = harness.reloaded();
        addTearDown(reloaded.dispose);
        await atNow(() => reloaded.controller.load());
        expect(reloaded.state.isLocked, isTrue);
        expect(reloaded.state.biometricEnabled, isTrue);

        reloaded.biometric.succeeds = false;
        expect(
          await atNow(
            () => reloaded.controller.unlockWithBiometric(reason: 'r'),
          ),
          AppLockBiometricResult.failed,
        );
        expect(reloaded.state.isLocked, isTrue);

        reloaded.biometric.succeeds = true;
        expect(
          await atNow(
            () => reloaded.controller.unlockWithBiometric(reason: 'r'),
          ),
          AppLockBiometricResult.success,
        );
        expect(reloaded.state.isLocked, isFalse);
      },
    );

    test('PIN keeps working when biometrics are turned off', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.setBiometricEnabled(enabled: true));
      await atNow(() => harness.controller.setBiometricEnabled(enabled: false));

      expect(harness.state.biometricEnabled, isFalse);
      expect(harness.state.enabled, isTrue);
      expect(
        await atNow(() => harness.controller.unlockWithPin('123456')),
        AppLockUnlockResult.unlocked,
      );
    });

    test('timeout changes keep the PIN credential', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(
        () => harness.controller.setTimeout(AppLockTimeout.fiveMinutes),
      );

      final _Harness reloaded = harness.reloaded();
      addTearDown(reloaded.dispose);
      await atNow(() => reloaded.controller.load());

      expect(reloaded.state.timeout, AppLockTimeout.fiveMinutes);
      expect(
        await atNow(() => reloaded.controller.unlockWithPin('123456')),
        AppLockUnlockResult.unlocked,
      );
    });

    test('disable clears the PIN and biometric configuration', () async {
      await atNow(() => harness.controller.setPin('123456'));
      await atNow(() => harness.controller.setBiometricEnabled(enabled: true));
      await atNow(() => harness.controller.disable());

      expect(harness.state.enabled, isFalse);
      expect(harness.state.biometricEnabled, isFalse);
      expect(harness.state.isLocked, isFalse);
      expect(harness.secrets.values, isEmpty);
    });
  });
}
