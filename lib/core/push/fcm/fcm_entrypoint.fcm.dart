import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/push/fcm/fcm_android_system_notification_cancel_bridge.dart';
import 'package:fluxer_app/core/push/fcm/fcm_background_handler_policy.dart';
import 'package:fluxer_app/core/push/fcm/fcm_pending_notification_tap.dart';
import 'package:fluxer_app/core/push/fcm/fcm_tap_payload_cache.dart';
import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_fcm/fcm_background_handler.dart';
import 'package:fluxer_fcm/fcm_notification_clear_hooks.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';
import 'package:fluxer_fcm/fluxer_fcm_bootstrap.dart';

@pragma('vm:entry-point')
Future<void> fcmBackgroundMessageHandlerEntry(RemoteMessage message) async {
  _configureFcmBootstrap();
  await fcmBackgroundMessageHandler(message);
}

void _configureFcmBootstrap() {
  FluxerFcmBootstrap.configure(
    enrichTapPayload: FcmTapPayloadCache.enrich,
    shouldSaveTapPayloadCache: shouldSaveFcmTapPayloadCache,
    saveTapPayloadCache: FcmTapPayloadCache.save,
    onBackgroundNotificationTap: FcmPendingNotificationTap.save,
    cancelFcmSystemDuplicates:
        FcmAndroidSystemNotificationCancelBridge.cancelFcmSystemDuplicates,
    shouldDisplayBackgroundLocalNotification: _shouldDisplayBackgroundLocal,
  );
  FcmNotificationClearHooks.onClear =
      PushNotificationClear.handleBackgroundClearPayload;
}

bool _shouldDisplayBackgroundLocal(FcmPushMessage message) {
  return shouldSaveFcmTapPayloadCache(message.payload);
}

Future<void> bootstrapFcmIfNeeded() async {
  if (!PushProviderGuard.isFirebaseMessaging || !Platform.isAndroid) {
    return;
  }
  try {
    _configureFcmBootstrap();
    await FluxerFcmBootstrap.bootstrapIfNeeded(
      onBackgroundMessage: fcmBackgroundMessageHandlerEntry,
    );
  } on Object catch (error, stackTrace) {
    if (kDebugMode) {
      debugPrint('[FCM] bootstrapIfNeeded failed: $error\n$stackTrace');
    }
    rethrow;
  }
}

Future<void> bootstrapFcmAfterRunApp() async {
  if (!PushProviderGuard.isFirebaseMessaging || !Platform.isAndroid) {
    return;
  }
  try {
    await FluxerFcmBootstrap.bootstrapAfterRunApp();
  } on Object catch (error, stackTrace) {
    if (kDebugMode) {
      debugPrint('[FCM] bootstrapAfterRunApp failed: $error\n$stackTrace');
    }
    rethrow;
  }
}
