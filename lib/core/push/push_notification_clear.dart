import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_service.dart';
import 'package:fluxer_app/core/badge/push_badge_count_parser.dart';
import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';

final class PushNotificationClear {
  PushNotificationClear._();

  static const MethodChannel _androidChannel = MethodChannel(
    'fluxer_app/android_notifications',
  );
  static const MethodChannel _appleChannel = MethodChannel(
    'fluxer_app/apple_push',
  );

  static Future<void> handleClearPayload(Map<String, String> payload) async {
    final String? channelId = resolvePushChannelId(payload);
    if (channelId == null) {
      return;
    }
    await cancelForChannel(channelId);
    final int? badgeCount = parsePushBadgeCount(payload);
    if (badgeCount != null) {
      await AppIconBadgeService.update(badgeCount);
    }
  }

  static Future<void> cancelForChannel(String channelId) async {
    if (kIsWeb || channelId.isEmpty) {
      return;
    }
    await LocalPushNotifications().cancelForChannel(channelId);
    if (Platform.isAndroid) {
      await _cancelAndroidSystemNotifications(channelId);
    }
    if (Platform.isIOS) {
      await _cancelIosDeliveredNotifications(channelId);
    }
  }

  static Future<void> clearAllDelivered() async {
    if (kIsWeb) {
      return;
    }
    await LocalPushNotifications().cancelAll();
    if (Platform.isAndroid) {
      await _cancelAllAndroidSystemNotifications();
    }
    if (Platform.isIOS) {
      await _removeAllIosDeliveredNotifications();
    }
  }

  static Future<void> _cancelAllAndroidSystemNotifications() async {
    try {
      await _androidChannel.invokeMethod<Object?>('cancelAll');
    } on MissingPluginException {
      return;
    } on PlatformException catch (e, st) {
      if (kDebugMode) {
        debugPrint('[PushNotificationClear] Android cancelAll failed: $e\n$st');
      }
    }
  }

  static Future<void> _removeAllIosDeliveredNotifications() async {
    try {
      await _appleChannel.invokeMethod<Object?>(
        'removeAllDeliveredNotifications',
      );
    } on MissingPluginException {
      return;
    } on PlatformException catch (e, st) {
      if (kDebugMode) {
        debugPrint(
          '[PushNotificationClear] iOS removeAllDelivered failed: $e\n$st',
        );
      }
    }
  }

  static Future<void> cancelForPayload(Map<String, String> payload) async {
    final String? channelId = resolvePushChannelId(payload);
    if (channelId != null) {
      await cancelForChannel(channelId);
      return;
    }
    await LocalPushNotifications().cancelForPayload(payload);
  }

  static Future<void> _cancelAndroidSystemNotifications(
    String channelId,
  ) async {
    try {
      await _androidChannel.invokeMethod<Object?>(
        'cancelForChannel',
        <String, String>{'channelId': channelId},
      );
    } on MissingPluginException {
      return;
    } on PlatformException catch (e, st) {
      if (kDebugMode) {
        debugPrint('[PushNotificationClear] Android cancel failed: $e\n$st');
      }
    }
  }

  static Future<void> _cancelIosDeliveredNotifications(String channelId) async {
    try {
      await _appleChannel.invokeMethod<Object?>(
        'removeDeliveredNotificationsForChannel',
        <String, String>{'channelId': channelId},
      );
    } on MissingPluginException {
      return;
    } on PlatformException catch (e, st) {
      if (kDebugMode) {
        debugPrint('[PushNotificationClear] iOS cancel failed: $e\n$st');
      }
    }
  }
}
