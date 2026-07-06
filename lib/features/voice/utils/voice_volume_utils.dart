import 'dart:math' as math;

import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';

const int _unityGainPercent = 100;
const double _quietRangeExponent = 1.2;

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
