import 'dart:convert';

import 'package:fluxer_app/core/router/route_kind.dart';

const String kPushNotificationClearType = 'notification_clear';
const String kPushNotificationClearAction = 'clear_channel';

String buildChannelTag(String channelId) => 'channel:$channelId';

bool isDmPushPayload(Map<String, String> payload) {
  final String? guildId = _nonEmpty(payload['guild_id']);
  return guildId == null || guildId == '@me' || guildId == 'null';
}

bool isNotificationClearPayload(Map<String, String> payload) {
  if (_isClearValue(payload['type']) || _isClearValue(payload['action'])) {
    return true;
  }
  return false;
}

String? resolvePushChannelId(Map<String, String> payload) {
  final String? channelId = _nonEmpty(payload['channel_id']);
  if (channelId != null) {
    return channelId;
  }
  final String? tag = resolvePushNotificationTag(payload);
  if (tag != null && tag.startsWith('channel:')) {
    final List<String> parts = tag.split(':');
    if (parts.length >= 2 && parts[1].isNotEmpty) {
      return parts[1];
    }
  }
  return resolvePushChannelIdFromUrl(
    _nonEmpty(payload['url']) ?? _nonEmpty(payload['navigate']),
  );
}

String? resolvePushChannelIdFromUrl(String? rawUrl) {
  if (rawUrl == null || rawUrl.isEmpty) {
    return null;
  }
  String path = rawUrl.trim();
  if (path.startsWith('http://') || path.startsWith('https://')) {
    final Uri? uri = Uri.tryParse(path);
    if (uri == null) {
      return null;
    }
    path = uri.path;
  }
  if (!path.startsWith('/')) {
    path = '/$path';
  }
  return extractChannelId(path);
}

Map<String, String> enrichPushPayload(Map<String, String> payload) {
  final Map<String, String> enriched = Map<String, String>.from(payload);
  if (_nonEmpty(enriched['channel_id']) == null) {
    final String? channelId = resolvePushChannelId(enriched);
    if (channelId != null) {
      enriched['channel_id'] = channelId;
    }
  }
  if (_nonEmpty(enriched['notification_tag']) == null) {
    final String? channelId = _nonEmpty(enriched['channel_id']);
    if (channelId != null) {
      enriched['notification_tag'] = buildChannelTag(channelId);
    }
  }
  return enriched;
}

String? resolvePushNotificationTag(Map<String, String> payload) {
  final String? explicitTag =
      _nonEmpty(payload['tag']) ?? _nonEmpty(payload['notification_tag']);
  if (explicitTag != null) {
    return explicitTag;
  }
  final String? channelId = _nonEmpty(payload['channel_id']);
  if (channelId != null) {
    return buildChannelTag(channelId);
  }
  final String? urlChannelId = resolvePushChannelIdFromUrl(
    _nonEmpty(payload['url']) ?? _nonEmpty(payload['navigate']),
  );
  if (urlChannelId != null) {
    return buildChannelTag(urlChannelId);
  }
  return null;
}

String? resolvePushGroupTag(Map<String, String> payload) {
  final Map<String, String> enriched = enrichPushPayload(payload);
  final String? notificationTag = _nonEmpty(enriched['notification_tag']);
  if (notificationTag != null) {
    return notificationTag;
  }
  final String? channelId = _nonEmpty(enriched['channel_id']);
  if (channelId != null) {
    return buildChannelTag(channelId);
  }
  final String? messageTag = _nonEmpty(enriched['tag']);
  if (messageTag == null || !messageTag.startsWith('channel:')) {
    return messageTag;
  }
  final List<String> parts = messageTag.split(':');
  if (parts.length >= 3 && parts[1].isNotEmpty) {
    return buildChannelTag(parts[1]);
  }
  return messageTag;
}

String? resolvePushMessageTag(Map<String, String> payload) {
  return _nonEmpty(payload['tag']);
}

String? resolvePushDisplayTag(Map<String, String> payload) {
  final Map<String, String> enriched = enrichPushPayload(payload);
  return resolvePushMessageTag(enriched) ??
      resolvePushNotificationTag(enriched);
}

/// Normalizes provider-specific tap payloads into navigation fields.
Map<String, String> normalizePushTapPayload(Map<String, String> raw) {
  final Map<String, String> payload = Map<String, String>.from(raw);
  _mergeNestedDataPayload(payload);
  final String? navigate = _nonEmpty(payload['navigate']);
  if (navigate != null && _nonEmpty(payload['url']) == null) {
    payload['url'] = navigate;
  }
  payload
    ..remove('data')
    ..remove('navigate');
  return enrichPushPayload(payload);
}

void _mergeNestedDataPayload(Map<String, String> payload) {
  final String? nestedRaw = payload['data'];
  if (nestedRaw == null || nestedRaw.isEmpty) {
    return;
  }
  final Object? decoded = _tryJsonDecode(nestedRaw);
  if (decoded is! Map) {
    return;
  }
  for (final MapEntry<dynamic, dynamic> entry in decoded.entries) {
    final String key = entry.key.toString();
    if (key == 'data' || key == 'aps') {
      continue;
    }
    final Object? value = entry.value;
    if (value == null) {
      continue;
    }
    payload.putIfAbsent(key, value.toString);
  }
}

Object? _tryJsonDecode(String raw) {
  try {
    return jsonDecode(raw);
  } on FormatException {
    return null;
  }
}

bool _isClearValue(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  return value == kPushNotificationClearType ||
      value == kPushNotificationClearAction;
}

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
