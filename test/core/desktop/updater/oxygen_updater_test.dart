import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/desktop/updater/oxygen_updater.dart';

void main() {
  test('builds channel/platform/arch update urls', () {
    expect(
      oxygenUpdateUrl(
        environment: AppBuildEnvironment.stable,
        abi: Abi.windowsX64,
      ),
      'https://pkgs.fluxer.com/oxygen/stable/win32/x64',
    );
    expect(
      oxygenUpdateUrl(
        environment: AppBuildEnvironment.beta,
        abi: Abi.macosArm64,
      ),
      'https://pkgs.fluxer.com/oxygen/beta/darwin/arm64',
    );
    expect(
      oxygenUpdateUrl(
        environment: AppBuildEnvironment.canary,
        abi: Abi.linuxArm64,
      ),
      'https://pkgs.fluxer.com/oxygen/canary/linux/arm64',
    );
  });

  test('returns null for unsupported abis', () {
    expect(
      oxygenUpdateUrl(
        environment: AppBuildEnvironment.stable,
        abi: Abi.androidArm64,
      ),
      isNull,
    );
  });

  test('maps full packages to their partial download name', () {
    expect(
      oxygenUpdatePartialFileName(
        'com.fluxer.oxygen.canary-2026.11.200-canary.3035-canary-full.nupkg',
      ),
      'com.fluxer.oxygen.canary-2026.11.200-canary.3035-canary-full.partial',
    );
  });

  test('locates the macos partial download', () {
    expect(
      oxygenUpdatePartialPaths(
        operatingSystem: 'macos',
        packageId: 'com.fluxer.oxygen.canary',
        fileName: 'oxygen-1-full.nupkg',
        executablePath: '/Applications/Fluxer.app/Contents/MacOS/Fluxer',
        home: '/Users/me',
      ),
      <String>[
        '/Users/me/Library/Caches/velopack/com.fluxer.oxygen.canary/packages/oxygen-1-full.partial',
      ],
    );
  });

  test('locates the linux partial download', () {
    expect(
      oxygenUpdatePartialPaths(
        operatingSystem: 'linux',
        packageId: 'com.fluxer.oxygen.canary',
        fileName: 'oxygen-1-full.nupkg',
        executablePath: '/tmp/.mount/usr/bin/fluxer',
        home: '/home/me',
      ),
      <String>[
        '/var/tmp/velopack/com.fluxer.oxygen.canary/packages/oxygen-1-full.partial',
      ],
    );
  });

  test('locates the windows partial download beside current', () {
    expect(
      oxygenUpdatePartialPaths(
        operatingSystem: 'windows',
        packageId: 'com.fluxer.oxygen.canary',
        fileName: 'oxygen-1-full.nupkg',
        executablePath: r'C:\Users\me\AppData\Local\Fluxer\current\Fluxer.exe',
        home: null,
      ),
      <String>[
        r'C:\Users\me\AppData\Local\Fluxer\packages\oxygen-1-full.partial',
      ],
    );
  });
}
