import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_app/core/badge/push_badge_count_parser.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_ids.dart'
    show
        kLocalNotificationMessageIdKey,
        pushMessageNotificationId,
        pushNotificationCancelIds;
import 'package:fluxer_app/core/push/push_notification_media.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:fluxer_app/core/push/push_notification_reply.dart';
import 'package:fluxer_app/core/push/push_notification_sound.dart';
import 'package:fluxer_app/core/push/push_notification_time.dart';

const int _kReplyFailedNotificationId = 900001;
const String _kReplyFailedNotificationTag = 'fluxer_reply_failed';

@pragma('vm:entry-point')
void pushNotificationReplyBackground(NotificationResponse response) {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  if (response.actionId != kPushReplyActionId) {
    return;
  }
  unawaited(LocalPushNotifications().handleReplyResponse(response));
}

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
        onDidReceiveBackgroundNotificationResponse:
            pushNotificationReplyBackground,
      );
      _initialized = ok ?? false;
      if (!_initialized) {
        return false;
      }
      try {
        await _handleLaunchNotification();
      } on Object catch (e, st) {
        if (kDebugMode) {
          debugPrint('[LocalPushNotifications] launch payload: $e\n$st');
        }
      }
      if (defaultTargetPlatform == TargetPlatform.android) {
        try {
          await _ensureAndroidChannel();
        } on Object catch (e, st) {
          if (kDebugMode) {
            debugPrint('[LocalPushNotifications] channel: $e\n$st');
          }
        }
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
    if (response.actionId == kPushReplyActionId) {
      return;
    }
    _onNotificationTap?.call(response.payload);
  }

  Future<void> handleReplyResponse(NotificationResponse response) async {
    final PushReplyResult result = await sendPushNotificationReply(
      payload: _payloadFromResponse(response),
      text: response.input,
    );
    if (result == PushReplyResult.failed) {
      await showReplyFailed();
    }
  }

  Future<void> showReplyFailed() async {
    if (kIsWeb) {
      return;
    }
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        return;
      }
    }
    try {
      await _plugin.show(
        id: _kReplyFailedNotificationId,
        title: _channelName,
        body: pushReplyFailedBody(),
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: _channelDescription,
            icon: _androidNotificationIcon,
            playSound: false,
            enableVibration: false,
            silent: true,
            tag: _kReplyFailedNotificationTag,
          ),
          iOS: DarwinNotificationDetails(
            presentSound: false,
            presentBanner: true,
            presentList: true,
          ),
        ),
      );
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[LocalPushNotifications] reply failed notice: $e\n$st');
      }
    }
  }

  Future<void> _handleLaunchNotification() async {
    final NotificationAppLaunchDetails? details = await _plugin
        .getNotificationAppLaunchDetails();
    final NotificationResponse? response = details?.notificationResponse;
    if (details == null ||
        !details.didNotificationLaunchApp ||
        response == null ||
        response.actionId == kPushReplyActionId) {
      return;
    }
    _onNotificationTap?.call(response.payload);
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
    final NotificationDetails details = await _notificationDetailsForPlatform(
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
    if (kIsWeb || channelId.isEmpty) {
      return;
    }
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        return;
      }
    }
    final String channelTag = buildChannelTag(channelId);
    try {
      final List<ActiveNotification> active = await _plugin
          .getActiveNotifications();
      for (final ActiveNotification notification in active) {
        final int? id = notification.id;
        if (id == null) {
          continue;
        }
        final bool tagMatch = pushNotificationTagMatchesChannel(
          notification.tag,
          channelId,
        );
        final bool groupMatch = pushNotificationTagMatchesChannel(
          notification.groupKey,
          channelId,
        );
        if (!tagMatch && !groupMatch) {
          continue;
        }
        await _plugin.cancel(id: id, tag: notification.tag);
      }
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint(
          '[LocalPushNotifications] active notification scan failed: $e\n$st',
        );
      }
    }
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

  Future<NotificationDetails> _notificationDetailsForPlatform({
    int? badgeCount,
    Map<String, String> payload = const <String, String>{},
  }) async {
    final String? groupKey = resolvePushGroupTag(payload);
    final String? messageTag = resolvePushDisplayTag(payload);
    final int? whenMillis = resolvePushNotificationWhenMillis(payload);
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        final AndroidNotificationSound? androidSound =
            resolvePushNotificationAndroidSound(payload);
        final String? avatarPath = await _downloadOptional(
          pushAuthorAvatarUrl(payload),
        );
        final String? imagePath = await _downloadOptional(
          pushAttachmentImageUrl(payload),
        );
        final FilePathAndroidBitmap? largeIcon = avatarPath == null
            ? null
            : FilePathAndroidBitmap(avatarPath);
        final BigPictureStyleInformation? picture = imagePath == null
            ? null
            : BigPictureStyleInformation(
                FilePathAndroidBitmap(imagePath),
                largeIcon: largeIcon,
              );
        return NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: _channelDescription,
            importance: Importance.high,
            priority: Priority.high,
            icon: _androidNotificationIcon,
            largeIcon: largeIcon,
            styleInformation: picture,
            number: badgeCount,
            groupKey: groupKey,
            tag: messageTag,
            sound: androidSound,
            playSound: androidSound != null,
            actions: androidPushReplyActions(
              payload,
              title: pushReplyActionTitle(),
              hint: pushReplyHint(),
            ),
            when: whenMillis,
            showWhen: whenMillis != null,
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

  Map<String, String> _payloadFromResponse(NotificationResponse response) {
    final String? raw = response.payload;
    if (raw == null || raw.isEmpty) {
      return const <String, String>{};
    }
    try {
      final Object? decoded = jsonDecode(raw);
      if (decoded is! Map) {
        return const <String, String>{};
      }
      return decoded.map(
        (dynamic key, dynamic value) =>
            MapEntry<String, String>(key.toString(), value?.toString() ?? ''),
      );
    } on FormatException {
      return const <String, String>{};
    }
  }

  Future<String?> _downloadOptional(String? url) async {
    if (url == null) {
      return null;
    }
    return downloadPushNotificationImage(url);
  }
}
