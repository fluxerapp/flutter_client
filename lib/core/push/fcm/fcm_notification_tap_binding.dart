import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/push/fcm/fcm_pending_notification_tap.dart';
import 'package:fluxer_app/core/push/push_notification_tap_handler.dart';
import 'package:fluxer_app/core/push/services/firebase_messaging_push_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fcm_notification_tap_binding.g.dart';

@Riverpod(keepAlive: true)
void fcmNotificationTapBinding(Ref ref) {
  if (kIsWeb || !Platform.isAndroid || !PushProviderGuard.isFirebaseMessaging) {
    return;
  }
  void handleTap(Map<String, String> payload) {
    ref
        .read(pushNotificationTapHandlerProvider.notifier)
        .handlePayload(payload);
  }

  FirebaseMessagingPushService.tapHost.setNotificationTapCallback(handleTap);
  unawaited(
    FcmPendingNotificationTap.flushToHandler(
      ref.read(pushNotificationTapHandlerProvider.notifier).handlePayloadJson,
    ),
  );
  ref.onDispose(() {
    FirebaseMessagingPushService.tapHost.setNotificationTapCallback(null);
  });
}
