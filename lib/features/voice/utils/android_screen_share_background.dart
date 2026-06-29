import 'dart:io';

import 'package:flutter_background/flutter_background.dart';

const Duration _kForegroundServiceVerifyDelay = Duration(milliseconds: 250);
const int _kForegroundServiceVerifyAttempts = 4;

/// Returns whether the Android screen-share foreground service is active.
Future<bool> isAndroidScreenShareBackgroundRunning() async {
  if (!Platform.isAndroid) {
    return true;
  }
  return FlutterBackground.isBackgroundExecutionEnabled;
}

Future<bool> _verifyAndroidScreenShareBackgroundRunning() async {
  for (
    int attempt = 0;
    attempt < _kForegroundServiceVerifyAttempts;
    attempt++
  ) {
    if (FlutterBackground.isBackgroundExecutionEnabled) {
      return true;
    }
    await Future<void>.delayed(_kForegroundServiceVerifyDelay);
  }
  return false;
}

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
    if (!hasPermissions) {
      return false;
    }
    return _verifyAndroidScreenShareBackgroundRunning();
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
