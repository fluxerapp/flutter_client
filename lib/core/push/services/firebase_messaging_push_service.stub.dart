import 'dart:async';

import 'package:fluxer_app/core/push/fcm/fcm_tap_binding_host.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_service.dart';

class FirebaseMessagingPushService implements PushService {
  const FirebaseMessagingPushService();

  static const FcmTapBindingHost tapHost = FcmTapBindingHostStub();

  static Future<void> bootstrapAfterAuth() async {}

  static Stream<String> get tokenRefreshStream => const Stream<String>.empty();

  @override
  Future<void> initialize() async {}

  @override
  Future<String?> getToken() async => null;

  @override
  Stream<PushMessage> watchMessages() => const Stream<PushMessage>.empty();
}
