import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

const Duration kIosDesktopPointerSuppressionDuration = Duration(
  milliseconds: 500,
);

bool initialIsTouchPrimary() {
  if (Platform.isIOS || Platform.isAndroid) {
    return true;
  }
  return !WidgetsBinding.instance.mouseTracker.mouseIsConnected;
}

bool isTouchPointerKind(PointerDeviceKind kind) {
  return kind == PointerDeviceKind.touch || kind == PointerDeviceKind.stylus;
}

bool isDesktopPointerKind(PointerDeviceKind kind) {
  return kind == PointerDeviceKind.mouse || kind == PointerDeviceKind.trackpad;
}

bool shouldPromoteDesktopPointerKind({
  required PointerDeviceKind kind,
  required bool isIOS,
  required bool mouseIsConnected,
  required bool isHoverEvent,
  DateTime? now,
  DateTime? iosTouchLockUntil,
}) {
  if (!isDesktopPointerKind(kind)) {
    return false;
  }
  if (isIOS && isHoverEvent && kind == PointerDeviceKind.mouse) {
    return false;
  }
  if (isIOS && kind == PointerDeviceKind.mouse && !mouseIsConnected) {
    return false;
  }
  if (isIOS &&
      iosTouchLockUntil != null &&
      now != null &&
      now.isBefore(iosTouchLockUntil)) {
    return false;
  }
  return true;
}
