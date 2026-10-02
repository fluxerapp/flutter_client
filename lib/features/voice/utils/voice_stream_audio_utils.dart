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

/// Screen-share mute uses enabled and gain.
/// Remote stop() leaves Android playback running.
class ScreenSharePlaybackControls {
  const ScreenSharePlaybackControls({
    required this.isActive,
    required this.start,
    required this.setEnabled,
    required this.setGain,
  });

  final bool Function() isActive;
  final Future<void> Function() start;
  final void Function({required bool enabled}) setEnabled;
  final Future<void> Function(double gain) setGain;

  Future<void> resume() async {
    if (isActive()) {
      return;
    }
    await start();
  }

  Future<void> pause() async {
    await apply(muted: true, gain: 0);
  }

  Future<void> apply({
    required bool muted,
    required double gain,
    bool flipEnabled = false,
  }) async {
    if (flipEnabled && !muted) {
      setEnabled(enabled: false);
      setEnabled(enabled: true);
    } else {
      setEnabled(enabled: !muted);
    }
    await setGain(muted ? 0 : gain);
  }
}

Future<void> resumeScreenSharePlayback(AudioTrack track) {
  return _controlsFor(track).resume();
}

Future<void> pauseScreenSharePlayback(AudioTrack track) {
  return _controlsFor(track).pause();
}

Future<void> applyScreenShareAudibleToTrack({
  required AudioTrack track,
  required bool muted,
  required int streamVolumePercent,
  required int outputVolumePercent,
  bool flipEnabled = false,
}) {
  final double gain = resolveStreamTrackVolume(
    streamVolumePercent: streamVolumePercent,
    outputVolumePercent: outputVolumePercent,
  );
  return _controlsFor(
    track,
  ).apply(muted: muted, gain: gain, flipEnabled: flipEnabled);
}

ScreenSharePlaybackControls _controlsFor(AudioTrack track) {
  return ScreenSharePlaybackControls(
    isActive: () => track.isActive,
    start: () async {
      await track.start();
    },
    setEnabled: ({required bool enabled}) {
      track.mediaStreamTrack.enabled = enabled;
    },
    setGain: (double gain) {
      return Helper.setVolume(gain, track.mediaStreamTrack);
    },
  );
}
