import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/push_provider.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:fluxer_app/core/push/push_service.dart';
import 'package:fluxer_app/core/push/services/firebase_messaging_push_service.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';
import 'package:fluxer_app/core/push/web_push/web_push_registration.dart';
import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fcm_mobile_device_registration.g.dart';

@Riverpod(keepAlive: true)
class FcmMobileDeviceRegistration extends _$FcmMobileDeviceRegistration {
  static const int _tokenPollAttempts = 30;
  static const Duration _tokenPollDelay = Duration(milliseconds: 200);
  String? _lastRegisteredUserId;
  String? _lastRegisteredRelayUrl;
  String? _lastRegisteredPublicKey;
  bool _syncInFlight = false;
  final WebPushKeyStore _keyStore = WebPushKeyStore();

  @override
  int build() {
    if (!PushProviderGuard.isFirebaseMessaging) {
      return 0;
    }
    final StreamSubscription<String> tokenRefreshSubscription =
        FirebaseMessagingPushService.tokenRefreshStream.listen((String token) {
          if (token.isEmpty) {
            return;
          }
          unawaited(sync());
        });
    ref
      ..onDispose(() {
        unawaited(tokenRefreshSubscription.cancel());
      })
      ..listen<String?>(fluxerAuthTokenProvider, (_, _) {
        unawaited(sync());
      })
      ..listen<bool>(authStateProvider, (_, _) {
        unawaited(sync());
      })
      ..listen<String?>(currentUserIdProvider, (
        String? previous,
        String? next,
      ) {
        if (previous != next) {
          unawaited(sync());
        }
      })
      ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
        if (next && previous == false) {
          unawaited(sync());
        }
      });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      unawaited(sync());
    });
    return 0;
  }

  bool get _shouldRun {
    if (kIsWeb || !Platform.isAndroid) {
      return false;
    }
    return PushProviderGuard.isFirebaseMessaging;
  }

  Future<void> sync() async {
    if (!_shouldRun) {
      return;
    }
    if (_syncInFlight) {
      return;
    }
    _syncInFlight = true;
    try {
      await _syncImpl();
    } finally {
      _syncInFlight = false;
    }
  }

  Future<void> _syncImpl() async {
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
    final bool granted = await requestPushNotificationPermission();
    if (!granted) {
      if (kDebugMode) {
        debugPrint('[FcmMobileDeviceRegistration] notifications not granted');
      }
      return;
    }
    final PushService push = ref.read(pushServiceProvider);
    try {
      await push.initialize();
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[FcmMobileDeviceRegistration] initialize failed: $e\n$st');
      }
      return;
    }
    String? token;
    for (var attempt = 0; attempt < _tokenPollAttempts; attempt++) {
      token = await push.getToken();
      if (token != null && token.isNotEmpty) {
        break;
      }
      await Future<void>.delayed(_tokenPollDelay);
    }
    if (token == null || token.isEmpty) {
      if (kDebugMode) {
        debugPrint('[FcmMobileDeviceRegistration] No FCM token after polling');
      }
      return;
    }
    final String relayUrl = fcmRelayUrl(
      appId: AppBuildConfig.mobilePushAppId,
      deviceToken: token,
    );
    final WebPushAccountKeys keys = await _keyStore.ensureKeys(userId);
    await unregisterLegacyRawTokenOnce(
      keyStore: _keyStore,
      platform: 'android_fcm',
      userId: userId,
      unregister: () => _unregisterToken(
        token!,
        providerEnvironment: _legacyProviderEnvironment,
      ),
    );
    if (shouldSkipWebPushRegistration(
      currentUserId: userId,
      relayUrl: relayUrl,
      publicKey: keys.publicKey,
      lastRegisteredUserId: _lastRegisteredUserId,
      lastRegisteredRelayUrl: _lastRegisteredRelayUrl,
      lastRegisteredPublicKey: _lastRegisteredPublicKey,
    )) {
      return;
    }
    try {
      await ref
          .read(fluxerClientProvider)
          .users
          .registerMobilePushDevice(
            body: RegisterMobileDeviceRequest(
              platform: RegisterMobileDeviceRequestPlatformPlatform.androidFcm,
              token: relayUrl,
              userAgent: ref.read(fluxerClientPropertiesProvider).userAgent,
              appId: AppBuildConfig.mobilePushAppId,
              encryptionKey: keys.publicKey,
              authSecret: keys.authSecret,
            ),
          );
      _lastRegisteredUserId = userId;
      _lastRegisteredRelayUrl = relayUrl;
      _lastRegisteredPublicKey = keys.publicKey;
      if (kDebugMode) {
        debugPrint(
          '[FcmMobileDeviceRegistration] registered relay for user $userId',
        );
      }
    } on DioException catch (e, st) {
      if (kDebugMode) {
        debugPrint('[FcmMobileDeviceRegistration] register failed: $e\n$st');
      }
    }
  }

  Future<void> unregisterCurrentToken() async {
    if (!_shouldRun) {
      return;
    }
    final String? token = await ref.read(pushServiceProvider).getToken();
    if (token == null || token.isEmpty) {
      return;
    }
    final String? bearer = ref.read(fluxerAuthTokenProvider);
    if (bearer == null || bearer.isEmpty) {
      return;
    }
    final String relayUrl =
        _lastRegisteredRelayUrl ??
        fcmRelayUrl(appId: AppBuildConfig.mobilePushAppId, deviceToken: token);
    try {
      await _unregisterToken(relayUrl);
      _lastRegisteredUserId = null;
      _lastRegisteredRelayUrl = null;
      _lastRegisteredPublicKey = null;
    } on DioException catch (e, st) {
      if (kDebugMode) {
        debugPrint('[FcmMobileDeviceRegistration] unregister failed: $e\n$st');
      }
    }
  }

  Future<void> _unregisterToken(
    String token, {
    UnregisterMobileDeviceRequestProviderEnvironmentProviderEnvironment?
    providerEnvironment,
  }) {
    return ref
        .read(fluxerClientProvider)
        .users
        .unregisterMobilePushDevice(
          body: UnregisterMobileDeviceRequest(
            platform: UnregisterMobileDeviceRequestPlatformPlatform.androidFcm,
            token: token,
            appId: AppBuildConfig.mobilePushAppId,
            providerEnvironment: providerEnvironment,
          ),
        );
  }

  static UnregisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
  get _legacyProviderEnvironment {
    return kDebugMode
        ? UnregisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
              .development
        : UnregisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
              .production;
  }
}
