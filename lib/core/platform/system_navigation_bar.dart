import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const MethodChannel _systemInsetsChannel = MethodChannel(
  'fluxer_app/system_insets',
);

double? _cachedNavigationBarHeightPx;

// called once at startup,, switching nav mode needs app restart
Future<void> precacheSystemNavigationBarHeight() async {
  if (kIsWeb || !Platform.isAndroid || _cachedNavigationBarHeightPx != null) {
    return;
  }
  try {
    final int? heightPx = await _systemInsetsChannel.invokeMethod<int>(
      'navigationBarHeight',
    );
    _cachedNavigationBarHeightPx = (heightPx != null && heightPx > 0)
        ? heightPx.toDouble()
        : 0;
  } on PlatformException {
    _cachedNavigationBarHeightPx = 0;
  } on MissingPluginException {
    _cachedNavigationBarHeightPx = 0;
  }
}

double cachedSystemNavigationBarHeight({required double devicePixelRatio}) {
  final double? heightPx = _cachedNavigationBarHeightPx;
  if (heightPx == null || heightPx <= 0) {
    return 0;
  }
  if (!devicePixelRatio.isFinite || devicePixelRatio <= 0) {
    return 0;
  }
  return heightPx / devicePixelRatio;
}

Future<double> systemNavigationBarHeight({
  required double devicePixelRatio,
}) async {
  if (kIsWeb || !Platform.isAndroid) {
    return 0;
  }
  if (!devicePixelRatio.isFinite || devicePixelRatio <= 0) {
    return 0;
  }
  final double? cached = _cachedNavigationBarHeightPx;
  if (cached != null) {
    return cached <= 0 ? 0 : cached / devicePixelRatio;
  }
  try {
    final int? heightPx = await _systemInsetsChannel.invokeMethod<int>(
      'navigationBarHeight',
    );
    if (heightPx == null || heightPx <= 0) {
      return 0;
    }
    return heightPx / devicePixelRatio;
  } on PlatformException {
    return 0;
  } on MissingPluginException {
    return 0;
  }
}
