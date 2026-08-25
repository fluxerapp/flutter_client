import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_app/core/badge/push_badge_count_parser.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_ids.dart'
    show
        kLocalNotificationMessageIdKey,
        pushMessageNotificationId,
        pushNotificationCancelIds;
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:fluxer_app/core/push/push_notification_sound.dart';

final class LocalPushNotifications {
  factory LocalPushNotifications() => _instance;
  LocalPushNotifications._();
  static final LocalPushNotifications _instance = LocalPushNotifications._();

  static const String _channelId = 'fluxer_default_push';
  static const String _channelName = 'Fluxer';
  static const String _channelDescription = 'Messages and alerts';
  static const String _androidNotificationIcon =
      '@drawable/fluxer_logo_monochrome';

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  void Function(String? payloadJson)? _onNotificationTap;

  Future<bool> ensureInitialized({
    void Function(String? payloadJson)? onNotificationTap,
  }) async {
    if (onNotificationTap != null) {
      _onNotificationTap = onNotificationTap;
    }
    if (kIsWeb) {
      return true;
    }
    if (_initialized) {
      return true;
    }
    try {
      const DarwinInitializationSettings darwin = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );
      final InitializationSettings settings = InitializationSettings(
        android: defaultTargetPlatform == TargetPlatform.android
            ? const AndroidInitializationSettings(_androidNotificationIcon)
            : null,
        iOS: defaultTargetPlatform == TargetPlatform.iOS ? darwin : null,
        macOS: defaultTargetPlatform == TargetPlatform.macOS ? darwin : null,
        linux: defaultTargetPlatform == TargetPlatform.linux
            ? const LinuxInitializationSettings(defaultActionName: 'Open')
            : null,
      );
      final bool? ok = await _plugin.initialize(
        settings: settings,
        onDidReceiveNotificationResponse: _onNotificationResponse,
      );
      _initialized = ok ?? false;
      if (_initialized) {
        await _handleLaunchNotification();
      }
      if (defaultTargetPlatform == TargetPlatform.android) {
        await _ensureAndroidChannel();
      }
    } on Object {
      _initialized = false;
      return false;
    }
    return _initialized;
  }

  Future<void> _ensureAndroidChannel() async {
    final AndroidFlutterLocalNotificationsPlugin? android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android == null) {
      return;
    }
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
    );
    await android.createNotificationChannel(channel);
  }

  Future<void> requestDisplayPermission() async {
    await requestPushNotificationPermission();
  }

  void _onNotificationResponse(NotificationResponse response) {
    _onNotificationTap?.call(response.payload);
  }

  Future<void> _handleLaunchNotification() async {
    final NotificationAppLaunchDetails? details = await _plugin
        .getNotificationAppLaunchDetails();
    if (details == null ||
        !details.didNotificationLaunchApp ||
        details.notificationResponse == null) {
      return;
    }
    _onNotificationTap?.call(details.notificationResponse!.payload);
  }

  Future<void> showPushMessage(PushMessage message) async {
    if (kIsWeb) {
      return;
    }
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        if (kDebugMode) {
          debugPrint('[LocalPushNotifications] show skipped: not initialized');
        }
        return;
      }
    }
    final String title = message.title ?? _channelName;
    final String body = (message.body != null && message.body!.isNotEmpty)
        ? message.body!
        : 'New message';
    final int id = pushMessageNotificationId(message.id);
    final int? badgeCount = parsePushBadgeCount(message.payload);
    final Map<String, String> enrichedPayload = enrichPushPayload(
      message.payload,
    );
    final NotificationDetails details = _notificationDetailsForPlatform(
      badgeCount: badgeCount,
      payload: enrichedPayload,
    );
    final Map<String, String> payloadWithMessageId = Map<String, String>.from(
      enrichedPayload,
    );
    payloadWithMessageId[kLocalNotificationMessageIdKey] = message.id;
    try {
      await _plugin.show(
        id: id,
        title: title,
        body: body,
        notificationDetails: details,
        payload: jsonEncode(payloadWithMessageId),
      );
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[LocalPushNotifications] show failed: $e\n$st');
      }
      return;
    }
  }

  Future<void> cancelForChannel(String channelId) async {
    if (kIsWeb || !_initialized || channelId.isEmpty) {
      return;
    }
    final String channelTag = buildChannelTag(channelId);
    final AndroidFlutterLocalNotificationsPlugin? android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      try {
        await android.cancel(tag: channelTag, id: 0);
      } on Object catch (e, st) {
        if (kDebugMode) {
          debugPrint(
            '[LocalPushNotifications] cancel channel tag failed: $e\n$st',
          );
        }
      }
    }
    for (final int id in pushNotificationCancelIds(<String, String>{
      'channel_id': channelId,
      'tag': channelTag,
    })) {
      try {
        await _plugin.cancel(id: id, tag: channelTag);
      } on Object catch (e, st) {
        if (kDebugMode) {
          debugPrint(
            '[LocalPushNotifications] cancel channel id=$id failed: $e\n$st',
          );
        }
      }
    }
  }

  Future<void> cancelAll() async {
    if (kIsWeb || !_initialized) {
      return;
    }
    try {
      await _plugin.cancelAll();
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[LocalPushNotifications] cancelAll failed: $e\n$st');
      }
    }
  }

  Future<void> cancelForPayload(Map<String, String> payload) async {
    if (kIsWeb || !_initialized) {
      return;
    }
    final String? messageTag = resolvePushMessageTag(payload);
    for (final int id in pushNotificationCancelIds(payload)) {
      try {
        await _plugin.cancel(id: id, tag: messageTag);
      } on Object catch (e, st) {
        if (kDebugMode) {
          debugPrint('[LocalPushNotifications] cancel failed id=$id: $e\n$st');
        }
      }
    }
  }

  NotificationDetails _notificationDetailsForPlatform({
    int? badgeCount,
    Map<String, String> payload = const <String, String>{},
  }) {
    final String? groupKey = resolvePushGroupTag(payload);
    final String? messageTag = resolvePushDisplayTag(payload);
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        final AndroidNotificationSound? androidSound =
            resolvePushNotificationAndroidSound(payload);
        return NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: _channelDescription,
            importance: Importance.high,
            priority: Priority.high,
            icon: _androidNotificationIcon,
            number: badgeCount,
            groupKey: groupKey,
            tag: messageTag,
            sound: androidSound,
            playSound: androidSound != null,
          ),
        );
      case TargetPlatform.iOS:
        return NotificationDetails(
          iOS: DarwinNotificationDetails(
            sound: resolvePushNotificationDarwinSound(payload),
          ),
        );
      case TargetPlatform.macOS:
        return NotificationDetails(
          macOS: DarwinNotificationDetails(
            sound: resolvePushNotificationDarwinSound(payload),
          ),
        );
      case TargetPlatform.linux:
        return const NotificationDetails(
          linux: LinuxNotificationDetails(
            urgency: LinuxNotificationUrgency.normal,
          ),
        );
      case TargetPlatform.windows:
        return const NotificationDetails(windows: WindowsNotificationDetails());
      case TargetPlatform.fuchsia:
        return const NotificationDetails();
    }
  }
}
