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
        pushGroupSummaryNotificationId,
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
const String _kMessageChannelId = 'fluxer_messages';
const String _kDirectMessageChannelId = 'fluxer_direct_messages';
const String _kMessageChannelName = 'Messages';
const String _kDirectMessageChannelName = 'Direct messages';
const String _kChannelDescription = 'Messages and alerts';

String _androidChannelId(Map<String, String> payload) {
  if (isDmPushPayload(payload)) {
    return _kDirectMessageChannelId;
  }
  return _kMessageChannelId;
}

String _androidChannelName(Map<String, String> payload) {
  if (isDmPushPayload(payload)) {
    return _kDirectMessageChannelName;
  }
  return _kMessageChannelName;
}

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
          await _ensureAndroidChannels();
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

  Future<void> _ensureAndroidChannels() async {
    final AndroidFlutterLocalNotificationsPlugin? android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android == null) {
      return;
    }
    await android.createNotificationChannel(
      const AndroidNotificationChannel(
        _kMessageChannelId,
        _kMessageChannelName,
        description: _kChannelDescription,
        importance: Importance.high,
        sound: kPushNotificationMessageAndroidSound,
      ),
    );
    await android.createNotificationChannel(
      const AndroidNotificationChannel(
        _kDirectMessageChannelId,
        _kDirectMessageChannelName,
        description: _kChannelDescription,
        importance: Importance.high,
        sound: kPushNotificationDirectMessageAndroidSound,
      ),
    );
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
    final Map<String, String> payload = _payloadFromResponse(response);
    final Future<void> dismissed = _dismissReplyNotification(
      response.id,
      payload,
    );
    final PushReplyResult result = await sendPushNotificationReply(
      payload: payload,
      text: response.input,
    );
    await dismissed;
    if (result == PushReplyResult.failed) {
      await showReplyFailed();
    }
  }

  Future<void> _dismissReplyNotification(
    int? notificationId,
    Map<String, String> payload,
  ) async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    final PushReplyDismissal? dismissal = pushReplyDismissal(
      notificationId: notificationId,
      payload: payload,
    );
    if (dismissal == null) {
      return;
    }
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        return;
      }
    }
    try {
      await _plugin.cancel(id: dismissal.id, tag: dismissal.tag);
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[LocalPushNotifications] reply dismiss failed: $e\n$st');
      }
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
        title: _kMessageChannelName,
        body: pushReplyFailedBody(),
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            _kMessageChannelId,
            _kMessageChannelName,
            channelDescription: _kChannelDescription,
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
    final String title = message.title ?? _kMessageChannelName;
    final String body = (message.body != null && message.body!.isNotEmpty)
        ? message.body!
        : 'New message';
    final int id = pushMessageNotificationId(message.id);
    final int? badgeCount = parsePushBadgeCount(message.payload);
    final Map<String, String> enrichedPayload = enrichPushPayload(
      message.payload,
    );
    final NotificationDetails details = await _notificationDetailsForPlatform(
      title: title,
      body: body,
      badgeCount: badgeCount,
      payload: enrichedPayload,
    );
    final Map<String, String> payloadWithMessageId = Map<String, String>.from(
      enrichedPayload,
    );
    payloadWithMessageId[kLocalNotificationMessageIdKey] = message.id;
    final String payloadJson = jsonEncode(payloadWithMessageId);
    try {
      await _plugin.show(
        id: id,
        title: title,
        body: body,
        notificationDetails: details,
        payload: payloadJson,
      );
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[LocalPushNotifications] show failed: $e\n$st');
      }
      if (!_androidDetailsHaveMedia(details)) {
        return;
      }
      try {
        await _plugin.show(
          id: id,
          title: title,
          body: body,
          notificationDetails: _notificationDetailsWithoutMedia(
            title: title,
            body: body,
            badgeCount: badgeCount,
            payload: enrichedPayload,
          ),
          payload: payloadJson,
        );
      } on Object catch (retryError, retryStack) {
        if (kDebugMode) {
          debugPrint(
            '[LocalPushNotifications] show retry failed: $retryError\n$retryStack',
          );
        }
        return;
      }
    }
    await _showAndroidGroupSummary(
      title: title,
      body: body,
      payload: enrichedPayload,
      payloadJson: payloadJson,
    );
  }

  Future<void> cancelForChannel(
    String channelId, {
    String? upToMessageId,
  }) async {
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
    final int summaryId = pushGroupSummaryNotificationId(channelTag);
    var unreadRemain = false;
    try {
      final List<ActiveNotification> active = await _plugin
          .getActiveNotifications();
      final List<ActiveNotification> covered = <ActiveNotification>[];
      for (final ActiveNotification notification in active) {
        if (notification.id == null) {
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
        final String? messageId = _messageIdForActiveNotification(
          notification,
          channelId,
        );
        final bool isSummary =
            notification.id == summaryId ||
            (messageId == null && notification.tag == channelTag);
        if (isSummary) {
          continue;
        }
        if (pushMessageIsCoveredByAck(messageId, upToMessageId)) {
          covered.add(notification);
        } else {
          unreadRemain = true;
        }
      }
      for (final ActiveNotification notification in covered) {
        await _plugin.cancel(id: notification.id!, tag: notification.tag);
      }
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint(
          '[LocalPushNotifications] active notification scan failed: $e\n$st',
        );
      }
    }
    if (unreadRemain) {
      return;
    }
    final AndroidFlutterLocalNotificationsPlugin? android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android == null) {
      return;
    }
    try {
      await android.cancel(tag: channelTag, id: summaryId);
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint(
          '[LocalPushNotifications] cancel channel tag failed: $e\n$st',
        );
      }
    }
  }

  String? _messageIdForActiveNotification(
    ActiveNotification notification,
    String channelId,
  ) {
    final String? fromTag = pushMessageIdFromChannelTag(
      notification.tag,
      channelId,
    );
    if (fromTag != null) {
      return fromTag;
    }
    final String? raw = notification.payload;
    if (raw == null || raw.isEmpty) {
      return null;
    }
    try {
      final Object? decoded = jsonDecode(raw);
      if (decoded is! Map) {
        return null;
      }
      final Object? messageId = decoded['message_id'];
      if (messageId == null) {
        return null;
      }
      final String value = messageId.toString();
      if (value.isEmpty) {
        return null;
      }
      return value;
    } on FormatException {
      return null;
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
    if (kIsWeb) {
      return;
    }
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        return;
      }
    }
    final Set<String?> tags = <String?>{resolvePushDisplayTag(payload)};
    final String? channelId = resolvePushChannelId(payload);
    final String? messageId = payload['message_id'];
    if (channelId != null &&
        channelId.isNotEmpty &&
        messageId != null &&
        messageId.isNotEmpty) {
      tags.add('${buildChannelTag(channelId)}:$messageId');
    }
    for (final int id in pushNotificationCancelIds(payload)) {
      for (final String? tag in tags) {
        try {
          await _plugin.cancel(id: id, tag: tag);
        } on Object catch (e, st) {
          if (kDebugMode) {
            debugPrint(
              '[LocalPushNotifications] cancel failed id=$id: $e\n$st',
            );
          }
        }
      }
    }
  }

  Future<NotificationDetails> _notificationDetailsForPlatform({
    required String title,
    required String body,
    int? badgeCount,
    Map<String, String> payload = const <String, String>{},
  }) async {
    final String? groupKey = resolvePushGroupTag(payload);
    final String? messageTag = resolvePushDisplayTag(payload);
    final int? whenMillis = resolvePushNotificationWhenMillis(payload);
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        final List<String?> images =
            await Future.wait<String?>(<Future<String?>>[
              _downloadOptional(
                pushAuthorAvatarUrl(payload),
                maxEdge: kPushAvatarMaxEdge,
              ),
              _downloadOptional(pushAttachmentImageUrl(payload)),
            ]);
        return NotificationDetails(
          android: _androidMessageDetails(
            title: title,
            body: body,
            payload: payload,
            badgeCount: badgeCount,
            groupKey: groupKey,
            messageTag: messageTag,
            whenMillis: whenMillis,
            avatarPath: images[0],
            imagePath: images[1],
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

  NotificationDetails _notificationDetailsWithoutMedia({
    required String title,
    required String body,
    required Map<String, String> payload,
    int? badgeCount,
  }) {
    return NotificationDetails(
      android: _androidMessageDetails(
        title: title,
        body: body,
        payload: payload,
        badgeCount: badgeCount,
        groupKey: resolvePushGroupTag(payload),
        messageTag: resolvePushDisplayTag(payload),
        whenMillis: resolvePushNotificationWhenMillis(payload),
      ),
    );
  }

  AndroidNotificationDetails _androidMessageDetails({
    required String title,
    required String body,
    required Map<String, String> payload,
    required int? badgeCount,
    required String? groupKey,
    required String? messageTag,
    required int? whenMillis,
    String? avatarPath,
    String? imagePath,
  }) {
    final AndroidNotificationSound? androidSound =
        resolvePushNotificationAndroidSound(payload);
    final FilePathAndroidBitmap? largeIcon = avatarPath == null
        ? null
        : FilePathAndroidBitmap(avatarPath);
    final StyleInformation style = imagePath == null
        ? BigTextStyleInformation(body)
        : BigPictureStyleInformation(
            FilePathAndroidBitmap(imagePath),
            contentTitle: title,
            summaryText: body,
            hideExpandedLargeIcon: true,
          );
    return AndroidNotificationDetails(
      _androidChannelId(payload),
      _androidChannelName(payload),
      channelDescription: _kChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
      category: AndroidNotificationCategory.message,
      icon: _androidNotificationIcon,
      largeIcon: largeIcon,
      styleInformation: style,
      number: badgeCount,
      groupKey: groupKey,
      groupAlertBehavior: GroupAlertBehavior.children,
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
    );
  }

  bool _androidDetailsHaveMedia(NotificationDetails details) {
    final AndroidNotificationDetails? android = details.android;
    if (android == null) {
      return false;
    }
    return android.largeIcon != null ||
        android.styleInformation is BigPictureStyleInformation;
  }

  Future<void> _showAndroidGroupSummary({
    required String title,
    required String body,
    required Map<String, String> payload,
    required String payloadJson,
  }) async {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    final String? groupKey = resolvePushGroupTag(payload);
    if (groupKey == null || groupKey.isEmpty) {
      return;
    }
    final int? whenMillis = resolvePushNotificationWhenMillis(payload);
    final String summaryTitle =
        resolvePushConversationName(payload, title: title) ?? title;
    try {
      await _plugin.show(
        id: pushGroupSummaryNotificationId(groupKey),
        title: summaryTitle,
        body: body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannelId(payload),
            _androidChannelName(payload),
            channelDescription: _kChannelDescription,
            importance: Importance.high,
            priority: Priority.high,
            category: AndroidNotificationCategory.message,
            icon: _androidNotificationIcon,
            styleInformation: BigTextStyleInformation(body),
            groupKey: groupKey,
            setAsGroupSummary: true,
            groupAlertBehavior: GroupAlertBehavior.children,
            tag: groupKey,
            playSound: false,
            enableVibration: false,
            silent: true,
            when: whenMillis,
            showWhen: whenMillis != null,
          ),
        ),
        payload: payloadJson,
      );
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[LocalPushNotifications] group summary failed: $e\n$st');
      }
    }
  }

  Future<String?> _downloadOptional(String? url, {int? maxEdge}) async {
    if (url == null) {
      return null;
    }
    if (maxEdge == null) {
      return downloadPushNotificationImage(url);
    }
    return downloadPushNotificationImage(url, maxEdge: maxEdge);
  }
}
