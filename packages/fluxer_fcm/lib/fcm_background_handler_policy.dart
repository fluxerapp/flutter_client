import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluxer_fcm/fcm_background_display_hooks.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';

bool shouldDisplayFcmBackgroundLocalNotification(
  RemoteMessage message,
  FcmPushMessage mapped,
) {
  if (FcmBackgroundDisplayHooks.shouldDisplayLocalNotification(mapped)) {
    return true;
  }
  return message.notification == null;
}
