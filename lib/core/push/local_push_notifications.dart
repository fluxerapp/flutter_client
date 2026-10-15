import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_app/core/badge/push_badge_count_parser.dart';
import 'package:fluxer_app/core/push/android_notification_reply_bridge.dart';
import 'package:fluxer_app/core/push/android_push_channels.dart';
import 'package:fluxer_app/core/push/android_push_conversation_history.dart';
import 'package:fluxer_app/core/push/android_push_conversation_notification.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_ids.dart'
    show
        kLocalNotificationMessageIdKey,
        pushGroupSummaryNotificationId,
        pushMessageNotificationId,
        pushNotificationCancelIds;
import 'package:fluxer_app/core/push/push_notification_media.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/push/push_notification_reply.dart';
import 'package:fluxer_app/core/push/push_notification_reply_background.dart';
import 'package:fluxer_app/core/push/push_notification_sound.dart';
import 'package:fluxer_app/core/push/push_notification_time.dart';

export 'package:fluxer_app/core/push/android_push_channels.dart'
    show androidPushChannelId;

const int _kReplyFailedNotificationId = 900001;
const String _kReplyFailedNotificationTag = 'fluxer_reply_failed';

final class LocalPushNotifications {
  factory LocalPushNotifications() => _instance;
  LocalPushNotifications._();
  static final LocalPushNotifications _instance = LocalPushNotifications._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  bool _launchDispatched = false;
  Future<bool>? _initializing;
  void Function(String? payloadJson)? _onNotificationTap;

  Future<String?> peekLaunchPayload() async {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return null;
    }
    final bool ready = await _initializePlugin();
    if (!ready) {
      return null;
    }
    return _readLaunchPayloadJson();
  }

  Future<bool> ensureInitialized({
    void Function(String? payloadJson)? onNotificationTap,
  }) async {
    if (onNotificationTap != null) {
      _onNotificationTap = onNotificationTap;
    }
    final bool ready = await _initializePlugin();
    if (!ready) {
      return false;
    }
    if (_launchDispatched || _onNotificationTap == null) {
      return true;
    }
    _launchDispatched = true;
    try {
      final String? payload = await _readLaunchPayloadJson();
      if (payload != null) {
        _onNotificationTap?.call(payload);
      }
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[LocalPushNotifications] launch payload: $e\n$st');
      }
    }
    return true;
  }

  Future<bool> _initializePlugin() {
    if (_initialized) {
      return Future<bool>.value(true);
    }
    final Future<bool>? inFlight = _initializing;
    if (inFlight != null) {
      return inFlight;
    }
    final Future<bool> run = _initializePluginOnce();
    _initializing = run;
    return run.whenComplete(() {
      if (identical(_initializing, run)) {
        _initializing = null;
      }
    });
  }

  Future<bool> _initializePluginOnce() async {
    try {
      const DarwinInitializationSettings darwin = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );
      final InitializationSettings settings = InitializationSettings(
        android: defaultTargetPlatform == TargetPlatform.android
            ? const AndroidInitializationSettings(kAndroidPushNotificationIcon)
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
        kAndroidPushMessageChannelId,
        kAndroidPushMessageChannelName,
        description: kAndroidPushChannelDescription,
        importance: Importance.high,
        sound: kPushNotificationMessageAndroidSound,
      ),
    );
    await android.createNotificationChannel(
      const AndroidNotificationChannel(
        kAndroidPushDirectMessageChannelId,
        kAndroidPushDirectMessageChannelName,
        description: kAndroidPushChannelDescription,
        importance: Importance.high,
        sound: kPushNotificationDirectMessageAndroidSound,
      ),
    );
    await android.createNotificationChannel(
      const AndroidNotificationChannel(
        kAndroidPushForumThreadCreatedChannelId,
        kAndroidPushForumThreadCreatedChannelName,
        description: kAndroidPushChannelDescription,
        importance: Importance.high,
        sound: kPushNotificationMessageAndroidSound,
      ),
    );
  }

  void _onNotificationResponse(NotificationResponse response) {
    if (response.actionId == kPushReplyActionId) {
      return;
    }
    _onNotificationTap?.call(response.payload);
  }

  Future<void> _attachAndroidReply({
    required int id,
    required String? tag,
    required Map<String, String> payload,
  }) async {
    final AndroidNotificationReplyTarget? target =
        androidNotificationReplyTarget(payload);
    if (target == null) {
      return;
    }
    await attachAndroidNotificationReply(
      id: id,
      tag: tag,
      channelId: target.channelId,
      messageId: target.messageId,
      userId: target.userId,
      title: pushReplyActionTitle(),
      hint: pushReplyHint(),
    );
  }

  Future<void> showReplyFailed() async {
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        return;
      }
    }
    try {
      await _plugin.show(
        id: _kReplyFailedNotificationId,
        title: kAndroidPushMessageChannelName,
        body: pushReplyFailedBody(),
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            kAndroidPushMessageChannelId,
            kAndroidPushMessageChannelName,
            channelDescription: kAndroidPushChannelDescription,
            icon: kAndroidPushNotificationIcon,
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

  Future<String?> _readLaunchPayloadJson() async {
    final NotificationAppLaunchDetails? details = await _plugin
        .getNotificationAppLaunchDetails();
    final NotificationResponse? response = details?.notificationResponse;
    if (details == null ||
        !details.didNotificationLaunchApp ||
        response == null ||
        response.actionId == kPushReplyActionId) {
      return null;
    }
    final String? payload = response.payload;
    if (payload == null || payload.isEmpty) {
      return null;
    }
    return payload;
  }

  Future<void> showPushMessage(PushMessage message) async {
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        if (kDebugMode) {
          debugPrint('[LocalPushNotifications] show skipped: not initialized');
        }
        return;
      }
    }
    final String title = message.title ?? kAndroidPushMessageChannelName;
    final String body = (message.body != null && message.body!.isNotEmpty)
        ? message.body!
        : 'New message';
    final Map<String, String> enrichedPayload = enrichPushPayload(
      message.payload,
    );
    if (defaultTargetPlatform == TargetPlatform.android) {
      await _showAndroidConversationPush(
        messageId: message.id,
        title: title,
        body: body,
        payload: enrichedPayload,
        alert: true,
      );
      return;
    }
    final int id = pushMessageNotificationId(message.id);
    final int? badgeCount = parsePushBadgeCount(message.payload);
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
    }
  }

  Future<void> _showAndroidConversationPush({
    required String messageId,
    required String title,
    required String body,
    required Map<String, String> payload,
    required bool alert,
  }) async {
    final String? conversationTag = resolvePushGroupTag(payload);
    if (conversationTag == null || conversationTag.isEmpty) {
      return;
    }
    final int? badgeCount = parsePushBadgeCount(payload);
    final int? whenMillis = resolvePushNotificationWhenMillis(
      Map<String, String>.from(payload)
        ..[kLocalNotificationMessageIdKey] = messageId,
    );
    final List<String?> media = await Future.wait<String?>(<Future<String?>>[
      _downloadOptional(
        pushAuthorAvatarUrl(payload),
        maxEdge: kPushAvatarMaxEdge,
      ),
      _downloadOptional(pushAttachmentImageUrl(payload)),
    ]);
    final String senderName = resolvePushSenderName(title);
    final PushConversationLine line = PushConversationLine(
      messageId: messageId,
      senderName: senderName,
      senderKey: resolvePushSenderKey(payload, senderName: senderName),
      body: body,
      timestampMs: whenMillis ?? DateTime.now().millisecondsSinceEpoch,
      avatarPath: media[0],
      imagePath: media[1],
    );
    final PushConversationState state =
        await AndroidPushConversationHistoryStore.appendLine(
          conversationTag: conversationTag,
          line: line,
          payload: payload,
        );
    await _publishAndroidConversationNotification(
      conversationTag: conversationTag,
      payload: state.payload,
      lines: state.lines,
      title: title,
      badgeCount: badgeCount,
      whenMillis: whenMillis,
      alert: alert,
    );
  }

  Future<void> _publishAndroidConversationNotification({
    required String conversationTag,
    required Map<String, String> payload,
    required List<PushConversationLine> lines,
    required bool alert,
    String? title,
    int? badgeCount,
    int? whenMillis,
  }) async {
    if (lines.isEmpty) {
      return;
    }
    final List<PushConversationLine> shownLines =
        pushConversationLinesWithExistingMedia(lines);
    final PushConversationLine latest = shownLines.last;
    final String displayTitle = resolvePushNotificationDisplayTitle(
      payload,
      title: title,
    );
    final int notificationId = pushGroupSummaryNotificationId(conversationTag);
    final Map<String, String> replyPayload = Map<String, String>.from(payload);
    replyPayload['message_id'] = latest.messageId;
    replyPayload[kLocalNotificationMessageIdKey] = latest.messageId;
    final String payloadJson = jsonEncode(replyPayload);
    final AndroidNotificationDetails androidDetails =
        buildAndroidConversationNotificationDetails(
          androidChannelId: androidPushChannelId(payload),
          androidChannelName: androidPushChannelName(payload),
          payload: payload,
          lines: shownLines,
          title: title,
          badgeCount: badgeCount,
          whenMillis: whenMillis,
          conversationTag: conversationTag,
          alert: alert,
        );
    final bool shown = await _showAndroidConversationNotification(
      notificationId: notificationId,
      displayTitle: displayTitle,
      body: latest.body,
      androidDetails: androidDetails,
      payloadJson: payloadJson,
    );
    if (!shown) {
      final List<PushConversationLine> plainLines =
          pushConversationLinesWithoutMedia(shownLines);
      final AndroidNotificationDetails plainDetails =
          buildAndroidConversationNotificationDetails(
            androidChannelId: androidPushChannelId(payload),
            androidChannelName: androidPushChannelName(payload),
            payload: payload,
            lines: plainLines,
            title: title,
            badgeCount: badgeCount,
            whenMillis: whenMillis,
            conversationTag: conversationTag,
            alert: alert,
          );
      final bool retryShown = await _showAndroidConversationNotification(
        notificationId: notificationId,
        displayTitle: displayTitle,
        body: latest.body,
        androidDetails: plainDetails,
        payloadJson: payloadJson,
      );
      if (!retryShown) {
        return;
      }
    }
    await _attachAndroidReply(
      id: notificationId,
      tag: conversationTag,
      payload: replyPayload,
    );
  }

  Future<void> cancelForChannel(
    String channelId, {
    String? upToMessageId,
  }) async {
    if (channelId.isEmpty) {
      return;
    }
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        return;
      }
    }
    final String channelTag = buildChannelTag(channelId);
    final int conversationId = pushGroupSummaryNotificationId(channelTag);
    if (defaultTargetPlatform == TargetPlatform.android) {
      final PushConversationState? remaining =
          await AndroidPushConversationHistoryStore.trimAck(
            conversationTag: channelTag,
            upToMessageId: upToMessageId,
          );
      if (remaining == null) {
        try {
          await _plugin.cancel(id: conversationId, tag: channelTag);
        } on Object catch (e, st) {
          if (kDebugMode) {
            debugPrint(
              '[LocalPushNotifications] cancel conversation failed: $e\n$st',
            );
          }
        }
      } else {
        await _publishAndroidConversationNotification(
          conversationTag: channelTag,
          payload: enrichPushPayload(remaining.payload),
          lines: remaining.lines,
          title: remaining.lines.last.senderName,
          alert: false,
        );
      }
    }
    await _cancelLegacyAndroidChannelMessages(
      channelId: channelId,
      channelTag: channelTag,
      conversationId: conversationId,
      upToMessageId: upToMessageId,
    );
  }

  Future<void> _cancelLegacyAndroidChannelMessages({
    required String channelId,
    required String channelTag,
    required int conversationId,
    String? upToMessageId,
  }) async {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    var unreadRemain = false;
    try {
      final List<ActiveNotification> active = await _plugin
          .getActiveNotifications();
      final List<ActiveNotification> covered = <ActiveNotification>[];
      for (final ActiveNotification notification in active) {
        if (notification.id == null) {
          continue;
        }
        if (notification.id == conversationId &&
            notification.tag == channelTag) {
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
        if (messageId == null) {
          if (notification.tag == channelTag) {
            continue;
          }
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
    if (!_initialized) {
      return;
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      await AndroidPushConversationHistoryStore.clearAll();
    }
    try {
      await _plugin.cancelAll();
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[LocalPushNotifications] cancelAll failed: $e\n$st');
      }
    }
  }

  Future<bool> _showAndroidConversationNotification({
    required int notificationId,
    required String displayTitle,
    required String body,
    required AndroidNotificationDetails androidDetails,
    required String payloadJson,
  }) async {
    try {
      await _plugin.show(
        id: notificationId,
        title: displayTitle,
        body: body,
        notificationDetails: NotificationDetails(android: androidDetails),
        payload: payloadJson,
      );
      return true;
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint(
          '[LocalPushNotifications] conversation show failed: $e\n$st',
        );
      }
      return false;
    }
  }

  Future<void> cancelForPayload(Map<String, String> payload) async {
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        return;
      }
    }
    final String? channelId = resolvePushChannelId(payload);
    if (channelId != null && channelId.isNotEmpty) {
      await cancelForChannel(channelId, upToMessageId: payload['message_id']);
      return;
    }
    final Set<String?> tags = <String?>{resolvePushDisplayTag(payload)};
    final Set<int> ids = <int>{...pushNotificationCancelIds(payload)};
    for (final int id in ids) {
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
    switch (defaultTargetPlatform) {
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
      case TargetPlatform.android:
        return const NotificationDetails();
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
