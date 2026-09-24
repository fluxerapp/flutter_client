import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';
import 'package:fluxer_app/core/push/web_push/web_push_registration.dart';
import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apns_voip_mobile_device_registration.g.dart';

@Riverpod(keepAlive: true)
class ApnsVoipMobileDeviceRegistration
    extends _$ApnsVoipMobileDeviceRegistration {
  static const int _tokenPollAttempts = 30;
  static const Duration _tokenPollDelay = Duration(milliseconds: 200);
  String? _lastRegisteredUserId;
  String? _lastRegisteredRelayUrl;
  String? _lastRegisteredPublicKey;
  bool _syncInFlight = false;
  final WebPushKeyStore _keyStore = WebPushKeyStore(
    keyPrefix: kWebPushVoipKeysPrefix,
  );

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
    if (kIsWeb || !Platform.isIOS || !PushProviderGuard.isApple) {
      return false;
    }
    return true;
  }

  Future<void> sync() async {
    if (!_shouldRunOnThisPlatform || _syncInFlight) {
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
    if (bearer == null || bearer.isEmpty || !ref.read(authStateProvider)) {
      return;
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null || userId.isEmpty) {
      return;
    }
    String? hex;
    for (var attempt = 0; attempt < _tokenPollAttempts; attempt++) {
      hex = await FlutterCallkitIncoming.getDevicePushTokenVoIP();
      if (hex != null && hex.isNotEmpty) {
        break;
      }
      await Future<void>.delayed(_tokenPollDelay);
    }
    if (hex == null || hex.isEmpty) {
      talker.warning(
        '[ApnsVoipMobileDeviceRegistration] no PushKit token after polling',
      );
      return;
    }
    const String environmentName = kDebugMode ? 'development' : 'production';
    final String relayUrl = apnsVoipRelayUrl(
      appId: AppBuildConfig.mobilePushAppId,
      environment: environmentName,
      deviceTokenHex: hex,
    );
    final WebPushAccountKeys keys = await _keyStore.ensureKeys(userId);
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
              platform: RegisterMobileDeviceRequestPlatformPlatform.iosApnsVoip,
              token: relayUrl,
              userAgent: ref.read(fluxerClientPropertiesProvider).userAgent,
              appId: AppBuildConfig.mobilePushAppId,
              providerEnvironment: _registerProviderEnvironment,
              encryptionKey: keys.publicKey,
              authSecret: keys.authSecret,
            ),
          );
      _lastRegisteredUserId = userId;
      _lastRegisteredRelayUrl = relayUrl;
      _lastRegisteredPublicKey = keys.publicKey;
      talker.info('[ApnsVoipMobileDeviceRegistration] registered user $userId');
    } on DioException catch (e, st) {
      talker.handle(
        e,
        st,
        '[ApnsVoipMobileDeviceRegistration] register failed',
      );
    }
  }

  Future<void> unregisterCurrentToken() async {
    if (!_shouldRunOnThisPlatform) {
      return;
    }
    final String? bearer = ref.read(fluxerAuthTokenProvider);
    if (bearer == null || bearer.isEmpty) {
      return;
    }
    final String? hex = await FlutterCallkitIncoming.getDevicePushTokenVoIP();
    final String relayUrl =
        _lastRegisteredRelayUrl ??
        (hex == null || hex.isEmpty
            ? ''
            : apnsVoipRelayUrl(
                appId: AppBuildConfig.mobilePushAppId,
                environment: kDebugMode ? 'development' : 'production',
                deviceTokenHex: hex,
              ));
    if (relayUrl.isEmpty) {
      return;
    }
    try {
      await ref
          .read(fluxerClientProvider)
          .users
          .unregisterMobilePushDevice(
            body: UnregisterMobileDeviceRequest(
              platform:
                  UnregisterMobileDeviceRequestPlatformPlatform.iosApnsVoip,
              token: relayUrl,
              appId: AppBuildConfig.mobilePushAppId,
              providerEnvironment: _unregisterProviderEnvironment,
            ),
          );
      _lastRegisteredUserId = null;
      _lastRegisteredRelayUrl = null;
      _lastRegisteredPublicKey = null;
    } on DioException catch (e, st) {
      talker.handle(
        e,
        st,
        '[ApnsVoipMobileDeviceRegistration] unregister failed',
      );
    }
  }
}
