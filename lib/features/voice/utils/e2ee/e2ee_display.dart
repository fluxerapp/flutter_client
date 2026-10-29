import 'package:fluxer_app/features/voice/utils/e2ee/e2ee_status.dart';
import 'package:fluxer_dart/gateway.dart';

bool isVoiceChannelE2eeEncryptedForIcon({
  required Map<String, VoiceState> voiceStates,
  required String guildId,
  required String channelId,
  required String? connectedVoiceGuildId,
  required String? connectedVoiceChannelId,
  required bool guildHasVoiceE2ee,
}) {
  final bool isConnectedToThisChannel =
      connectedVoiceGuildId == guildId && connectedVoiceChannelId == channelId;
  if (!isConnectedToThisChannel) {
    return false;
  }
  return computeChannelE2eeStatus(
        voiceStates: voiceStates,
        guildId: guildId,
        channelId: channelId,
        guildHasVoiceE2ee: guildHasVoiceE2ee,
      ) ==
      ChannelE2eeStatus.encrypted;
}

bool isDmCallE2eeEncryptedForHeader({
  required Map<String, VoiceState> voiceStates,
  required String channelId,
  required String? connectedVoiceGuildId,
  required String? connectedVoiceChannelId,
}) {
  final bool isPrivateConnected =
      (connectedVoiceGuildId == null || connectedVoiceGuildId.isEmpty) &&
      connectedVoiceChannelId == channelId;
  if (!isPrivateConnected) {
    return false;
  }
  return computeChannelE2eeStatus(
        voiceStates: voiceStates,
        guildId: null,
        channelId: channelId,
        guildHasVoiceE2ee: true,
      ) ==
      ChannelE2eeStatus.encrypted;
}

bool hasDmOngoingCallNotJoined({
  required Map<String, VoiceState> voiceStates,
  required String channelId,
  required bool isInVoiceOnChannel,
}) {
  if (isInVoiceOnChannel) {
    return false;
  }
  for (final VoiceState vs in voiceStates.values) {
    if (vs.channelId != channelId) {
      continue;
    }
    if (vs.guildId == null || vs.guildId!.isEmpty) {
      return true;
    }
  }
  return false;
}
