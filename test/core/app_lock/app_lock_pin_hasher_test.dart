import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/app_lock/app_lock_pin_hasher.dart';

void main() {
  group('AppLockPinHasher', () {
    final AppLockPinHasher hasher = AppLockPinHasher(
      random: Random(7),
      iterations: 1000,
    );

    test('verifies the matching PIN', () async {
      final AppLockPinCredential credential = await hasher.create('123456');

      expect(await hasher.verify('123456', credential), isTrue);
    });

    test('rejects a different PIN', () async {
      final AppLockPinCredential credential = await hasher.create('123456');

      expect(await hasher.verify('123457', credential), isFalse);
      expect(await hasher.verify('000000', credential), isFalse);
    });

    test('never stores the PIN in plain text', () async {
      final AppLockPinCredential credential = await hasher.create('123456');

      expect(credential.hash, isNot(contains('123456')));
      expect(credential.salt, isNotEmpty);
    });

    test('uses a fresh salt for each credential', () async {
      final AppLockPinCredential first = await hasher.create('123456');
      final AppLockPinCredential second = await hasher.create('123456');

      expect(first.salt, isNot(second.salt));
      expect(first.hash, isNot(second.hash));
    });
  });
}
