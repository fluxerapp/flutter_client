import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_fcm/fcm_android_system_notification_cancel.dart';
import 'package:fluxer_fcm/fcm_background_notification_tap_hooks.dart';
import 'package:fluxer_fcm/fcm_background_notification_display.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';
import 'package:fluxer_fcm/fcm_push_notification_ids.dart';

const String kFcmBackgroundNotificationChannelId = 'fluxer_default_push';
const String kFcmBackgroundNotificationChannelName = 'Fluxer';
const String kFcmBackgroundNotificationChannelDescription =
    'Messages and alerts';
const String kFcmBackgroundNotificationIcon =
    '@drawable/fluxer_logo_monochrome';

const AndroidNotificationChannel kFcmBackgroundNotificationChannel =
    AndroidNotificationChannel(
      kFcmBackgroundNotificationChannelId,
      kFcmBackgroundNotificationChannelName,
      description: kFcmBackgroundNotificationChannelDescription,
      importance: Importance.high,
    );

bool _isBackgroundNotificationsReady = false;
FlutterLocalNotificationsPlugin? _backgroundPlugin;

Future<void> ensureFcmBackgroundNotificationsReady() async {
  if (_isBackgroundNotificationsReady) {
    return;
  }
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
    return;
  }
  final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings(kFcmBackgroundNotificationIcon);
  const InitializationSettings settings = InitializationSettings(
    android: androidSettings,
  );
  final bool? initialized = await plugin.initialize(
    settings: settings,
    onDidReceiveNotificationResponse: _onBackgroundNotificationResponse,
    onDidReceiveBackgroundNotificationResponse:
        _onBackgroundNotificationResponse,
  );
  if (initialized != true) {
    if (kDebugMode) {
      debugPrint('[FcmBackgroundNotifications] initialize failed');
    }
    return;
  }
  final AndroidFlutterLocalNotificationsPlugin? android = plugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();
  await android?.createNotificationChannel(kFcmBackgroundNotificationChannel);
  _backgroundPlugin = plugin;
  _isBackgroundNotificationsReady = true;
}

@pragma('vm:entry-point')
void _onBackgroundNotificationResponse(NotificationResponse response) {
  if (kDebugMode) {
    debugPrint('[FcmBackgroundNotifications] tap payload=${response.payload}');
  }
  FcmBackgroundNotificationTapHooks.handleTap(response.payload);
}

Future<void> showFcmBackgroundNotification(FcmPushMessage message) async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
    return;
  }
  await ensureFcmBackgroundNotificationsReady();
  final FlutterLocalNotificationsPlugin? plugin = _backgroundPlugin;
  if (plugin == null) {
    if (kDebugMode) {
      debugPrint('[FcmBackgroundNotifications] show skipped: not ready');
    }
    return;
  }
  final String title = resolveFcmBackgroundNotificationTitle(message);
  final String body = resolveFcmBackgroundNotificationBody(message);
  final int id = fcmPushMessageNotificationId(message.id);
  final Map<String, String> payloadWithMessageId = buildFcmBackgroundTapPayload(
    message,
  );
  final Iterable<String> messageIds = collectFcmCandidateMessageIds(
    messageId: message.id,
    payload: message.payload,
  );
  try {
    await deduplicateFcmSystemNotifications(
      plugin: plugin,
      messageIds: messageIds,
      excludeNotificationId: id,
      showLocalNotification: () async {
        await plugin.show(
          id: id,
          title: title,
          body: body,
          notificationDetails: const NotificationDetails(
            android: AndroidNotificationDetails(
              kFcmBackgroundNotificationChannelId,
              kFcmBackgroundNotificationChannelName,
              channelDescription: kFcmBackgroundNotificationChannelDescription,
              importance: Importance.high,
              priority: Priority.high,
              icon: kFcmBackgroundNotificationIcon,
            ),
          ),
          payload: jsonEncode(payloadWithMessageId),
        );
      },
    );
  } on Object catch (error, stackTrace) {
    if (kDebugMode) {
      debugPrint(
        '[FcmBackgroundNotifications] show failed: $error\n$stackTrace',
      );
    }
  }
}
