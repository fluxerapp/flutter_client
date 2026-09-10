import 'dart:math' as math;

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

int resolveVoiceStreamLabelHeight({
  int statsWidth = 0,
  int statsHeight = 0,
  int settingsWidth = 0,
  int settingsHeight = 0,
  int publicationWidth = 0,
  int publicationHeight = 0,
}) {
  if (statsHeight > 0) {
    return statsHeight;
  }
  if (settingsHeight > 0) {
    return settingsHeight;
  }
  if (publicationHeight > 0) {
    return publicationHeight;
  }
  return firstPositiveFrameRate(<int>[
    statsWidth,
    settingsWidth,
    publicationWidth,
  ]);
}

int voiceStreamHeightFromLargestFrame({
  required Iterable<num?> widths,
  required Iterable<num?> heights,
}) {
  final List<num?> widthList = widths.toList(growable: false);
  final List<num?> heightList = heights.toList(growable: false);
  final int count = math.min(widthList.length, heightList.length);
  var bestArea = 0;
  var bestHeight = 0;
  for (int i = 0; i < count; i++) {
    final int width = parsePositiveInt(widthList[i]);
    final int height = parsePositiveInt(heightList[i]);
    if (width <= 0 || height <= 0) {
      continue;
    }
    final int area = width * height;
    if (area > bestArea) {
      bestArea = area;
      bestHeight = height;
    }
  }
  return bestHeight;
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
