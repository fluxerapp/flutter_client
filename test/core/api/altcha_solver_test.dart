import 'dart:convert';

import 'package:altcha_lib/altcha_lib.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/altcha_pbkdf2.dart';
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
  group('altchaDeriveKey', () {
    final List<(ChallengeParameters, List<int>, List<int>)> vectors = [
      (_parameters(cost: 1), _bytes(16, 1), _bytes(20, 2)),
      (_parameters(cost: 2), _bytes(16, 3), _bytes(20, 4)),
      (_parameters(cost: 1000), _bytes(16, 5), _bytes(20, 6)),
      (_parameters(cost: 3000), _bytes(16, 7), _bytes(20, 8)),
      (_parameters(cost: 17, keyLength: 16), _bytes(51, 9), _bytes(64, 10)),
      (_parameters(cost: 5), _bytes(0, 0), _bytes(0, 0)),
      (_parameters(cost: 9), _bytes(52, 11), _bytes(20, 12)),
      (_parameters(cost: 9), _bytes(16, 13), _bytes(65, 14)),
      (
        _parameters(algorithm: 'PBKDF2/SHA-512', cost: 9, keyLength: 64),
        _bytes(16, 15),
        _bytes(20, 16),
      ),
    ];

    for (final (ChallengeParameters parameters, salt, password) in vectors) {
      test('matches altcha_lib deriveKey for cost ${parameters.cost}, '
          '${parameters.algorithm}, salt ${salt.length}, '
          'password ${password.length}', () async {
        final DeriveKeyResult fast = await altchaDeriveKey(
          parameters,
          salt,
          password,
        );
        final DeriveKeyResult reference = await deriveKey(
          parameters,
          salt,
          password,
        );
        expect(fast.derivedKey, reference.derivedKey);
      });
    }
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
