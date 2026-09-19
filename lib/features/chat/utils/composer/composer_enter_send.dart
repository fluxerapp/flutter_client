import 'package:flutter/services.dart';

bool isComposerSubmitKey(LogicalKeyboardKey key) {
  return key == LogicalKeyboardKey.enter ||
      key == LogicalKeyboardKey.numpadEnter;
}

/// Enter sends on desktop and wide web. On Android and iOS it only sends when
/// a physical keyboard is connected, so on-screen Enter stays a newline.
bool composerEnterSends({
  required bool isWeb,
  required bool isWideLayout,
  required bool isNativeMobileOs,
  required bool physicalKeyboardConnected,
}) {
  if (isWeb) {
    return isWideLayout;
  }
  if (isNativeMobileOs) {
    return physicalKeyboardConnected;
  }
  return true;
}
