import 'dart:convert';

import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway_client/custom_status_storage.dart'
    as gateway_custom_status;

const int kCustomStatusTextLimit = 128;

CustomStatusResponse? customStatusFromMap(Map<String, dynamic>? map) {
  if (map == null || map.isEmpty) {
    return null;
  }
  try {
    return normalizeCustomStatus(
      CustomStatusResponse.fromJson(map.cast<String, Object?>()),
    );
  } on Object {
    return null;
  }
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
    try {
      return normalizeCustomStatus(
        CustomStatusResponse.fromJson(
          jsonDecode(stored) as Map<String, Object?>,
        ),
      );
    } on Object {
      return normalizeCustomStatus(
        CustomStatusResponse(text: stored, emojiAnimated: false),
      );
    }
  }
  return normalizeCustomStatus(
    CustomStatusResponse(text: stored, emojiAnimated: false),
  );
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
