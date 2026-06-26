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
import 'package:fluxer_app/core/push/fcm/fcm_registration_logic.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:fluxer_app/core/push/push_service.dart';
import 'package:fluxer_app/core/push/services/firebase_messaging_push_service.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fcm_mobile_device_registration.g.dart';

@Riverpod(keepAlive: true)
class FcmMobileDeviceRegistration extends _$FcmMobileDeviceRegistration {
  static const int _tokenPollAttempts = 30;
  static const Duration _tokenPollDelay = Duration(milliseconds: 200);
  String? _lastRegisteredUserId;
  String? _lastRegisteredToken;
  bool _syncInFlight = false;

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
    if (shouldSkipFcmRegistration(
      currentUserId: userId,
      token: token,
      lastRegisteredUserId: _lastRegisteredUserId,
      lastRegisteredToken: _lastRegisteredToken,
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
              token: token,
              userAgent: ref.read(fluxerClientPropertiesProvider).userAgent,
              appId: AppBuildConfig.mobilePushAppId,
              providerEnvironment: _registerProviderEnvironment,
            ),
          );
      _lastRegisteredUserId = userId;
      _lastRegisteredToken = token;
      if (kDebugMode) {
        debugPrint(
          '[FcmMobileDeviceRegistration] registered token for user $userId',
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
    String? token = _lastRegisteredToken;
    if (token == null || token.isEmpty) {
      token = await ref.read(pushServiceProvider).getToken();
    }
    if (token == null || token.isEmpty) {
      return;
    }
    final String? bearer = ref.read(fluxerAuthTokenProvider);
    if (bearer == null || bearer.isEmpty) {
      return;
    }
    try {
      await ref
          .read(fluxerClientProvider)
          .users
          .unregisterMobilePushDevice(
            body: UnregisterMobileDeviceRequest(
              platform:
                  UnregisterMobileDeviceRequestPlatformPlatform.androidFcm,
              token: token,
              appId: AppBuildConfig.mobilePushAppId,
              providerEnvironment: _unregisterProviderEnvironment,
            ),
          );
      _lastRegisteredUserId = null;
      _lastRegisteredToken = null;
    } on DioException catch (e, st) {
      if (kDebugMode) {
        debugPrint('[FcmMobileDeviceRegistration] unregister failed: $e\n$st');
      }
    }
  }
}
