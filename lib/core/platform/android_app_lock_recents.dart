import 'dart:io';

import 'package:flutter/services.dart';

const MethodChannel _androidAppLockChannel = MethodChannel(
  'fluxer_app/app_lock',
);

Future<void> setAndroidHideInRecents({required bool hide}) async {
  if (!Platform.isAndroid) {
    return;
  }
  await _androidAppLockChannel.invokeMethod<void>('setHideInRecents', hide);
}
