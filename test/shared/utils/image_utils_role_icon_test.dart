import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
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
  group('isRoleIconExtensionAllowed', () {
    test('accepts supported extensions', () {
      expect(ImageUtils.isRoleIconExtensionAllowed('icon.png'), isTrue);
      expect(ImageUtils.isRoleIconExtensionAllowed('photo.JPEG'), isTrue);
      expect(ImageUtils.isRoleIconExtensionAllowed('x.webp'), isTrue);
    });

    test('rejects unsupported extensions', () {
      expect(ImageUtils.isRoleIconExtensionAllowed('icon.gif'), isFalse);
      expect(ImageUtils.isRoleIconExtensionAllowed('notes.txt'), isFalse);
    });
  });

  group('prepareRoleIconUploadBytes', () {
    test('returns square png bytes', () async {
      final img.Image source = img.Image(width: 80, height: 40);
      final Uint8List input = Uint8List.fromList(img.encodePng(source));
      final Uint8List output = await ImageUtils.prepareRoleIconUploadBytes(
        input,
      );
      final img.Image? decoded = img.decodeImage(output);
      expect(decoded, isNotNull);
      expect(decoded!.width, decoded.height);
    });

    test('output is stable for a fixed input', () async {
      final Uint8List output = await ImageUtils.prepareRoleIconUploadBytes(
        createGradientPng(width: 20, height: 12),
      );
      expect(fnv1a(output), 651704647);
    });

    test('throws when image cannot be decoded', () async {
      await expectLater(
        ImageUtils.prepareRoleIconUploadBytes(
          Uint8List.fromList(<int>[1, 2, 3]),
        ),
        throwsFormatException,
      );
    });
  });

  group('squareCustomEmojiForRoleIcon', () {
    test('returns square png bytes capped at the requested side', () async {
      final Uint8List output = await ImageUtils.squareCustomEmojiForRoleIcon(
        createGradientPng(width: 200, height: 150),
      );
      final img.Image? decoded = img.decodeImage(output);
      expect(decoded, isNotNull);
      expect(decoded!.width, 128);
      expect(decoded.height, 128);
      expect(fnv1a(output), 2355306612);
    });

    test('throws when image cannot be decoded', () async {
      await expectLater(
        ImageUtils.squareCustomEmojiForRoleIcon(
          Uint8List.fromList(<int>[1, 2, 3]),
        ),
        throwsFormatException,
      );
    });
  });

  group('isOverRoleIconSizeLimit', () {
    test('flags payloads over 256 KiB', () {
      expect(
        ImageUtils.isOverRoleIconSizeLimit(Uint8List(kRoleIconMaxBytes + 1)),
        isTrue,
      );
      expect(
        ImageUtils.isOverRoleIconSizeLimit(Uint8List(kRoleIconMaxBytes)),
        isFalse,
      );
    });
  });
}
