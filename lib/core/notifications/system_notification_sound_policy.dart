import 'dart:io';

import 'package:flutter/services.dart';

const MethodChannel _androidNotificationsChannel = MethodChannel(
  'fluxer_app/android_notifications',
);

Future<bool> isSystemNotificationSoundSuppressed() async {
  if (!Platform.isAndroid) {
    return false;
  }
  try {
    final bool? suppressed = await _androidNotificationsChannel
        .invokeMethod<bool>('isNotificationSoundSuppressed');
    return suppressed ?? false;
  } on PlatformException {
    return false;
  } on MissingPluginException {
    return false;
  }
}
