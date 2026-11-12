import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:velopack_flutter/velopack_flutter.dart' as velopack;

const String kOxygenUpdateBaseUrl = 'https://pkgs.fluxer.com/oxygen';

@visibleForTesting
String? oxygenUpdatePlatform(Abi abi) {
  return switch (abi) {
    Abi.windowsX64 || Abi.windowsArm64 => 'win32',
    Abi.macosX64 || Abi.macosArm64 => 'darwin',
    Abi.linuxX64 || Abi.linuxArm64 => 'linux',
    _ => null,
  };
}

@visibleForTesting
String? oxygenUpdateArch(Abi abi) {
  return switch (abi) {
    Abi.windowsX64 || Abi.macosX64 || Abi.linuxX64 => 'x64',
    Abi.windowsArm64 || Abi.macosArm64 || Abi.linuxArm64 => 'arm64',
    _ => null,
  };
}

String? oxygenUpdateUrl({
  required AppBuildEnvironment environment,
  required Abi abi,
}) {
  final String? platform = oxygenUpdatePlatform(abi);
  final String? arch = oxygenUpdateArch(abi);
  if (platform == null || arch == null) {
    return null;
  }
  return '$kOxygenUpdateBaseUrl/${environment.name}/$platform/$arch';
}

class OxygenUpdater {
  OxygenUpdater._();

  static bool _initialized = false;

  static bool get isInitialized => _initialized;

  static Future<void> initialize() async {
    if (_initialized) {
      return;
    }
    final String? url = oxygenUpdateUrl(
      environment: AppBuildConfig.environment,
      abi: Abi.current(),
    );
    if (url == null) {
      return;
    }
    await velopack.initializeVelopack(url: url);
    try {
      await velopack.currentVersion();
    } on Object {
      return;
    }
    _initialized = true;
  }

  static Future<bool> isUpdateAvailable() => velopack.isUpdateAvailable();

  static Future<bool> prepareUpdateOnExit() async {
    if (!await velopack.isUpdateAvailable()) {
      return false;
    }
    await velopack.waitExitThenUpdate(silent: false, restart: true);
    return true;
  }
}
