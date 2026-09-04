import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_participant_consolidation.dart';

void main() {
  group('consolidateVoiceGridTiles', () {
    test('keeps one camera tile and reports extra devices', () {
      final List<VoiceConsolidatedTile<String>> result =
          consolidateVoiceGridTiles<String>(
            tiles: <String>['cam-a', 'cam-b', 'share'],
            userId: (String tile) => tile.startsWith('share') ? 'u2' : 'u1',
            isScreenShare: (String tile) => tile.startsWith('share'),
            expandedUserIds: const <String>{},
          );
      expect(result.length, 2);
      expect(result.first.tile, 'cam-a');
      expect(result.first.extraDeviceCount, 1);
      expect(result.last.tile, 'share');
      expect(result.last.extraDeviceCount, 0);
    });

    test('expands every camera tile when the user is expanded', () {
      final List<VoiceConsolidatedTile<String>> result =
          consolidateVoiceGridTiles<String>(
            tiles: <String>['cam-a', 'cam-b'],
            userId: (String tile) => 'u1',
            isScreenShare: (String tile) => false,
            expandedUserIds: const <String>{'u1'},
          );
      expect(result.map((VoiceConsolidatedTile<String> e) => e.tile), <String>[
        'cam-a',
        'cam-b',
      ]);
      expect(
        result.every(
          (VoiceConsolidatedTile<String> e) => e.extraDeviceCount == 0,
        ),
        isTrue,
      );
    });
  });
}
