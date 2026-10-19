import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/scroller/fluxer_smooth_scrollbar_metrics.dart';

void main() {
  group('fluxerSmoothScrollbarThumbExtent', () {
    test('shrinks as the scrollable range grows', () {
      const double trackLength = 400;
      const double viewportDimension = 400;
      final double shortList = fluxerSmoothScrollbarThumbExtent(
        trackLength: trackLength,
        viewportDimension: viewportDimension,
        scrollableExtent: 200,
      );
      final double longList = fluxerSmoothScrollbarThumbExtent(
        trackLength: trackLength,
        viewportDimension: viewportDimension,
        scrollableExtent: 4000,
      );
      expect(shortList, greaterThan(longList));
      expect(
        longList,
        greaterThanOrEqualTo(kFluxerSmoothScrollbarMinThumbExtent),
      );
    });

    test('fills the track when there is nothing to scroll', () {
      expect(
        fluxerSmoothScrollbarThumbExtent(
          trackLength: 200,
          viewportDimension: 200,
          scrollableExtent: 0,
        ),
        200,
      );
    });
  });

  group('fluxerSmoothScrollbarLerpExtent', () {
    test('moves gradually toward target', () {
      final double next = fluxerSmoothScrollbarLerpExtent(
        current: 100,
        target: 500,
        snap: false,
      );
      expect(next, greaterThan(100));
      expect(next, lessThan(500));
    });

    test('snaps immediately', () {
      expect(
        fluxerSmoothScrollbarLerpExtent(current: 100, target: 500, snap: true),
        500,
      );
    });
  });

  group('fluxerSmoothScrollbarScrollFraction', () {
    test('pins to trailing edge', () {
      expect(
        fluxerSmoothScrollbarScrollFraction(
          pixels: 10,
          minExtent: -4000,
          maxExtent: 40,
          pinTrailingEdge: true,
        ),
        1,
      );
    });

    test('uses the full extent range', () {
      expect(
        fluxerSmoothScrollbarScrollFraction(
          pixels: 50,
          minExtent: 0,
          maxExtent: 100,
          pinTrailingEdge: false,
        ),
        0.5,
      );
    });

    test('a small step off the trailing edge stays near the trailing edge', () {
      final double fraction = fluxerSmoothScrollbarScrollFraction(
        pixels: 0,
        minExtent: -8000,
        maxExtent: 40,
        pinTrailingEdge: false,
      );
      expect(fraction, greaterThan(0.95));
    });
  });

  group('fluxerSmoothScrollbarPixelsForTrackY', () {
    test('maps track Y to scroll offset', () {
      const double topInset = 0;
      const double trackLength = 200;
      const double thumbExtent = 48;

      final double top = fluxerSmoothScrollbarPixelsForTrackY(
        localY: topInset + thumbExtent / 2,
        topInset: topInset,
        trackLength: trackLength,
        thumbExtent: thumbExtent,
        minScrollExtent: -500,
        maxScrollExtent: 500,
      );
      expect(top, -500);

      final double bottom = fluxerSmoothScrollbarPixelsForTrackY(
        localY: topInset + trackLength - thumbExtent / 2,
        topInset: topInset,
        trackLength: trackLength,
        thumbExtent: thumbExtent,
        minScrollExtent: -500,
        maxScrollExtent: 500,
      );
      expect(bottom, 500);
    });
  });
}
