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
                final ({double sidePadding, double verticalPadding}) padding =
                    voiceGridPadding(
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
                final bool gapBudgetFits =
                    padding.verticalPadding * 2 +
                        gap * (metrics.rows - 1).clamp(0, double.infinity) <=
                    height + _epsilon;
                expect(metrics.tileWidth, greaterThanOrEqualTo(0));
                expect(metrics.tileHeight, greaterThanOrEqualTo(0));
                if (metrics.tileWidth > 0) {
                  expect(
                    metrics.tileWidth / metrics.tileHeight,
                    closeTo(voiceGridTileAspectRatio, 0.0001),
                  );
                }
                expect(
                  metrics.contentWidth,
                  lessThanOrEqualTo(width + _epsilon),
                );
                if (gapBudgetFits) {
                  expect(
                    metrics.contentHeight,
                    lessThanOrEqualTo(height + _epsilon),
                  );
                } else {
                  expect(metrics.tileWidth, 0);
                  expect(metrics.tileHeight, 0);
                }
              }
            }
          }
        }
      }
    });

    test('contains a compact single tile at 16:9 inside the frame', () {
      final VoiceGridLayoutMetrics metrics = resolveVoiceGridLayoutMetrics(
        tileCount: 1,
        containerWidth: 1600,
        containerHeight: 500,
        compact: true,
      );
      expect(metrics.tileWidth, lessThan(metrics.availableWidth));
      expect(
        metrics.tileWidth,
        closeTo(metrics.availableHeight * voiceGridTileAspectRatio, 0.0001),
      );
      expect(metrics.tileHeight, closeTo(metrics.availableHeight, 0.0001));
      expect(metrics.contentWidth, lessThan(1600));
      expect(metrics.contentHeight, closeTo(500, 0.0001));
    });
  });

  group('resolveVoiceGridPackedLayoutMetrics', () {
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
}
