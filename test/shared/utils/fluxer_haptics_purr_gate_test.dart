import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

void main() {
  group('FluxerHapticPurrGate', () {
    late DateTime now;
    late FluxerHapticPurrGate gate;

    setUp(() {
      now = DateTime(2026);
      gate = FluxerHapticPurrGate(now: () => now);
    });

    test('allows the first purr', () {
      expect(gate.tryAcquire(), isTrue);
    });

    test('rejects purrs inside the min interval', () {
      expect(gate.tryAcquire(), isTrue);
      now = now.add(const Duration(seconds: 7));
      expect(gate.tryAcquire(), isFalse);
    });

    test('allows another purr after the min interval', () {
      expect(gate.tryAcquire(), isTrue);
      now = now.add(const Duration(seconds: 8));
      expect(gate.tryAcquire(), isTrue);
    });

    test('caps purrs inside the rolling window', () {
      expect(gate.tryAcquire(), isTrue);
      now = now.add(const Duration(seconds: 8));
      expect(gate.tryAcquire(), isTrue);
      now = now.add(const Duration(seconds: 8));
      expect(gate.tryAcquire(), isTrue);
      now = now.add(const Duration(seconds: 8));
      expect(gate.tryAcquire(), isFalse);
    });

    test('allows another purr once the oldest play leaves the window', () {
      expect(gate.tryAcquire(), isTrue);
      now = now.add(const Duration(seconds: 8));
      expect(gate.tryAcquire(), isTrue);
      now = now.add(const Duration(seconds: 8));
      expect(gate.tryAcquire(), isTrue);

      now = now.add(const Duration(seconds: 29));
      expect(gate.tryAcquire(), isTrue);
    });
  });
}
