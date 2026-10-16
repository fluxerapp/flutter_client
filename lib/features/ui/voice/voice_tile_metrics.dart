import 'dart:math' as math;
import 'dart:ui' show Offset, Rect, Size;

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

Rect voiceTileContainContentRect({
  required Size containerSize,
  required double contentAspectRatio,
}) {
  if (containerSize.width <= 0 ||
      containerSize.height <= 0 ||
      contentAspectRatio <= 0) {
    return Offset.zero & containerSize;
  }
  final double containerAspect = containerSize.width / containerSize.height;
  if (contentAspectRatio > containerAspect) {
    final double height = containerSize.width / contentAspectRatio;
    final double top = (containerSize.height - height) / 2;
    return Rect.fromLTWH(0, top, containerSize.width, height);
  }
  final double width = containerSize.height * contentAspectRatio;
  final double left = (containerSize.width - width) / 2;
  return Rect.fromLTWH(left, 0, width, containerSize.height);
}
