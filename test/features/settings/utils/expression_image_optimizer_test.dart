import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/expressions/expression_image_optimizer.dart';
import 'package:image/image.dart' as img;

int fnv1a(List<int> values) {
  int hash = 0x811c9dc5;
  for (final int value in values) {
    hash = ((hash ^ (value & 0xff)) * 0x01000193) & 0xffffffff;
  }
  return hash;
}

Uint8List createGradientPng({required int width, required int height}) {
  final img.Image image = img.Image(
    width: width,
    height: height,
    numChannels: 4,
  );
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      image.setPixelRgba(
        x,
        y,
        (x * 7) % 256,
        (y * 11) % 256,
        (x + y) % 256,
        (x * y) % 256,
      );
    }
  }
  return Uint8List.fromList(img.encodePng(image));
}

void main() {
  Uint8List createPng({required int width, required int height}) {
    final img.Image image = img.Image(width: width, height: height);
    img.fill(image, color: img.ColorRgb8(255, 0, 0));
    return Uint8List.fromList(img.encodePng(image));
  }

  test('optimizeGuildEmojiImage resizes static images to base64 png', () async {
    final Uint8List bytes = createPng(width: 512, height: 256);
    final String encoded = await optimizeGuildEmojiImage(
      bytes: bytes,
      maxSizeBytes: 256 * 1024,
    );
    final Uint8List decoded = base64Decode(encoded);
    final img.Image? image = img.decodeImage(decoded);
    expect(image, isNotNull);
    expect(image!.width, 128);
    expect(image.height, 128);
  });

  test(
    'optimizeGuildEmojiImage keeps transparent padding for non-square images',
    () async {
      final img.Image source = img.Image(
        width: 256,
        height: 128,
        numChannels: 4,
      );
      img.fill(source, color: img.ColorRgba8(255, 0, 0, 255));
      final Uint8List bytes = Uint8List.fromList(img.encodePng(source));

      final String encoded = await optimizeGuildEmojiImage(
        bytes: bytes,
        maxSizeBytes: 256 * 1024,
      );
      final img.Image? image = img.decodeImage(base64Decode(encoded));

      expect(image, isNotNull);
      expect(image!.getPixel(0, 0).a, 0);
      expect(image.getPixel(0, image.height - 1).a, 0);
      expect(
        image.getPixel(image.width ~/ 2, image.height ~/ 2).a,
        greaterThan(0),
      );
    },
  );

  test(
    'optimizeGuildEmojiImage preserves transparent regions in square images',
    () async {
      final img.Image source = img.Image(
        width: 128,
        height: 128,
        numChannels: 4,
      );
      img.fill(source, color: img.ColorRgba8(0, 0, 0, 0));
      for (int y = 32; y < 96; y++) {
        for (int x = 32; x < 96; x++) {
          source.setPixelRgba(x, y, 0, 255, 0, 255);
        }
      }
      final Uint8List bytes = Uint8List.fromList(img.encodePng(source));

      final String encoded = await optimizeGuildEmojiImage(
        bytes: bytes,
        maxSizeBytes: 256 * 1024,
      );
      final img.Image? image = img.decodeImage(base64Decode(encoded));

      expect(image, isNotNull);
      expect(image!.getPixel(0, 0).a, 0);
      expect(image.getPixel(image.width - 1, image.height - 1).a, 0);
      expect(
        image.getPixel(image.width ~/ 2, image.height ~/ 2).a,
        greaterThan(0),
      );
    },
  );

  test('optimizeGuildStickerImage preserves transparency', () async {
    final img.Image source = img.Image(width: 640, height: 320, numChannels: 4);
    img.fill(source, color: img.ColorRgba8(0, 0, 255, 255));
    final Uint8List bytes = Uint8List.fromList(img.encodePng(source));

    final String encoded = await optimizeGuildStickerImage(
      bytes: bytes,
      maxSizeBytes: 512 * 1024,
    );
    final img.Image? image = img.decodeImage(base64Decode(encoded));

    expect(image, isNotNull);
    expect(image!.width, 320);
    expect(image.height, 320);
    expect(image.getPixel(0, 0).a, 0);
    expect(
      image.getPixel(image.width ~/ 2, image.height ~/ 2).a,
      greaterThan(0),
    );
  });

  test('optimizeGuildEmojiImage passes through svg under size limit', () async {
    final Uint8List bytes = Uint8List.fromList(
      '<svg xmlns="http://www.w3.org/2000/svg"></svg>'.codeUnits,
    );
    final String encoded = await optimizeGuildEmojiImage(
      bytes: bytes,
      maxSizeBytes: 1024,
    );
    expect(base64Decode(encoded), bytes);
  });

  test('optimizeGuildEmojiImage throws when svg exceeds size limit', () async {
    final Uint8List bytes = Uint8List.fromList(
      '<svg xmlns="http://www.w3.org/2000/svg">${'x' * 2048}</svg>'.codeUnits,
    );
    await expectLater(
      optimizeGuildEmojiImage(bytes: bytes, maxSizeBytes: 64),
      throwsA(
        isA<ExpressionImageOptimizationException>().having(
          (ExpressionImageOptimizationException error) => error.reason,
          'reason',
          ExpressionImageOptimizationReason.svg,
        ),
      ),
    );
  });

  test('isSvgBytes detects svg content', () {
    final Uint8List svg = Uint8List.fromList(
      '<?xml version="1.0"?><svg></svg>'.codeUnits,
    );
    final Uint8List png = createPng(width: 1, height: 1);
    expect(isSvgBytes(svg), isTrue);
    expect(isSvgBytes(png), isFalse);
  });

  test('optimizeGuildEmojiImage output is stable for a fixed input', () async {
    final String encoded = await optimizeGuildEmojiImage(
      bytes: createGradientPng(width: 50, height: 30),
      maxSizeBytes: 1 << 20,
    );
    expect(fnv1a(encoded.codeUnits), 988939735);
  });

  test(
    'optimizeGuildStickerImage output is stable for a fixed input',
    () async {
      final String encoded = await optimizeGuildStickerImage(
        bytes: createGradientPng(width: 50, height: 30),
        maxSizeBytes: 1 << 20,
      );
      expect(fnv1a(encoded.codeUnits), 1041078885);
    },
  );
}
