import 'dart:isolate';
import 'dart:typed_data';

import 'package:image/image.dart' as img;

bool isTiffImage(Uint8List bytes) {
  if (bytes.length < 4) {
    return false;
  }
  final bool littleEndian =
      bytes[0] == 0x49 && bytes[1] == 0x49 && bytes[2] == 0x2A && bytes[3] == 0;
  final bool bigEndian =
      bytes[0] == 0x4D && bytes[1] == 0x4D && bytes[2] == 0 && bytes[3] == 0x2A;
  return littleEndian || bigEndian;
}

Future<Uint8List?> decodeScreenShareThumbnail(Uint8List? bytes) async {
  if (bytes == null || bytes.isEmpty) {
    return null;
  }
  if (!isTiffImage(bytes)) {
    return bytes;
  }
  return await Isolate.run(() {
    final img.Image? image = img.decodeTiff(bytes);
    if (image == null) {
      return null;
    }
    return img.encodePng(image, level: 1);
  });
}
