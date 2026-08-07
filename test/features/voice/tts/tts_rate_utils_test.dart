import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/tts/tts_rate_utils.dart';

void main() {
  group('parseTtsRateInput', () {
    test('parses plain and x-prefixed numbers', () {
      expect(parseTtsRateInput('1.2'), 1.2);
      expect(parseTtsRateInput('x0.5'), 0.5);
      expect(parseTtsRateInput('X2'), 2.0);
    });

    test('clamps to supported range', () {
      expect(parseTtsRateInput('0'), 0.1);
      expect(parseTtsRateInput('9'), 2.0);
    });

    test('returns null for invalid input', () {
      expect(parseTtsRateInput(''), isNull);
      expect(parseTtsRateInput('abc'), isNull);
    });
  });

  group('nearestTtsRate', () {
    test('snaps to closest preset', () {
      expect(nearestTtsRate(1.2), 1.0);
      expect(nearestTtsRate(1.3), 1.5);
    });
  });
}
