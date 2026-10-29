import 'dart:math' as math;

import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:livekit_client/livekit_client.dart';

const List<int> kVoiceStreamResolutionHeights = <int>[
  480,
  240,
  720,
  1080,
  1440,
  2160,
];

int closestVoiceStreamResolutionHeight(int height) {
  var closest = kVoiceStreamResolutionHeights.first;
  var smallestDiff = (height - closest).abs();
  for (final int value in kVoiceStreamResolutionHeights) {
    final int diff = (height - value).abs();
    if (diff < smallestDiff) {
      closest = value;
      smallestDiff = diff;
    }
  }
  return closest;
}

String voiceStreamResolutionLabel(int height) {
  final int target = closestVoiceStreamResolutionHeight(height);
  if (target == 2160) {
    return '4K';
  }
  return '${target}p';
}

String voiceStreamQualityLabel({required int height, required int fps}) {
  final String resolution = voiceStreamResolutionLabel(height);
  if (fps <= 0) {
    return resolution;
  }
  return '$resolution $fps FPS';
}

int parsePositiveFrameRate(Object? raw) {
  if (raw is num && raw.isFinite && raw > 0) {
    return raw.round();
  }
  if (raw is String) {
    final double? parsed = double.tryParse(raw);
    if (parsed != null && parsed.isFinite && parsed > 0) {
      return parsed.round();
    }
  }
  return 0;
}

int parsePositiveInt(Object? raw) => parsePositiveFrameRate(raw);

int voiceStreamDimensionFromSettings(
  Map<String, dynamic> settings,
  String key,
) {
  return parsePositiveInt(settings[key]);
}

double? screenShareContentAspectRatio(VoiceMediaParticipant? participant) {
  if (participant == null || !participant.hasScreenShare) {
    return null;
  }
  final VideoDimensions? dimensions = participant.screenShareDimensions;
  if (dimensions != null && dimensions.width > 0 && dimensions.height > 0) {
    return dimensions.width / dimensions.height;
  }
  final VideoTrack? track = participant.screenShareTrack;
  if (track != null) {
    try {
      final Map<String, dynamic> settings = track.mediaStreamTrack
          .getSettings();
      final int width = voiceStreamDimensionFromSettings(settings, 'width');
      final int height = voiceStreamDimensionFromSettings(settings, 'height');
      if (width > 0 && height > 0) {
        return width / height;
      }
    } on Object {
      return null;
    }
  }
  return null;
}

Future<double?> screenShareContentAspectRatioResolved(
  VoiceMediaParticipant? participant,
) async {
  if (participant == null || !participant.hasScreenShare) {
    return null;
  }
  final VideoTrack? track = participant.screenShareTrack;
  if (track is RemoteVideoTrack) {
    try {
      final stats = await track.getReceiverStats();
      final int width = parsePositiveInt(stats?.frameWidth);
      final int height = parsePositiveInt(stats?.frameHeight);
      if (width > 0 && height > 0) {
        return width / height;
      }
    } on Object {
      return screenShareContentAspectRatio(participant);
    }
  } else if (track is LocalVideoTrack) {
    try {
      final stats = await track.getSenderStats();
      final ({int width, int height}) frame = voiceStreamLargestFrame(
        widths: stats.map((item) => item.frameWidth),
        heights: stats.map((item) => item.frameHeight),
      );
      if (frame.width > 0 && frame.height > 0) {
        return frame.width / frame.height;
      }
    } on Object {
      return screenShareContentAspectRatio(participant);
    }
  }
  return screenShareContentAspectRatio(participant);
}

int resolveVoiceStreamLabelHeight({
  int statsWidth = 0,
  int statsHeight = 0,
  int settingsWidth = 0,
  int settingsHeight = 0,
  int publicationWidth = 0,
  int publicationHeight = 0,
}) {
  if (statsHeight > 0) {
    return _landscapeEquivalentHeight(statsWidth, statsHeight);
  }
  if (settingsHeight > 0) {
    return _landscapeEquivalentHeight(settingsWidth, settingsHeight);
  }
  if (publicationHeight > 0) {
    return _landscapeEquivalentHeight(publicationWidth, publicationHeight);
  }
  return firstPositiveFrameRate(<int>[
    statsWidth,
    settingsWidth,
    publicationWidth,
  ]);
}

int _landscapeEquivalentHeight(int width, int height) {
  if (width <= 0 || height <= width) {
    return height;
  }
  return math.max(width, (height * 9 / 16).round());
}

({int width, int height}) voiceStreamLargestFrame({
  required Iterable<num?> widths,
  required Iterable<num?> heights,
}) {
  final List<num?> widthList = widths.toList(growable: false);
  final List<num?> heightList = heights.toList(growable: false);
  final int count = math.min(widthList.length, heightList.length);
  var bestArea = 0;
  var best = (width: 0, height: 0);
  for (int i = 0; i < count; i++) {
    final int width = parsePositiveInt(widthList[i]);
    final int height = parsePositiveInt(heightList[i]);
    if (width <= 0 || height <= 0) {
      continue;
    }
    final int area = width * height;
    if (area > bestArea) {
      bestArea = area;
      best = (width: width, height: height);
    }
  }
  return best;
}

int voiceStreamFpsFromSettings(Map<String, dynamic> settings) {
  return parsePositiveFrameRate(
    settings['frameRate'] ??
        settings['framerate'] ??
        settings['maxFrameRate'] ??
        settings['maxFramerate'],
  );
}

int firstPositiveFrameRate(Iterable<int> values) {
  for (final int value in values) {
    if (value > 0) {
      return value;
    }
  }
  return 0;
}

int maxPositiveFrameRate(Iterable<num?> values) {
  var best = 0;
  for (final num? value in values) {
    final int fps = parsePositiveFrameRate(value);
    if (fps > best) {
      best = fps;
    }
  }
  return best;
}
