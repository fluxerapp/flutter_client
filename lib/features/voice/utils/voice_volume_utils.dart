import 'dart:math' as math;

import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';

const int _unityGainPercent = 100;
const double _quietRangeExponent = 1.2;
const double kMaxVoiceTrackVolume = 3;

double inputVoiceVolumePercentToGain(int value) {
  return clampVoiceVolumePercent(value) / _unityGainPercent;
}

double boostedVoiceVolumePercentToTrackVolume(int value) {
  final int clamped = clampVoiceVolumePercent(value);
  if (clamped == 0) {
    return 0;
  }
  if (clamped <= _unityGainPercent) {
    return math
        .pow(
          10,
          ((clamped - _unityGainPercent) / _unityGainPercent) *
              _quietRangeExponent,
        )
        .toDouble();
  }
  return math
      .pow(
        2,
        (clamped - _unityGainPercent) /
            (kMaxVoiceVolumePercent - _unityGainPercent),
      )
      .toDouble();
}

int composeVoiceVolumePercent(Iterable<int> volumeParts) {
  var composed = 100.0;
  for (final int part in volumeParts) {
    composed *= clampVoiceVolumePercent(part) / _unityGainPercent;
  }
  return clampVoiceVolumePercent(composed.round());
}

double composedBoostedVoiceTrackVolume(Iterable<int> volumeParts) {
  return clampVoiceTrackVolume(
    boostedVoiceVolumePercentToTrackVolume(
      composeVoiceVolumePercent(volumeParts),
    ),
  );
}

double clampVoiceTrackVolume(double volume) {
  if (!volume.isFinite || volume <= 0) {
    return 0;
  }
  if (volume >= kMaxVoiceTrackVolume) {
    return kMaxVoiceTrackVolume;
  }
  return volume;
}
