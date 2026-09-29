import 'dart:typed_data';

import 'package:altcha_lib/altcha_lib.dart';

const String _kFastAlgorithm = 'PBKDF2/SHA-256';
const int _kBlockBytes = 64;
const int _kDigestBytes = 32;
const int _kMaxSinglePaddedBlockBytes = 55;
const int _kMask32 = 0xffffffff;

final Uint32List _kRoundConstants = Uint32List.fromList(const <int>[
  0x428a2f98,
  0x71374491,
  0xb5c0fbcf,
  0xe9b5dba5,
  0x3956c25b,
  0x59f111f1,
  0x923f82a4,
  0xab1c5ed5,
  0xd807aa98,
  0x12835b01,
  0x243185be,
  0x550c7dc3,
  0x72be5d74,
  0x80deb1fe,
  0x9bdc06a7,
  0xc19bf174,
  0xe49b69c1,
  0xefbe4786,
  0x0fc19dc6,
  0x240ca1cc,
  0x2de92c6f,
  0x4a7484aa,
  0x5cb0a9dc,
  0x76f988da,
  0x983e5152,
  0xa831c66d,
  0xb00327c8,
  0xbf597fc7,
  0xc6e00bf3,
  0xd5a79147,
  0x06ca6351,
  0x14292967,
  0x27b70a85,
  0x2e1b2138,
  0x4d2c6dfc,
  0x53380d13,
  0x650a7354,
  0x766a0abb,
  0x81c2c92e,
  0x92722c85,
  0xa2bfe8a1,
  0xa81a664b,
  0xc24b8b70,
  0xc76c51a3,
  0xd192e819,
  0xd6990624,
  0xf40e3585,
  0x106aa070,
  0x19a4c116,
  0x1e376c08,
  0x2748774c,
  0x34b0bcb5,
  0x391c0cb3,
  0x4ed8aa4a,
  0x5b9cca4f,
  0x682e6ff3,
  0x748f82ee,
  0x78a5636f,
  0x84c87814,
  0x8cc70208,
  0x90befffa,
  0xa4506ceb,
  0xbef9a3f7,
  0xc67178f2,
]);

final Uint32List _kInitialState = Uint32List.fromList(const <int>[
  0x6a09e667,
  0xbb67ae85,
  0x3c6ef372,
  0xa54ff53a,
  0x510e527f,
  0x9b05688c,
  0x1f83d9ab,
  0x5be0cd19,
]);

Future<DeriveKeyResult> altchaDeriveKey(
  ChallengeParameters parameters,
  List<int> salt,
  List<int> password,
) async {
  if (parameters.algorithm != _kFastAlgorithm ||
      parameters.keyLength > _kDigestBytes ||
      password.length > _kBlockBytes ||
      salt.length + 4 > _kMaxSinglePaddedBlockBytes) {
    return deriveKey(parameters, salt, password);
  }
  final Uint8List key = _pbkdf2Sha256SingleBlock(
    password,
    salt,
    parameters.cost,
  );
  return DeriveKeyResult(
    derivedKey: key.sublist(0, parameters.keyLength),
    parameters: <String, dynamic>{},
  );
}

@pragma('vm:prefer-inline')
int _rotr(int x, int n) => ((x >> n) | (x << (32 - n))) & _kMask32;

@pragma('vm:unsafe:no-bounds-checks')
@pragma('vm:prefer-inline')
void _compress(Uint32List state, Uint32List w, Uint32List out) {
  for (int t = 16; t < 64; t++) {
    final int w15 = w[t - 15];
    final int w2 = w[t - 2];
    final int s0 = _rotr(w15, 7) ^ _rotr(w15, 18) ^ (w15 >> 3);
    final int s1 = _rotr(w2, 17) ^ _rotr(w2, 19) ^ (w2 >> 10);
    w[t] = (w[t - 16] + s0 + w[t - 7] + s1) & _kMask32;
  }
  int a = state[0];
  int b = state[1];
  int c = state[2];
  int d = state[3];
  int e = state[4];
  int f = state[5];
  int g = state[6];
  int h = state[7];
  final Uint32List k = _kRoundConstants;
  for (int t = 0; t < 64; t++) {
    final int s1 = _rotr(e, 6) ^ _rotr(e, 11) ^ _rotr(e, 25);
    final int ch = (e & f) ^ ((~e & _kMask32) & g);
    final int t1 = (h + s1 + ch + k[t] + w[t]) & _kMask32;
    final int s0 = _rotr(a, 2) ^ _rotr(a, 13) ^ _rotr(a, 22);
    final int maj = (a & b) ^ (a & c) ^ (b & c);
    final int t2 = (s0 + maj) & _kMask32;
    h = g;
    g = f;
    f = e;
    e = (d + t1) & _kMask32;
    d = c;
    c = b;
    b = a;
    a = (t1 + t2) & _kMask32;
  }
  out[0] = (state[0] + a) & _kMask32;
  out[1] = (state[1] + b) & _kMask32;
  out[2] = (state[2] + c) & _kMask32;
  out[3] = (state[3] + d) & _kMask32;
  out[4] = (state[4] + e) & _kMask32;
  out[5] = (state[5] + f) & _kMask32;
  out[6] = (state[6] + g) & _kMask32;
  out[7] = (state[7] + h) & _kMask32;
}

void _loadPaddedBlock(Uint32List w, List<int> bytes, int totalLengthBytes) {
  final Uint8List block = Uint8List(_kBlockBytes)
    ..setAll(0, bytes)
    ..[bytes.length] = 0x80;
  final int bits = totalLengthBytes * 8;
  block[60] = (bits >> 24) & 0xff;
  block[61] = (bits >> 16) & 0xff;
  block[62] = (bits >> 8) & 0xff;
  block[63] = bits & 0xff;
  for (int i = 0; i < 16; i++) {
    w[i] =
        (block[i * 4] << 24) |
        (block[i * 4 + 1] << 16) |
        (block[i * 4 + 2] << 8) |
        block[i * 4 + 3];
  }
}

void _loadKeyPad(Uint32List w, List<int> password, int pad) {
  for (int i = 0; i < 16; i++) {
    int word = 0;
    for (int j = 0; j < 4; j++) {
      final int index = i * 4 + j;
      final int keyByte = index < password.length ? password[index] : 0;
      word = (word << 8) | (keyByte ^ pad);
    }
    w[i] = word;
  }
}

@pragma('vm:unsafe:no-bounds-checks')
@pragma('vm:prefer-inline')
void _loadDigestBlock(Uint32List w, Uint32List digest) {
  for (int i = 0; i < 8; i++) {
    w[i] = digest[i];
  }
  w[8] = 0x80000000;
  for (int i = 9; i < 15; i++) {
    w[i] = 0;
  }
  w[15] = (_kBlockBytes + _kDigestBytes) * 8;
}

@pragma('vm:unsafe:no-bounds-checks')
Uint8List _pbkdf2Sha256SingleBlock(
  List<int> password,
  List<int> salt,
  int iterations,
) {
  final Uint32List w = Uint32List(64);
  final Uint32List innerState = Uint32List(8);
  final Uint32List outerState = Uint32List(8);
  _loadKeyPad(w, password, 0x36);
  _compress(_kInitialState, w, innerState);
  _loadKeyPad(w, password, 0x5c);
  _compress(_kInitialState, w, outerState);

  final Uint8List message = Uint8List(salt.length + 4)
    ..setAll(0, salt)
    ..[salt.length + 3] = 1;
  _loadPaddedBlock(w, message, _kBlockBytes + message.length);
  final Uint32List u = Uint32List(8);
  _compress(innerState, w, u);
  _loadDigestBlock(w, u);
  _compress(outerState, w, u);
  final Uint32List accumulator = Uint32List.fromList(u);

  for (int iteration = 1; iteration < iterations; iteration++) {
    _loadDigestBlock(w, u);
    _compress(innerState, w, u);
    _loadDigestBlock(w, u);
    _compress(outerState, w, u);
    for (int i = 0; i < 8; i++) {
      accumulator[i] ^= u[i];
    }
  }

  final Uint8List out = Uint8List(_kDigestBytes);
  for (int i = 0; i < 8; i++) {
    out[i * 4] = accumulator[i] >> 24;
    out[i * 4 + 1] = (accumulator[i] >> 16) & 0xff;
    out[i * 4 + 2] = (accumulator[i] >> 8) & 0xff;
    out[i * 4 + 3] = accumulator[i] & 0xff;
  }
  return out;
}
