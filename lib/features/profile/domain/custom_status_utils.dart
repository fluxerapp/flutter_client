import 'dart:convert';

import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway_client/custom_status_storage.dart'
    as gateway_custom_status;

const int kCustomStatusTextLimit = 128;

CustomStatusResponse? customStatusFromMap(Map<String, dynamic>? map) {
  if (map == null || map.isEmpty) {
    return null;
  }
  return normalizeCustomStatus(
    _customStatusFromLenientMap(map.cast<String, Object?>()),
  );
}

// Presence payloads omit emoji_animated, and a strict decode of them leaked
// the raw JSON into status text.
CustomStatusResponse _customStatusFromLenientMap(Map<String, Object?> map) {
  final Object? text = map['text'];
  final Object? emojiId = map['emoji_id'];
  final Object? emojiName = map['emoji_name'];
  final Object? expiresAt = map['expires_at'];
  return CustomStatusResponse(
    text: text is String ? text : null,
    emojiId: emojiId is String && emojiId.isNotEmpty ? emojiId : null,
    emojiName: emojiName is String && emojiName.isNotEmpty ? emojiName : null,
    expiresAt: expiresAt is String ? DateTime.tryParse(expiresAt) : null,
    emojiAnimated: map['emoji_animated'] == true,
  );
}

String? serializeCustomStatus(CustomStatusResponse? status) {
  return gateway_custom_status.serializeCustomStatusResponse(
    normalizeCustomStatus(status),
  );
}

String? serializeCustomStatusMap(Map<String, dynamic>? map) {
  return gateway_custom_status.serializeCustomStatusMap(map);
}

CustomStatusResponse? parseStoredCustomStatus(String? stored) {
  if (stored == null || stored.isEmpty) {
    return null;
  }
  if (stored.startsWith('{')) {
    final Object? decoded = _tryDecodeJson(stored);
    if (decoded is Map<String, dynamic> && _hasCustomStatusKey(decoded)) {
      return normalizeCustomStatus(
        _customStatusFromLenientMap(decoded.cast<String, Object?>()),
      );
    }
  }
  return normalizeCustomStatus(
    CustomStatusResponse(text: stored, emojiAnimated: false),
  );
}

bool _hasCustomStatusKey(Map<String, dynamic> map) {
  return map.containsKey('text') ||
      map.containsKey('emoji_id') ||
      map.containsKey('emoji_name') ||
      map.containsKey('expires_at') ||
      map.containsKey('emoji_animated');
}

Object? _tryDecodeJson(String value) {
  try {
    return jsonDecode(value);
  } on FormatException {
    return null;
  }
}

bool hasVisibleCustomStatus(String? stored) {
  return parseStoredCustomStatus(stored) != null;
}

CustomStatusResponse customStatusResponseFromPayload(
  CustomStatusPayload payload,
) {
  final dynamic expiresAt = payload.expiresAt;
  DateTime? parsedExpiresAt;
  if (expiresAt is DateTime) {
    parsedExpiresAt = expiresAt;
  } else if (expiresAt is String) {
    parsedExpiresAt = DateTime.tryParse(expiresAt);
  }
  return CustomStatusResponse(
    text: payload.text,
    emojiId: payload.emojiId,
    emojiName: payload.emojiName,
    expiresAt: parsedExpiresAt,
    emojiAnimated: false,
  );
}

CustomStatusResponse? normalizeCustomStatus(CustomStatusResponse? status) {
  if (status == null) {
    return null;
  }
  final String? text = status.text?.trim();
  final bool hasEmoji =
      status.emojiId != null ||
      (status.emojiName != null && status.emojiName!.isNotEmpty);
  if ((text == null || text.isEmpty) && !hasEmoji) {
    return null;
  }
  final DateTime? expiresAt = status.expiresAt;
  if (expiresAt != null && !expiresAt.toUtc().isAfter(DateTime.now().toUtc())) {
    return null;
  }
  return status;
}

CustomStatusPayload buildCustomStatusPayload({
  required String? text,
  required String? emojiId,
  required String? emojiName,
  required DateTime? expiresAt,
}) {
  final String? trimmedText = text?.trim();
  return CustomStatusPayload(
    text: trimmedText == null || trimmedText.isEmpty ? null : trimmedText,
    emojiId: emojiId,
    emojiName: emojiId == null ? emojiName : null,
    expiresAt: expiresAt?.toUtc().toIso8601String(),
  );
}
