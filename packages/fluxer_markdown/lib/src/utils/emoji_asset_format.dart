import 'dart:convert';
import 'dart:typed_data';

bool isWebpEmojiAsset(Uint8List bytes) {
  return bytes.length >= 12 &&
      bytes[0] == 0x52 &&
      bytes[1] == 0x49 &&
      bytes[2] == 0x46 &&
      bytes[3] == 0x46 &&
      bytes[8] == 0x57 &&
      bytes[9] == 0x45 &&
      bytes[10] == 0x42 &&
      bytes[11] == 0x50;
}

bool isSvgEmojiAsset(Uint8List bytes) {
  if (bytes.isEmpty) {
    return false;
  }
  final content = utf8.decode(bytes, allowMalformed: true).trimLeft();
  return content.startsWith('<');
}
