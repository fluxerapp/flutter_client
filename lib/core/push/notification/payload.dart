import 'dart:convert';

import 'package:fluxer_app/core/router/route_kind.dart';

const String kPushNotificationClearType = 'notification_clear';
const String kPushNotificationClearAction = 'clear_channel';

String buildChannelTag(String channelId) => 'channel:$channelId';

bool pushMessageIsCoveredByAck(String? messageId, String? upToMessageId) {
  if (upToMessageId == null || upToMessageId.isEmpty) {
    return true;
  }
  if (messageId == null || messageId.isEmpty) {
    return false;
  }
  return _compareNumericIds(messageId, upToMessageId) <= 0;
}

bool isDmPushPayload(Map<String, String> payload) {
  final String? guildId = _nonEmpty(payload['guild_id']);
  return guildId == null || guildId == '@me' || guildId == 'null';
}

const String forumThreadCreatedNotifType = '9';

bool isForumThreadCreatedPushPayload(Map<String, String> payload) =>
    _nonEmpty(payload['notif_type_id']) == forumThreadCreatedNotifType &&
    _nonEmpty(payload['parent_id']) != null;

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

const String kPushGroupDmTitleSuffix = ' (Group DM)';
const String kPushConversationNameKey = 'conversation_name';
const String kPushConversationIconPathKey = 'conversation_icon_path';

final RegExp _guildTitlePattern = RegExp(r' \(#([^,]+), (.+)\)$');
final RegExp _threadParentPrefix = RegExp('^#[^,]+, ');

bool isPushGroupDmTitle(String? title) =>
    title != null && title.endsWith(kPushGroupDmTitleSuffix);

Map<String, String> withPushConversationIdentity(
  Map<String, String> payload, {
  String? name,
  String? iconPath,
}) {
  return <String, String>{
    for (final MapEntry<String, String> entry in payload.entries)
      if (entry.key != kPushConversationIconPathKey) entry.key: entry.value,
    kPushConversationNameKey: ?name,
    kPushConversationIconPathKey: ?iconPath,
  };
}

String? resolvePushConversationName(
  Map<String, String> payload, {
  String? title,
  String groupDmLabel = 'Group DM',
}) {
  final String? messageTitle = _nonEmpty(title) ?? _nonEmpty(payload['title']);
  if (messageTitle == null) {
    return null;
  }
  if (isPushGroupDmTitle(messageTitle)) {
    return _nonEmpty(payload[kPushConversationNameKey]) ?? groupDmLabel;
  }
  if (isDmPushPayload(enrichPushPayload(payload))) {
    return null;
  }
  final String? threadName = _nonEmpty(payload['parent_id']) == null
      ? null
      : _nonEmpty(payload['channel_name']);
  return threadName ??
      _nonEmpty(_guildTitlePattern.firstMatch(messageTitle)?.group(1));
}

String? resolvePushCommunityName(Map<String, String> payload, {String? title}) {
  final String? messageTitle = _nonEmpty(title) ?? _nonEmpty(payload['title']);
  if (messageTitle == null || isDmPushPayload(enrichPushPayload(payload))) {
    return null;
  }
  final String? community = _guildTitlePattern
      .firstMatch(messageTitle)
      ?.group(2);
  if (_nonEmpty(payload['parent_id']) == null) {
    return _nonEmpty(community);
  }
  final String? tail =
      _threadTitleTail(messageTitle, _nonEmpty(payload['channel_name'])) ??
      community;
  if (tail == null) {
    return null;
  }
  final String? parentName = _nonEmpty(payload['parent_name']);
  final String parentPrefix = '#$parentName, ';
  if (parentName != null && tail.startsWith(parentPrefix)) {
    return _nonEmpty(tail.substring(parentPrefix.length));
  }
  return _nonEmpty(tail.replaceFirst(_threadParentPrefix, ''));
}

String? _threadTitleTail(String title, String? threadName) {
  if (threadName == null || !title.endsWith(')')) {
    return null;
  }
  final String marker = ' (#$threadName, ';
  final int open = title.indexOf(marker);
  if (open < 0) {
    return null;
  }
  return title.substring(open + marker.length, title.length - 1);
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

String? targetUserIdFromPushPayloadJson(String? payloadJson) {
  if (payloadJson == null || payloadJson.isEmpty) {
    return null;
  }
  final Object? decoded = _tryJsonDecode(payloadJson);
  if (decoded is! Map) {
    return null;
  }
  final Map<String, String> payload = <String, String>{};
  for (final MapEntry<dynamic, dynamic> entry in decoded.entries) {
    final Object? value = entry.value;
    if (value == null) {
      continue;
    }
    payload[entry.key.toString()] = value.toString();
  }
  final String? userId = normalizePushTapPayload(payload)['target_user_id'];
  if (userId == null || userId.isEmpty) {
    return null;
  }
  return userId;
}

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

int _compareNumericIds(String a, String b) {
  final String left = _stripLeadingZeros(a);
  final String right = _stripLeadingZeros(b);
  if (left.length != right.length) {
    return left.length < right.length ? -1 : 1;
  }
  return left.compareTo(right);
}

String _stripLeadingZeros(String value) {
  final String stripped = value.replaceFirst(RegExp('^0+'), '');
  if (stripped.isEmpty) {
    return '0';
  }
  return stripped;
}

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
