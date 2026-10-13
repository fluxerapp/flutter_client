import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/push/push_account_lifecycle.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_manager_provider.g.dart';

const Duration _kPostSwitchStartupTimeout = Duration(seconds: 20);

class AccountManagerState {
  final List<StoredAccount> accounts;
  final bool isSwitching;
  final bool isSwitchPending;

  const AccountManagerState({
    required this.accounts,
    required this.isSwitching,
    this.isSwitchPending = false,
  });

  AccountManagerState copyWith({
    List<StoredAccount>? accounts,
    bool? isSwitching,
    bool? isSwitchPending,
  }) {
    return AccountManagerState(
      accounts: accounts ?? this.accounts,
      isSwitching: isSwitching ?? this.isSwitching,
      isSwitchPending: isSwitchPending ?? this.isSwitchPending,
    );
  }
}

@Riverpod(keepAlive: true)
class AccountManager extends _$AccountManager {
  Future<void>? _pendingSwitch;
  String? _pendingUserId;
  String? _requestedUserId;

  @override
  AccountManagerState build() {
    return const AccountManagerState(accounts: [], isSwitching: false);
  }

  Future<void> loadAccounts() async {
    final repo = ref.read(authRepositoryProvider);
    final accounts = await repo.getStoredAccounts();
    state = state.copyWith(accounts: accounts);
  }

  Future<void> switchToAccount(
    String userId, {
    bool ignoreIfPending = false,
  }) async {
    if (_pendingSwitch != null && ignoreIfPending) {
      return;
    }
    _requestedUserId = userId;
    for (
      Future<void>? pending = _pendingSwitch;
      pending != null;
      pending = _pendingSwitch
    ) {
      if (_pendingUserId == userId) {
        return pending;
      }
      try {
        await pending;
      } on Object {
        talker.debug('[AccountManager] Pending switch ended before $userId');
      }
      if (_requestedUserId != userId) {
        throw const AccountSwitchSupersededFailure();
      }
    }
    final Future<void> pending = _switchTo(userId);
    _pendingSwitch = pending;
    _pendingUserId = userId;
    state = state.copyWith(isSwitchPending: true);
    try {
      await pending;
    } finally {
      _pendingSwitch = null;
      _pendingUserId = null;
      state = state.copyWith(isSwitchPending: false);
    }
  }

  Future<void> _switchTo(String userId) async {
    try {
      final db = ref.read(fluxerDatabaseProvider);
      final authRepository = ref.read(authRepositoryProvider);
      final metadata = await db.authSessionDao.getSession(userId);
      final session = await authRepository.getSession(userId);

      if (metadata == null || !metadata.isValid || session == null) {
        throw const AuthFailure('Session is no longer valid.');
      }

      final InstanceConfigSnapshot instanceSnapshot = await authRepository
          .resolveInstanceSnapshotForUser(userId);
      final isValid = await _validateToken(
        session.token,
        baseUrl: instanceSnapshot.apiBaseUrl,
      );
      if (!isValid) {
        await db.authSessionDao.markInvalid(userId);
        await loadAccounts();
        throw const SessionExpiredFailure();
      }

      state = state.copyWith(isSwitching: true);
      await db.authSessionDao.touchSession(userId);
      ref.read(activeInstanceProvider.notifier).applySnapshot(instanceSnapshot);

      await PushAccountLifecycle.leaveActiveAccount(
        ref,
        mode: LeavePushAccountMode.switchAccount,
      );

      ref.invalidate(appStartupProvider);
      await ref
          .read(appStartupProvider.future)
          .timeout(_kPostSwitchStartupTimeout);

      ref.read(gatewayConnectionFailedProvider.notifier).reset();
      state = state.copyWith(isSwitching: false);
    } on SessionExpiredFailure {
      rethrow;
    } on Exception catch (e) {
      talker.error('[AccountManager] Switch failed: $e');
      state = state.copyWith(isSwitching: false);
      rethrow;
    }
  }

  Future<bool> _validateToken(String token, {String? baseUrl}) async {
    try {
      final String resolvedBaseUrl = baseUrl ?? ref.read(fluxerBaseUrlProvider);
      await Dio(
        BaseOptions(
          baseUrl: resolvedBaseUrl,
          headers: {'Authorization': formatSessionAuthorizationHeader(token)},
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      ).get<void>('/users/@me');
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return false;
      }
      rethrow;
    }
  }

  Future<void> signOut(String userId) async {
    final repo = ref.read(authRepositoryProvider);

    await PushAccountLifecycle.leaveActiveAccount(
      ref,
      mode: LeavePushAccountMode.signOut,
    );
    await repo.logout(userId);
    ref.read(syncedPreferencesStoreProvider).reset();
    ref.read(slowmodeTrackerProvider.notifier).reset();
    await loadAccounts();

    if (state.accounts.isEmpty) {
      ref.read(activeInstanceProvider.notifier).resetToOfficialDefault();
      ref.invalidate(instanceSelectorProvider);
    }

    ref.read(fluxerAuthTokenProvider.notifier).setToken(null);
    ref.read(authStateProvider.notifier).setAuthenticated(value: false);
  }

  Future<bool> expireSessionIfInvalid() async {
    final String? token = ref.read(fluxerAuthTokenProvider);
    if (token == null || token.isEmpty) {
      return false;
    }
    bool isValid;
    try {
      isValid = await _validateToken(token);
    } on Exception {
      return false;
    }
    if (isValid) {
      return false;
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (userId != null && userId.isNotEmpty) {
      await ref.read(fluxerDatabaseProvider).authSessionDao.markInvalid(userId);
    }
    ref.read(syncedPreferencesStoreProvider).reset();
    ref.read(slowmodeTrackerProvider.notifier).reset();
    await loadAccounts();
    ref.read(fluxerAuthTokenProvider.notifier).setToken(null);
    ref.read(authStateProvider.notifier).setAuthenticated(value: false);
    return true;
  }

  Future<void> removeAccount(String userId) async {
    final authRepository = ref.read(authRepositoryProvider);
    final session = await authRepository.getSession(userId);

    if (session != null) {
      try {
        final baseUrl = ref.read(fluxerBaseUrlProvider);
        await Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: {
              'Authorization': formatSessionAuthorizationHeader(session.token),
            },
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        ).post<void>('/auth/logout');
      } on Object catch (e) {
        talker.warning('[AccountManager] Failed to logout stored account: $e');
      }
    }

    await PushAccountLifecycle.forgetStoredAccount(ref, userId);
    await authRepository.removeStoredAccount(userId);
    await loadAccounts();
  }
}
