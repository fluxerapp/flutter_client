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
}
