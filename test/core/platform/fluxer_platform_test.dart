import 'dart:ui' show Size;

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

  group('isFluxerRuntimeMobileFormFactorFromLogicalSize', () {
    test('treats an empty first-frame size as desktop', () {
      expect(
        isFluxerRuntimeMobileFormFactorFromLogicalSize(Size.zero),
        isFalse,
      );
      expect(
        isFluxerRuntimeMobileFormFactorFromLogicalSize(const Size(0, 800)),
        isFalse,
      );
    });

    test('treats a compact window as mobile form factor', () {
      expect(
        isFluxerRuntimeMobileFormFactorFromLogicalSize(const Size(390, 844)),
        isTrue,
      );
    });

    test('treats a wide window as desktop form factor', () {
      expect(
        isFluxerRuntimeMobileFormFactorFromLogicalSize(const Size(1280, 720)),
        isFalse,
      );
    });
  });

  test('reports every desktop os as a desktop client and device', () {
    for (final TargetPlatform platform in <TargetPlatform>[
      TargetPlatform.linux,
      TargetPlatform.macOS,
      TargetPlatform.windows,
    ]) {
      expect(resolveClientPlatform(platform), 'desktop');
      expect(resolveDeviceClass(platform), 'desktop');
    }
  });

  test('reports phones as mobile devices', () {
    expect(resolveDeviceClass(TargetPlatform.android), 'mobile');
    expect(resolveDeviceClass(TargetPlatform.iOS), 'mobile');
  });

  group('buildFluxerClientUserAgent', () {
    String userAgentFor(
      TargetPlatform platform, {
      String osVersion = '',
      String distribution = '',
    }) => buildFluxerClientUserAgent(
      clientPlatform: resolveClientPlatform(platform),
      clientVersion: '1.0.0',
      releaseChannel: 'beta',
      systemToken: resolveUserAgentSystemToken(
        platform,
        osVersion: osVersion,
        distribution: distribution,
      ),
    );

    test('names desktop clients Fluxer Oxygen with their real os', () {
      expect(
        userAgentFor(TargetPlatform.macOS, osVersion: '27.2.0'),
        'Fluxer Oxygen/1.0.0 (Macintosh; Mac OS X 27.2.0; beta)',
      );
      expect(
        userAgentFor(TargetPlatform.windows, osVersion: '10.0.26100'),
        'Fluxer Oxygen/1.0.0 (Windows NT 10.0.26100; beta)',
      );
      expect(
        userAgentFor(
          TargetPlatform.linux,
          osVersion: '24.04.1 LTS (Noble Numbat)',
          distribution: 'Ubuntu',
        ),
        'Fluxer Oxygen/1.0.0 (Linux; Ubuntu 24.04.1; beta)',
      );
    });

    test('still names the os when details are missing', () {
      expect(
        userAgentFor(TargetPlatform.macOS),
        'Fluxer Oxygen/1.0.0 (Macintosh; beta)',
      );
      expect(
        userAgentFor(TargetPlatform.windows),
        'Fluxer Oxygen/1.0.0 (Windows NT; beta)',
      );
      expect(
        userAgentFor(TargetPlatform.linux, distribution: 'Linux'),
        'Fluxer Oxygen/1.0.0 (Linux; beta)',
      );
    });

    test('drops kernel strings and unsafe distribution characters', () {
      expect(
        userAgentFor(
          TargetPlatform.linux,
          osVersion: 'Linux 6.11.0-arch1-1 #1 SMP PREEMPT_DYNAMIC',
          distribution: 'Arch Linux',
        ),
        'Fluxer Oxygen/1.0.0 (Linux; Arch Linux; beta)',
      );
      expect(
        userAgentFor(
          TargetPlatform.linux,
          osVersion: '12 (bookworm)',
          distribution: 'Debian GNU/Linux\r\n (é)',
        ),
        'Fluxer Oxygen/1.0.0 (Linux; Debian GNU Linux 12; beta)',
      );
    });

    test('keeps the mobile user agents unchanged', () {
      expect(
        userAgentFor(TargetPlatform.android),
        'Fluxer Android/1.0.0 (beta)',
      );
      expect(userAgentFor(TargetPlatform.iOS), 'Fluxer iOS/1.0.0 (beta)');
    });

    test('omits missing parts', () {
      expect(
        buildFluxerClientUserAgent(
          clientPlatform: 'desktop',
          clientVersion: null,
          releaseChannel: null,
        ),
        'Fluxer Oxygen',
      );
    });
  });
}
