import 'dart:ui' show Path, Rect;

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

  group('SplashRevealComplete', () {
    test('starts complete and can reset then complete again', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(splashRevealCompleteProvider), isTrue);

      container.read(splashRevealCompleteProvider.notifier).reset();
      expect(container.read(splashRevealCompleteProvider), isFalse);

      container.read(splashRevealCompleteProvider.notifier).complete();
      expect(container.read(splashRevealCompleteProvider), isTrue);
    });
  });

  group('splashRevealSymbolPath', () {
    test('parses the brand symbol into a bounded path', () {
      final Path path = splashRevealSymbolPath();
      final Rect bounds = path.getBounds();

      expect(bounds.width, greaterThan(200));
      expect(bounds.height, greaterThan(200));
      expect(bounds.left, greaterThanOrEqualTo(0));
      expect(bounds.top, greaterThanOrEqualTo(0));
      expect(
        bounds.right,
        lessThanOrEqualTo(SplashRevealOverlay.symbolViewBox),
      );
      expect(
        bounds.bottom,
        lessThanOrEqualTo(SplashRevealOverlay.symbolViewBox),
      );
    });
  });

  group('splashRevealLogoScale', () {
    test('keeps scale at 1 for reduced motion', () {
      expect(
        splashRevealLogoScale(
          0.5,
          reducedMotion: true,
          useLogoZoomTransition: true,
        ),
        1,
      );
      expect(
        splashRevealLogoScale(
          1,
          reducedMotion: true,
          useLogoZoomTransition: true,
        ),
        1,
      );
    });

    test('pulses then expands for full motion with zoom', () {
      expect(
        splashRevealLogoScale(
          0,
          reducedMotion: false,
          useLogoZoomTransition: true,
        ),
        1,
      );
      expect(
        splashRevealLogoScale(
          SplashRevealOverlay.pulseEndFraction,
          reducedMotion: false,
          useLogoZoomTransition: true,
        ),
        closeTo(SplashRevealOverlay.pulseScale, 0.001),
      );
      expect(
        splashRevealLogoScale(
          1,
          reducedMotion: false,
          useLogoZoomTransition: true,
        ),
        SplashRevealOverlay.expandScale,
      );
    });

    test('fades instead of expanding when zoom is disabled', () {
      expect(
        splashRevealLogoScale(
          1,
          reducedMotion: false,
          useLogoZoomTransition: false,
        ),
        SplashRevealOverlay.fadeEndScale,
      );
    });
  });

  group('splashRevealLayerOpacity', () {
    test('fades out for reduced motion', () {
      expect(splashRevealLayerOpacity(0, reducedMotion: true), 1);
      expect(splashRevealLayerOpacity(1, reducedMotion: true), 0);
      expect(splashRevealLayerOpacity(0.5, reducedMotion: true), lessThan(1));
    });

    test('holds then fades on outro keyframes with zoom', () {
      expect(splashRevealLayerOpacity(0, reducedMotion: false), 1);
      expect(splashRevealLayerOpacity(0.08, reducedMotion: false), 1);
      expect(splashRevealLayerOpacity(0.2, reducedMotion: false), lessThan(1));
      expect(splashRevealLayerOpacity(1, reducedMotion: false), 0);
    });

    test('fades during outro when zoom is disabled', () {
      expect(splashRevealLayerOpacity(0.2, reducedMotion: false), lessThan(1));
    });
  });

  group('splashRevealShellScale', () {
    test('stays at 1 for reduced motion', () {
      expect(
        splashRevealShellScale(
          0,
          reducedMotion: true,
          useLogoZoomTransition: true,
        ),
        1,
      );
      expect(
        splashRevealShellScale(
          0.5,
          reducedMotion: true,
          useLogoZoomTransition: true,
        ),
        1,
      );
    });

    test('settles from 1.1 to 1 with zoom', () {
      expect(
        splashRevealShellScale(
          0,
          reducedMotion: false,
          useLogoZoomTransition: true,
        ),
        SplashRevealOverlay.shellStartScale,
      );
      expect(
        splashRevealShellScale(
          1,
          reducedMotion: false,
          useLogoZoomTransition: true,
        ),
        1,
      );
    });

    test('stays at 1 when zoom is disabled', () {
      expect(
        splashRevealShellScale(
          0,
          reducedMotion: false,
          useLogoZoomTransition: false,
        ),
        1,
      );
    });
  });
}
