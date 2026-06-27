import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:unifiedpush/unifiedpush.dart' as up;

const String kUnifiedPushDefaultTitle = 'Fluxer';

PushMessage mapUnifiedPushMessage(up.PushMessage message) {
  final String id = DateTime.now().microsecondsSinceEpoch.toString();
  if (!message.decrypted) {
    if (kDebugMode) {
      debugPrint(
        '[UnifiedPush] payload not decrypted — check VAPID on register '
        'and server mobile-device registration',
      );
    }
    return PushMessage(
      id: id,
      title: kUnifiedPushDefaultTitle,
      body: 'New notification (encrypted)',
      payload: const <String, String>{},
    );
  }
  final String raw = utf8.decode(message.content);
  final Object? decoded = _tryJsonDecode(raw);
  if (decoded is Map<String, Object?>) {
    return _mapJsonPayload(decoded, id);
  }
  return PushMessage(
    id: id,
    title: kUnifiedPushDefaultTitle,
    body: raw.isEmpty ? 'New message' : raw,
    payload: const <String, String>{},
  );
}

Object? _tryJsonDecode(String raw) {
  try {
    return jsonDecode(raw);
  } on FormatException {
    return null;
  }
}

PushMessage _mapJsonPayload(Map<String, Object?> json, String fallbackId) {
  final Map<String, Object?> data = _readObjectMap(json['data']);
  final Map<String, Object?> notification = _readObjectMap(
    json['notification'],
  );
  final Map<String, Object?> notificationData = _readObjectMap(
    notification['data'],
  );
  final String? title =
      _readString(json, 'title') ?? _readString(notification, 'title');
  final String? body =
      _readString(json, 'body') ?? _readString(notification, 'body');
  final String id =
      _readString(json, 'id') ??
      _readString(json, 'message_id') ??
      _readStringFromMap(data, 'message_id') ??
      _readStringFromMap(notificationData, 'message_id') ??
      fallbackId;
  final Map<String, String> payload = <String, String>{};
  _mergeIntoPayload(payload, json);
  _mergeIntoPayload(payload, notification);
  _mergeIntoPayload(payload, data);
  _mergeIntoPayload(payload, notificationData);
  final String? url =
      _readStringFromMap(data, 'url') ??
      _readStringFromMap(notificationData, 'url') ??
      _readString(notification, 'navigate');
  if (url != null) {
    payload['url'] = url;
  }
  return PushMessage(
    id: id,
    title: title ?? kUnifiedPushDefaultTitle,
    body: body ?? 'New message',
    payload: enrichPushPayload(payload),
  );
}

Map<String, Object?> _readObjectMap(Object? value) {
  if (value is Map<String, Object?>) {
    return value;
  }
  if (value is Map) {
    return Map<String, Object?>.from(value);
  }
  return <String, Object?>{};
}

void _mergeIntoPayload(
  Map<String, String> payload,
  Map<String, Object?> source,
) {
  for (final MapEntry<String, Object?> entry in source.entries) {
    if (entry.key == 'title' ||
        entry.key == 'body' ||
        entry.key == 'aps' ||
        entry.key == 'data') {
      continue;
    }
    final Object? value = entry.value;
    if (value == null) {
      continue;
    }
    if (value is Map || value is List) {
      payload[entry.key] = jsonEncode(value);
    } else {
      payload[entry.key] = value.toString();
    }
  }
}

String? _readString(Map<String, Object?> json, String key) {
  return _readStringFromMap(json, key);
}

String? _readStringFromMap(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is String && value.isNotEmpty) {
    return value;
  }
  return null;
}
