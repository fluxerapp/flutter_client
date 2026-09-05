import 'dart:math' as math;

import 'package:flutter/painting.dart';

class VoiceTileMetrics {
  const VoiceTileMetrics({
    required this.hideConnectionId,
    required this.hideDeviceIcon,
    required this.compactNameplate,
    required this.inset,
  });

  final bool hideConnectionId;
  final bool hideDeviceIcon;
  final bool compactNameplate;
  final double inset;
}

VoiceTileMetrics voiceTileMetricsForSize(Size size) {
  final double shortest = math.min(size.width, size.height);
  if (shortest < 220) {
    return const VoiceTileMetrics(
      hideConnectionId: true,
      hideDeviceIcon: true,
      compactNameplate: true,
      inset: 4,
    );
  }
  if (shortest < 280) {
    return const VoiceTileMetrics(
      hideConnectionId: true,
      hideDeviceIcon: false,
      compactNameplate: true,
      inset: 6,
    );
  }
  return const VoiceTileMetrics(
    hideConnectionId: false,
    hideDeviceIcon: false,
    compactNameplate: false,
    inset: 8,
  );
}
