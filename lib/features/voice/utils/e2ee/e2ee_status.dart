import 'package:fluxer_dart/gateway.dart';

enum ChannelE2eeStatus { none, encrypted, broken }

ChannelE2eeStatus computeChannelE2eeStatusFromStates({
  required List<VoiceState> connectedStates,
  ChannelE2eeStatus emptyChannelStatus = ChannelE2eeStatus.none,
}) {
  if (connectedStates.isEmpty) {
    return emptyChannelStatus;
  }
  int total = 0;
  int capable = 0;
  for (final VoiceState vs in connectedStates) {
    if (vs.channelId == null) {
      continue;
    }
    total += 1;
    if (vs.e2eeCapable ?? false) {
      capable += 1;
    }
  }
  if (total == 0) {
    return emptyChannelStatus;
  }
  if (capable == 0) {
    return ChannelE2eeStatus.none;
  }
  if (capable == total) {
    return ChannelE2eeStatus.encrypted;
  }
  return ChannelE2eeStatus.broken;
}

List<VoiceState> voiceStatesForChannel({
  required Map<String, VoiceState> voiceStates,
  required String channelId,
  String? guildId,
}) {
  return voiceStates.values.where((VoiceState vs) {
    if (vs.channelId != channelId) {
      return false;
    }
    if (guildId == null) {
      return vs.guildId == null || vs.guildId!.isEmpty;
    }
    return vs.guildId == guildId;
  }).toList();
}

ChannelE2eeStatus computeChannelE2eeStatus({
  required Map<String, VoiceState> voiceStates,
  required String? guildId,
  required String channelId,
  required bool guildHasVoiceE2ee,
  ChannelE2eeStatus emptyChannelStatus = ChannelE2eeStatus.none,
}) {
  if (guildId != null && !guildHasVoiceE2ee) {
    return ChannelE2eeStatus.none;
  }
  final List<VoiceState> connected = voiceStatesForChannel(
    voiceStates: voiceStates,
    channelId: channelId,
    guildId: guildId,
  );
  return computeChannelE2eeStatusFromStates(
    connectedStates: connected,
    emptyChannelStatus: emptyChannelStatus,
  );
}
