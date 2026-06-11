import 'dart:io';

import 'package:flutter_background/flutter_background.dart';

/// Starts the media projection foreground service for Android screen share.
Future<bool> enableAndroidScreenShareBackground({
  required String notificationText,
  bool isRetry = false,
}) async {
  if (!Platform.isAndroid) {
    return true;
  }
  try {
    bool hasPermissions = await FlutterBackground.hasPermissions;
    if (!isRetry) {
      final FlutterBackgroundAndroidConfig androidConfig =
          FlutterBackgroundAndroidConfig(
            notificationTitle: 'Fluxer',
            notificationText: notificationText,
          );
      hasPermissions = await FlutterBackground.initialize(
        androidConfig: androidConfig,
      );
    }
    if (hasPermissions && !FlutterBackground.isBackgroundExecutionEnabled) {
      await FlutterBackground.enableBackgroundExecution();
    }
    return hasPermissions && FlutterBackground.isBackgroundExecutionEnabled;
  } on Object {
    if (!isRetry) {
      await Future<void>.delayed(const Duration(seconds: 1));
      return enableAndroidScreenShareBackground(
        notificationText: notificationText,
        isRetry: true,
      );
    }
    return false;
  }
}

/// Stops the screen share foreground service when sharing ends or voice leaves.
Future<void> disableAndroidScreenShareBackground() async {
  if (!Platform.isAndroid) {
    return;
  }
  if (!FlutterBackground.isBackgroundExecutionEnabled) {
    return;
  }
  try {
    await FlutterBackground.disableBackgroundExecution();
  } on Object {
    // Best-effort cleanup.
  }
}
