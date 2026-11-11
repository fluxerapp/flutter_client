import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_app/core/badge/push_badge_count_parser.dart';
import 'package:fluxer_app/core/push/android/channels.dart';
import 'package:fluxer_app/core/push/android/conversation/history.dart';
import 'package:fluxer_app/core/push/android/conversation/identity.dart';
import 'package:fluxer_app/core/push/android/conversation/messaging_style.dart';
import 'package:fluxer_app/core/push/android/media/cache.dart';
import 'package:fluxer_app/core/push/android/media/instance_urls.dart';
import 'package:fluxer_app/core/push/android/notification_bridge.dart';
import 'package:fluxer_app/core/push/android/reply_bridge.dart';
import 'package:fluxer_app/core/push/notification/clear.dart';
import 'package:fluxer_app/core/push/notification/ids.dart'
    show
        kLocalNotificationMessageIdKey,
        pushGroupSummaryNotificationId,
        pushMessageNotificationId,
        pushNotificationCancelIds;
import 'package:fluxer_app/core/push/notification/localization.dart';
import 'package:fluxer_app/core/push/notification/payload.dart';
import 'package:fluxer_app/core/push/notification/reply.dart';
import 'package:fluxer_app/core/push/notification/reply_background.dart';
import 'package:fluxer_app/core/push/notification/sound.dart';
import 'package:fluxer_app/core/push/notification/sound_settings.dart';
import 'package:fluxer_app/core/push/notification/time.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

export 'package:fluxer_app/core/push/android/channels.dart'
    show androidPushChannelId;

const int _kReplyFailedNotificationId = 900001;
const String _kReplyFailedNotificationTag = 'fluxer_reply_failed';
const Duration _kPushMediaWait = Duration(seconds: 4);

final class LocalPushNotifications {
  factory LocalPushNotifications() => _instance;
  LocalPushNotifications._();
  static final LocalPushNotifications _instance = LocalPushNotifications._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  bool _launchDispatched = false;
  Future<bool>? _initializing;
  Future<void> _publishTail = Future<void>.value();
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
        windows: defaultTargetPlatform == TargetPlatform.windows
            ? const WindowsInitializationSettings(
                appName: 'Fluxer Oxygen',
                appUserModelId: 'com.fluxer.oxygen',
                guid: '02357f68-878d-4d1b-b915-7d7a1ac79a85',
              )
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
    await loadPushNotificationLocale();
    final FluxerLocalizations l10n = pushNotificationLocalizations();
    await android.createNotificationChannel(
      AndroidNotificationChannel(
        kAndroidPushMessageChannelId,
        l10n.notificationChannelMessages,
        description: l10n.notificationChannelDescription,
        importance: Importance.high,
        sound: kPushNotificationMessageAndroidSound,
      ),
    );
    await android.createNotificationChannel(
      AndroidNotificationChannel(
        kAndroidPushDirectMessageChannelId,
        l10n.notificationChannelDirectMessages,
        description: l10n.notificationChannelDescription,
        importance: Importance.high,
        sound: kPushNotificationDirectMessageAndroidSound,
      ),
    );
    await android.createNotificationChannel(
      AndroidNotificationChannel(
        kAndroidPushForumThreadCreatedChannelId,
        l10n.notificationChannelForumPosts,
        description: l10n.notificationChannelDescription,
        importance: Importance.high,
        sound: kPushNotificationMessageAndroidSound,
      ),
    );
    await android.createNotificationChannel(
      AndroidNotificationChannel(
        kAndroidPushSilentMessageChannelId,
        l10n.notificationChannelMessagesSilent,
        description: l10n.notificationChannelDescription,
        importance: Importance.high,
        playSound: false,
      ),
    );
    await android.createNotificationChannel(
      AndroidNotificationChannel(
        kAndroidPushSilentDirectMessageChannelId,
        l10n.notificationChannelDirectMessagesSilent,
        description: l10n.notificationChannelDescription,
        importance: Importance.high,
        playSound: false,
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
      failureTitle: pushNotificationLocalizations().notificationChannelMessages,
      failureBody: pushReplyFailedBody(),
    );
  }

  Future<void> showReplyFailed() async {
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        return;
      }
    }
    final FluxerLocalizations l10n = pushNotificationLocalizations();
    try {
      await _plugin.show(
        id: _kReplyFailedNotificationId,
        title: l10n.notificationChannelMessages,
        body: pushReplyFailedBody(),
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            kAndroidPushMessageChannelId,
            l10n.notificationChannelMessages,
            channelDescription: l10n.notificationChannelDescription,
            icon: kAndroidPushNotificationIcon,
            color: kAndroidPushAccentColor,
            playSound: false,
            enableVibration: false,
            silent: true,
            tag: _kReplyFailedNotificationTag,
          ),
          iOS: const DarwinNotificationDetails(
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
    await loadPushNotificationLocale();
    final FluxerLocalizations l10n = pushNotificationLocalizations();
    final String title = message.title ?? l10n.notificationChannelMessages;
    final String body = (message.body != null && message.body!.isNotEmpty)
        ? message.body!
        : l10n.notificationNewMessageFallback;
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
    final PushConversationContext context = await loadPushConversationContext(
      payload,
      title: title,
    );
    final PushMediaInstanceUrls mediaEndpoints = context.endpoints;
    final List<String?> media = await Future.wait<String?>(<Future<String?>>[
      _downloadOptional(
        pushAuthorAvatarUrl(payload, endpoints: mediaEndpoints),
        downloadPushNotificationAvatar,
      ),
      _downloadOptional(
        pushAttachmentImageUrl(payload, endpoints: mediaEndpoints),
        downloadPushNotificationImage,
      ),
      _downloadOptional(
        pushConversationIconDownloadUrl(
          context.identity.iconUrl,
          endpoints: mediaEndpoints,
        ),
        downloadPushNotificationAvatar,
      ),
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
    await _serializedPublish(() async {
      if (PushNotificationClear.isAckedOnAndroid(
        resolvePushChannelId(payload),
        payload['message_id'],
      )) {
        return;
      }
      final Set<String>? active = await _activeConversationTags();
      if (active != null) {
        await AndroidPushConversationHistoryStore.retainConversations(active);
      }
      final PushConversationState state =
          await AndroidPushConversationHistoryStore.appendLine(
            conversationTag: conversationTag,
            line: line,
            payload: withPushConversationIdentity(
              <String, String>{...payload, 'title': title},
              name: context.identity.name,
              iconPath: media[2],
            ),
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
    });
  }

  Future<void> _serializedPublish(Future<void> Function() action) {
    final Future<void> run = _publishTail.then((_) => action());
    _publishTail = run.then<void>((_) {}, onError: (Object _, StackTrace _) {});
    return run;
  }

  Future<Set<String>?> _activeConversationTags() async {
    final AndroidFlutterLocalNotificationsPlugin? android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android == null) {
      return null;
    }
    try {
      final List<ActiveNotification> notifications = await android
          .getActiveNotifications();
      return <String>{
        for (final ActiveNotification notification in notifications)
          ?notification.tag,
      };
    } on Object {
      return null;
    }
  }

  Future<Map<String, String>> _imageContentUris(
    List<PushConversationLine> lines,
  ) async {
    final Map<String, String> uris = <String, String>{};
    for (final PushConversationLine line in lines) {
      final String? path = line.imagePath;
      if (path == null || uris.containsKey(path)) {
        continue;
      }
      final String? uri = await androidPushImageContentUri(path);
      if (uri != null) {
        uris[path] = uri;
      }
    }
    return uris;
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
    final bool soundEnabled = await isPushNotificationSoundEnabled(payload);
    final String? storedIconPath = payload[kPushConversationIconPathKey];
    final String? conversationIconPath =
        storedIconPath != null && File(storedIconPath).existsSync()
        ? storedIconPath
        : null;
    final bool shortcutPublished = await publishAndroidConversationShortcut(
      id: conversationTag,
      label: displayTitle,
      iconPath: resolvePushGroupConversation(payload, title: title)
          ? conversationIconPath
          : latest.avatarPath,
    );
    final String? shortcutId = shortcutPublished ? conversationTag : null;
    final AndroidNotificationDetails androidDetails =
        buildAndroidConversationNotificationDetails(
          payload: payload,
          lines: shownLines,
          title: title,
          badgeCount: badgeCount,
          whenMillis: whenMillis,
          conversationTag: conversationTag,
          alert: alert,
          soundEnabled: soundEnabled,
          shortcutId: shortcutId,
          conversationIconPath: conversationIconPath,
          imageUris: await _imageContentUris(shownLines),
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
            payload: payload,
            lines: plainLines,
            title: title,
            badgeCount: badgeCount,
            whenMillis: whenMillis,
            conversationTag: conversationTag,
            alert: alert,
            soundEnabled: soundEnabled,
            shortcutId: shortcutId,
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
    if (defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    await _serializedPublish(() async {
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
        return;
      }
      final Set<String>? active = await _activeConversationTags();
      if (active != null && !active.contains(channelTag)) {
        await AndroidPushConversationHistoryStore.retainConversations(active);
        return;
      }
      await _publishAndroidConversationNotification(
        conversationTag: channelTag,
        payload: enrichPushPayload(remaining.payload),
        lines: remaining.lines,
        title: remaining.payload['title'] ?? remaining.lines.last.senderName,
        alert: false,
      );
    });
  }

  Future<void> cancelAll() async {
    if (!_initialized) {
      return;
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      await AndroidPushConversationHistoryStore.clearAll();
      await clearPushNotificationMediaCache();
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

  Future<bool> showDesktopMessage({
    required int id,
    required String title,
    required String body,
    required Map<String, String> payload,
    String? subtitle,
    String? iconPath,
  }) async {
    if (!_initialized) {
      final bool ready = await ensureInitialized();
      if (!ready) {
        return false;
      }
    }
    final NotificationDetails details = NotificationDetails(
      macOS: defaultTargetPlatform == TargetPlatform.macOS
          ? DarwinNotificationDetails(
              presentSound: false,
              subtitle: subtitle,
              threadIdentifier: payload['channel_id'],
              attachments: await _darwinAttachment(iconPath),
            )
          : null,
      linux: defaultTargetPlatform == TargetPlatform.linux
          ? LinuxNotificationDetails(
              suppressSound: true,
              category: LinuxNotificationCategory.imReceived,
              urgency: LinuxNotificationUrgency.normal,
              icon: iconPath == null ? null : FilePathLinuxIcon(iconPath),
            )
          : null,
      windows: defaultTargetPlatform == TargetPlatform.windows
          ? WindowsNotificationDetails(
              audio: WindowsNotificationAudio.silent(),
              images: <WindowsImage>[
                if (iconPath != null)
                  WindowsImage(
                    Uri.file(iconPath),
                    altText: title,
                    placement: WindowsImagePlacement.appLogoOverride,
                    crop: WindowsImageCrop.circle,
                  ),
              ],
            )
          : null,
    );
    try {
      await _plugin.show(
        id: id,
        title: title,
        body: body,
        notificationDetails: details,
        payload: jsonEncode(payload),
      );
      return true;
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[LocalPushNotifications] desktop show failed: $e\n$st');
      }
      return false;
    }
  }

  Future<List<DarwinNotificationAttachment>?> _darwinAttachment(
    String? iconPath,
  ) async {
    if (iconPath == null) {
      return null;
    }
    try {
      final Directory dir = Directory(
        '${Directory.systemTemp.path}/fluxer_notification_attachments',
      );
      await dir.create(recursive: true);
      final File copy = await File(
        iconPath,
      ).copy('${dir.path}/${DateTime.now().microsecondsSinceEpoch}.png');
      return <DarwinNotificationAttachment>[
        DarwinNotificationAttachment(copy.path),
      ];
    } on Object {
      return null;
    }
  }

  Future<void> cancelIds(Iterable<int> ids) async {
    if (!_initialized) {
      return;
    }
    for (final int id in ids) {
      try {
        await _plugin.cancel(id: id);
      } on Object catch (e, st) {
        if (kDebugMode) {
          debugPrint('[LocalPushNotifications] cancel failed id=$id: $e\n$st');
        }
      }
    }
  }

  Future<bool?> requestMacOSPermission() async {
    final bool ready = await _initializePlugin();
    if (!ready) {
      return null;
    }
    return _plugin
        .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<bool?> checkMacOSPermission() async {
    final bool ready = await _initializePlugin();
    if (!ready) {
      return null;
    }
    final NotificationsEnabledOptions? options = await _plugin
        .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin
        >()
        ?.checkPermissions();
    return options?.isEnabled;
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

  Future<String?> _downloadOptional(
    String? url,
    Future<String?> Function(String url) download,
  ) async {
    if (url == null) {
      return null;
    }
    return download(url).timeout(_kPushMediaWait, onTimeout: () => null);
  }
}
