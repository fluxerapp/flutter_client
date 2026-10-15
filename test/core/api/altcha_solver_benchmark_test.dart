@Tags(<String>['slow'])
library;

import 'dart:math';

import 'package:altcha_lib/altcha_lib.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/altcha_native_solver.dart';

const int _kServerDefaultCost = 5000;
const int _kServerDefaultMaxCounter = 1000;
const int _kWorkers = 4;
const int _kRuns = 3;

Future<Challenge> _serverDefaultChallenge(Random random) {
  return createChallenge(
    algorithm: 'PBKDF2/SHA-256',
    cost: _kServerDefaultCost,
    counter:
        _kServerDefaultMaxCounter ~/ 2 +
        random.nextInt(_kServerDefaultMaxCounter ~/ 2 + 1),
    deriveKey: deriveKey,
    hmacSignatureSecret: 'benchmark',
  );
}

Future<int> _timeNative(Challenge challenge) async {
  final Stopwatch stopwatch = Stopwatch()..start();
  final AltchaNativeSolution? solution = await solveAltchaNative(
    nonce: hexToBuffer(challenge.parameters.nonce),
    salt: hexToBuffer(challenge.parameters.salt),
    cost: challenge.parameters.cost,
    prefix: hexToBuffer(challenge.parameters.keyPrefix),
    workers: _kWorkers,
    timeout: const Duration(seconds: 60),
  );
  stopwatch.stop();
  expect(solution, isNotNull);
  return stopwatch.elapsedMilliseconds;
}

Future<int> _timeDart(Challenge challenge) async {
  final Stopwatch stopwatch = Stopwatch()..start();
  final Solution? solution = await solveChallengeIsolates(
    challenge: challenge,
    deriveKey: deriveKey,
    concurrency: _kWorkers,
  );
  stopwatch.stop();
  expect(solution, isNotNull);
  return stopwatch.elapsedMilliseconds;
}

void main() {
  test('native solver beats the Dart solver on the server default '
      'challenge', () async {
    final Random random = Random(7);
    final Challenge warmUp = await _serverDefaultChallenge(random);
    await _timeNative(warmUp);
    await _timeDart(warmUp);
    int nativeTotal = 0;
    int dartTotal = 0;
    for (int run = 0; run < _kRuns; run++) {
      final Challenge challenge = await _serverDefaultChallenge(random);
      nativeTotal += await _timeNative(challenge);
      dartTotal += await _timeDart(challenge);
    }
    final double nativeMs = nativeTotal / _kRuns;
    final double dartMs = dartTotal / _kRuns;
    debugPrint(
      'ALTCHA cost $_kServerDefaultCost, $_kWorkers workers: '
      'native ${nativeMs.toStringAsFixed(0)} ms, '
      'dart ${dartMs.toStringAsFixed(0)} ms, '
      '${(dartMs / max(nativeMs, 1)).toStringAsFixed(1)}x',
    );
    expect(nativeMs * 5, lessThan(dartMs));
  });
}
