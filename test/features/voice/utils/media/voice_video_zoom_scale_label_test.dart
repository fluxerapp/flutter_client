import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/voice/voice_fullscreen_video_zoom.dart';

void main() {
  group('voiceVideoZoomScaleLabel', () {
    test('formats unity scale', () {
      expect(voiceVideoZoomScaleLabel(1), '1.0');
    });

    test('rounds to one decimal', () {
      expect(voiceVideoZoomScaleLabel(1.54), '1.5');
    });

    test('clamps above max', () {
      expect(voiceVideoZoomScaleLabel(8.2), '8.0');
    });

    test('clamps below min', () {
      expect(voiceVideoZoomScaleLabel(0.5), '1.0');
    });
  });
}
