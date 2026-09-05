import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/voice/utils/voice_volume_utils.dart';
import 'package:livekit_client/livekit_client.dart';

double resolveStreamTrackVolume({
  required int streamVolumePercent,
  required int outputVolumePercent,
}) {
  return composedBoostedVoiceTrackVolume(<int>[
    streamVolumePercent,
    outputVolumePercent,
  ]);
}

Future<void> applyStreamVolumeToTrack({
  required AudioTrack track,
  required int streamVolumePercent,
  required int outputVolumePercent,
}) async {
  final double volume = resolveStreamTrackVolume(
    streamVolumePercent: streamVolumePercent,
    outputVolumePercent: outputVolumePercent,
  );
  await Helper.setVolume(volume, track.mediaStreamTrack);
}
