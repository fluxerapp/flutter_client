import 'package:fluxer_dart/gateway.dart';

const int kVoiceP2pDefaultMaxParticipants = 2;

enum VoiceChannelMode { empty, p2p, sfu }

VoiceChannelMode voiceChannelMode(Iterable<VoiceState> states) {
  if (states.isEmpty) {
    return VoiceChannelMode.empty;
  }
  return states.every((VoiceState vs) => vs.p2p)
      ? VoiceChannelMode.p2p
      : VoiceChannelMode.sfu;
}
