import 'dart:io';

import 'package:app_badge_plus/app_badge_plus.dart';
import 'package:flutter/services.dart';

const MethodChannel _desktopBadgeChannel = MethodChannel(
  'fluxer_app/desktop_badge',
);

final class AppIconBadgeService {
  const AppIconBadgeService._();

  static bool get _usesAppBadgePlus =>
      Platform.isIOS || Platform.isAndroid || Platform.isMacOS;

  static bool get _usesDesktopChannel => Platform.isWindows || Platform.isLinux;

  static Future<void> update(int count, {String? description}) async {
    final int badge = count < 0 ? 0 : count;
    if (_usesDesktopChannel) {
      await _updateDesktop(badge, description);
      return;
    }
    if (!_usesAppBadgePlus) {
      return;
    }
    if (Platform.isAndroid) {
      final bool supported = await AppBadgePlus.isSupported();
      if (!supported) {
        return;
      }
    }
    try {
      await AppBadgePlus.updateBadge(badge);
    } on Object {
      // Launcher may reject badge updates on some devices.
    }
  }

  static Future<void> _updateDesktop(int badge, String? description) async {
    try {
      await _desktopBadgeChannel.invokeMethod<void>(
        'setCount',
        <String, Object?>{'count': badge, 'description': description},
      );
    } on MissingPluginException {
      return;
    } on PlatformException {
      return;
    }
  }

  static Future<void> clear() => update(0);
}
