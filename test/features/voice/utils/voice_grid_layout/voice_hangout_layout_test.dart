import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_hangout_layout.dart';

void main() {
  group('voiceGridPaginateTiles', () {
    test('splits tiles into pages', () {
      final List<List<int>> pages = voiceGridPaginateTiles<int>(
        tiles: List<int>.generate(9, (int i) => i),
        tilesPerPage: 4,
      );
      expect(pages.length, 3);
      expect(pages[0].length, 4);
      expect(pages[2].length, 1);
    });
  });
}
