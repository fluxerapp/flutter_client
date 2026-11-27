import 'dart:typed_data';

import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_thumbnail.dart';
import 'package:image/image.dart' as img;
import 'package:test/test.dart';

void main() {
  test('recognises both TIFF byte orders', () {
    expect(isTiffImage(Uint8List.fromList(<int>[0x49, 0x49, 0x2A, 0])), isTrue);
    expect(isTiffImage(Uint8List.fromList(<int>[0x4D, 0x4D, 0, 0x2A])), isTrue);
    expect(
      isTiffImage(Uint8List.fromList(<int>[0xFF, 0xD8, 0xFF, 0])),
      isFalse,
    );
    expect(isTiffImage(Uint8List(2)), isFalse);
  });

  test('passes non-TIFF thumbnails through unchanged', () async {
    final Uint8List jpeg = img.encodeJpg(img.Image(width: 4, height: 2));
    expect(await decodeScreenShareThumbnail(jpeg), same(jpeg));
    expect(await decodeScreenShareThumbnail(null), isNull);
    expect(await decodeScreenShareThumbnail(Uint8List(0)), isNull);
  });

  test('converts TIFF thumbnails to PNG', () async {
    final Uint8List tiff = img.encodeTiff(img.Image(width: 8, height: 4));
    final Uint8List? decoded = await decodeScreenShareThumbnail(tiff);
    expect(decoded, isNotNull);
    final img.Image? png = img.decodePng(decoded!);
    expect(png?.width, 8);
    expect(png?.height, 4);
  });
}
