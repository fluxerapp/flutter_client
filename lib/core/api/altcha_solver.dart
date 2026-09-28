import 'dart:convert';
import 'dart:io';

import 'package:altcha_lib/altcha_lib.dart';
import 'package:fluxer_app/core/api/altcha_pbkdf2.dart';
import 'package:fluxer_app/core/talker.dart';

const Duration _kSolveTimeout = Duration(seconds: 60);
const Duration _kSolveTimeoutGrace = Duration(seconds: 5);
const int _kMaxSolverIsolates = 6;
final RegExp _kHexBytes = RegExp(r'^(?:[0-9a-fA-F]{2})*$');
final RegExp _kHex = RegExp(r'^[0-9a-fA-F]*$');

Map<String, dynamic>? readAltchaChallenge(Object? body) {
  Object? data = body;
  if (data is String) {
    try {
      data = jsonDecode(data);
    } on FormatException {
      return null;
    }
  }
  if (data is! Map || data['captcha_provider'] != 'altcha') {
    return null;
  }
  final Object? challenge = data['altcha_challenge'];
  if (challenge is! Map || challenge['signature'] is! String) {
    return null;
  }
  final Object? parameters = challenge['parameters'];
  if (parameters is! Map ||
      !_isHex(parameters['nonce'], _kHexBytes) ||
      !_isHex(parameters['salt'], _kHexBytes) ||
      !_isHex(parameters['keyPrefix'], _kHex)) {
    return null;
  }
  return Map<String, dynamic>.from(challenge);
}

bool _isHex(Object? value, RegExp pattern) {
  return value is String && pattern.hasMatch(value);
}

Future<String?> solveAltchaChallenge(Map<String, dynamic> raw) async {
  try {
    final Map<String, dynamic> parameters = Map<String, dynamic>.from(
      raw['parameters'] as Map,
    );
    final Solution? solution = await solveChallengeIsolates(
      challenge: Challenge.fromJson(<String, dynamic>{
        'parameters': parameters,
        'signature': raw['signature'],
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
            'parameters': raw['parameters'],
            'signature': raw['signature'],
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
