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

  group('splashRevealLogoScale', () {
    test('keeps scale at 1 for reduced motion', () {
      expect(splashRevealLogoScale(0.5, reducedMotion: true), 1);
      expect(splashRevealLogoScale(1, reducedMotion: true), 1);
    });

    test('pulses then expands for full motion', () {
      expect(splashRevealLogoScale(0, reducedMotion: false), 1);
      expect(
        splashRevealLogoScale(
          SplashRevealOverlay.pulseEndFraction,
          reducedMotion: false,
        ),
        closeTo(SplashRevealOverlay.pulseScale, 0.001),
      );
      final double endScale = SplashRevealOverlay.useLogoZoomTransition
          ? SplashRevealOverlay.expandScale
          : SplashRevealOverlay.pulseScale;
      expect(splashRevealLogoScale(1, reducedMotion: false), endScale);
    });
  });

  group('splashRevealLayerOpacity', () {
    test('fades out for reduced motion', () {
      expect(splashRevealLayerOpacity(0, reducedMotion: true), 1);
      expect(splashRevealLayerOpacity(1, reducedMotion: true), 0);
      expect(splashRevealLayerOpacity(0.5, reducedMotion: true), lessThan(1));
    });

    test('holds then fades on outro keyframes', () {
      expect(splashRevealLayerOpacity(0, reducedMotion: false), 1);
      if (SplashRevealOverlay.useLogoZoomTransition) {
        expect(splashRevealLayerOpacity(0.2, reducedMotion: false), 1);
      } else {
        expect(
          splashRevealLayerOpacity(0.2, reducedMotion: false),
          lessThan(1),
        );
      }
      expect(splashRevealLayerOpacity(1, reducedMotion: false), 0);
    });
  });

  group('splashRevealShellScale', () {
    test('stays at 1 for reduced motion', () {
      expect(splashRevealShellScale(0, reducedMotion: true), 1);
      expect(splashRevealShellScale(0.5, reducedMotion: true), 1);
    });

    test('settles from 1.1 to 1', () {
      final double startScale = SplashRevealOverlay.useLogoZoomTransition
          ? SplashRevealOverlay.shellStartScale
          : 1;
      expect(splashRevealShellScale(0, reducedMotion: false), startScale);
      expect(splashRevealShellScale(1, reducedMotion: false), 1);
    });
  });
}
