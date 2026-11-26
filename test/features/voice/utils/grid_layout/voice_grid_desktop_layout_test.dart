import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_desktop_layout.dart';

void main() {
  group('resolveVoiceGridDesktopLayout', () {
    test('fills the stage with one 16:9 tile instead of a square', () {
      final VoiceGridDesktopLayout layout = resolveVoiceGridDesktopLayout(
        tileCount: 1,
        container: const Size(1200, 700),
        compact: false,
      );
      expect(layout.tileSize.width, closeTo(1176, 0.01));
      expect(
        layout.tileSize.width / layout.tileSize.height,
        closeTo(16 / 9, 0.001),
      );
      expect(layout.rects.single.center, const Offset(600, 350));
    });

    test('keeps every tile 16:9 and centers the last row', () {
      final VoiceGridDesktopLayout layout = resolveVoiceGridDesktopLayout(
        tileCount: 3,
        container: const Size(1200, 700),
        compact: false,
      );
      expect(layout.columns, 2);
      expect(layout.visibleTileCount, 3);
      for (final Rect rect in layout.rects) {
        expect(rect.width / rect.height, closeTo(16 / 9, 0.001));
      }
      expect(layout.rects.last.center.dx, closeTo(600, 0.01));
    });

    test('reports overflow once tiles would drop below the minimum', () {
      final VoiceGridDesktopLayout layout = resolveVoiceGridDesktopLayout(
        tileCount: 40,
        container: const Size(700, 400),
        compact: false,
      );
      expect(layout.visibleTileCount, lessThan(40));
      expect(layout.tileSize.width, greaterThanOrEqualTo(220));
    });

    test('compact panels always fit every tile', () {
      final VoiceGridDesktopLayout layout = resolveVoiceGridDesktopLayout(
        tileCount: 12,
        container: const Size(800, 160),
        compact: true,
      );
      expect(layout.visibleTileCount, 12);
      expect(layout.rects, hasLength(12));
    });

    test('handles empty input', () {
      expect(
        resolveVoiceGridDesktopLayout(
          tileCount: 0,
          container: const Size(800, 600),
          compact: false,
        ).rects,
        isEmpty,
      );
    });
  });
}
