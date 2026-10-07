import 'package:flutter/services.dart';

bool isComposerSubmitKey(LogicalKeyboardKey key) {
  return key == LogicalKeyboardKey.enter ||
      key == LogicalKeyboardKey.numpadEnter;
}

/// Enter sends on desktop. On Android and iOS it only sends when a physical
/// keyboard is connected, so on-screen Enter stays a newline.
bool composerEnterSends({
  required bool isNativeMobileOs,
  required bool physicalKeyboardConnected,
}) {
  if (isNativeMobileOs) {
    return physicalKeyboardConnected;
  }
  return true;
}
