import 'dart:convert';
import 'dart:typed_data';

Uint8List decodeWebPushKey(String value) {
  final String trimmed = value.trim().replaceAll('=', '');
  try {
    return Uint8List.fromList(base64Url.decode(base64Url.normalize(trimmed)));
  } on FormatException {
    return Uint8List.fromList(base64.decode(base64.normalize(trimmed)));
  }
}

String encodeWebPushKey(List<int> bytes) {
  return base64Url.encode(bytes).replaceAll('=', '');
}
