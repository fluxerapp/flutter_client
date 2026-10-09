import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/voice_tile_metrics.dart';

void main() {
  test('shrinks the inset on small tiles', () {
    expect(voiceTileMetricsForSize(const Size(180, 100)).inset, 4);
    expect(voiceTileMetricsForSize(const Size(400, 250)).inset, 6);
    expect(voiceTileMetricsForSize(const Size(400, 300)).inset, 8);
  });
}
