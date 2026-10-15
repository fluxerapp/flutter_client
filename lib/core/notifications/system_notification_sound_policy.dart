import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const MethodChannel _androidNotificationsChannel = MethodChannel(
  'fluxer_app/android_notifications',
);

Future<bool> isSystemNotificationSoundSuppressed() async {
  if (defaultTargetPlatform != TargetPlatform.android) {
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
