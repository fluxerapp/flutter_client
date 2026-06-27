import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/push_provider.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_registration_logic.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unifiedpush/unifiedpush.dart' as up;

part 'unified_push_mobile_device_registration.g.dart';

@Riverpod(keepAlive: true)
class UnifiedPushMobileDeviceRegistration
    extends _$UnifiedPushMobileDeviceRegistration {
  StreamSubscription<up.PushEndpoint>? _endpointSubscription;
  String? _trackedUserId;

  @override
  int build() {
    if (!PushProviderGuard.isUnifiedPush) {
      return 0;
    }
    ref
      ..listen<String?>(fluxerAuthTokenProvider, (_, _) {
        unawaited(_onAuthOrUserChanged());
      })
      ..listen<bool>(authStateProvider, (_, _) {
        unawaited(_onAuthOrUserChanged());
      })
      ..listen<String?>(currentUserIdProvider, (
        String? previous,
        String? next,
      ) {
        if (previous != next) {
          unawaited(_onAuthOrUserChanged());
        }
      })
      ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
        if (next && previous == false) {
          unawaited(_onAppResumed());
        }
      });
    unawaited(_endpointSubscription?.cancel());
    _endpointSubscription = UnifiedPushService.instance.endpointStream.listen((
      up.PushEndpoint endpoint,
    ) {
      unawaited(_registerEndpoint(endpoint));
    });
    ref.onDispose(() {
      unawaited(_endpointSubscription?.cancel());
      _endpointSubscription = null;
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      unawaited(_onAuthOrUserChanged());
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
    if (kIsWeb || !Platform.isAndroid) {
      return false;
    }
    return PushProviderGuard.isUnifiedPush;
  }

  Future<void> _onAuthOrUserChanged() async {
    if (!_shouldRun) {
      return;
    }
    if (!ref.read(authStateProvider)) {
      return;
    }
    final String? bearer = ref.read(fluxerAuthTokenProvider);
    if (bearer == null || bearer.isEmpty) {
      return;
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null || userId.isEmpty) {
      return;
    }
    _trackedUserId = userId;
    final MobilePushRegistration? persisted = await _loadPersistedForUser(
      userId,
    );
    final bool hasPersistedSubscription =
        persisted?.pushSubscriptionId.isNotEmpty ?? false;
    await UnifiedPushService.instance.loadCachedVapidPublicKey();
    await UnifiedPushService.instance.syncRegistration(
      hasPersistedSubscription: hasPersistedSubscription,
    );
    await syncFromCurrentEndpoint();
  }

  Future<void> _onAppResumed() async {
    if (!_shouldRun) {
      return;
    }
    if (!ref.read(appUiForegroundProvider)) {
      return;
    }
    await _onAuthOrUserChanged();
  }

  Future<bool> hasPersistedSubscriptionForCurrentUser() async {
    if (!_shouldRun) {
      return false;
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null || userId.isEmpty) {
      return false;
    }
    final MobilePushRegistration? persisted = await _loadPersistedForUser(
      userId,
    );
    final String? id = persisted?.pushSubscriptionId;
    return id != null && id.isNotEmpty;
  }

  Future<void> syncFromCurrentEndpoint() async {
    if (!_shouldRun) {
      return;
    }
    final up.PushEndpoint? endpoint =
        UnifiedPushService.instance.currentEndpoint;
    if (endpoint == null) {
      return;
    }
    await _registerEndpoint(endpoint);
  }

  Future<MobilePushRegistration?> _loadPersistedForUser(String userId) {
    return ref
        .read(fluxerDatabaseProvider)
        .mobilePushRegistrationDao
        .getForUser(userId);
  }

  Future<void> _registerEndpoint(up.PushEndpoint endpoint) async {
    if (!_shouldRun) {
      return;
    }
    final String? bearer = ref.read(fluxerAuthTokenProvider);
    if (bearer == null || bearer.isEmpty) {
      return;
    }
    if (!ref.read(authStateProvider)) {
      return;
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null || userId.isEmpty) {
      return;
    }
    final String url = endpoint.url;
    final String? pubKey = endpoint.pubKeySet?.pubKey;
    final String? auth = endpoint.pubKeySet?.auth;
    if (url.isEmpty || pubKey == null || auth == null) {
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushMobileDeviceRegistration] incomplete endpoint keys',
        );
      }
      return;
    }
    final MobilePushRegistration? persisted = await _loadPersistedForUser(
      userId,
    );
    if (shouldSkipMobilePushRegistration(
      currentUserId: userId,
      persistedUserId: persisted?.userId,
      pushSubscriptionId: persisted?.pushSubscriptionId,
      endpointUrl: url,
      encryptionKey: pubKey,
      authSecret: auth,
      persistedEndpointUrl: persisted?.endpointUrl,
      persistedEncryptionKey: persisted?.encryptionKey,
      persistedAuthSecret: persisted?.authSecret,
    )) {
      return;
    }
    if (hasUnifiedPushEndpointRotated(
      endpointUrl: url,
      encryptionKey: pubKey,
      authSecret: auth,
      persistedEndpointUrl: persisted?.endpointUrl,
      persistedEncryptionKey: persisted?.encryptionKey,
      persistedAuthSecret: persisted?.authSecret,
    )) {
      final String? oldSubscriptionId = persisted?.pushSubscriptionId;
      final String? oldEndpointUrl = persisted?.endpointUrl;
      if (oldSubscriptionId != null &&
          oldSubscriptionId.isNotEmpty &&
          oldEndpointUrl != null &&
          oldEndpointUrl.isNotEmpty) {
        await ref
            .read(fluxerDatabaseProvider)
            .mobilePushRegistrationDao
            .clearForUser(userId);
        await _deleteServerRegistration(
          pushSubscriptionId: oldSubscriptionId,
          endpointUrl: oldEndpointUrl,
        );
      }
    }
    try {
      final RegisterMobileDeviceResponse response = await ref
          .read(fluxerClientProvider)
          .users
          .registerMobilePushDevice(
            body: RegisterMobileDeviceRequest(
              platform: RegisterMobileDeviceRequestPlatformPlatform
                  .androidUnifiedPush,
              token: url,
              userAgent: ref.read(fluxerClientPropertiesProvider).userAgent,
              appId: AppBuildConfig.mobilePushAppId,
              providerEnvironment: _registerProviderEnvironment,
              encryptionKey: pubKey,
              authSecret: auth,
            ),
          );
      String? vapid;
      try {
        vapid =
            (await ref.read(fluxerClientProvider).instance.getWellKnownFluxer())
                .push
                .publicVapidKey;
      } on Object {
        vapid = null;
      }
      await ref
          .read(fluxerDatabaseProvider)
          .mobilePushRegistrationDao
          .upsert(
            userId: userId,
            pushSubscriptionId: response.deviceId,
            endpointUrl: url,
            encryptionKey: pubKey,
            authSecret: auth,
            vapidPublicKey: vapid,
          );
      if (vapid != null && vapid.isNotEmpty) {
        await UnifiedPushService.instance.persistVapidPublicKey(vapid);
        await ref
            .read(fluxerDatabaseProvider)
            .mobilePushRegistrationDao
            .saveGlobalVapidPublicKey(vapid);
        await UnifiedPushService.instance.applyVapidAndReregisterIfNeeded(
          vapid,
        );
      }
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushMobileDeviceRegistration] registered device '
          '${response.deviceId}',
        );
      }
    } on DioException catch (e, st) {
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushMobileDeviceRegistration] register failed: $e\n$st',
        );
      }
    }
  }

  Future<void> _deleteServerRegistration({
    required String pushSubscriptionId,
    required String endpointUrl,
  }) async {
    final String? bearer = ref.read(fluxerAuthTokenProvider);
    if (bearer == null || bearer.isEmpty) {
      return;
    }
    try {
      await ref
          .read(fluxerClientProvider)
          .users
          .deleteMobilePushDevice(deviceId: pushSubscriptionId);
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushMobileDeviceRegistration] deleted device '
          '$pushSubscriptionId',
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushMobileDeviceRegistration] delete by id failed: $e; '
          'trying token unregister',
        );
      }
      try {
        await ref
            .read(fluxerClientProvider)
            .users
            .unregisterMobilePushDevice(
              body: UnregisterMobileDeviceRequest(
                platform: UnregisterMobileDeviceRequestPlatformPlatform
                    .androidUnifiedPush,
                token: endpointUrl,
                appId: AppBuildConfig.mobilePushAppId,
                providerEnvironment: _unregisterProviderEnvironment,
              ),
            );
      } on DioException catch (e2, st) {
        if (kDebugMode) {
          debugPrint(
            '[UnifiedPushMobileDeviceRegistration] token unregister failed: '
            '$e2\n$st',
          );
        }
      }
    }
  }

  Future<void> unregisterCurrentEndpoint() async {
    if (!_shouldRun) {
      return;
    }
    final String? userId = _trackedUserId ?? ref.read(currentUserIdProvider);
    if (userId == null || userId.isEmpty) {
      return;
    }
    final String? bearer = ref.read(fluxerAuthTokenProvider);
    if (bearer == null || bearer.isEmpty) {
      return;
    }
    final MobilePushRegistration? persisted = await _loadPersistedForUser(
      userId,
    );
    if (persisted != null) {
      await _deleteServerRegistration(
        pushSubscriptionId: persisted.pushSubscriptionId,
        endpointUrl: persisted.endpointUrl,
      );
      await ref
          .read(fluxerDatabaseProvider)
          .mobilePushRegistrationDao
          .clearForUser(userId);
      return;
    }
    final String? url = await ref.read(pushServiceProvider).getToken();
    if (url == null || url.isEmpty) {
      return;
    }
    try {
      await ref
          .read(fluxerClientProvider)
          .users
          .unregisterMobilePushDevice(
            body: UnregisterMobileDeviceRequest(
              platform: UnregisterMobileDeviceRequestPlatformPlatform
                  .androidUnifiedPush,
              token: url,
              appId: AppBuildConfig.mobilePushAppId,
              providerEnvironment: _unregisterProviderEnvironment,
            ),
          );
    } on DioException catch (e, st) {
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushMobileDeviceRegistration] unregister failed: $e\n$st',
        );
      }
    }
  }
}
