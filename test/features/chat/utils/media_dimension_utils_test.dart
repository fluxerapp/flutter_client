import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';

void main() {
  group('coverDecodeCacheSize', () {
    test('caps only the binding height for a wide source in a square cell', () {
      final cache = coverDecodeCacheSize(
        cellWidth: 100,
        cellHeight: 100,
        devicePixelRatio: 2,
        sourceWidth: 1920,
        sourceHeight: 1080,
      );
      expect(cache.height, 200);
      expect(cache.width, isNull);
    });

    test('caps only the binding width for a tall source in a square cell', () {
      final cache = coverDecodeCacheSize(
        cellWidth: 100,
        cellHeight: 100,
        devicePixelRatio: 2,
        sourceWidth: 1080,
        sourceHeight: 1920,
      );
      expect(cache.width, 200);
      expect(cache.height, isNull);
    });

    test('never returns both axes, which would distort via exact policy', () {
      // Both axes would distort via ResizeImagePolicy.exact.
      final cache = coverDecodeCacheSize(
        cellWidth: 137,
        cellHeight: 300,
        devicePixelRatio: 3,
        sourceWidth: 4000,
        sourceHeight: 3000,
      );
      expect(cache.width == null || cache.height == null, isTrue);
    });

    test('caps the larger cell axis when the source ratio is unknown', () {
      final portrait = coverDecodeCacheSize(
        cellWidth: 100,
        cellHeight: 300,
        devicePixelRatio: 1,
      );
      expect(portrait.height, 300);
      expect(portrait.width, isNull);

      final landscape = coverDecodeCacheSize(
        cellWidth: 300,
        cellHeight: 100,
        devicePixelRatio: 1,
      );
      expect(landscape.width, 300);
      expect(landscape.height, isNull);
    });

    test('returns no cap for non-finite or empty cells', () {
      expect(
        coverDecodeCacheSize(
          cellWidth: double.infinity,
          cellHeight: 100,
          devicePixelRatio: 2,
          sourceWidth: 100,
          sourceHeight: 100,
        ),
        (width: null, height: null),
      );
      expect(
        coverDecodeCacheSize(
          cellWidth: 0,
          cellHeight: 100,
          devicePixelRatio: 2,
        ),
        (width: null, height: null),
      );
    });
  });

  group('containDecodeCacheSize', () {
    test('caps the opposite axis from cover for a wide source', () {
      final cache = containDecodeCacheSize(
        cellWidth: 100,
        cellHeight: 100,
        devicePixelRatio: 2,
        sourceWidth: 1920,
        sourceHeight: 1080,
      );
      expect(cache.width, 200);
      expect(cache.height, isNull);
    });

    test('caps the opposite axis from cover for a tall source', () {
      final cache = containDecodeCacheSize(
        cellWidth: 100,
        cellHeight: 100,
        devicePixelRatio: 2,
        sourceWidth: 1080,
        sourceHeight: 1920,
      );
      expect(cache.height, 200);
      expect(cache.width, isNull);
    });

    test('never returns both axes for a square sticker box', () {
      final cache = containDecodeCacheSize(
        cellWidth: 160,
        cellHeight: 160,
        devicePixelRatio: 1,
      );
      expect(cache.width == null || cache.height == null, isTrue);
    });
  });
}
