import 'dart:async';
import 'dart:math';

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/app_lock/app_lock_biometric_authenticator.dart';
import 'package:fluxer_app/core/app_lock/app_lock_config.dart';
import 'package:fluxer_app/core/app_lock/app_lock_pin_hasher.dart';
import 'package:fluxer_app/core/app_lock/app_lock_store.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lock_controller.g.dart';

const Duration _baseCooldown = Duration(seconds: 30);
const int _attemptsBeforeCooldown = 4;
const int _maxDoublings = 30;

Duration appLockCooldownForFailedAttempts(int failedAttempts) {
  final int doublings = failedAttempts - _attemptsBeforeCooldown - 1;
  if (doublings < 0) {
    return Duration.zero;
  }
  return _baseCooldown * (1 << min(doublings, _maxDoublings));
}

enum AppLockUnlockResult { unlocked, wrongPin, coolingDown }

class AppLockState {
  const AppLockState({
    this.loaded = false,
    this.enabled = false,
    this.biometricEnabled = false,
    this.timeout = AppLockTimeout.oneMinute,
    this.isLocked = false,
    this.isPrivacyCovered = false,
    this.cooldownUntil,
  });

  final bool loaded;
  final bool enabled;
  final bool biometricEnabled;
  final AppLockTimeout timeout;
  final bool isLocked;
  final bool isPrivacyCovered;
  final DateTime? cooldownUntil;

  Duration remainingCooldown(DateTime now) {
    final DateTime? until = cooldownUntil;
    if (until == null || !now.isBefore(until)) {
      return Duration.zero;
    }
    return until.difference(now);
  }

  AppLockState copyWith({
    bool? enabled,
    bool? biometricEnabled,
    AppLockTimeout? timeout,
    bool? isLocked,
    bool? isPrivacyCovered,
    DateTime? cooldownUntil,
    bool clearCooldown = false,
  }) {
    return AppLockState(
      loaded: loaded,
      enabled: enabled ?? this.enabled,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
      timeout: timeout ?? this.timeout,
      isLocked: isLocked ?? this.isLocked,
      isPrivacyCovered: isPrivacyCovered ?? this.isPrivacyCovered,
      cooldownUntil: clearCooldown
          ? null
          : (cooldownUntil ?? this.cooldownUntil),
    );
  }
}

@Riverpod(keepAlive: true)
AppLockSecretStore appLockSecretStore(Ref ref) => SecureAppLockSecretStore();

@Riverpod(keepAlive: true)
AppLockStore appLockStore(Ref ref) =>
    AppLockStore(ref.watch(appLockSecretStoreProvider));

@Riverpod(keepAlive: true)
AppLockInstallMarker appLockInstallMarker(Ref ref) =>
    SharedPreferencesAppLockInstallMarker();

@Riverpod(keepAlive: true)
AppLockPinHasher appLockPinHasher(Ref ref) => AppLockPinHasher();

@Riverpod(keepAlive: true)
AppLockBiometricAuthenticator appLockBiometricAuthenticator(Ref ref) =>
    LocalAuthBiometricAuthenticator();

@Riverpod(keepAlive: true)
class AppLockController extends _$AppLockController {
  DateTime? _backgroundedAt;
  bool _loadRequested = false;
  bool _loading = false;

  @override
  AppLockState build() => const AppLockState();

  Future<void> load() async {
    _loadRequested = true;
    if (state.loaded || _loading) {
      return;
    }
    _loading = true;
    try {
      await _load();
    } on Object catch (error) {
      talker.warning('[AppLock] Failed to load app lock settings: $error');
    } finally {
      _loading = false;
    }
  }

  Future<void> _load() async {
    final AppLockStore store = ref.read(appLockStoreProvider);
    final AppLockInstallMarker marker = ref.read(appLockInstallMarkerProvider);
    if (!await marker.isMarked()) {
      await store.clear();
      await marker.mark();
    }
    final AppLockSnapshot snapshot = await store.read();
    state = AppLockState(
      loaded: true,
      enabled: snapshot.hasPin,
      biometricEnabled: snapshot.biometricEnabled,
      timeout: snapshot.timeout,
      isLocked: snapshot.hasPin,
      cooldownUntil: snapshot.cooldownUntil,
    );
  }

  void onLifecycleChanged(AppLifecycleState lifecycle) {
    if (lifecycle == AppLifecycleState.resumed) {
      _onResumed();
      return;
    }
    if (!state.enabled) {
      return;
    }
    final bool backgrounded =
        lifecycle == AppLifecycleState.paused ||
        lifecycle == AppLifecycleState.hidden;
    if (backgrounded || defaultTargetPlatform == TargetPlatform.iOS) {
      coverForPrivacy();
    }
    if (!backgrounded) {
      return;
    }
    _backgroundedAt ??= clock.now();
    if (state.timeout.duration == Duration.zero && !state.isLocked) {
      state = state.copyWith(isLocked: true);
    }
  }

  void coverForPrivacy() {
    if (state.enabled && !state.isPrivacyCovered) {
      state = state.copyWith(isPrivacyCovered: true);
    }
  }

  void _onResumed() {
    if (_loadRequested && !state.loaded) {
      unawaited(load());
    }
    final DateTime? since = _backgroundedAt;
    _backgroundedAt = null;
    final bool timedOut =
        state.enabled &&
        since != null &&
        clock.now().difference(since) >= state.timeout.duration;
    if (state.isPrivacyCovered || (timedOut && !state.isLocked)) {
      state = state.copyWith(
        isPrivacyCovered: false,
        isLocked: state.isLocked || timedOut,
      );
    }
  }

  Future<AppLockUnlockResult> unlockWithPin(String pin) async {
    if (state.remainingCooldown(clock.now()) > Duration.zero) {
      return AppLockUnlockResult.coolingDown;
    }
    final AppLockStore store = ref.read(appLockStoreProvider);
    final AppLockSnapshot current = await store.read();
    final AppLockPinCredential? credential = current.pinCredential;
    final bool matches =
        credential != null &&
        await ref.read(appLockPinHasherProvider).verify(pin, credential);
    if (matches) {
      await _markUnlocked();
      return AppLockUnlockResult.unlocked;
    }
    final int failedAttempts = current.failedAttempts + 1;
    final DateTime cooldownUntil = clock.now().add(
      appLockCooldownForFailedAttempts(failedAttempts),
    );
    await store.write(
      current.copyWith(
        failedAttempts: failedAttempts,
        cooldownUntil: cooldownUntil,
      ),
    );
    state = state.copyWith(cooldownUntil: cooldownUntil);
    return AppLockUnlockResult.wrongPin;
  }

  Future<AppLockBiometricResult> unlockWithBiometric({
    required String reason,
  }) async {
    final AppLockBiometricResult result = await verifyBiometric(reason: reason);
    if (result == AppLockBiometricResult.success) {
      await _markUnlocked();
    }
    return result;
  }

  Future<AppLockBiometricResult> verifyBiometric({required String reason}) =>
      ref
          .read(appLockBiometricAuthenticatorProvider)
          .authenticate(reason: reason);

  Future<List<AppLockBiometricKind>> availableBiometricKinds() =>
      ref.read(appLockBiometricAuthenticatorProvider).availableKinds();

  Future<void> setPin(String pin) async {
    final AppLockStore store = ref.read(appLockStoreProvider);
    final AppLockSnapshot current = await store.read();
    final AppLockPinCredential credential = await ref
        .read(appLockPinHasherProvider)
        .create(pin);
    await store.write(
      current.copyWith(
        pinCredential: credential,
        failedAttempts: 0,
        clearCooldown: true,
      ),
    );
    state = state.copyWith(enabled: true, isLocked: false, clearCooldown: true);
  }

  Future<void> setBiometricEnabled({required bool enabled}) async {
    final AppLockStore store = ref.read(appLockStoreProvider);
    final AppLockSnapshot current = await store.read();
    await store.write(current.copyWith(biometricEnabled: enabled));
    state = state.copyWith(biometricEnabled: enabled);
  }

  Future<void> setTimeout(AppLockTimeout timeout) async {
    final AppLockStore store = ref.read(appLockStoreProvider);
    final AppLockSnapshot current = await store.read();
    await store.write(current.copyWith(timeout: timeout));
    state = state.copyWith(timeout: timeout);
  }

  Future<void> disable() async {
    await ref.read(appLockStoreProvider).clear();
    state = state.copyWith(
      enabled: false,
      biometricEnabled: false,
      isLocked: false,
      isPrivacyCovered: false,
      clearCooldown: true,
    );
  }

  Future<void> _markUnlocked() async {
    final AppLockStore store = ref.read(appLockStoreProvider);
    final AppLockSnapshot current = await store.read();
    if (current.failedAttempts != 0 || current.cooldownUntil != null) {
      await store.write(
        current.copyWith(failedAttempts: 0, clearCooldown: true),
      );
    }
    state = state.copyWith(isLocked: false, clearCooldown: true);
  }
}
