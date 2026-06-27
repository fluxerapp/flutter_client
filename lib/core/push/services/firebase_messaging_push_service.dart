import 'dart:async';

import 'package:fluxer_app/core/push/fcm/fcm_tap_binding_host.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_service.dart';

/// OSS / UnifiedPush builds: FCM is not linked; this stub is never selected at runtime.
class FirebaseMessagingPushService implements PushService {
  const FirebaseMessagingPushService();

  static const FcmTapBindingHost tapHost = FcmTapBindingHostStub();

  static Future<void> bootstrapAfterAuth() async {}

  static Stream<String> get tokenRefreshStream => const Stream<String>.empty();

  @override
  Future<void> requestPermissions() async {}

  @override
  Future<void> initialize() async {}

  @override
  Future<String?> getToken() async => null;

  @override
  Stream<PushMessage> watchMessages() => const Stream<PushMessage>.empty();
}
