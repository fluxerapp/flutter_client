import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_layout.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('computeInitialCropRect', () {
    const viewport = Rect.fromLTWH(0, 0, 400, 600);

    test('fits square avatar inside viewport with inset', () {
      final rect = computeInitialCropRect(viewport, 1);

      expect(rect.width, rect.height);
      expect(rect.width, 400 - (imageCropViewportInset * 2));
      expect(rect.center, viewport.center);
    });

    test('fits wide banner inside viewport with inset', () {
      const aspectRatio = 17 / 6;
      final rect = computeInitialCropRect(viewport, aspectRatio);

      expect(rect.width / rect.height, closeTo(aspectRatio, 0.001));
      expect(rect.width, 400 - (imageCropViewportInset * 2));
      expect(rect.center, viewport.center);
    });

    test('fits guild banner ratio when viewport is landscape', () {
      const landscape = Rect.fromLTWH(0, 0, 800, 400);
      const aspectRatio = 16 / 9;
      final rect = computeInitialCropRect(landscape, aspectRatio);

      expect(rect.width / rect.height, closeTo(aspectRatio, 0.001));
      expect(rect.height, 400 - (imageCropViewportInset * 2));
      expect(rect.center.dx, closeTo(landscape.center.dx, 0.001));
      expect(rect.center.dy, closeTo(landscape.center.dy, 0.001));
    });

    test('fits square avatar inside short landscape viewport', () {
      const landscape = Rect.fromLTWH(0, 0, 800, 300);
      final rect = computeInitialCropRect(landscape, 1);

      expect(rect.width, rect.height);
      expect(rect.height, 300 - (imageCropViewportInset * 2));
      expect(rect.center, landscape.center);
    });
  });

  group('imageCropScaleAllowed', () {
    const maxScale = 2.5;

    test('allows zooming out below the initial cover scale', () {
      expect(imageCropScaleAllowed(0.5, maxScale), isTrue);
    });

    test('allows the initial cover scale', () {
      expect(imageCropScaleAllowed(1, maxScale), isTrue);
    });

    test('allows zooming in up to the max scale', () {
      expect(imageCropScaleAllowed(maxScale, maxScale), isTrue);
    });

    test('rejects scale above the max', () {
      expect(imageCropScaleAllowed(maxScale + 0.1, maxScale), isFalse);
    });
  });

  group('imageCropMaxScaleFor', () {
    const viewport = Size(400, 600);

    test('caps at native size when image is larger than viewport', () {
      const imageSize = Size(1000, 1000);
      expect(imageCropMaxScaleFor(imageSize, viewport), 2.5);
    });

    test('caps at cover scale when image is smaller than viewport', () {
      const imageSize = Size(100, 100);
      expect(imageCropMaxScaleFor(imageSize, viewport), 1.5);
    });

    test('prefers native width for wide images', () {
      const imageSize = Size(2000, 1000);
      expect(imageCropMaxScaleFor(imageSize, viewport), 5.0);
    });

    test('prefers native height for tall images', () {
      const imageSize = Size(1000, 2000);
      expect(imageCropMaxScaleFor(imageSize, viewport), closeTo(3.333, 0.001));
    });
  });
}
