import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

const String kVoiceCallKitExtraChannelId = 'channelId';
const Uuid _voiceCallKitUuid = Uuid();
const String kVoiceCallKitExtraMessageId = 'messageId';
const String kVoiceCallKitExtraConnectionId = 'connectionId';
const String kVoiceCallKitExtraIsDm = 'isDm';

enum VoiceCallKitSessionKind { incomingRing, outgoingRing, activeVoice }

typedef VoiceCallKitVoiceSnapshot = ({
  bool isInVoice,
  bool isConnected,
  bool isConnecting,
  String? channelId,
  String? activeConnectionId,
});

class VoiceCallKitSession {
  const VoiceCallKitSession({
    required this.callKitId,
    required this.channelId,
    required this.kind,
    this.messageId,
    this.connectionId,
  });

  final String callKitId;
  final String channelId;
  final VoiceCallKitSessionKind kind;
  final String? messageId;
  final String? connectionId;
}

bool shouldPresentIncomingVoiceSheet({
  required bool isNativeVoiceCallKitPlatform,
  required bool isRuntimeMobileFormFactor,
  required bool isForeground,
}) {
  if (isNativeVoiceCallKitPlatform || isRuntimeMobileFormFactor) {
    return isForeground;
  }
  return true;
}

bool shouldPresentIncomingVoiceCallKit({
  required bool isMobileCallKitPlatform,
  required bool isForeground,
  required bool hasPendingIncoming,
}) {
  if (!isMobileCallKitPlatform || isForeground || !hasPendingIncoming) {
    return false;
  }
  return true;
}

bool shouldSuppressIncomingVoiceCallKitForChannel({
  required String channelId,
  required VoiceCallKitVoiceSnapshot? activeVoice,
}) {
  if (activeVoice == null || !activeVoice.isInVoice) {
    return false;
  }
  return activeVoice.channelId == channelId;
}

bool shouldPlayIncomingVoiceRingSfx({
  required bool isNativeVoiceCallKitPlatform,
  required bool isForeground,
  required bool hasPendingIncoming,
}) {
  if (!hasPendingIncoming) {
    return false;
  }
  if (!isNativeVoiceCallKitPlatform) {
    return true;
  }
  return isForeground;
}

bool shouldMaintainBackgroundVoiceCallKit({
  required bool isMobileCallKitPlatform,
  required bool isForeground,
  required bool isInVoice,
}) {
  if (!isMobileCallKitPlatform || isForeground || !isInVoice) {
    return false;
  }
  return true;
}

bool shouldStartCallKitOnVoiceJoin({required VoiceCallKitVoiceSnapshot voice}) {
  return voice.isConnected;
}

bool shouldLeaveVoiceFromCallKitEnd({
  required VoiceCallKitVoiceSnapshot voice,
  required String channelId,
}) {
  return voice.channelId == channelId && voice.isConnected;
}

bool didJoinVoiceCall({
  required VoiceCallKitVoiceSnapshot? previous,
  required VoiceCallKitVoiceSnapshot next,
}) {
  if (!next.isInVoice || next.channelId == null || next.channelId!.isEmpty) {
    return false;
  }
  if (previous == null || !previous.isInVoice) {
    return true;
  }
  return previous.channelId != next.channelId;
}

bool shouldEndIncomingRingCallKitSession({
  required VoiceCallKitSession session,
  required Set<String> pendingIncomingChannelIds,
}) {
  if (session.kind != VoiceCallKitSessionKind.incomingRing) {
    return false;
  }
  return !pendingIncomingChannelIds.contains(session.channelId);
}

bool shouldEndCallKitSessionForActiveCallsChange({
  required VoiceCallKitSession session,
  required Set<String> activeCallChannelIds,
}) {
  if (session.kind == VoiceCallKitSessionKind.activeVoice &&
      session.messageId == null) {
    return false;
  }
  return !activeCallChannelIds.contains(session.channelId);
}

bool shouldDeferMobileCallKitStartCall({
  required bool isMobileCallKitPlatform,
  required AppLifecycleState? lifecycleState,
}) {
  if (!isMobileCallKitPlatform) {
    return false;
  }
  return lifecycleState == AppLifecycleState.paused ||
      lifecycleState == AppLifecycleState.hidden;
}

bool shouldDismissCallKitOnForeground({
  required bool isIos,
  required bool isInVoice,
}) {
  if (isIos && isInVoice) {
    return false;
  }
  return true;
}

String resolveVoiceCallKitSessionId() {
  return _voiceCallKitUuid.v4();
}

String? resolveChannelIdFromCallKitExtra(Map<String, dynamic>? extra) {
  if (extra == null) {
    return null;
  }
  final dynamic channelId = extra[kVoiceCallKitExtraChannelId];
  if (channelId is String && channelId.isNotEmpty) {
    return channelId;
  }
  return null;
}
