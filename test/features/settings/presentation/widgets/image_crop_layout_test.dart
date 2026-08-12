import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_layout.dart';

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
  });
}
