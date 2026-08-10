import 'dart:ui' show Offset, Size;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/features/shell/presentation/splash_reveal_overlay.dart';

void main() {
  group('SplashExitAllowed', () {
    test('starts closed and opens on allow', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(splashExitAllowedProvider), isFalse);

      container.read(splashExitAllowedProvider.notifier).allow();
      expect(container.read(splashExitAllowedProvider), isTrue);
    });

    test('reset closes the gate again', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(splashExitAllowedProvider.notifier).allow();
      container.read(splashExitAllowedProvider.notifier).reset();

      expect(container.read(splashExitAllowedProvider), isFalse);
    });
  });

  group('maxRevealRadius', () {
    test('covers all corners from center', () {
      const Size size = Size(400, 800);
      const Offset center = Offset(200, 400);

      final double radius = maxRevealRadius(size, center);

      expect(radius, closeTo(447.21, 0.01));
      expect(
        radius,
        greaterThanOrEqualTo((Offset(size.width, 0) - center).distance),
      );
    });
  });
}
