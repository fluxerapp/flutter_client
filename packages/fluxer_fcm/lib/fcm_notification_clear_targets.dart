const String kFcmChannelTagPrefix = 'channel:';

String? resolveFcmClearChannelId(Map<String, String> payload) {
  final String? channelId = _nonEmpty(payload['channel_id']);
  if (channelId != null) {
    return channelId;
  }
  return _channelIdFromTag(
    _nonEmpty(payload['notification_tag']) ?? _nonEmpty(payload['tag']),
  );
}

String? resolveFcmClearChannelTag(Map<String, String> payload) {
  final String? channelId = resolveFcmClearChannelId(payload);
  if (channelId == null) {
    return null;
  }
  return '$kFcmChannelTagPrefix$channelId';
}

String? resolveFcmClearLiteralTag(Map<String, String> payload) {
  return _nonEmpty(payload['notification_tag']) ?? _nonEmpty(payload['tag']);
}

bool fcmClearTargetMatches({
  required String channelTag,
  String? literalTag,
  String? activeTag,
  String? activeGroupKey,
}) {
  for (final String? candidate in <String?>[activeTag, activeGroupKey]) {
    final String? value = _nonEmpty(candidate);
    if (value == null) {
      continue;
    }
    if (value == channelTag || value.startsWith('$channelTag:')) {
      return true;
    }
    if (literalTag != null && value == literalTag) {
      return true;
    }
  }
  return false;
}

String? _channelIdFromTag(String? tag) {
  if (tag == null || !tag.startsWith(kFcmChannelTagPrefix)) {
    return null;
  }
  final List<String> parts = tag.split(':');
  if (parts.length < 2) {
    return null;
  }
  return _nonEmpty(parts[1]);
}

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
