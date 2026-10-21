import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/core/api/fluxer_api_features.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/instance/well_known_compat.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/push/push_sync_retry.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_instance_id.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_registration_logic.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_vapid_cache.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unified_push_mobile_device_registration.g.dart';

class _PendingUnifiedPushDelete {
  const _PendingUnifiedPushDelete({
    required this.account,
    required this.pushSubscriptionId,
    required this.endpointUrl,
  });

  final _PushAccount account;
  final String pushSubscriptionId;
  final String endpointUrl;
}

class _PushAccount {
  const _PushAccount({
    required this.userId,
    required this.token,
    required this.apiBaseUrl,
    this.cachedVapid,
  });

  final String userId;
  final String token;
  final String apiBaseUrl;
  final String? cachedVapid;

  String get instanceId => unifiedPushInstanceIdForApiBase(apiBaseUrl);
}

@Riverpod(keepAlive: true)
class UnifiedPushMobileDeviceRegistration
    extends _$UnifiedPushMobileDeviceRegistration {
  StreamSubscription<UnifiedPushEndpoint>? _endpointSubscription;
  Future<void>? _authSyncFuture;
  bool _authSyncAgain = false;
  final PushSyncRetry _registerRetry = PushSyncRetry();
  final PushSyncRetry _deleteRetry = PushSyncRetry();
  _PendingUnifiedPushDelete? _pendingDelete;
  Object? _deleteAttempt;
  final Set<String> _blockedUserIds = <String>{};
  Future<void> _registerQueue = Future<void>.value();
  final WebPushKeyStore _keyStore = WebPushKeyStore();

  @override
  int build() {
    if (!PushProviderGuard.isUnifiedPush) {
      return 0;
    }
    ref
      ..listen<String?>(fluxerAuthTokenProvider, (_, _) {
        unawaited(syncAllAccounts());
      })
      ..listen<bool>(authStateProvider, (_, _) {
        unawaited(syncAllAccounts());
      })
      ..listen<String?>(currentUserIdProvider, (
        String? previous,
        String? next,
      ) {
        if (previous != next) {
          unawaited(syncAllAccounts());
        }
      })
      ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
        if (next && previous == false) {
          unawaited(syncAllAccounts());
        }
      });
    unawaited(_endpointSubscription?.cancel());
    _endpointSubscription = UnifiedPushService.instance.endpointStream.listen((
      UnifiedPushEndpoint update,
    ) {
      unawaited(_registerInstanceEndpoint(update));
    });
    ref.onDispose(() {
      unawaited(_endpointSubscription?.cancel());
      _endpointSubscription = null;
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      unawaited(syncAllAccounts());
    });
    return 0;
  }

  static RegisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
  get _registerProviderEnvironment {
    return kDebugMode
        ? RegisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
              .development
        : RegisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
              .production;
  }

  static UnregisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
  get _unregisterProviderEnvironment {
    return kDebugMode
        ? UnregisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
              .development
        : UnregisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
              .production;
  }

  bool get _shouldRun {
    if (!Platform.isAndroid) {
      return false;
    }
    return PushProviderGuard.isUnifiedPush;
  }

  Future<void> syncAllAccounts() {
    return _syncAllAccounts(external: true);
  }

  Future<void> _syncAllAccounts({required bool external}) {
    if (external) {
      _registerRetry.beginExternalAttempt();
    }
    final Future<void>? inFlight = _authSyncFuture;
    if (inFlight != null) {
      _authSyncAgain = true;
      return inFlight;
    }
    final Future<void> sync = _drainAuthSync();
    _authSyncFuture = sync;
    return sync.whenComplete(() {
      if (identical(_authSyncFuture, sync)) {
        _authSyncFuture = null;
      }
    });
  }

  Future<void> _drainAuthSync() async {
    do {
      _authSyncAgain = false;
      try {
        await _syncStoredAccounts();
      } on Object catch (e, st) {
        if (kDebugMode) {
          debugPrint(
            '[UnifiedPushMobileDeviceRegistration] auth sync failed: $e\n$st',
          );
        }
      }
    } while (_authSyncAgain && ref.mounted);
  }

  Future<void> _syncStoredAccounts() async {
    if (!_shouldRun || !ref.mounted) {
      return;
    }
    final List<_PushAccount> accounts = await _loadAccounts();
    if (!ref.mounted) {
      return;
    }
    final Set<String> loadedIds = <String>{
      for (final _PushAccount account in accounts) account.userId,
    };
    _blockedUserIds.removeWhere((String userId) => !loadedIds.contains(userId));
    final List<_PushAccount> active = accounts
        .where(
          (_PushAccount account) => !_blockedUserIds.contains(account.userId),
        )
        .toList();
    await UnifiedPushService.instance.initialize();
    final Map<String, List<_PushAccount>> byInstance =
        <String, List<_PushAccount>>{};
    for (final _PushAccount account in active) {
      if (account.instanceId.isEmpty) {
        continue;
      }
      byInstance
          .putIfAbsent(account.instanceId, () => <_PushAccount>[])
          .add(account);
    }
    for (final MapEntry<String, List<_PushAccount>> entry
        in byInstance.entries) {
      try {
        final String? vapid = await _vapidForInstance(entry.value);
        if (!ref.mounted) {
          return;
        }
        final bool hasPersisted = await _instanceHasPersistedSubscription(
          entry.value,
        );
        await UnifiedPushService.instance.syncInstance(
          instance: entry.key,
          vapid: vapid,
          hasPersistedSubscription: hasPersisted,
        );
        final upEndpoint = UnifiedPushService.instance.endpointFor(entry.key);
        if (upEndpoint == null) {
          continue;
        }
        await _registerAccounts(
          UnifiedPushEndpoint(instance: entry.key, endpoint: upEndpoint),
          entry.value,
          vapid,
        );
      } on Object catch (e, st) {
        if (kDebugMode) {
          debugPrint(
            '[UnifiedPushMobileDeviceRegistration] instance ${entry.key} '
            'sync failed: $e\n$st',
          );
        }
      }
    }
    await UnifiedPushService.instance.retainInstances(<String>{
      for (final _PushAccount account in accounts)
        if (account.instanceId.isNotEmpty) account.instanceId,
    });
  }

  Future<List<_PushAccount>> _loadAccounts() async {
    final sessions = await ref
        .read(fluxerDatabaseProvider)
        .authSessionDao
        .getAllSessions();
    final AuthTokenStorage storage = ref.read(authTokenStorageProvider);
    final List<_PushAccount> accounts = <_PushAccount>[];
    for (final session in sessions) {
      if (!session.isValid) {
        continue;
      }
      final String? token = await storage.readToken(session.userId);
      if (token == null || token.isEmpty) {
        continue;
      }
      InstanceConfigSnapshot? snapshot;
      try {
        snapshot = await ref
            .read(authRepositoryProvider)
            .resolveInstanceSnapshotForUser(session.userId);
      } on Object {
        snapshot = null;
      }
      final String apiBaseUrl = snapshot == null || snapshot.apiBaseUrl.isEmpty
          ? await storage.readApiBaseUrl(session.userId) ?? ''
          : snapshot.apiBaseUrl;
      if (apiBaseUrl.isEmpty) {
        continue;
      }
      accounts.add(
        _PushAccount(
          userId: session.userId,
          token: token,
          apiBaseUrl: apiBaseUrl,
          cachedVapid: snapshot?.wellKnown?.push.publicVapidKey,
        ),
      );
    }
    return accounts;
  }

  Future<bool> _instanceHasPersistedSubscription(
    List<_PushAccount> accounts,
  ) async {
    for (final _PushAccount account in accounts) {
      final MobilePushRegistration? persisted = await _loadPersistedForUser(
        account.userId,
      );
      if (persisted != null && persisted.pushSubscriptionId.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  Future<String?> _storedVapid(List<_PushAccount> accounts) async {
    final String? cached = await ref
        .read(fluxerDatabaseProvider)
        .mobilePushRegistrationDao
        .getVapidForInstance(accounts.first.instanceId);
    if (hasUnifiedPushVapid(cached)) {
      return cached;
    }
    for (final _PushAccount account in accounts) {
      if (hasUnifiedPushVapid(account.cachedVapid)) {
        return account.cachedVapid;
      }
    }
    return null;
  }

  Future<String?> _vapidForInstance(List<_PushAccount> accounts) async {
    final String instanceId = accounts.first.instanceId;
    final String? fetched = await _fetchVapid(accounts.first.apiBaseUrl);
    if (hasUnifiedPushVapid(fetched)) {
      if (ref.mounted) {
        await ref
            .read(fluxerDatabaseProvider)
            .mobilePushRegistrationDao
            .saveVapidForInstance(
              instanceId: instanceId,
              vapidPublicKey: fetched!,
            );
      }
      return fetched;
    }
    return _storedVapid(accounts);
  }

  Future<String?> _fetchVapid(String apiBaseUrl) async {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    try {
      final String url = const InstanceEndpointNormalizer().buildWellKnownUrl(
        apiBaseUrl,
      );
      final Response<dynamic> response = await dio.get<dynamic>(url);
      final Object? data = response.data;
      if (data is! Map) {
        return null;
      }
      return parseWellKnownFluxer(
        Map<String, dynamic>.from(data),
      ).push.publicVapidKey;
    } on Object {
      return null;
    } finally {
      dio.close();
    }
  }

  Future<void> _registerInstanceEndpoint(UnifiedPushEndpoint update) async {
    if (!_shouldRun || !ref.mounted || update.endpoint.url.isEmpty) {
      return;
    }
    final List<_PushAccount> accounts = await _loadAccounts();
    if (!ref.mounted) {
      return;
    }
    final List<_PushAccount> matched = accounts
        .where(
          (_PushAccount account) =>
              account.instanceId == update.instance &&
              !_blockedUserIds.contains(account.userId),
        )
        .toList();
    if (matched.isEmpty) {
      return;
    }
    final String? vapid =
        await _storedVapid(matched) ?? await _vapidForInstance(matched);
    if (!ref.mounted) {
      return;
    }
    await _registerAccounts(update, matched, vapid);
  }

  Future<void> _registerAccounts(
    UnifiedPushEndpoint update,
    List<_PushAccount> accounts,
    String? vapid,
  ) {
    final Future<void> run = _registerQueue.then((_) async {
      if (!ref.mounted) {
        return;
      }
      var needsRetry = false;
      for (final _PushAccount account in accounts) {
        if (_blockedUserIds.contains(account.userId)) {
          continue;
        }
        try {
          final bool registered = await _registerAccount(
            account,
            update,
            vapid,
          );
          if (!registered) {
            needsRetry = true;
          }
        } on Object catch (e, st) {
          needsRetry = true;
          if (kDebugMode) {
            debugPrint(
              '[UnifiedPushMobileDeviceRegistration] register failed: $e\n$st',
            );
          }
        }
      }
      if (!needsRetry || !ref.mounted) {
        return;
      }
      _registerRetry.schedule(() {
        if (!ref.mounted) {
          return;
        }
        unawaited(_syncAllAccounts(external: false));
      });
    });
    _registerQueue = run.then<void>(
      (_) {},
      onError: (Object _, StackTrace _) {},
    );
    return run;
  }

  Future<MobilePushRegistration?> _loadPersistedForUser(String userId) {
    return ref
        .read(fluxerDatabaseProvider)
        .mobilePushRegistrationDao
        .getForUser(userId);
  }

  Future<bool> _registerAccount(
    _PushAccount account,
    UnifiedPushEndpoint update,
    String? vapid,
  ) async {
    if (_blockedUserIds.contains(account.userId) || !ref.mounted) {
      return true;
    }
    final String url = update.endpoint.url;
    final String? pubKey = update.endpoint.pubKeySet?.pubKey;
    final String? auth = update.endpoint.pubKeySet?.auth;
    if (url.isEmpty ||
        pubKey == null ||
        pubKey.isEmpty ||
        auth == null ||
        auth.isEmpty) {
      return true;
    }
    final MobilePushRegistration? persisted = await _loadPersistedForUser(
      account.userId,
    );
    if (_blockedUserIds.contains(account.userId) || !ref.mounted) {
      return true;
    }
    await _moveSecretsToSecureStorage(account.userId, persisted);
    final storedKeys = await _keyStore.read(account.userId);
    if (shouldSkipMobilePushRegistration(
      currentUserId: account.userId,
      persistedUserId: persisted?.userId,
      pushSubscriptionId: persisted?.pushSubscriptionId,
      endpointUrl: url,
      encryptionKey: pubKey,
      authSecret: auth,
      persistedEndpointUrl: persisted?.endpointUrl,
      persistedEncryptionKey: storedKeys?.publicKey,
      persistedAuthSecret: storedKeys?.authSecret,
    )) {
      return true;
    }
    final bool endpointRotated = hasUnifiedPushEndpointRotated(
      endpointUrl: url,
      encryptionKey: pubKey,
      authSecret: auth,
      persistedEndpointUrl: persisted?.endpointUrl,
      persistedEncryptionKey: storedKeys?.publicKey,
      persistedAuthSecret: storedKeys?.authSecret,
    );
    final String? oldSubscriptionId = endpointRotated
        ? persisted?.pushSubscriptionId
        : null;
    final String? oldEndpointUrl = endpointRotated
        ? persisted?.endpointUrl
        : null;
    if (_blockedUserIds.contains(account.userId) || !ref.mounted) {
      return true;
    }
    final String? deviceId = await _postDeviceRegistration(
      account: account,
      endpointUrl: url,
      encryptionKey: pubKey,
      authSecret: auth,
    );
    if (deviceId == null || deviceId.isEmpty) {
      return false;
    }
    if (_blockedUserIds.contains(account.userId) || !ref.mounted) {
      return true;
    }
    await ref
        .read(fluxerDatabaseProvider)
        .mobilePushRegistrationDao
        .upsert(
          userId: account.userId,
          pushSubscriptionId: deviceId,
          endpointUrl: url,
          encryptionKey: '',
          authSecret: '',
          vapidPublicKey: vapid,
        );
    await _keyStore.write(
      WebPushAccountKeys(
        userId: account.userId,
        publicKey: pubKey,
        authSecret: auth,
      ),
    );
    if (shouldDeletePriorUnifiedPushRegistration(
          endpointRotated: endpointRotated,
          oldSubscriptionId: oldSubscriptionId,
          oldEndpointUrl: oldEndpointUrl,
          newDeviceId: deviceId,
        ) &&
        !_blockedUserIds.contains(account.userId)) {
      await _deleteOrRetry(
        account: account,
        pushSubscriptionId: oldSubscriptionId!,
        endpointUrl: oldEndpointUrl!,
        fresh: true,
      );
    }
    if (kDebugMode) {
      debugPrint(
        '[UnifiedPushMobileDeviceRegistration] registered device $deviceId '
        'for ${account.userId}',
      );
    }
    return true;
  }

  Future<void> _deleteOrRetry({
    required _PushAccount account,
    required String pushSubscriptionId,
    required String endpointUrl,
    bool fresh = false,
  }) async {
    final Object attempt = Object();
    _deleteAttempt = attempt;
    if (fresh &&
        (_pendingDelete?.pushSubscriptionId != pushSubscriptionId ||
            _pendingDelete?.endpointUrl != endpointUrl)) {
      _deleteRetry.succeeded();
    }
    final bool deleted = await _deleteServerRegistration(
      account: account,
      pushSubscriptionId: pushSubscriptionId,
      endpointUrl: endpointUrl,
    );
    if (!identical(_deleteAttempt, attempt) || !ref.mounted) {
      return;
    }
    if (deleted) {
      _pendingDelete = null;
      _deleteRetry.succeeded();
      return;
    }
    _pendingDelete = _PendingUnifiedPushDelete(
      account: account,
      pushSubscriptionId: pushSubscriptionId,
      endpointUrl: endpointUrl,
    );
    final _PendingUnifiedPushDelete pending = _pendingDelete!;
    _deleteRetry.schedule(() {
      if (!ref.mounted || !identical(_pendingDelete, pending)) {
        return;
      }
      unawaited(
        _deleteOrRetry(
          account: pending.account,
          pushSubscriptionId: pending.pushSubscriptionId,
          endpointUrl: pending.endpointUrl,
        ),
      );
    });
  }

  Future<String?> _postDeviceRegistration({
    required _PushAccount account,
    required String endpointUrl,
    required String encryptionKey,
    required String authSecret,
  }) async {
    final Dio dio = _dioFor(account);
    try {
      final RegisterMobileDeviceResponse response =
          await UsersApi(
            dio,
            baseUrl: account.apiBaseUrl,
          ).registerMobilePushDevice(
            body: RegisterMobileDeviceRequest(
              platform: RegisterMobileDeviceRequestPlatformPlatform
                  .androidUnifiedPush,
              token: endpointUrl,
              userAgent: ref.read(fluxerClientPropertiesProvider).userAgent,
              appId: AppBuildConfig.mobilePushAppId,
              providerEnvironment: _registerProviderEnvironment,
              encryptionKey: encryptionKey,
              authSecret: authSecret,
            ),
          );
      return response.deviceId;
    } on DioException catch (e, st) {
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushMobileDeviceRegistration] register failed: $e\n$st',
        );
      }
      return null;
    } finally {
      dio.close();
    }
  }

  Future<bool> _deleteServerRegistration({
    required _PushAccount account,
    required String pushSubscriptionId,
    required String endpointUrl,
  }) async {
    final Dio dio = _dioFor(account);
    final UsersApi users = UsersApi(dio, baseUrl: account.apiBaseUrl);
    try {
      await users.deleteMobilePushDevice(deviceId: pushSubscriptionId);
      return true;
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushMobileDeviceRegistration] delete by id failed: $e; '
          'trying token unregister',
        );
      }
      try {
        await users.unregisterMobilePushDevice(
          body: UnregisterMobileDeviceRequest(
            platform: UnregisterMobileDeviceRequestPlatformPlatform
                .androidUnifiedPush,
            token: endpointUrl,
            appId: AppBuildConfig.mobilePushAppId,
            providerEnvironment: _unregisterProviderEnvironment,
          ),
        );
        return true;
      } on DioException catch (e2, st) {
        if (kDebugMode) {
          debugPrint(
            '[UnifiedPushMobileDeviceRegistration] token unregister failed: '
            '$e2\n$st',
          );
        }
        return false;
      }
    } finally {
      dio.close();
    }
  }

  Dio _dioFor(_PushAccount account) {
    return Dio(
      BaseOptions(
        baseUrl: account.apiBaseUrl,
        contentType: 'application/json',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: <String, dynamic>{
          'Authorization': formatSessionAuthorizationHeader(account.token),
          'User-Agent': ref.read(fluxerClientPropertiesProvider).userAgent,
          'X-Fluxer-Client-Properties': ref.read(
            fluxerClientPropertiesHeaderProvider,
          ),
          fluxerApiFeaturesHeaderName: buildFluxerApiFeaturesHeaderValue(),
        },
      ),
    );
  }

  Future<void> _moveSecretsToSecureStorage(
    String userId,
    MobilePushRegistration? persisted,
  ) async {
    if (persisted == null) {
      return;
    }
    if (persisted.encryptionKey.isEmpty && persisted.authSecret.isEmpty) {
      return;
    }
    final existing = await _keyStore.read(userId);
    if (existing == null) {
      await _keyStore.write(
        WebPushAccountKeys(
          userId: userId,
          publicKey: persisted.encryptionKey,
          authSecret: persisted.authSecret,
        ),
      );
    }
    await ref
        .read(fluxerDatabaseProvider)
        .mobilePushRegistrationDao
        .upsert(
          userId: userId,
          pushSubscriptionId: persisted.pushSubscriptionId,
          endpointUrl: persisted.endpointUrl,
          encryptionKey: '',
          authSecret: '',
          vapidPublicKey: persisted.vapidPublicKey,
        );
  }

  Future<void> unregisterCurrentEndpoint() {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null || userId.isEmpty) {
      return Future<void>.value();
    }
    return unregisterUser(userId);
  }

  Future<void> unregisterUser(String userId) {
    if (userId.isEmpty) {
      return Future<void>.value();
    }
    _blockedUserIds.add(userId);
    final Future<void> run = _registerQueue.then((_) async {
      if (!ref.mounted) {
        return;
      }
      await _unregisterUserNow(userId);
    });
    _registerQueue = run.then<void>(
      (_) {},
      onError: (Object _, StackTrace _) {},
    );
    return run;
  }

  Future<void> _unregisterUserNow(String userId) async {
    if (!_shouldRun) {
      return;
    }
    final List<_PushAccount> accounts = await _loadAccounts();
    _PushAccount? account;
    for (final _PushAccount candidate in accounts) {
      if (candidate.userId == userId) {
        account = candidate;
        break;
      }
    }
    if (account == null || !ref.mounted) {
      if (!ref.mounted) {
        return;
      }
      await ref
          .read(fluxerDatabaseProvider)
          .mobilePushRegistrationDao
          .clearForUser(userId);
      final String apiBaseUrl =
          await ref.read(authTokenStorageProvider).readApiBaseUrl(userId) ?? '';
      final String instanceId = unifiedPushInstanceIdForApiBase(apiBaseUrl);
      final bool stillUsed = accounts.any(
        (_PushAccount other) => other.instanceId == instanceId,
      );
      if (instanceId.isNotEmpty && !stillUsed) {
        await UnifiedPushService.instance.unregisterInstance(instanceId);
      }
      return;
    }
    final MobilePushRegistration? persisted = await _loadPersistedForUser(
      userId,
    );
    if (persisted != null && persisted.pushSubscriptionId.isNotEmpty) {
      await _deleteServerRegistration(
        account: account,
        pushSubscriptionId: persisted.pushSubscriptionId,
        endpointUrl: persisted.endpointUrl,
      );
    }
    if (!ref.mounted) {
      return;
    }
    await ref
        .read(fluxerDatabaseProvider)
        .mobilePushRegistrationDao
        .clearForUser(userId);
    final String instanceId = account.instanceId;
    final bool stillUsed = accounts.any(
      (_PushAccount other) =>
          other.userId != userId && other.instanceId == instanceId,
    );
    if (!stillUsed) {
      await UnifiedPushService.instance.unregisterInstance(instanceId);
    }
  }
}
