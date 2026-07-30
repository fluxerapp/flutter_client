import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/expression_image_optimizer.dart';
import 'package:image/image.dart' as img;

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
}
