import 'dart:convert';
import 'dart:typed_data';

import 'package:altcha_lib/altcha_lib.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/altcha_native_solver.dart';
import 'package:fluxer_app/core/api/altcha_solver.dart';

const String _signatureSecret = 'test-signature-secret';
const String _keySignatureSecret = 'test-key-signature-secret';

ChallengeParameters _parameters({
  required int cost,
  String algorithm = 'PBKDF2/SHA-256',
  int keyLength = 32,
}) {
  return ChallengeParameters(
    algorithm: algorithm,
    nonce: '00',
    salt: '00',
    cost: cost,
    keyLength: keyLength,
    keyPrefix: '00',
  );
}

List<int> _bytes(int length, int seed) {
  return List<int>.generate(length, (int i) => (i * 31 + seed) & 0xff);
}

Map<String, dynamic> _validChallengeParameters([
  Map<String, dynamic> overrides = const <String, dynamic>{},
]) {
  return <String, dynamic>{
    'algorithm': 'PBKDF2/SHA-256',
    'cost': 1000,
    'keyLength': 32,
    'nonce': '0a1b',
    'salt': 'c2d3',
    'keyPrefix': '00',
    ...overrides,
  };
}

void main() {
  group('solveAltchaNative', () {
    final List<(int cost, int nonceBytes, int saltBytes, int counter)> cases = [
      (1, 16, 16, 0),
      (2, 16, 16, 3),
      (1000, 16, 16, 37),
      (5000, 16, 16, 21),
      (17, 0, 0, 9),
      (9, 60, 51, 14),
      (3, 1, 1, 64),
    ];

    for (final (int cost, int nonceBytes, int saltBytes, int counter)
        in cases) {
      test('finds counter $counter for cost $cost, nonce $nonceBytes, '
          'salt $saltBytes', () async {
        final Uint8List nonce = Uint8List.fromList(_bytes(nonceBytes, cost));
        final Uint8List salt = Uint8List.fromList(_bytes(saltBytes, counter));
        final DeriveKeyResult expected = await deriveKey(
          _parameters(cost: cost),
          salt,
          <int>[
            ...nonce,
            ...(ByteData(4)..setUint32(0, counter)).buffer.asUint8List(),
          ],
        );
        final AltchaNativeSolution? solution = await solveAltchaNative(
          nonce: nonce,
          salt: salt,
          cost: cost,
          prefix: Uint8List.fromList(expected.derivedKey.sublist(0, 16)),
          workers: 3,
          timeout: const Duration(seconds: 30),
        );
        expect(solution?.counter, counter);
        expect(solution?.key, expected.derivedKey);
      });
    }

    test('stops at the deadline when no counter matches', () async {
      final AltchaNativeSolution? solution = await solveAltchaNative(
        nonce: Uint8List(16),
        salt: Uint8List(16),
        cost: 1000,
        prefix: Uint8List(32)..fillRange(0, 32, 0xff),
        workers: 2,
        timeout: const Duration(milliseconds: 50),
      );
      expect(solution, isNull);
    });
  });

  test('solves a signed challenge into a verifiable token', () async {
    final Challenge challenge = await createChallenge(
      algorithm: 'PBKDF2/SHA-256',
      cost: 1000,
      counter: 73,
      deriveKey: deriveKey,
      expiresAt: DateTime.now().add(const Duration(minutes: 10)),
      hmacSignatureSecret: _signatureSecret,
      hmacKeySignatureSecret: _keySignatureSecret,
    );
    final String body = jsonEncode(<String, dynamic>{
      'code': 'CAPTCHA_REQUIRED',
      'message': 'Verification required. Try again.',
      'captcha_provider': 'altcha',
      'altcha_challenge': challenge.toJson(),
    });

    final Map<String, dynamic>? raw = parseAltchaChallenge(body).challenge;
    expect(raw, isNotNull);

    final String? token = await solveAltchaChallenge(raw!);
    expect(token, isNotNull);

    final Map<String, dynamic> decoded =
        jsonDecode(utf8.decode(base64Decode(token!))) as Map<String, dynamic>;
    expect(
      (decoded['challenge'] as Map<String, dynamic>)['parameters'],
      raw['parameters'],
    );

    final Payload payload = Payload.fromJson(decoded);
    expect(payload.solution.counter, 73);

    final VerifySolutionResult viaKeySignature = await verifySolution(
      challenge: payload.challenge,
      solution: payload.solution,
      deriveKey: deriveKey,
      hmacSignatureSecret: _signatureSecret,
      hmacKeySignatureSecret: _keySignatureSecret,
    );
    expect(viaKeySignature.verified, isTrue);

    final VerifySolutionResult viaDerivation = await verifySolution(
      challenge: payload.challenge,
      solution: payload.solution,
      deriveKey: deriveKey,
      hmacSignatureSecret: _signatureSecret,
    );
    expect(viaDerivation.verified, isTrue);
  });

  test('solves challenges the native solver does not cover', () async {
    final Challenge challenge = await createChallenge(
      algorithm: 'PBKDF2/SHA-512',
      cost: 10,
      counter: 5,
      deriveKey: deriveKey,
      expiresAt: DateTime.now().add(const Duration(minutes: 10)),
      hmacSignatureSecret: _signatureSecret,
      hmacKeySignatureSecret: _keySignatureSecret,
      keyLength: 64,
    );

    final String? token = await solveAltchaChallenge(challenge.toJson());
    expect(token, isNotNull);

    final Payload payload = Payload.fromJson(
      jsonDecode(utf8.decode(base64Decode(token!))) as Map<String, dynamic>,
    );
    expect(payload.solution.counter, 5);
    final VerifySolutionResult result = await verifySolution(
      challenge: payload.challenge,
      solution: payload.solution,
      deriveKey: deriveKey,
      hmacSignatureSecret: _signatureSecret,
    );
    expect(result.verified, isTrue);
  });

  test('ignores bodies without an altcha challenge', () {
    expect(parseAltchaChallenge(null).challenge, isNull);
    expect(parseAltchaChallenge('not json').challenge, isNull);
    expect(
      parseAltchaChallenge(<String, dynamic>{
        'code': 'CAPTCHA_REQUIRED',
        'message': 'Verification required. Try again.',
      }).challenge,
      isNull,
    );
    expect(
      parseAltchaChallenge(<String, dynamic>{
        'captcha_provider': 'none',
        'altcha_challenge': <String, dynamic>{
          'parameters': <String, dynamic>{},
          'signature': 'abc',
        },
      }).challenge,
      isNull,
    );
  });

  test('ignores challenges whose nonce, salt or key prefix is not hex', () {
    Map<String, dynamic> body(Map<String, dynamic> overrides) {
      return <String, dynamic>{
        'captcha_provider': 'altcha',
        'altcha_challenge': <String, dynamic>{
          'parameters': _validChallengeParameters(overrides),
          'signature': 'abc',
        },
      };
    }

    expect(
      parseAltchaChallenge(body(<String, dynamic>{})).challenge,
      isNotNull,
    );
    expect(
      parseAltchaChallenge(body(<String, dynamic>{'nonce': 'abc'})).challenge,
      isNull,
    );
    expect(
      parseAltchaChallenge(body(<String, dynamic>{'salt': 'zz'})).challenge,
      isNull,
    );
    expect(
      parseAltchaChallenge(body(<String, dynamic>{'nonce': null})).challenge,
      isNull,
    );
    expect(
      parseAltchaChallenge(
        body(<String, dynamic>{'keyPrefix': 'g0'}),
      ).challenge,
      isNull,
    );
  });

  test('rejects challenges with unsupported or out-of-range parameters', () {
    Map<String, dynamic> body(Map<String, dynamic> parameterOverrides) {
      return <String, dynamic>{
        'captcha_provider': 'altcha',
        'altcha_challenge': <String, dynamic>{
          'parameters': _validChallengeParameters(parameterOverrides),
          'signature': 'abc',
        },
      };
    }

    expect(
      parseAltchaChallenge(
        body(<String, dynamic>{'cost': kAltchaMaxCost + 1}),
      ).rejectionReason,
      'challenge cost is out of range',
    );
    expect(
      parseAltchaChallenge(
        body(<String, dynamic>{'algorithm': 'PBKDF2/SHA-999'}),
      ).rejectionReason,
      'challenge algorithm is not supported',
    );
    expect(
      parseAltchaChallenge(
        body(<String, dynamic>{'keyLength': kAltchaMaxKeyLength + 1}),
      ).rejectionReason,
      'challenge keyLength is out of range',
    );
    expect(
      parseAltchaChallenge(
        body(<String, dynamic>{'cost': 1000.0, 'keyLength': 32.0}),
      ).challenge,
      isNotNull,
    );
  });
}
