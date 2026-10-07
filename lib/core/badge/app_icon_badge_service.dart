import 'dart:io';

import 'package:app_badge_plus/app_badge_plus.dart';

/// Updates the OS app-icon badge via app_badge_plus.
final class AppIconBadgeService {
  const AppIconBadgeService._();

  static bool get _isMobile => Platform.isIOS || Platform.isAndroid;

  static Future<void> update(int count) async {
    if (!_isMobile) {
      return;
    }
    final int badge = count < 0 ? 0 : count;
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

  static Future<void> clear() => update(0);
}
