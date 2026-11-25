import 'package:fluxer_dart/gateway.dart';

bool isVoiceStateMuted(VoiceState voice) =>
    voice.selfMute || voice.mute || voice.suppress;

VoiceState voiceStateWithLocalAudio(
  VoiceState voice, {
  required bool selfMute,
  required bool selfDeaf,
}) {
  if (voice.selfMute == selfMute && voice.selfDeaf == selfDeaf) {
    return voice;
  }
  return VoiceState(
    userId: voice.userId,
    channelId: voice.channelId,
    guildId: voice.guildId,
    sessionId: voice.sessionId,
    connectionId: voice.connectionId,
    selfMute: selfMute,
    selfDeaf: selfDeaf,
    selfVideo: voice.selfVideo,
    selfStream: voice.selfStream,
    mute: voice.mute,
    deaf: voice.deaf,
    suppress: voice.suppress,
    isMobile: voice.isMobile,
    e2eeCapable: voice.e2eeCapable,
  );
}
