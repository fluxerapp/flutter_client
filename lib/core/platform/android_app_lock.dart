import 'dart:io';

import 'package:flutter/services.dart';

const MethodChannel _androidAppLockChannel = MethodChannel(
  'fluxer_app/app_lock',
);

Future<void> setAndroidAppLockEnabled({required bool enabled}) async {
  if (!Platform.isAndroid) {
    return;
  }
  await _androidAppLockChannel.invokeMethod<void>('setEnabled', enabled);
}

void setAndroidAppLockPausedHandler(VoidCallback? onPaused) {
  if (!Platform.isAndroid) {
    return;
  }
  _androidAppLockChannel.setMethodCallHandler(
    onPaused == null
        ? null
        : (MethodCall call) async {
            if (call.method == 'paused') {
              onPaused();
            }
          },
  );
}
