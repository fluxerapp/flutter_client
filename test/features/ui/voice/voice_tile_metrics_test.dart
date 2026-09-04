import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/voice_tile_metrics.dart';

void main() {
  test('collapses nameplate on small tiles', () {
    final VoiceTileMetrics small = voiceTileMetricsForSize(
      const Size(180, 100),
    );
    expect(small.hideConnectionId, isTrue);
    expect(small.hideDeviceIcon, isTrue);
    expect(small.compactNameplate, isTrue);

    final VoiceTileMetrics large = voiceTileMetricsForSize(
      const Size(400, 300),
    );
    expect(large.hideConnectionId, isFalse);
    expect(large.hideDeviceIcon, isFalse);
    expect(large.compactNameplate, isFalse);
  });
}
