import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluxer_fcm/fcm_background_display_hooks.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';
import 'package:fluxer_fcm/fcm_push_notification_sound.dart';

bool shouldHandleFcmBackgroundNotificationClear(FcmPushMessage mapped) {
  return isFcmNotificationClearPayload(mapped.payload);
}

bool shouldDisplayFcmBackgroundLocalNotification(
  RemoteMessage message,
  FcmPushMessage mapped,
) {
  if (shouldHandleFcmBackgroundNotificationClear(mapped)) {
    return false;
  }
  if (FcmBackgroundDisplayHooks.shouldDisplayLocalNotification(mapped)) {
    return true;
  }
  return message.notification == null;
}
