import 'dart:async';

import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_service.dart';

/// Push backend disabled for this build.
class NoOpPushService implements PushService {
  const NoOpPushService();

  @override
  Future<void> initialize() async {}

  @override
  Future<String?> getToken() async => null;

  @override
  Stream<PushMessage> watchMessages() => const Stream<PushMessage>.empty();
}
