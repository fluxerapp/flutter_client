import 'dart:convert';
import 'dart:io';

import 'package:altcha_lib/altcha_lib.dart';
import 'package:fluxer_app/core/api/altcha_pbkdf2.dart';
import 'package:fluxer_app/core/talker.dart';

const Duration _kSolveTimeout = Duration(seconds: 60);
const Duration _kSolveTimeoutGrace = Duration(seconds: 5);
const int _kMaxSolverIsolates = 6;

const int kAltchaMinCost = 1;
const int kAltchaMaxCost = 500000;
const int kAltchaMinKeyLength = 1;
const int kAltchaMaxKeyLength = 64;
const int kAltchaMaxHexFieldLength = 512;

const Set<String> kAltchaAllowedAlgorithms = <String>{
  'PBKDF2/SHA-256',
  'PBKDF2/SHA-384',
  'PBKDF2/SHA-512',
  'SHA-256',
  'SHA-384',
  'SHA-512',
  'SCRYPT',
  'ARGON2ID',
};

final Set<String> _kAltchaAllowedAlgorithmsNormalized = kAltchaAllowedAlgorithms
    .map((String a) => a.toUpperCase())
    .toSet();

bool _isAllowedAltchaAlgorithm(String algorithm) {
  return _kAltchaAllowedAlgorithmsNormalized.contains(algorithm.toUpperCase());
}

final RegExp _kHexBytes = RegExp(r'^(?:[0-9a-fA-F]{2})*$');
final RegExp _kHex = RegExp(r'^[0-9a-fA-F]*$');

class AltchaChallengeParseResult {
  const AltchaChallengeParseResult({this.challenge, this.rejectionReason});

  final Map<String, dynamic>? challenge;
  final String? rejectionReason;
}

AltchaChallengeParseResult parseAltchaChallenge(Object? body) {
  Object? data = body;
  if (data is String) {
    try {
      data = jsonDecode(data);
    } on FormatException {
      return const AltchaChallengeParseResult(
        rejectionReason: 'response body is not JSON',
      );
    }
  }
  if (data is! Map) {
    return const AltchaChallengeParseResult(
      rejectionReason: 'response body is not an object',
    );
  }
  if (data['captcha_provider'] != 'altcha') {
    return const AltchaChallengeParseResult(
      rejectionReason: 'captcha_provider is not altcha',
    );
  }
  final Object? challenge = data['altcha_challenge'];
  if (challenge is! Map) {
    return const AltchaChallengeParseResult(
      rejectionReason: 'altcha_challenge is missing or not an object',
    );
  }
  if (challenge['signature'] is! String) {
    return const AltchaChallengeParseResult(
      rejectionReason: 'challenge signature is missing',
    );
  }
  final Object? parameters = challenge['parameters'];
  if (parameters is! Map) {
    return const AltchaChallengeParseResult(
      rejectionReason: 'challenge parameters are missing',
    );
  }
  final String? parameterRejection = _validateChallengeParameters(parameters);
  if (parameterRejection != null) {
    return AltchaChallengeParseResult(rejectionReason: parameterRejection);
  }
  return AltchaChallengeParseResult(
    challenge: Map<String, dynamic>.from(challenge),
  );
}

String? _validateChallengeParameters(Map<dynamic, dynamic> parameters) {
  final Object? algorithm = parameters['algorithm'];
  if (algorithm is! String || algorithm.isEmpty) {
    return 'challenge algorithm is missing';
  }
  if (!_isAllowedAltchaAlgorithm(algorithm)) {
    return 'challenge algorithm is not supported';
  }
  final int? cost = _readBoundedInt(
    parameters['cost'],
    min: kAltchaMinCost,
    max: kAltchaMaxCost,
  );
  if (cost == null) {
    return 'challenge cost is out of range';
  }
  final int? keyLength = _readBoundedInt(
    parameters['keyLength'],
    min: kAltchaMinKeyLength,
    max: kAltchaMaxKeyLength,
  );
  if (keyLength == null) {
    return 'challenge keyLength is out of range';
  }
  if (!_isHexField(parameters['nonce'], _kHexBytes)) {
    return 'challenge nonce is not valid hex';
  }
  if (!_isHexField(parameters['salt'], _kHexBytes)) {
    return 'challenge salt is not valid hex';
  }
  if (!_isHexField(parameters['keyPrefix'], _kHex, allowEmpty: true)) {
    return 'challenge keyPrefix is not valid hex';
  }
  final Object? memoryCost = parameters['memoryCost'];
  if (memoryCost != null && memoryCost is! int) {
    return 'challenge memoryCost is invalid';
  }
  final Object? parallelism = parameters['parallelism'];
  if (parallelism != null && parallelism is! int) {
    return 'challenge parallelism is invalid';
  }
  return null;
}

int? _readBoundedInt(Object? value, {required int min, required int max}) {
  if (value is! num || value != value.roundToDouble()) {
    return null;
  }
  final int parsed = value.toInt();
  if (parsed < min || parsed > max) {
    return null;
  }
  return parsed;
}

bool _isHexField(Object? value, RegExp pattern, {bool allowEmpty = false}) {
  if (value is! String) {
    return false;
  }
  if (!allowEmpty && value.isEmpty) {
    return false;
  }
  if (value.length > kAltchaMaxHexFieldLength) {
    return false;
  }
  return pattern.hasMatch(value);
}

Future<String?> solveAltchaChallenge(Map<String, dynamic> raw) async {
  final Map<String, dynamic>? challenge = parseAltchaChallenge(
    <String, dynamic>{'captcha_provider': 'altcha', 'altcha_challenge': raw},
  ).challenge;
  if (challenge == null) {
    return null;
  }
  try {
    final Map<String, dynamic> parameterMap = Map<String, dynamic>.from(
      challenge['parameters'] as Map,
    );
    final Solution? solution = await solveChallengeIsolates(
      challenge: Challenge.fromJson(<String, dynamic>{
        'parameters': parameterMap,
        'signature': challenge['signature'],
      }),
      deriveKey: altchaDeriveKey,
      concurrency: (Platform.numberOfProcessors - 1).clamp(
        2,
        _kMaxSolverIsolates,
      ),
      timeout: _kSolveTimeout,
    ).timeout(_kSolveTimeout + _kSolveTimeoutGrace, onTimeout: () => null);
    if (solution == null) {
      return null;
    }
    return base64Encode(
      utf8.encode(
        jsonEncode(<String, dynamic>{
          'challenge': <String, dynamic>{
            'parameters': challenge['parameters'],
            'signature': challenge['signature'],
          },
          'solution': solution.toJson(),
        }),
      ),
    );
  } on Object catch (e, st) {
    talker.warning('[AltchaSolver] Solve failed: $e\n$st');
    return null;
  }
}
