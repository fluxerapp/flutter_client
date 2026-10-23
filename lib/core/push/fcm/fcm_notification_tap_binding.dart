import 'dart:async';
import 'dart:io';

import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/push/android/android_push_pipeline.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_tap_handler.dart';
import 'package:fluxer_app/core/push/services/firebase_messaging_push_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fcm_notification_tap_binding.g.dart';

final List<Future<void>> _inFlightFcmTapHandlers = <Future<void>>[];

Future<void> awaitInFlightFcmTapHandlers() async {
  if (_inFlightFcmTapHandlers.isEmpty) {
    return;
  }
  final List<Future<void>> pending = List<Future<void>>.from(
    _inFlightFcmTapHandlers,
  );
  await Future.wait(pending);
}

@Riverpod(keepAlive: true)
void fcmNotificationTapBinding(Ref ref) {
  if (!Platform.isAndroid || !PushProviderGuard.isFirebaseMessaging) {
    return;
  }
  void handleTap(Map<String, String> payload) {
    final Future<void> work = _handleFcmNotificationTap(ref, payload);
    _inFlightFcmTapHandlers.add(work);
    unawaited(
      work.whenComplete(() {
        _inFlightFcmTapHandlers.remove(work);
      }),
    );
  }

  FirebaseMessagingPushService.tapHost.setNotificationTapCallback(handleTap);
  ref.onDispose(() {
    FirebaseMessagingPushService.tapHost.setNotificationTapCallback(null);
  });
}

Future<void> _handleFcmNotificationTap(
  Ref ref,
  Map<String, String> payload,
) async {
  final String? ciphertext = payload['p'];
  if (ciphertext != null &&
      ciphertext.isNotEmpty &&
      payload['url'] == null &&
      payload['channel_id'] == null) {
    final PushMessage? message = await AndroidPushPipeline.handleCiphertext(
      ciphertextBase64: ciphertext,
      backgroundMode: false,
    );
    if (message == null) {
      return;
    }
    payload = message.payload;
  }
  ref.read(pushNotificationTapHandlerProvider.notifier).handlePayload(payload);
}
