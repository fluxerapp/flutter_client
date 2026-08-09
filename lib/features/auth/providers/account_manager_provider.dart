import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
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

  const AccountManagerState({
    required this.accounts,
    required this.isSwitching,
  });

  AccountManagerState copyWith({
    List<StoredAccount>? accounts,
    bool? isSwitching,
  }) {
    return AccountManagerState(
      accounts: accounts ?? this.accounts,
      isSwitching: isSwitching ?? this.isSwitching,
    );
  }
}

@Riverpod(keepAlive: true)
class AccountManager extends _$AccountManager {
  @override
  AccountManagerState build() {
    return const AccountManagerState(accounts: [], isSwitching: false);
  }

  /// Loads stored accounts from the database.
  Future<void> loadAccounts() async {
    final repo = ref.read(authRepositoryProvider);
    final accounts = await repo.getStoredAccounts();
    state = state.copyWith(accounts: accounts);
  }

  /// Switches to a different stored account.
  ///
  /// Validates the token with the server first (`GET /users/@me`). If the
  /// token is expired or invalid, the account is marked invalid and a
  /// [SessionExpiredFailure] is thrown so the UI can prompt re-login.
  Future<void> switchToAccount(String userId) async {
    state = state.copyWith(isSwitching: true);

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
      ref.read(activeInstanceProvider.notifier).applySnapshot(instanceSnapshot);

      // Validate the stored token against the server before switching.
      final isValid = await _validateToken(session.token);
      if (!isValid) {
        await db.authSessionDao.markInvalid(userId);
        await loadAccounts();
        state = state.copyWith(isSwitching: false);
        throw SessionExpiredFailure(userId);
      }

      // Update lastActive to make this the active session.
      await db.authSessionDao.touchSession(userId);

      await PushAccountLifecycle.leaveActiveAccount(
        ref,
        mode: LeavePushAccountMode.switchAccount,
      );

      ref.read(syncedPreferencesStoreProvider).reset();
      ref.read(slowmodeTrackerProvider.notifier).reset();

      // Trigger full app restart with new session.
      ref.invalidate(appStartupProvider);
      await ref
          .read(appStartupProvider.future)
          .timeout(_kPostSwitchStartupTimeout);

      state = state.copyWith(isSwitching: false);
    } on SessionExpiredFailure {
      rethrow;
    } on Exception catch (e) {
      talker.error('[AccountManager] Switch failed: $e');
      state = state.copyWith(isSwitching: false);
      rethrow;
    }
  }

  /// Validates a token by calling `GET /users/@me` with the account's own
  /// token. Returns `false` on 401 or network failure.
  Future<bool> _validateToken(String token) async {
    try {
      final baseUrl = ref.read(fluxerBaseUrlProvider);
      await Dio(
        BaseOptions(
          baseUrl: baseUrl,
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
      // Network errors — don't mark invalid, just fail the switch.
      rethrow;
    }
  }

  /// Signs out an account and navigates to login (which shows account selector).
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

    // Always go to login — account selector shows remaining accounts.
    ref.read(fluxerAuthTokenProvider.notifier).setToken(null);
    ref.read(authStateProvider.notifier).setAuthenticated(value: false);
  }

  /// Probes the active session after a fatal gateway close. On a rejected
  /// token (401) it clears the session, signs out to login (account kept for
  /// re-login), and returns true. Network failures leave the session intact.
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

  /// Removes a non-current stored account (invalidates its server session
  /// using the account's own token, then deletes locally).
  Future<void> removeAccount(String userId) async {
    final authRepository = ref.read(authRepositoryProvider);
    final session = await authRepository.getSession(userId);

    if (session != null) {
      // Best-effort server logout using the stored account's own token,
      // matching the web app behavior (skipAuth + account-specific token).
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

    await authRepository.removeStoredAccount(userId);
    await loadAccounts();
  }
}
