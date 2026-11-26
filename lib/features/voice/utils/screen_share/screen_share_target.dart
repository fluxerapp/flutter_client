import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:livekit_client/livekit_client.dart';

const List<int> kScreenShareFrameRates = <int>[15, 30, 60, 120];

const List<ScreenshareResolution> kScreenShareResolutionRungs =
    ScreenshareResolution.values;

const Map<ScreenshareResolution, VideoDimensions> kScreenShareDimensions =
    <ScreenshareResolution, VideoDimensions>{
      ScreenshareResolution.low480p: VideoDimensions(854, 480),
      ScreenshareResolution.medium: VideoDimensions(1280, 720),
      ScreenshareResolution.high: VideoDimensions(1920, 1080),
      ScreenshareResolution.ultra: VideoDimensions(2560, 1440),
      ScreenshareResolution.source: VideoDimensions(3840, 2160),
    };

const Map<ScreenshareResolution, Map<int, int>> _kBitrateFloorKbps =
    <ScreenshareResolution, Map<int, int>>{
      ScreenshareResolution.low480p: <int, int>{
        15: 1200,
        30: 2000,
        60: 3000,
        120: 3000,
      },
      ScreenshareResolution.medium: <int, int>{
        15: 2000,
        30: 3000,
        60: 4500,
        120: 4500,
      },
      ScreenshareResolution.high: <int, int>{
        15: 3000,
        30: 4500,
        60: 6000,
        120: 6000,
      },
      ScreenshareResolution.ultra: <int, int>{
        15: 4000,
        30: 5500,
        60: 6000,
        120: 6000,
      },
      ScreenshareResolution.source: <int, int>{
        15: 4500,
        30: 6000,
        60: 6000,
        120: 6000,
      },
    };

const Map<StreamingMode, ({ScreenshareResolution resolution, int frameRate})>
kStreamingModePresets =
    <StreamingMode, ({ScreenshareResolution resolution, int frameRate})>{
      StreamingMode.gaming: (
        resolution: ScreenshareResolution.ultra,
        frameRate: 60,
      ),
      StreamingMode.screenshare: (
        resolution: ScreenshareResolution.high,
        frameRate: 30,
      ),
    };

const List<int> kScreenShareBitrateStepsBps = <int>[
  2000000,
  4000000,
  6000000,
  8000000,
  10000000,
  15000000,
  20000000,
  25000000,
  30000000,
  40000000,
  50000000,
];

const double _kBitsPerPixelPerFrame = 0.02;
const int _kMinMaintainFramerateBitrateBps = 500000;

typedef ScreenShareQuality = ({
  ScreenshareResolution resolution,
  int frameRate,
});

typedef ScreenShareQualityPatch = ({
  ScreenshareResolution? resolution,
  int? frameRate,
});

typedef ScreenShareTargetResolver =
    ScreenShareTarget Function(VideoDimensions? source);

@immutable
class ScreenShareBitrateBudget {
  const ScreenShareBitrateBudget({required this.ceilingBps, this.chosenBps});

  static const ScreenShareBitrateBudget automatic = ScreenShareBitrateBudget(
    ceilingBps: kMaxScreenShareBitrateBps,
  );

  final int ceilingBps;
  final int? chosenBps;

  @override
  bool operator ==(Object other) =>
      other is ScreenShareBitrateBudget &&
      other.ceilingBps == ceilingBps &&
      other.chosenBps == chosenBps;

  @override
  int get hashCode => Object.hash(ceilingBps, chosenBps);
}

class ScreenShareTarget {
  const ScreenShareTarget({
    required this.mode,
    required this.resolution,
    required this.frameRate,
    required this.width,
    required this.height,
    required this.rung,
    required this.maxBitrate,
    required this.degradationPreference,
    required this.tierLimited,
  });

  final StreamingMode mode;
  final ScreenshareResolution resolution;
  final int frameRate;
  final int width;
  final int height;
  final ScreenshareResolution rung;
  final int maxBitrate;
  final DegradationPreference degradationPreference;
  final bool tierLimited;

  VideoDimensions get dimensions => VideoDimensions(width, height);

  VideoParameters get videoParameters => VideoParameters(
    dimensions: dimensions,
    encoding: VideoEncoding(maxBitrate: maxBitrate, maxFramerate: frameRate),
  );
}

ScreenShareBitrateBudget screenShareBitrateBudget({
  required int ceilingBps,
  required int? chosenBps,
  required bool canChoose,
}) {
  return ScreenShareBitrateBudget(
    ceilingBps: ceilingBps,
    chosenBps: canChoose && chosenBps != null
        ? math.min(chosenBps, ceilingBps)
        : null,
  );
}

int resolveScreenShareFrameRate(int frameRate) {
  if (frameRate >= 120) {
    return 120;
  }
  if (frameRate >= 60) {
    return 60;
  }
  if (frameRate >= 30) {
    return 30;
  }
  return 15;
}

int _rungPixels(ScreenshareResolution resolution) {
  final VideoDimensions dimensions = kScreenShareDimensions[resolution]!;
  return dimensions.width * dimensions.height;
}

ScreenshareResolution screenShareRungForPixels(int pixels) {
  ScreenshareResolution rung = kScreenShareResolutionRungs.first;
  for (final ScreenshareResolution candidate in kScreenShareResolutionRungs) {
    if (_rungPixels(candidate) > pixels) {
      break;
    }
    rung = candidate;
  }
  return rung;
}

int screenShareBitrateBps({
  required int pixels,
  required ScreenshareResolution rung,
  required int frameRate,
  required ScreenShareBitrateBudget budget,
}) {
  final int? chosen = budget.chosenBps;
  if (chosen != null) {
    return math.min(chosen, budget.ceilingBps);
  }
  final int rate = resolveScreenShareFrameRate(frameRate);
  final double scale = math.max(
    1,
    budget.ceilingBps / kMaxScreenShareBitrateBps,
  );
  final double floor = _kBitrateFloorKbps[rung]![rate]! * 1000 * scale;
  final double computed = _kBitsPerPixelPerFrame * pixels * rate * scale;
  return math.min(budget.ceilingBps, math.max(floor, computed).round());
}

({int width, int height, ScreenshareResolution rung}) fitScreenShareDimensions(
  ScreenshareResolution resolution,
  VideoDimensions? source,
) {
  final VideoDimensions preset = kScreenShareDimensions[resolution]!;
  if (source == null || source.width <= 0 || source.height <= 0) {
    return (width: preset.width, height: preset.height, rung: resolution);
  }
  final int budget = _rungPixels(resolution);
  final int sourcePixels = source.width * source.height;
  if (sourcePixels <= budget) {
    return (
      width: source.width,
      height: source.height,
      rung: screenShareRungForPixels(sourcePixels),
    );
  }
  final double scale = math.sqrt(budget / sourcePixels);
  return (
    width: _floorToEven(source.width * scale),
    height: _floorToEven(source.height * scale),
    rung: resolution,
  );
}

int _floorToEven(double value) => math.max(2, (value / 2).floor() * 2);

double screenShareScaleDownBy({
  required VideoDimensions source,
  required VideoDimensions target,
}) {
  final int sourcePixels = source.width * source.height;
  final int targetPixels = target.width * target.height;
  if (sourcePixels <= 0 || targetPixels <= 0) {
    return 1;
  }
  return math.max(1, math.sqrt(sourcePixels / targetPixels));
}

ScreenshareResolution capScreenShareResolution(
  VideoQualityCaps caps,
  ScreenshareResolution resolution,
) {
  ScreenshareResolution capped = kScreenShareResolutionRungs.first;
  for (final ScreenshareResolution candidate in kScreenShareResolutionRungs) {
    if (candidate.index > resolution.index) {
      break;
    }
    if (caps.allowsScreenShareResolution(candidate)) {
      capped = candidate;
    }
  }
  return capped;
}

ScreenshareResolution maxScreenShareResolution(VideoQualityCaps caps) {
  return capScreenShareResolution(caps, ScreenshareResolution.source);
}

int capScreenShareFrameRate(VideoQualityCaps caps, int frameRate) {
  return caps.allowsFrameRate(frameRate)
      ? frameRate
      : resolveScreenShareFrameRate(caps.screenShareMaxFrameRate);
}

ScreenShareQuality resolveScreenShareQuality({
  required StreamingMode mode,
  required ScreenshareResolution storedResolution,
  required int storedFrameRate,
  required VideoQualityCaps caps,
}) {
  final ScreenShareQuality chosen =
      kStreamingModePresets[mode] ??
      (
        resolution: storedResolution,
        frameRate: resolveScreenShareFrameRate(storedFrameRate),
      );
  return (
    resolution: capScreenShareResolution(caps, chosen.resolution),
    frameRate: capScreenShareFrameRate(caps, chosen.frameRate),
  );
}

ScreenShareQuality resolveScreenShareQualityFor(
  VoiceSettingsState settings,
  VideoQualityCaps caps,
) {
  return resolveScreenShareQuality(
    mode: settings.streamingMode,
    storedResolution: settings.screenshareResolution,
    storedFrameRate: settings.videoFrameRate,
    caps: caps,
  );
}

bool isScreenShareTierLimited(
  VoiceSettingsState settings,
  VideoQualityCaps caps,
) {
  return settings.streamingMode == StreamingMode.custom &&
      (!caps.allowsScreenShareResolution(settings.screenshareResolution) ||
          !caps.allowsFrameRate(
            resolveScreenShareFrameRate(settings.videoFrameRate),
          ));
}

DegradationPreference screenShareDegradationPreference({
  required StreamingMode mode,
  required ScreenshareResolution rung,
  required int maxBitrate,
}) {
  if (rung == ScreenshareResolution.source ||
      mode == StreamingMode.screenshare ||
      maxBitrate < _kMinMaintainFramerateBitrateBps) {
    return DegradationPreference.maintainResolution;
  }
  return DegradationPreference.maintainFramerate;
}

ScreenShareTarget resolveScreenShareTarget({
  required VoiceSettingsState settings,
  required VideoQualityCaps caps,
  required ScreenShareBitrateBudget bitrate,
  VideoDimensions? source,
}) {
  final ScreenShareQuality quality = resolveScreenShareQualityFor(
    settings,
    caps,
  );
  final ({int width, int height, ScreenshareResolution rung}) fit =
      fitScreenShareDimensions(quality.resolution, source);
  final int maxBitrate = screenShareBitrateBps(
    pixels: fit.width * fit.height,
    rung: fit.rung,
    frameRate: quality.frameRate,
    budget: bitrate,
  );
  return ScreenShareTarget(
    mode: settings.streamingMode,
    resolution: quality.resolution,
    frameRate: quality.frameRate,
    width: fit.width,
    height: fit.height,
    rung: fit.rung,
    maxBitrate: maxBitrate,
    degradationPreference: screenShareDegradationPreference(
      mode: settings.streamingMode,
      rung: fit.rung,
      maxBitrate: maxBitrate,
    ),
    tierLimited: isScreenShareTierLimited(settings, caps),
  );
}

ScreenShareQualityPatch? resolveScreenShareQualityPick({
  required VoiceSettingsState settings,
  required VideoQualityCaps caps,
  ScreenshareResolution? resolution,
  int? frameRate,
}) {
  final ScreenShareQuality effective = resolveScreenShareQualityFor(
    settings,
    caps,
  );
  final ScreenShareQuality stored = resolveScreenShareQualityFor(
    settings.copyWith(streamingMode: StreamingMode.custom),
    caps,
  );
  if (resolution != null) {
    if (!caps.allowsScreenShareResolution(resolution) ||
        resolution == effective.resolution) {
      return null;
    }
    return (
      resolution: resolution,
      frameRate: stored.frameRate == effective.frameRate
          ? null
          : effective.frameRate,
    );
  }
  if (frameRate == null ||
      !caps.allowsFrameRate(frameRate) ||
      frameRate == effective.frameRate) {
    return null;
  }
  return (
    resolution: stored.resolution == effective.resolution
        ? null
        : effective.resolution,
    frameRate: frameRate,
  );
}

List<int> screenShareBitrateOptions(ScreenShareBitrateBudget budget) {
  final Set<int> offered = <int>{
    for (final int step in kScreenShareBitrateStepsBps)
      if (step < budget.ceilingBps) step,
    budget.ceilingBps,
    ?budget.chosenBps,
  };
  return offered.toList()..sort();
}
