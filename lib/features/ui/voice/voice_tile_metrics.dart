import 'dart:math' as math;

import 'package:flutter/painting.dart';

class VoiceTileMetrics {
  const VoiceTileMetrics({required this.inset});

  final double inset;
}

VoiceTileMetrics voiceTileMetricsForSize(Size size) {
  final double shortest = math.min(size.width, size.height);
  if (shortest < 220) {
    return const VoiceTileMetrics(inset: 4);
  }
  if (shortest < 280) {
    return const VoiceTileMetrics(inset: 6);
  }
  return const VoiceTileMetrics(inset: 8);
}
