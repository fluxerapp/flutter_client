import 'dart:ui' show Rect, Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/voice_tile_metrics.dart';

void main() {
  test('shrinks the inset on small tiles', () {
    expect(voiceTileMetricsForSize(const Size(180, 100)).inset, 4);
    expect(voiceTileMetricsForSize(const Size(400, 250)).inset, 6);
    expect(voiceTileMetricsForSize(const Size(400, 300)).inset, 8);
  });

  test('voiceTileContainContentRect letterboxes portrait containers', () {
    final Rect rect = voiceTileContainContentRect(
      containerSize: const Size(400, 800),
      contentAspectRatio: 16 / 9,
    );
    expect(rect.width, 400);
    expect(rect.height, closeTo(225, 0.5));
    expect(rect.top, closeTo(287.5, 0.5));
    expect(rect.left, 0);
  });
}
