import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:path/path.dart' as p;
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

@visibleForTesting
List<String> oxygenUpdatePartialPaths({
  required String operatingSystem,
  required String packageId,
  required String fileName,
  required String executablePath,
  required String? home,
}) {
  final String partialName = oxygenUpdatePartialFileName(fileName);
  return switch (operatingSystem) {
    'macos' when home != null => <String>[
      p.posix.join(
        home,
        'Library/Caches/velopack',
        packageId,
        'packages',
        partialName,
      ),
    ],
    'linux' => <String>[
      p.posix.join('/var/tmp/velopack', packageId, 'packages', partialName),
    ],
    'windows' => <String>[
      p.windows.join(
        p.windows.dirname(p.windows.dirname(executablePath)),
        'packages',
        partialName,
      ),
    ],
    _ => const <String>[],
  };
}

@visibleForTesting
String oxygenUpdatePartialFileName(String fileName) {
  const String suffix = '.nupkg';
  final String base = fileName.endsWith(suffix)
      ? fileName.substring(0, fileName.length - suffix.length)
      : fileName;
  return '$base.partial';
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

  static Future<bool> downloadUpdate({
    required void Function(double progress) onProgress,
  }) async {
    final velopack.UpdateInfo? info = await velopack.getLatestUpdateInfo();
    if (info == null) {
      return false;
    }
    final velopack.VelopackAsset asset = info.targetFullRelease;
    final List<File> partials = oxygenUpdatePartialPaths(
      operatingSystem: Platform.operatingSystem,
      packageId: asset.packageId,
      fileName: asset.fileName,
      executablePath: Platform.resolvedExecutable,
      home: Platform.environment['HOME'],
    ).map(File.new).toList();
    for (final File partial in partials) {
      try {
        partial.deleteSync();
      } on FileSystemException {
        continue;
      }
    }
    final double total = asset.size.toDouble();
    double reported = 0;
    void report(double value) {
      final double clamped = value.clamp(0, 1).toDouble();
      if (clamped > reported) {
        reported = clamped;
        onProgress(clamped);
      }
    }

    final Timer? poll = total <= 0
        ? null
        : Timer.periodic(const Duration(milliseconds: 250), (_) {
            for (final File partial in partials) {
              try {
                report(partial.lengthSync() / total);
                return;
              } on FileSystemException {
                continue;
              }
            }
          });
    try {
      await velopack.checkAndDownloadUpdatesWithProgress().forEach(
        (int percent) => report(percent / 100),
      );
    } finally {
      poll?.cancel();
    }
    report(1);
    return true;
  }

  static Future<void> applyUpdateOnExit() =>
      velopack.waitExitThenUpdate(silent: false, restart: true);
}
