import 'dart:async';

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
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';
import 'package:fluxer_app/core/push/web_push/web_push_registration.dart';
import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apns_mobile_device_registration.g.dart';

@Riverpod(keepAlive: true)
class ApnsMobileDeviceRegistration extends _$ApnsMobileDeviceRegistration {
  static const int _tokenPollAttempts = 30;
  static const Duration _tokenPollDelay = Duration(milliseconds: 200);
  String? _lastRegisteredUserId;
  String? _lastRegisteredRelayUrl;
  String? _lastRegisteredPublicKey;
  bool _syncInFlight = false;
  final WebPushKeyStore _keyStore = WebPushKeyStore();

  @override
  int build() {
    if (!PushProviderGuard.isApple) {
      return 0;
    }
    ref
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

  bool get _shouldRunOnThisPlatform {
    if (kIsWeb) {
      return false;
    }
    if (defaultTargetPlatform != TargetPlatform.iOS) {
      return false;
    }
    if (!PushProviderGuard.isApple) {
      return false;
    }
    return true;
  }

  Future<void> sync() async {
    if (!_shouldRunOnThisPlatform) {
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
      _logApnsWarning('sync skipped: missing auth token');
      return;
    }
    if (!ref.read(authStateProvider)) {
      _logApnsWarning('sync skipped: not authenticated');
      return;
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null || userId.isEmpty) {
      _logApnsWarning('sync skipped: missing user id');
      return;
    }
    _logApnsInfo('sync started for user $userId');
    final bool granted = await requestPushNotificationPermission();
    if (!granted) {
      _logApnsWarning('sync aborted: notification permission not granted');
      return;
    }
    final PushService push = ref.read(pushServiceProvider);
    try {
      await push.initialize();
    } on Object catch (e, st) {
      talker.handle(
        e,
        st,
        '[ApnsMobileDeviceRegistration] sync aborted: push initialize failed',
      );
      return;
    }
    String? hex;
    var tokenPollAttempts = 0;
    for (var attempt = 0; attempt < _tokenPollAttempts; attempt++) {
      tokenPollAttempts = attempt + 1;
      hex = await push.getToken();
      if (hex != null && hex.isNotEmpty) {
        break;
      }
      await Future<void>.delayed(_tokenPollDelay);
    }
    if (hex == null || hex.isEmpty) {
      _logApnsWarning(
        'sync aborted: no APNs device token after $tokenPollAttempts poll(s)',
      );
      return;
    }
    const String environmentName = kDebugMode ? 'development' : 'production';
    final String relayUrl = apnsRelayUrl(
      appId: AppBuildConfig.mobilePushAppId,
      environment: environmentName,
      deviceTokenHex: hex,
    );
    final WebPushAccountKeys keys = await _keyStore.ensureKeys(userId);
    await unregisterLegacyRawTokenOnce(
      keyStore: _keyStore,
      platform: 'ios_apns',
      userId: userId,
      unregister: () => _unregisterToken(
        hex!,
        providerEnvironment: _unregisterProviderEnvironment,
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
      _logApnsInfo('submit skipped: relay already registered for user $userId');
      return;
    }
    final String appId = AppBuildConfig.mobilePushAppId;
    final RegisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
    environment = _registerProviderEnvironment;
    _logApnsInfo(
      'submitting APNs relay userId=$userId appId=$appId '
      'environment=$environmentName',
    );
    try {
      await ref
          .read(fluxerClientProvider)
          .users
          .registerMobilePushDevice(
            body: RegisterMobileDeviceRequest(
              platform: RegisterMobileDeviceRequestPlatformPlatform.iosApns,
              token: relayUrl,
              userAgent: ref.read(fluxerClientPropertiesProvider).userAgent,
              appId: appId,
              providerEnvironment: environment,
              encryptionKey: keys.publicKey,
              authSecret: keys.authSecret,
            ),
          );
      _lastRegisteredUserId = userId;
      _lastRegisteredRelayUrl = relayUrl;
      _lastRegisteredPublicKey = keys.publicKey;
      _logApnsInfo('APNs relay registration succeeded for user $userId');
    } on DioException catch (e, st) {
      final int? statusCode = e.response?.statusCode;
      final Object? responseData = e.response?.data;
      talker.handle(
        e,
        st,
        '[ApnsMobileDeviceRegistration] APNs registration failed '
        'userId=$userId appId=$appId status=$statusCode response=$responseData',
      );
    }
  }

  void _logApnsInfo(String message) {
    talker.info('[ApnsMobileDeviceRegistration] $message');
  }

  void _logApnsWarning(String message) {
    talker.warning('[ApnsMobileDeviceRegistration] $message');
  }

  Future<void> unregisterCurrentToken() async {
    if (!_shouldRunOnThisPlatform) {
      return;
    }
    final String? hex = await ref.read(pushServiceProvider).getToken();
    if (hex == null || hex.isEmpty) {
      return;
    }
    final String? bearer = ref.read(fluxerAuthTokenProvider);
    if (bearer == null || bearer.isEmpty) {
      return;
    }
    final String relayUrl =
        _lastRegisteredRelayUrl ??
        apnsRelayUrl(
          appId: AppBuildConfig.mobilePushAppId,
          environment: kDebugMode ? 'development' : 'production',
          deviceTokenHex: hex,
        );
    try {
      _logApnsInfo('unregistering APNs relay');
      await _unregisterToken(
        relayUrl,
        providerEnvironment: _unregisterProviderEnvironment,
      );
      _lastRegisteredUserId = null;
      _lastRegisteredRelayUrl = null;
      _lastRegisteredPublicKey = null;
      _logApnsInfo('APNs unregister succeeded');
    } on DioException catch (e, st) {
      final int? statusCode = e.response?.statusCode;
      final Object? responseData = e.response?.data;
      talker.handle(
        e,
        st,
        '[ApnsMobileDeviceRegistration] APNs unregister failed '
        'status=$statusCode response=$responseData',
      );
    }
  }

  Future<void> _unregisterToken(
    String token, {
    required UnregisterMobileDeviceRequestProviderEnvironmentProviderEnvironment
    providerEnvironment,
  }) {
    return ref
        .read(fluxerClientProvider)
        .users
        .unregisterMobilePushDevice(
          body: UnregisterMobileDeviceRequest(
            platform: UnregisterMobileDeviceRequestPlatformPlatform.iosApns,
            token: token,
            appId: AppBuildConfig.mobilePushAppId,
            providerEnvironment: providerEnvironment,
          ),
        );
  }
}
