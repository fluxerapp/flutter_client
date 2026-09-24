import 'package:uuid/uuid.dart';

const String kCallRingType = 'call_ring';
const String kCallRingFallbackName = 'Fluxer';
const String kCallRingFallbackHandle = 'Incoming call';
const int kCallRingMinimumDurationMs = 1000;

const String kFluxerCallRingNamespace = '8c1a0e4a-6b2d-5f7e-9a10-0b1c2d3e4f50';

const Uuid _callRingUuid = Uuid();

class CallRingDisplay {
  const CallRingDisplay({
    required this.nameCaller,
    required this.handle,
    required this.durationMs,
    this.avatar,
  });

  final String nameCaller;
  final String handle;
  final int durationMs;
  final String? avatar;
}

bool isCallRingPayload(Map<String, String> payload) {
  return payload['type'] == kCallRingType;
}

int? readCallRingEpochMs(Map<String, String> payload, String key) {
  final String? raw = payload[key];
  if (raw == null || raw.isEmpty) {
    return null;
  }
  return int.tryParse(raw);
}

int callRingDurationMs({required int? expiresAtMs, required int nowMs}) {
  if (expiresAtMs == null) {
    return kCallRingMinimumDurationMs;
  }
  final int remaining = expiresAtMs - nowMs;
  if (remaining < kCallRingMinimumDurationMs) {
    return kCallRingMinimumDurationMs;
  }
  return remaining;
}

bool callRingWindowHasClosed({required int? expiresAtMs, required int nowMs}) {
  if (expiresAtMs == null) {
    return false;
  }
  return expiresAtMs <= nowMs;
}

CallRingDisplay resolveCallRingDisplay({
  required Map<String, String> payload,
  required int nowMs,
  String? knownChannelName,
}) {
  final String? callerName = _nonEmpty(payload['caller_name']);
  final String? avatar = _nonEmpty(payload['caller_avatar_url']);
  final String name;
  if (callerName != null) {
    name = callerName;
  } else if (knownChannelName != null && knownChannelName.isNotEmpty) {
    name = knownChannelName;
  } else {
    name = kCallRingFallbackName;
  }
  return CallRingDisplay(
    nameCaller: name,
    handle: callerName ?? knownChannelName ?? kCallRingFallbackHandle,
    avatar: avatar,
    durationMs: callRingDurationMs(
      expiresAtMs: readCallRingEpochMs(payload, 'expires_at_ms'),
      nowMs: nowMs,
    ),
  );
}

String callKitIdForMessageId(String messageId) {
  return _callRingUuid.v5(kFluxerCallRingNamespace, messageId);
}

bool payloadCollidesWithCallRing({
  required Map<String, String> payload,
  required Iterable<String> activeCallMessageIds,
}) {
  if (isCallRingPayload(payload)) {
    return false;
  }
  final String? messageId = _nonEmpty(payload['message_id']);
  if (messageId == null) {
    return false;
  }
  return activeCallMessageIds.contains(messageId);
}

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
