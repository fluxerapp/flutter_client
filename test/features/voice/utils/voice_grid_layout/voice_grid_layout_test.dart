import 'dart:ui' show Rect;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_grid_layout.dart';

const double _epsilon = 0.001;

double _usedWidth(VoiceGridPackedLayoutMetrics packed) {
  final VoiceGridLayoutMetrics metrics = packed.metrics;
  return metrics.sidePadding * 2 +
      metrics.tileWidth * metrics.columns +
      metrics.gap * (metrics.columns - 1);
}

double _usedHeight(VoiceGridPackedLayoutMetrics packed) {
  final VoiceGridLayoutMetrics metrics = packed.metrics;
  final int rows = voiceGridRowCount(packed.visibleTileCount, metrics.columns);
  return metrics.verticalPadding * 2 +
      metrics.tileHeight * rows +
      metrics.gap * (rows - 1);
}

void main() {
  group('voiceGridRowCount', () {
    test('emits stable row counts for every selectable column count', () {
      expect(
        <int, int>{
          1: voiceGridRowCount(0, 1),
          2: voiceGridRowCount(0, 2),
          3: voiceGridRowCount(0, 3),
          4: voiceGridRowCount(0, 4),
        },
        <int, int>{1: 1, 2: 1, 3: 1, 4: 1},
      );
      expect(
        <int, int>{
          1: voiceGridRowCount(5, 1),
          2: voiceGridRowCount(5, 2),
          3: voiceGridRowCount(5, 3),
          4: voiceGridRowCount(5, 4),
        },
        <int, int>{1: 5, 2: 3, 3: 2, 4: 2},
      );
      expect(
        <int, int>{
          1: voiceGridRowCount(10, 1),
          2: voiceGridRowCount(10, 2),
          3: voiceGridRowCount(10, 3),
          4: voiceGridRowCount(10, 4),
        },
        <int, int>{1: 10, 2: 5, 3: 4, 4: 3},
      );
    });
  });

  group('voiceGridColumnCount', () {
    test('matches the intended column breakpoints exactly', () {
      expect(
        voiceGridColumnCount(
          tileCount: 1,
          containerWidth: 1920,
          containerHeight: 1080,
        ),
        1,
      );
      expect(
        voiceGridColumnCount(
          tileCount: 2,
          containerWidth: 519,
          containerHeight: 800,
        ),
        1,
      );
      expect(
        voiceGridColumnCount(
          tileCount: 2,
          containerWidth: 520,
          containerHeight: 260,
        ),
        2,
      );
      expect(
        voiceGridColumnCount(
          tileCount: 5,
          containerWidth: 859,
          containerHeight: 800,
        ),
        2,
      );
      expect(
        voiceGridColumnCount(
          tileCount: 5,
          containerWidth: 860,
          containerHeight: 360,
        ),
        3,
      );
      expect(
        voiceGridColumnCount(
          tileCount: 10,
          containerWidth: 1179,
          containerHeight: 800,
        ),
        3,
      );
      expect(
        voiceGridColumnCount(
          tileCount: 10,
          containerWidth: 1180,
          containerHeight: 460,
        ),
        4,
      );
    });
  });

  group('resolveVoiceGridPackedLayoutMetrics', () {
    test('stacks two portrait tiles instead of side-by-side strips', () {
      final VoiceGridPackedLayoutMetrics packed =
          resolveVoiceGridPackedLayoutMetrics(
            tileCount: 2,
            containerWidth: 390,
            containerHeight: 700,
            compact: true,
          );
      expect(packed.visibleTileCount, 2);
      expect(packed.metrics.columns, 1);
      expect(
        voiceGridRowCount(packed.visibleTileCount, packed.metrics.columns),
        2,
      );
    });

    test('limits visible tiles before they fall below the minimum size', () {
      final int capacity = resolveVoiceGridPackedLayoutMetrics(
        tileCount: 64,
        containerWidth: 800,
        containerHeight: 450,
      ).visibleTileCount;
      final VoiceGridMinTileSize minSize = voiceGridMinTileSize();
      final VoiceGridPackedLayoutMetrics packed =
          resolveVoiceGridPackedLayoutMetrics(
            tileCount: 64,
            containerWidth: 800,
            containerHeight: 450,
          );
      expect(capacity, greaterThan(0));
      expect(capacity, lessThan(64));
      expect(packed.visibleTileCount, capacity);
      expect(
        packed.metrics.tileWidth,
        greaterThanOrEqualTo(minSize.minTileWidth - _epsilon),
      );
      expect(
        packed.metrics.tileHeight,
        greaterThanOrEqualTo(minSize.minTileHeight - _epsilon),
      );

      final VoiceGridPackedLayoutMetrics wide =
          resolveVoiceGridPackedLayoutMetrics(
            tileCount: 24,
            containerWidth: 1920,
            containerHeight: 1080,
          );
      expect(wide.visibleTileCount, 24);
      expect(
        wide.metrics.columns,
        greaterThan(voiceGridColumnRules.first.columns),
      );

      expect(
        resolveVoiceGridPackedLayoutMetrics(
          tileCount: 10,
          containerWidth: voiceGridMinTileWidthPx / 2,
          containerHeight: 90,
        ).visibleTileCount,
        0,
      );
    });

    test('does not force an oversized fallback tile when none fit', () {
      final VoiceGridPackedLayoutMetrics packed =
          resolveVoiceGridPackedLayoutMetrics(
            tileCount: 8,
            containerWidth: 640,
            containerHeight: 0,
            compact: true,
          );
      expect(packed.visibleTileCount, 0);
      expect(packed.metrics.tileWidth, 0);
      expect(packed.metrics.tileHeight, 0);
    });

    test('packs compact tiles across a wide short viewport', () {
      final VoiceGridPackedLayoutMetrics packed =
          resolveVoiceGridPackedLayoutMetrics(
            tileCount: 64,
            containerWidth: 1920,
            containerHeight: 120,
            compact: true,
          );
      expect(packed.visibleTileCount, greaterThan(8));
      expect(packed.metrics.columns, packed.visibleTileCount);
      expect(
        voiceGridRowCount(packed.visibleTileCount, packed.metrics.columns),
        1,
      );
      expect(
        packed.metrics.tileWidth,
        greaterThanOrEqualTo(voiceGridCompactMinTileWidthPx - _epsilon),
      );
      expect(_usedWidth(packed), lessThanOrEqualTo(1920 + _epsilon));
      expect(_usedHeight(packed), lessThanOrEqualTo(120 + _epsilon));
    });

    test('packs compact tiles down a tall narrow viewport', () {
      final VoiceGridPackedLayoutMetrics packed =
          resolveVoiceGridPackedLayoutMetrics(
            tileCount: 64,
            containerWidth: 180,
            containerHeight: 1200,
            compact: true,
          );
      expect(packed.visibleTileCount, greaterThan(8));
      expect(packed.metrics.columns, 1);
      expect(
        voiceGridRowCount(packed.visibleTileCount, packed.metrics.columns),
        packed.visibleTileCount,
      );
      expect(
        packed.metrics.tileWidth,
        greaterThanOrEqualTo(voiceGridCompactMinTileWidthPx - _epsilon),
      );
      expect(_usedWidth(packed), lessThanOrEqualTo(180 + _epsilon));
      expect(_usedHeight(packed), lessThanOrEqualTo(1200 + _epsilon));
    });
  });

  group('resolveVoiceGridCompactLayout', () {
    test('stacks two people as squares', () {
      final VoiceGridCompactLayout layout = resolveVoiceGridCompactLayout(
        cameraCount: 2,
        screenShareCount: 0,
        containerWidth: 390,
        containerHeight: 700,
      );
      expect(layout.rects, hasLength(2));
      final Rect first = layout.rects[0];
      final Rect second = layout.rects[1];
      expect(first.width, closeTo(first.height, 0.51));
      expect(second.width, closeTo(first.width, 0.51));
      expect(second.left, closeTo(first.left, 0.51));
      expect(second.top, greaterThan(first.bottom));
      expect(first.width, lessThan(366));
      expect(layout.contentHeight, lessThanOrEqualTo(700 + _epsilon));
    });

    test('uses two columns of squares for four and five people', () {
      final VoiceGridCompactLayout four = resolveVoiceGridCompactLayout(
        cameraCount: 4,
        screenShareCount: 0,
        containerWidth: 390,
        containerHeight: 700,
      );
      expect(four.rects[1].left, greaterThan(four.rects[0].right - _epsilon));
      expect(four.rects[1].top, closeTo(four.rects[0].top, 0.51));
      expect(four.rects[2].top, greaterThan(four.rects[0].bottom));
      expect(four.rects[0].width, closeTo(four.rects[0].height, 0.51));
      expect(four.rects[3].width, closeTo(four.rects[0].width, 0.51));

      final VoiceGridCompactLayout five = resolveVoiceGridCompactLayout(
        cameraCount: 5,
        screenShareCount: 0,
        containerWidth: 390,
        containerHeight: 700,
      );
      expect(five.rects, hasLength(5));
      expect(five.rects[1].left, greaterThan(five.rects[0].right - _epsilon));
      expect(five.rects[4].width, closeTo(five.rects[0].width, 0.51));
      expect(five.rects[4].height, closeTo(five.rects[4].width, 0.51));
      expect(five.rects[4].left, greaterThan(five.rects[0].left + 1));
      expect(five.rects[4].top, greaterThan(five.rects[2].top));
    });

    test('shrinks squares when screens are shared', () {
      final VoiceGridCompactLayout people = resolveVoiceGridCompactLayout(
        cameraCount: 5,
        screenShareCount: 0,
        containerWidth: 390,
        containerHeight: 700,
      );
      final VoiceGridCompactLayout shared = resolveVoiceGridCompactLayout(
        cameraCount: 5,
        screenShareCount: 2,
        containerWidth: 390,
        containerHeight: 700,
      );
      expect(shared.rects, hasLength(7));
      for (int i = 0; i < 5; i++) {
        expect(shared.rects[i].width, closeTo(shared.rects[i].height, 0.51));
      }
      expect(shared.rects[0].width, lessThan(people.rects[0].width));
      for (final Rect share in shared.rects.skip(5)) {
        expect(share.width / share.height, closeTo(16 / 9, 0.05));
        expect(share.width, greaterThan(share.height));
        expect(share.width, closeTo(366, 1));
        expect(share.left, closeTo(12, 1));
      }
      expect(shared.rects[6].top, greaterThan(shared.rects[5].bottom));
    });

    test('uses three columns once seven people are in the call', () {
      final VoiceGridCompactLayout layout = resolveVoiceGridCompactLayout(
        cameraCount: 7,
        screenShareCount: 0,
        containerWidth: 390,
        containerHeight: 700,
      );
      expect(
        layout.rects[1].left,
        greaterThan(layout.rects[0].right - _epsilon),
      );
      expect(
        layout.rects[2].left,
        greaterThan(layout.rects[1].right - _epsilon),
      );
      expect(layout.rects[2].top, closeTo(layout.rects[0].top, 0.51));
      expect(layout.rects[0].width, closeTo(layout.rects[0].height, 0.51));
    });

    test('scrolls instead of squashing a tall stack', () {
      final VoiceGridCompactLayout layout = resolveVoiceGridCompactLayout(
        cameraCount: 30,
        screenShareCount: 0,
        containerWidth: 390,
        containerHeight: 700,
      );
      expect(layout.contentHeight, greaterThan(700));
      expect(
        layout.rects.first.width,
        closeTo(layout.rects.first.height, 0.51),
      );
      expect(layout.rects.first.width, greaterThan(100));
      expect(layout.rects.first.left, greaterThanOrEqualTo(0));
    });
  });
}
