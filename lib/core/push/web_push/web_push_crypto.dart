import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:pointycastle/api.dart' as castle;
import 'package:pointycastle/ecc/api.dart';
import 'package:pointycastle/ecc/curves/secp256r1.dart';
import 'package:pointycastle/key_generators/api.dart';
import 'package:pointycastle/key_generators/ec_key_generator.dart';
import 'package:pointycastle/random/fortuna_random.dart';

const int kWebPushRecordSize = 2816;
const int kWebPushPublicKeyLength = 65;
const int kWebPushAuthSecretLength = 16;
const int _kSaltLength = 16;
const int _kTagLength = 16;
const int _kHeaderLength = _kSaltLength + 4 + 1 + kWebPushPublicKeyLength;
const int _kPaddingDelimiter = 0x02;

final ECDomainParameters _p256 = ECCurve_secp256r1();

class WebPushKeyPair {
  const WebPushKeyPair({
    required this.privateKey,
    required this.publicKey,
    required this.authSecret,
  });

  final Uint8List privateKey;
  final Uint8List publicKey;
  final Uint8List authSecret;
}

WebPushKeyPair generateWebPushKeyPair() {
  final ECKeyGenerator generator = ECKeyGenerator()
    ..init(
      castle.ParametersWithRandom(ECKeyGeneratorParameters(_p256), _fortuna()),
    );
  final castle.AsymmetricKeyPair<castle.PublicKey, castle.PrivateKey> pair =
      generator.generateKeyPair();
  final ECPublicKey publicKey = pair.publicKey as ECPublicKey;
  final ECPrivateKey privateKey = pair.privateKey as ECPrivateKey;
  final ECPoint? point = publicKey.Q;
  if (point == null) {
    throw StateError('P-256 key generation failed');
  }
  return WebPushKeyPair(
    privateKey: _unsignedFixed(privateKey.d!, 32),
    publicKey: point.getEncoded(false),
    authSecret: _randomBytes(kWebPushAuthSecretLength),
  );
}

Future<Uint8List> encryptWebPushRecord({
  required List<int> plaintext,
  required Uint8List recipientPublicKey,
  required Uint8List authSecret,
}) async {
  if (recipientPublicKey.length != kWebPushPublicKeyLength ||
      recipientPublicKey[0] != 0x04 ||
      authSecret.length != kWebPushAuthSecretLength) {
    throw ArgumentError('invalid web push recipient key');
  }
  final WebPushKeyPair ephemeral = _ephemeralKeyPair();
  if (ephemeral.publicKey.length != kWebPushPublicKeyLength) {
    throw StateError('P-256 key generation failed');
  }
  final Uint8List salt = _randomBytes(_kSaltLength);
  final Uint8List shared = _sharedSecret(
    privateKey: ephemeral.privateKey,
    remotePublicKey: recipientPublicKey,
  );
  final _ContentKey contentKey = await _deriveContentKey(
    sharedSecret: shared,
    authSecret: authSecret,
    salt: salt,
    recipientPublicKey: recipientPublicKey,
    ephemeralPublicKey: ephemeral.publicKey,
  );
  const int paddedLength = kWebPushRecordSize - _kTagLength - _kHeaderLength;
  if (plaintext.length >= paddedLength) {
    throw ArgumentError('web push plaintext does not fit');
  }
  final Uint8List padded = Uint8List(paddedLength)
    ..setRange(0, plaintext.length, plaintext)
    ..[plaintext.length] = _kPaddingDelimiter;
  final SecretBox box = await AesGcm.with128bits().encrypt(
    padded,
    secretKey: SecretKey(contentKey.cek),
    nonce: contentKey.nonce,
  );
  final BytesBuilder body = BytesBuilder(copy: false)
    ..add(salt)
    ..add(_recordSizeBytes())
    ..addByte(kWebPushPublicKeyLength)
    ..add(ephemeral.publicKey)
    ..add(box.cipherText)
    ..add(box.mac.bytes);
  return body.toBytes();
}

Future<String?> decryptWebPushRecord({
  required Uint8List record,
  required Uint8List privateKey,
  required Uint8List authSecret,
}) async {
  if (privateKey.length != 32 ||
      authSecret.length != kWebPushAuthSecretLength) {
    return null;
  }
  if (record.length < _kHeaderLength + _kTagLength ||
      record.length > kWebPushRecordSize) {
    return null;
  }
  if (record[20] != kWebPushPublicKeyLength) {
    return null;
  }
  final Uint8List salt = Uint8List.sublistView(record, 0, _kSaltLength);
  final Uint8List ephemeralPublicKey = Uint8List.sublistView(
    record,
    21,
    21 + kWebPushPublicKeyLength,
  );
  if (ephemeralPublicKey.isEmpty || ephemeralPublicKey[0] != 0x04) {
    return null;
  }
  const int cipherStart = 21 + kWebPushPublicKeyLength;
  if (record.length < cipherStart + _kTagLength) {
    return null;
  }
  final Uint8List cipherText = Uint8List.sublistView(
    record,
    cipherStart,
    record.length - _kTagLength,
  );
  final Uint8List tag = Uint8List.sublistView(
    record,
    record.length - _kTagLength,
  );
  try {
    final Uint8List shared = _sharedSecret(
      privateKey: privateKey,
      remotePublicKey: ephemeralPublicKey,
    );
    final Uint8List recipientPublicKey = _publicFromPrivate(privateKey);
    final _ContentKey contentKey = await _deriveContentKey(
      sharedSecret: shared,
      authSecret: authSecret,
      salt: salt,
      recipientPublicKey: recipientPublicKey,
      ephemeralPublicKey: ephemeralPublicKey,
    );
    final List<int> clear = await AesGcm.with128bits().decrypt(
      SecretBox(cipherText, nonce: contentKey.nonce, mac: Mac(tag)),
      secretKey: SecretKey(contentKey.cek),
    );
    return _unpad(clear);
  } on Object {
    return null;
  }
}

WebPushKeyPair _ephemeralKeyPair() {
  final ECKeyGenerator generator = ECKeyGenerator()
    ..init(
      castle.ParametersWithRandom(ECKeyGeneratorParameters(_p256), _fortuna()),
    );
  final castle.AsymmetricKeyPair<castle.PublicKey, castle.PrivateKey> pair =
      generator.generateKeyPair();
  final ECPublicKey publicKey = pair.publicKey as ECPublicKey;
  final ECPrivateKey privateKey = pair.privateKey as ECPrivateKey;
  return WebPushKeyPair(
    privateKey: _unsignedFixed(privateKey.d!, 32),
    publicKey: publicKey.Q!.getEncoded(false),
    authSecret: Uint8List(0),
  );
}

Uint8List _sharedSecret({
  required Uint8List privateKey,
  required Uint8List remotePublicKey,
}) {
  final ECPrivateKey local = ECPrivateKey(_bigInt(privateKey), _p256);
  final ECPoint? point = _p256.curve.decodePoint(remotePublicKey);
  if (point == null) {
    throw StateError('invalid P-256 point');
  }
  final ECDHBasicAgreement agreement = ECDHBasicAgreement()..init(local);
  return _unsignedFixed(
    agreement.calculateAgreement(ECPublicKey(point, _p256)),
    32,
  );
}

Uint8List _publicFromPrivate(Uint8List privateKey) {
  final ECPoint? point = _p256.G * _bigInt(privateKey);
  if (point == null) {
    throw StateError('invalid P-256 scalar');
  }
  return point.getEncoded(false);
}

Future<_ContentKey> _deriveContentKey({
  required Uint8List sharedSecret,
  required Uint8List authSecret,
  required Uint8List salt,
  required Uint8List recipientPublicKey,
  required Uint8List ephemeralPublicKey,
}) async {
  final Uint8List info = Uint8List.fromList(<int>[
    ..._info('WebPush: info'),
    ...recipientPublicKey,
    ...ephemeralPublicKey,
  ]);
  final Uint8List ikm = await _hkdf(
    ikm: sharedSecret,
    salt: authSecret,
    info: info,
    length: 32,
  );
  final Uint8List cek = await _hkdf(
    ikm: ikm,
    salt: salt,
    info: _info('Content-Encoding: aes128gcm'),
    length: 16,
  );
  final Uint8List nonce = await _hkdf(
    ikm: ikm,
    salt: salt,
    info: _info('Content-Encoding: nonce'),
    length: 12,
  );
  return _ContentKey(cek, nonce);
}

List<int> _info(String value) {
  return <int>[...value.codeUnits, 0];
}

Future<Uint8List> _hkdf({
  required List<int> ikm,
  required List<int> salt,
  required List<int> info,
  required int length,
}) async {
  final SecretKey key = await Hkdf(
    hmac: Hmac.sha256(),
    outputLength: length,
  ).deriveKey(secretKey: SecretKey(ikm), nonce: salt, info: info);
  return Uint8List.fromList(await key.extractBytes());
}

String? _unpad(List<int> clear) {
  var end = clear.length;
  while (end > 0 && clear[end - 1] == 0) {
    end--;
  }
  if (end == 0 || clear[end - 1] != _kPaddingDelimiter) {
    return null;
  }
  try {
    return utf8.decode(clear.sublist(0, end - 1));
  } on FormatException {
    return null;
  }
}

Uint8List _recordSizeBytes() {
  final ByteData data = ByteData(4)..setUint32(0, kWebPushRecordSize);
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

Uint8List _unsignedFixed(BigInt value, int length) {
  final Uint8List bytes = Uint8List(length);
  BigInt rest = value;
  for (var index = length - 1; index >= 0; index--) {
    bytes[index] = (rest & BigInt.from(0xff)).toInt();
    rest >>= 8;
  }
  return bytes;
}

BigInt _bigInt(Uint8List bytes) {
  var value = BigInt.zero;
  for (final int byte in bytes) {
    value = (value << 8) | BigInt.from(byte);
  }
  return value;
}

Uint8List _randomBytes(int length) {
  final Random random = Random.secure();
  return Uint8List.fromList(
    List<int>.generate(length, (_) => random.nextInt(256)),
  );
}

FortunaRandom _fortuna() {
  final FortunaRandom random = FortunaRandom()
    ..seed(castle.KeyParameter(_randomBytes(32)));
  return random;
}

final class _ContentKey {
  const _ContentKey(this.cek, this.nonce);

  final Uint8List cek;
  final Uint8List nonce;
}
