import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

bool initialIsTouchPrimary() {
  if (kIsWeb) {
    return false;
  }
  if (Platform.isIOS || Platform.isAndroid) {
    return true;
  }
  return !WidgetsBinding.instance.mouseTracker.mouseIsConnected;
}

bool isTouchPointerKind(PointerDeviceKind kind) {
  return kind == PointerDeviceKind.touch || kind == PointerDeviceKind.stylus;
}

bool isMousePointerKind(PointerDeviceKind kind) {
  return kind == PointerDeviceKind.mouse;
}
