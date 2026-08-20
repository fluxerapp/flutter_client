import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_speaking_order.dart';

void main() {
  group('voiceGridTilesForDisplay', () {
    test('preserves order when prioritizeSpeakingParticipants is false', () {
      final List<String> tiles = <String>['a', 'b', 'c'];

      expect(
        voiceGridTilesForDisplay(
          prioritizeSpeakingParticipants: false,
          tiles: tiles,
          orderBySpeaking: (List<String> input) => input.reversed.toList(),
        ),
        tiles,
      );
    });

    test('reorders tiles when prioritizeSpeakingParticipants is true', () {
      final List<String> tiles = <String>['quiet', 'speaking', 'idle'];

      expect(
        voiceGridTilesForDisplay(
          prioritizeSpeakingParticipants: true,
          tiles: tiles,
          orderBySpeaking: (List<String> input) {
            int priority(String value) {
              if (value == 'speaking') {
                return 2;
              }
              if (value == 'idle') {
                return 1;
              }
              return 0;
            }

            final List<String> ordered = List<String>.from(input)
              ..sort(
                (String left, String right) =>
                    priority(right).compareTo(priority(left)),
              );
            return ordered;
          },
        ),
        <String>['speaking', 'idle', 'quiet'],
      );
    });
  });
}
