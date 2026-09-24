import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/push/android/android_push_pipeline.dart';
import 'package:fluxer_app/core/push/push_message.dart';
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
    final String? ciphertext = payload['p'];
    if (ciphertext != null &&
        ciphertext.isNotEmpty &&
        payload['url'] == null &&
        payload['channel_id'] == null) {
      unawaited(_openCiphertext(ref, ciphertext));
      return;
    }
    ref
        .read(pushNotificationTapHandlerProvider.notifier)
        .handlePayload(payload);
  }

  FirebaseMessagingPushService.tapHost.setNotificationTapCallback(handleTap);
  ref.onDispose(() {
    FirebaseMessagingPushService.tapHost.setNotificationTapCallback(null);
  });
}

Future<void> _openCiphertext(Ref ref, String ciphertext) async {
  final PushMessage? message = await AndroidPushPipeline.handleCiphertext(
    ciphertextBase64: ciphertext,
    backgroundMode: false,
  );
  if (message == null) {
    return;
  }
  ref
      .read(pushNotificationTapHandlerProvider.notifier)
      .handlePayload(message.payload);
}
