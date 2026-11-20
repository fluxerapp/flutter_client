import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_background_budget.dart';
import 'package:fluxer_fcm/fcm_message_mapper.dart';

void main() {
  test('background data-only messages expose ciphertext and nothing else', () {
    final RemoteMessage input = RemoteMessage(
      messageId: 'bg-data',
      data: <String, String>{
        'v': '1',
        'p': 'ciphertext',
        'title': 'alice',
        'body': 'hello',
      },
    );
    expect(extractFcmCiphertext(input.data), 'ciphertext');
  });

  test(
    'a stalled background handler returns once its budget is spent',
    () async {
      final Stopwatch stopwatch = Stopwatch()..start();
      await runFcmBackgroundWithinBudget(
        () => Completer<void>().future,
        budget: const Duration(milliseconds: 50),
      );
      expect(stopwatch.elapsed, lessThan(const Duration(seconds: 5)));
    },
  );

  test('background handler errors never escape to the plugin', () async {
    await expectLater(
      runFcmBackgroundWithinBudget(() async => throw StateError('boom')),
      completes,
    );
  });
}
