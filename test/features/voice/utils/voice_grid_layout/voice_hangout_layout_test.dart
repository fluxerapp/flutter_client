import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_participant_layouts.dart';
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

  group('voiceHangoutTileRects', () {
    test('returns one centered 16:9 rect for a single tile', () {
      final List<Rect> rects = voiceHangoutTileRects(
        tileCount: 1,
        width: 390,
        height: 700,
        landscape: false,
      );
      expect(rects.length, 1);
      expect(rects.first.width, closeTo(390, 0.001));
      expect(rects.first.height, closeTo(390 / (16 / 9), 0.001));
      expect(rects.first.top, greaterThan(0));
      expect(rects.first.left, 0);
    });

    test('returns side-by-side rects in landscape for two tiles', () {
      final List<Rect> rects = voiceHangoutTileRects(
        tileCount: 2,
        width: 400,
        height: 200,
        landscape: true,
      );
      expect(rects.length, 2);
      expect(rects[0].left, 0);
      expect(rects[1].left, greaterThan(rects[0].right));
    });

    test('returns empty for zero tiles', () {
      expect(
        voiceHangoutTileRects(
          tileCount: 0,
          width: 400,
          height: 300,
          landscape: false,
        ),
        isEmpty,
      );
    });
  });

  group('voiceHangoutCenteredAspectRect', () {
    test('fits portrait aspect into a tall phone frame', () {
      final Rect rect = voiceHangoutCenteredAspectRect(
        width: 390,
        height: 700,
        aspectRatio: 9 / 16,
      );
      expect(rect.width, closeTo(390, 0.01));
      expect(rect.height, closeTo(390 * 16 / 9, 0.01));
      expect(rect.left, 0);
      expect(rect.top, greaterThan(0));
    });
  });
}
