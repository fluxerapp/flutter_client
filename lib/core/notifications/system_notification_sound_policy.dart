import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const MethodChannel _androidNotificationsChannel = MethodChannel(
  'fluxer_app/android_notifications',
);

/// Returns true when the OS is suppressing notification-style sounds.
///
/// On Android this reflects Do Not Disturb / interruption filters. On iOS,
/// notification clips already respect the silent switch via audio session policy.
Future<bool> isSystemNotificationSoundSuppressed() async {
  if (kIsWeb || !Platform.isAndroid) {
    return false;
  }
  try {
    final bool? suppressed = await _androidNotificationsChannel.invokeMethod<bool>(
      'isNotificationSoundSuppressed',
    );
    return suppressed ?? false;
  } on PlatformException {
    return false;
  } on MissingPluginException {
    return false;
  }
}
