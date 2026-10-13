import 'package:flutter/services.dart';

bool isComposerSubmitKey(LogicalKeyboardKey key) {
  return key == LogicalKeyboardKey.enter ||
      key == LogicalKeyboardKey.numpadEnter;
}

bool composerEnterSends({
  required bool isNativeMobileOs,
  required bool physicalKeyboardConnected,
}) {
  if (isNativeMobileOs) {
    return physicalKeyboardConnected;
  }
  return true;
}
