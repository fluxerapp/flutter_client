import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/slowmode_format.dart';

void main() {
  group('formatSlowmodeCountdown', () {
    test('formats sub-minute durations as MM:SS', () {
      expect(formatSlowmodeCountdown(const Duration(seconds: 5)), '00:05');
      expect(formatSlowmodeCountdown(const Duration(seconds: 45)), '00:45');
    });

    test('formats minute durations as MM:SS', () {
      expect(formatSlowmodeCountdown(const Duration(seconds: 90)), '01:30');
      expect(formatSlowmodeCountdown(const Duration(minutes: 10)), '10:00');
    });

    test('promotes to HH:MM:SS past an hour', () {
      expect(formatSlowmodeCountdown(const Duration(hours: 1)), '01:00:00');
      expect(
        formatSlowmodeCountdown(
          const Duration(hours: 1, minutes: 1, seconds: 5),
        ),
        '01:01:05',
      );
    });

    test('rounds partial seconds up so the clock never reads early', () {
      expect(
        formatSlowmodeCountdown(const Duration(milliseconds: 4001)),
        '00:05',
      );
      expect(formatSlowmodeCountdown(const Duration(milliseconds: 1)), '00:01');
    });
  });
}
