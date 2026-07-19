import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';

void main() {
  group('isFluxerMobileFormFactorShortestSide', () {
    test('returns true below the mobile breakpoint', () {
      expect(isFluxerMobileFormFactorShortestSide(599), isTrue);
    });

    test('returns false at or above the mobile breakpoint', () {
      expect(isFluxerMobileFormFactorShortestSide(600), isFalse);
      expect(isFluxerMobileFormFactorShortestSide(1280), isFalse);
    });
  });

  group('resolveClientPlatform', () {
    test('reports linux mobile form factor as linux client platform', () {
      expect(
        resolveClientPlatform(TargetPlatform.linux, mobileFormFactor: true),
        'linux',
      );
    });

    test('reports desktop linux as desktop client platform', () {
      expect(resolveClientPlatform(TargetPlatform.linux), 'desktop');
    });
  });

  group('resolveDeviceClass', () {
    test('reports mobile form factor on desktop os as mobile device class', () {
      expect(
        resolveDeviceClass(TargetPlatform.linux, mobileFormFactor: true),
        'mobile',
      );
      expect(
        resolveDeviceClass(TargetPlatform.macOS, mobileFormFactor: true),
        'mobile',
      );
    });

    test('reports desktop form factor as desktop device class', () {
      expect(resolveDeviceClass(TargetPlatform.linux), 'desktop');
    });
  });

  group('buildFluxerClientUserAgent', () {
    test('uses Fluxer Linux label for linux mobile platform', () {
      expect(
        buildFluxerClientUserAgent(
          clientPlatform: 'linux',
          clientVersion: '1.0.0',
          releaseChannel: 'beta',
        ),
        'Fluxer Linux/1.0.0 (beta)',
      );
    });
  });
}
