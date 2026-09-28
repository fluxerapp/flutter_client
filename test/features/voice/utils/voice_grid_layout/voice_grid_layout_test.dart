import 'dart:ui' show Rect;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_grid_layout.dart';

const double _epsilon = 0.001;

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

  group('resolveVoiceGridLayoutMetrics', () {
    test('keeps all feasible layouts inside their viewport', () {
      const List<double> widths = <double>[
        240,
        320,
        419,
        420,
        519,
        520,
        759,
        760,
        859,
        860,
        1179,
        1180,
        1440,
        1920,
      ];
      const List<double> heights = <double>[
        180,
        240,
        259,
        260,
        359,
        360,
        459,
        460,
        519,
        520,
        720,
        1080,
      ];
      const List<int> tileCounts = <int>[
        1,
        2,
        3,
        4,
        5,
        6,
        8,
        10,
        12,
        16,
        24,
        32,
        40,
        64,
      ];
      for (final int tileCount in tileCounts) {
        for (final double width in widths) {
          for (final double height in heights) {
            for (final bool compact in <bool>[false, true]) {
              for (final bool edgeToEdge in <bool>[false, true]) {
                final VoiceGridLayoutMetrics metrics =
                    resolveVoiceGridLayoutMetrics(
                      tileCount: tileCount,
                      containerWidth: width,
                      containerHeight: height,
                      compact: compact,
                      edgeToEdge: edgeToEdge,
                    );
                final double gap = voiceGridGap(
                  tileCount: tileCount,
                  compact: compact,
                  containerHeight: height,
                );
                expect(gap, greaterThanOrEqualTo(0));
                expect(metrics.tileWidth, greaterThanOrEqualTo(0));
                expect(metrics.tileHeight, greaterThanOrEqualTo(0));
                if (metrics.tileWidth > 0) {
                  expect(
                    metrics.tileWidth,
                    lessThanOrEqualTo(metrics.availableWidth + _epsilon),
                  );
                  expect(
                    metrics.tileHeight,
                    lessThanOrEqualTo(metrics.availableHeight + _epsilon),
                  );
                }
                expect(
                  metrics.contentWidth,
                  lessThanOrEqualTo(width + _epsilon),
                );
                expect(
                  metrics.contentHeight,
                  lessThanOrEqualTo(height + _epsilon),
                );
              }
            }
          }
        }
      }
    });

    test('keeps a wide stage on the column breakpoints', () {
      final VoiceGridLayoutMetrics metrics = resolveVoiceGridLayoutMetrics(
        tileCount: 10,
        containerWidth: 1920,
        containerHeight: 1080,
      );
      expect(metrics.columns, 4);
    });

    test('squares a lone avatar tile', () {
      final ({double width, double height}) size = voiceGridPlacedTileSize(
        cellWidth: 350,
        cellHeight: 700,
        tileCount: 1,
        squareTile: true,
      );
      expect(size.width, closeTo(350, _epsilon));
      expect(size.height, closeTo(350, _epsilon));
    });

    test('keeps filled cells when the lone tile is not a square avatar', () {
      final ({double width, double height}) size = voiceGridPlacedTileSize(
        cellWidth: 350,
        cellHeight: 700,
        tileCount: 1,
        squareTile: false,
      );
      expect(size.width, closeTo(350, _epsilon));
      expect(size.height, closeTo(700, _epsilon));
    });

    test('contains a compact single tile inside the frame', () {
      final VoiceGridLayoutMetrics metrics = resolveVoiceGridLayoutMetrics(
        tileCount: 1,
        containerWidth: 1600,
        containerHeight: 500,
        compact: true,
      );
      expect(metrics.tileWidth, closeTo(metrics.availableWidth, _epsilon));
      expect(metrics.tileHeight, closeTo(metrics.availableHeight, _epsilon));
      expect(metrics.contentWidth, closeTo(1600, _epsilon));
      expect(metrics.contentHeight, closeTo(500, _epsilon));
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
      expect(packed.metrics.rows, 2);
    });

    test('limits visible tiles before they fall below the minimum size', () {
      final int capacity = voiceGridVisibleTileCapacity(
        tileCount: 64,
        containerWidth: 800,
        containerHeight: 450,
      );
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
        voiceGridVisibleTileCapacity(
          tileCount: 10,
          containerWidth: voiceGridMinTileWidthPx / 2,
          containerHeight: 90,
        ),
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
      expect(packed.metrics.rows, 1);
      expect(
        packed.metrics.tileWidth,
        greaterThanOrEqualTo(voiceGridCompactMinTileWidthPx - _epsilon),
      );
      expect(packed.metrics.contentWidth, lessThanOrEqualTo(1920 + _epsilon));
      expect(packed.metrics.contentHeight, lessThanOrEqualTo(120 + _epsilon));
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
      expect(packed.metrics.rows, packed.visibleTileCount);
      expect(
        packed.metrics.tileWidth,
        greaterThanOrEqualTo(voiceGridCompactMinTileWidthPx - _epsilon),
      );
      expect(packed.metrics.contentWidth, lessThanOrEqualTo(180 + _epsilon));
      expect(packed.metrics.contentHeight, lessThanOrEqualTo(1200 + _epsilon));
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
