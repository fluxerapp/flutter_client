import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

const Duration kIosDesktopPointerSuppressionDuration = Duration(
  milliseconds: 500,
);

bool initialIsTouchPrimary() =>
    defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android;

const Set<PointerDeviceKind> kTouchPointerDeviceKinds = {
  PointerDeviceKind.touch,
  PointerDeviceKind.stylus,
};

bool isTouchPointerKind(PointerDeviceKind kind) {
  return kTouchPointerDeviceKinds.contains(kind);
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
