import 'dart:convert';
import 'dart:isolate';
import 'dart:math';

import 'package:cryptography/cryptography.dart';

class AppLockPinCredential {
  const AppLockPinCredential({required this.hash, required this.salt});

  final String hash;
  final String salt;
}

class AppLockPinHasher {
  AppLockPinHasher({Random? random, this.iterations = _defaultIterations})
    : _random = random ?? Random.secure();

  static const int _defaultIterations = 100000;
  static const int _saltLength = 16;
  static const int _keyBits = 256;

  final Random _random;
  final int iterations;

  Future<AppLockPinCredential> create(String pin) async {
    final List<int> salt = List<int>.generate(
      _saltLength,
      (_) => _random.nextInt(256),
    );
    final List<int> hash = await _derive(pin, salt);
    return AppLockPinCredential(
      hash: base64Encode(hash),
      salt: base64Encode(salt),
    );
  }

  Future<bool> verify(String pin, AppLockPinCredential credential) async {
    final List<int> expected = base64Decode(credential.hash);
    final List<int> actual = await _derive(pin, base64Decode(credential.salt));
    return _constantTimeEquals(expected, actual);
  }

  Future<List<int>> _derive(String pin, List<int> salt) {
    final int rounds = iterations;
    return Isolate.run(() async {
      final Pbkdf2 algorithm = Pbkdf2(
        macAlgorithm: Hmac.sha256(),
        iterations: rounds,
        bits: _keyBits,
      );
      final SecretKey key = await algorithm.deriveKey(
        secretKey: SecretKey(utf8.encode(pin)),
        nonce: salt,
      );
      return key.extractBytes();
    });
  }

  bool _constantTimeEquals(List<int> a, List<int> b) {
    if (a.length != b.length) {
      return false;
    }
    int difference = 0;
    for (int i = 0; i < a.length; i++) {
      difference |= a[i] ^ b[i];
    }
    return difference == 0;
  }
}
