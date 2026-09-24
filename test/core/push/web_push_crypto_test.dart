import 'dart:typed_data';

import 'package:cryptography/cryptography.dart' as c;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/web_push/web_push_crypto.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/block/aes.dart';
import 'package:pointycastle/block/modes/gcm.dart';
import 'package:pointycastle/ecc/api.dart';
import 'package:pointycastle/ecc/curves/secp256r1.dart';

void main() {
  test('P-256 shared secret matches OpenSSL', () {
    final Uint8List shared = _sharedSecret(
      privateKey: _hex(
        '86be4ad6440b555fa5ecc2509609cae450ab9cc67b7f35de93a181bd39306f97',
      ),
      publicKey: _hex(
        '04ae555ca3b58bf190c84f1a2b302b03828e78588f261e3039e5a5136e454a5d'
        'e3b0d15b41e7ef8ced8e222af7e719ad48b015acd448ebb7f580addb86646daaa2',
      ),
    );
    expect(
      shared,
      _hex('e181b0c7fd92e33f500b0e3419441bc869ccd754a24e109de025506201b35674'),
    );
  });

  test('decrypts a record sealed independently of this client', () async {
    final Uint8List recipientPrivate = _hex(
      '7b54768260533234dab847e8f6c073815bcc935fcc14f16db69c32629ecf9cb3',
    );
    final Uint8List recipientPublic = _hex(
      '04ae555ca3b58bf190c84f1a2b302b03828e78588f261e3039e5a5136e454a5d'
      'e3b0d15b41e7ef8ced8e222af7e719ad48b015acd448ebb7f580addb86646daaa2',
    );
    final Uint8List ephemeralPublic = _hex(
      '04967351d1b21dfa8509d5a309cebeacb6c3522a6c5eeae8f77198c572b6814f'
      '376d2248af0bf7e71c6fa003e4cdeebc188f72e606ba2730f7bca5a2850bc0636b',
    );
    final Uint8List auth = _hex('00112233445566778899aabbccddeeff');
    final Uint8List salt = _hex('0102030405060708090a0b0c0d0e0f10');
    final Uint8List shared = _sharedSecret(
      privateKey: _hex(
        '86be4ad6440b555fa5ecc2509609cae450ab9cc67b7f35de93a181bd39306f97',
      ),
      publicKey: recipientPublic,
    );
    final Uint8List info = Uint8List.fromList(<int>[
      ...'WebPush: info'.codeUnits,
      0,
      ...recipientPublic,
      ...ephemeralPublic,
    ]);
    final Uint8List ikm = await _hkdf(
      ikm: shared,
      salt: auth,
      info: info,
      length: 32,
    );
    final Uint8List cek = await _hkdf(
      ikm: ikm,
      salt: salt,
      info: Uint8List.fromList(<int>[
        ...'Content-Encoding: aes128gcm'.codeUnits,
        0,
      ]),
      length: 16,
    );
    final Uint8List nonce = await _hkdf(
      ikm: ikm,
      salt: salt,
      info: Uint8List.fromList(<int>[
        ...'Content-Encoding: nonce'.codeUnits,
        0,
      ]),
      length: 12,
    );
    final Uint8List plaintext = Uint8List.fromList(<int>[
      ...'{"title":"Alice"}'.codeUnits,
    ]);
    const int paddedLength = kWebPushRecordSize - 16 - 86;
    final Uint8List padded = Uint8List(paddedLength)
      ..setRange(0, plaintext.length, plaintext)
      ..[plaintext.length] = 0x02;
    final GCMBlockCipher cipher = GCMBlockCipher(AESEngine())
      ..init(true, AEADParameters(KeyParameter(cek), 128, nonce, Uint8List(0)));
    final Uint8List sealed = cipher.process(padded);
    final Uint8List record = Uint8List.fromList(<int>[
      ...salt,
      0x00,
      0x00,
      0x0b,
      0x00,
      65,
      ...ephemeralPublic,
      ...sealed,
    ]);
    expect(record.length, kWebPushRecordSize);
    expect(
      await decryptWebPushRecord(
        record: record,
        privateKey: recipientPrivate,
        authSecret: auth,
      ),
      '{"title":"Alice"}',
    );
  });
}

Uint8List _sharedSecret({
  required Uint8List privateKey,
  required Uint8List publicKey,
}) {
  final ECDomainParameters domain = ECCurve_secp256r1();
  final ECPoint? point = domain.curve.decodePoint(publicKey);
  final ECDHBasicAgreement agreement = ECDHBasicAgreement()
    ..init(ECPrivateKey(_bigInt(privateKey), domain));
  final BigInt secret = agreement.calculateAgreement(
    ECPublicKey(point, domain),
  );
  return _unsigned(secret, 32);
}

Future<Uint8List> _hkdf({
  required List<int> ikm,
  required List<int> salt,
  required List<int> info,
  required int length,
}) async {
  final c.Mac prkMac = await c.Hmac.sha256().calculateMac(
    ikm,
    secretKey: c.SecretKey(salt),
  );
  final List<int> out = <int>[];
  List<int> block = <int>[];
  var counter = 1;
  while (out.length < length) {
    final c.Mac mac = await c.Hmac.sha256().calculateMac(<int>[
      ...block,
      ...info,
      counter,
    ], secretKey: c.SecretKey(prkMac.bytes));
    block = mac.bytes;
    out.addAll(block);
    counter++;
  }
  return Uint8List.fromList(out.sublist(0, length));
}

BigInt _bigInt(Uint8List bytes) {
  var value = BigInt.zero;
  for (final int byte in bytes) {
    value = (value << 8) | BigInt.from(byte);
  }
  return value;
}

Uint8List _unsigned(BigInt value, int length) {
  final Uint8List bytes = Uint8List(length);
  var rest = value;
  for (var index = length - 1; index >= 0; index--) {
    bytes[index] = (rest & BigInt.from(0xff)).toInt();
    rest >>= 8;
  }
  return bytes;
}

Uint8List _hex(String value) {
  final Uint8List bytes = Uint8List(value.length ~/ 2);
  for (var index = 0; index < bytes.length; index++) {
    bytes[index] = int.parse(
      value.substring(index * 2, index * 2 + 2),
      radix: 16,
    );
  }
  return bytes;
}
