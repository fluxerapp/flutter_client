import 'dart:math';

const String _totpAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';

List<int> _randomBytes(int length) {
  final Random rng = Random.secure();
  return List<int>.generate(length, (_) => rng.nextInt(256));
}

String encodeTotpKey(List<int> bytes) {
  int bits = 0;
  int value = 0;
  final StringBuffer output = StringBuffer();
  for (final int byte in bytes) {
    value = (value << 8) | byte;
    bits += 8;
    while (bits >= 5) {
      output.write(_totpAlphabet[(value >> (bits - 5)) & 31]);
      bits -= 5;
    }
  }
  if (bits > 0) {
    output.write(_totpAlphabet[(value << (5 - bits)) & 31]);
  }
  return output.toString();
}

String generateTotpSecret() {
  return encodeTotpKey(_randomBytes(20));
}

String encodeTotpSecret(String secret) {
  return secret.replaceAll(RegExp(r'[\s._-]+'), '').toUpperCase();
}

String encodeTotpSecretAsUrl({
  required String accountName,
  required String secret,
  required String issuer,
}) {
  final String encodedSecret = encodeTotpSecret(secret);
  final String label =
      '${Uri.encodeComponent(issuer)}:${Uri.encodeComponent(accountName)}';
  final String query = Uri(
    queryParameters: <String, String>{
      'secret': encodedSecret,
      'issuer': issuer,
    },
  ).query;
  return 'otpauth://totp/$label?$query';
}
