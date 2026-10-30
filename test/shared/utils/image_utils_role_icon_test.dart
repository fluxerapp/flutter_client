import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:image/image.dart' as img;

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

    test('throws when image cannot be decoded', () async {
      await expectLater(
        ImageUtils.prepareRoleIconUploadBytes(
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
