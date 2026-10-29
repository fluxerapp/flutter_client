import 'package:fluxer_dart/gateway.dart';

String voiceStateSyntheticStorageKey({
  required String userId,
  required String channelId,
}) {
  return '_u_${userId}_$channelId';
}

VoiceState? resolveSelfConnectionVoiceState({
  required Map<String, VoiceState> voiceStates,
  required String? activeConnectionId,
  required String? userId,
  required String? channelId,
}) {
  if (activeConnectionId != null) {
    final VoiceState? byConnectionId = voiceStates[activeConnectionId];
    if (byConnectionId != null) {
      return byConnectionId;
    }
  }
  if (userId != null && channelId != null && channelId.isNotEmpty) {
    return voiceStates[voiceStateSyntheticStorageKey(
      userId: userId,
      channelId: channelId,
    )];
  }
  return null;
}
