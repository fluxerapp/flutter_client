import 'package:fluxer_voice/fluxer_voice.dart';
import 'package:livekit_client/livekit_client.dart';

VoicePipVideoSource? voicePipVideoSourceFor(VideoTrack track) {
  final String? trackId = track.mediaStreamTrack.id;
  if (trackId == null || trackId.isEmpty) {
    return null;
  }
  return VoicePipVideoSource.webRtcTrack(trackId);
}
