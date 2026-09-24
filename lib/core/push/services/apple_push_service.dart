import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:fluxer_app/core/push/push_notification_reply.dart';
import 'package:fluxer_app/core/push/push_service.dart';

class ApplePushService implements PushService {
  const ApplePushService();
  static const MethodChannel _channel = MethodChannel('fluxer_app/apple_push');
  static bool _replyHandlerInstalled = false;
  static bool _replyReadyAnnounced = false;
  static Future<void>? _replyInstall;
  static const EventChannel _messageChannel = EventChannel(
    'fluxer_app/apple_push/messages',
  );
  static bool _shouldUseNativeChannel() {
    if (kIsWeb) {
      return false;
    }
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  @override
  Future<void> requestPermissions() async {
    if (!_shouldUseNativeChannel()) {
      return;
    }
    await requestPushNotificationPermission();
  }

  static Future<void> installReplyHandler() {
    if (!_shouldUseNativeChannel() || _replyReadyAnnounced) {
      return Future<void>.value();
    }
    return _replyInstall ??= _announceReplyHandler().whenComplete(() {
      _replyInstall = null;
    });
  }

  static Future<void> _announceReplyHandler() async {
    if (!_replyHandlerInstalled) {
      _replyHandlerInstalled = true;
      _channel.setMethodCallHandler(_onReplyCall);
    }
    for (var attempt = 0; attempt < 25; attempt++) {
      try {
        await _channel.invokeMethod<void>('replyHandlerReady');
        _replyReadyAnnounced = true;
        return;
      } on MissingPluginException {
        await Future<void>.delayed(const Duration(milliseconds: 200));
      } on PlatformException catch (error) {
        if (error.code != 'notImplemented') {
          return;
        }
        await Future<void>.delayed(const Duration(milliseconds: 200));
      }
    }
  }

  static Future<void> _onReplyCall(MethodCall call) async {
    if (call.method != 'sendNotificationReply') {
      return;
    }
    final Object? arguments = call.arguments;
    if (arguments is! Map) {
      return;
    }
    final String? text = arguments['text']?.toString();
    final Object? rawPayload = arguments['payload'];
    final Map<String, String> payload = <String, String>{};
    if (rawPayload is Map) {
      for (final MapEntry<Object?, Object?> entry in rawPayload.entries) {
        final String? value = entry.value?.toString();
        if (value == null || value.isEmpty) {
          continue;
        }
        payload[entry.key.toString()] = value;
      }
    }
    final PushReplyResult result = await sendPushNotificationReply(
      payload: payload,
      text: text,
    );
    if (result == PushReplyResult.failed) {
      await LocalPushNotifications().showReplyFailed();
    }
  }

  @override
  Future<void> initialize() async {
    if (!_shouldUseNativeChannel()) {
      return;
    }
    unawaited(installReplyHandler());
    try {
      await _channel.invokeMethod<Object?>('registerRemoteNotifications');
    } on MissingPluginException {
      return;
    } on PlatformException {
      return;
    }
  }

  @override
  Future<String?> getToken() async {
    if (!_shouldUseNativeChannel()) {
      return null;
    }
    try {
      final Object? token = await _channel.invokeMethod<Object?>(
        'getDeviceToken',
      );
      if (token is String && token.isNotEmpty) {
        return token;
      }
      return null;
    } on MissingPluginException {
      return null;
    } on PlatformException {
      return null;
    }
  }

  @override
  Stream<PushMessage> watchMessages() {
    if (!_shouldUseNativeChannel()) {
      return const Stream<PushMessage>.empty();
    }
    return _messageChannel.receiveBroadcastStream().asyncExpand(
      _mapPushMessageEvent,
    );
  }

  Stream<PushMessage> _mapPushMessageEvent(Object? event) async* {
    final Map<String, Object?>? eventMap = _castMap(event);
    if (eventMap == null) {
      return;
    }
    final Map<String, Object?>? data = _castMap(eventMap['data']);
    if (data == null) {
      return;
    }
    final Map<String, String> payload = data.map(
      (String key, Object? value) =>
          MapEntry<String, String>(key, value?.toString() ?? ''),
    );
    final Map<String, Object?>? notification = _castMap(
      eventMap['notification'],
    );
    final String? title = notification?['title']?.toString();
    final String? body = notification?['body']?.toString();
    final String id = _resolveMessageId(eventMap);
    yield PushMessage(id: id, title: title, body: body, payload: payload);
  }

  String _resolveMessageId(Map<String, Object?> eventMap) {
    final String? messageId = eventMap['messageId']?.toString();
    if (messageId != null && messageId.isNotEmpty) {
      return messageId;
    }
    return DateTime.now().microsecondsSinceEpoch.toString();
  }

  Map<String, Object?>? _castMap(Object? value) {
    if (value is Map<Object?, Object?>) {
      return value.map(
        (Object? key, Object? mapValue) =>
            MapEntry<String, Object?>(key.toString(), mapValue),
      );
    }
    return null;
  }
}
