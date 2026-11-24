import 'dart:io';

import 'package:app_badge_plus/app_badge_plus.dart';
import 'package:flutter/services.dart';

const MethodChannel _desktopBadgeChannel = MethodChannel(
  'fluxer_app/desktop_badge',
);
const MethodChannel _macPlatformChannel = MethodChannel(
  'fluxer_app/desktop_platform',
);
const int kAppIconBadgeUnreadDot = -1;

final class AppIconBadgeService {
  const AppIconBadgeService._();

  static bool get _usesAppBadgePlus => Platform.isIOS || Platform.isAndroid;

  static bool get _usesDesktopChannel => Platform.isWindows || Platform.isLinux;

  static Future<void> update(
    int count, {
    String? description,
    bool dark = false,
    bool linuxUnreadAsCount = false,
  }) async {
    final int badge = count < kAppIconBadgeUnreadDot ? 0 : count;
    if (Platform.isMacOS) {
      await _updateMac(badge);
      return;
    }
    if (_usesDesktopChannel) {
      final int desktopBadge = Platform.isLinux && badge < 0
          ? (linuxUnreadAsCount ? 1 : 0)
          : badge;
      await _updateDesktop(desktopBadge, description, dark);
      return;
    }
    if (!_usesAppBadgePlus) {
      return;
    }
    final int mobileBadge = badge < 0 ? 0 : badge;
    if (Platform.isAndroid) {
      final bool supported = await AppBadgePlus.isSupported();
      if (!supported) {
        return;
      }
    }
    try {
      await AppBadgePlus.updateBadge(mobileBadge);
    } on Object {
      // Launcher may reject badge updates on some devices.
    }
  }

  static Future<void> _updateMac(int badge) async {
    final String? label = switch (badge) {
      kAppIconBadgeUnreadDot => '•',
      > 0 => '$badge',
      _ => null,
    };
    try {
      await _macPlatformChannel.invokeMethod<void>(
        'setDockBadge',
        <String, Object?>{'label': label},
      );
    } on MissingPluginException {
      return;
    } on PlatformException {
      return;
    }
  }

  static Future<void> _updateDesktop(
    int badge,
    String? description,
    bool dark,
  ) async {
    try {
      await _desktopBadgeChannel.invokeMethod<void>(
        'setCount',
        <String, Object?>{
          'count': badge,
          'description': description,
          'dark': dark,
        },
      );
    } on MissingPluginException {
      return;
    } on PlatformException {
      return;
    }
  }

  static Future<void> clear() => update(0);
}
