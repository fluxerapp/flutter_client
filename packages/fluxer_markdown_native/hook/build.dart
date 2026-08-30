import 'dart:io';

import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';

/// Cargo-builds the vendored Rust parser for the requested target and
/// bundles it as a code asset resolved by `src/bindings.dart`.
void main(List<String> args) async {
  await build(args, (input, output) async {
    if (!input.config.buildCodeAssets) {
      return;
    }
    final code = input.config.code;
    final triple = _rustTriple(code);
    // The crate builds in place inside the fluxer monorepo submodule; the
    // size-tuned release profile is injected via env because the workspace
    // manifest is upstream's and stays unpatched.
    final crateRoot = input.packageRoot.resolve(
      '../../fluxer/packages/markdown_parser/rust/',
    );
    final targetDir = input.outputDirectoryShared.resolve('cargo-target/');

    final environment = <String, String>{
      'CARGO_TARGET_DIR': targetDir.toFilePath(),
      'CARGO_PROFILE_RELEASE_OPT_LEVEL': 'z',
      'CARGO_PROFILE_RELEASE_LTO': 'fat',
      'CARGO_PROFILE_RELEASE_CODEGEN_UNITS': '1',
      'CARGO_PROFILE_RELEASE_STRIP': 'symbols',
    };
    final linker = _linkerFor(code);
    if (linker != null) {
      final envTriple = triple.toUpperCase().replaceAll('-', '_');
      environment['CARGO_TARGET_${envTriple}_LINKER'] = linker.toFilePath();
    }
    if (code.targetOS == OS.iOS) {
      environment['IPHONEOS_DEPLOYMENT_TARGET'] = '${code.iOS.targetVersion}';
    }
    if (code.targetOS == OS.macOS) {
      environment['MACOSX_DEPLOYMENT_TARGET'] = '${code.macOS.targetVersion}';
    }

    final ProcessResult result;
    try {
      result = await Process.run(
        'cargo',
        <String>['build', '--release', '--locked', '--lib', '--target', triple],
        workingDirectory: crateRoot.toFilePath(),
        environment: environment,
      );
    } on ProcessException catch (error) {
      throw ProcessException(
        error.executable,
        error.arguments,
        'Failed to launch cargo. Install rustup and run '
        '`rustup target add $triple`. (${error.message})',
        error.errorCode,
      );
    }
    if (result.exitCode != 0) {
      throw ProcessException(
        'cargo',
        <String>['build', '--target', triple],
        'cargo build failed for $triple:\n${result.stderr}\n${result.stdout}',
        result.exitCode,
      );
    }

    final libraryName = code.targetOS.dylibFileName('fluxer_markdown_parser');
    final builtLibrary = targetDir.resolve('$triple/release/$libraryName');
    final bundledLibrary = input.outputDirectory.resolve(libraryName);
    await File.fromUri(builtLibrary).copy(bundledLibrary.toFilePath());

    output.assets.code.add(
      CodeAsset(
        package: input.packageName,
        name: 'src/bindings.dart',
        linkMode: DynamicLoadingBundled(),
        file: bundledLibrary,
      ),
    );
    output.dependencies.add(crateRoot.resolve('Cargo.toml'));
    output.dependencies.add(
      input.packageRoot.resolve('../../fluxer/Cargo.lock'),
    );
    final sources = Directory.fromUri(crateRoot.resolve('src/'));
    await for (final entity in sources.list(recursive: true)) {
      if (entity is File) {
        output.dependencies.add(entity.uri);
      }
    }
  });
}

String _rustTriple(CodeConfig code) {
  final os = code.targetOS;
  final arch = code.targetArchitecture;
  final triple = switch (os) {
    OS.android => switch (arch) {
      Architecture.arm64 => 'aarch64-linux-android',
      Architecture.arm => 'armv7-linux-androideabi',
      Architecture.x64 => 'x86_64-linux-android',
      Architecture.riscv64 => 'riscv64-linux-android',
      _ => null,
    },
    OS.iOS => switch ((arch, code.iOS.targetSdk)) {
      (Architecture.arm64, IOSSdk.iPhoneOS) => 'aarch64-apple-ios',
      (Architecture.arm64, IOSSdk.iPhoneSimulator) => 'aarch64-apple-ios-sim',
      (Architecture.x64, IOSSdk.iPhoneSimulator) => 'x86_64-apple-ios',
      _ => null,
    },
    OS.macOS => switch (arch) {
      Architecture.arm64 => 'aarch64-apple-darwin',
      Architecture.x64 => 'x86_64-apple-darwin',
      _ => null,
    },
    OS.linux => switch (arch) {
      Architecture.arm64 => 'aarch64-unknown-linux-gnu',
      Architecture.x64 => 'x86_64-unknown-linux-gnu',
      Architecture.riscv64 => 'riscv64gc-unknown-linux-gnu',
      _ => null,
    },
    OS.windows => switch (arch) {
      Architecture.arm64 => 'aarch64-pc-windows-msvc',
      Architecture.x64 => 'x86_64-pc-windows-msvc',
      _ => null,
    },
    _ => null,
  };
  if (triple == null) {
    throw UnsupportedError('No Rust triple for $os/$arch');
  }
  return triple;
}

/// Android must link through the NDK's target-prefixed clang wrapper; the
/// bare `clang` the hook provides does not select the Android sysroot.
Uri? _linkerFor(CodeConfig code) {
  if (code.targetOS != OS.android) {
    return null;
  }
  final compiler = code.cCompiler?.compiler;
  if (compiler == null) {
    throw StateError(
      'Android build provided no C compiler config; the NDK clang is '
      'required to link the Rust parser. Without it cargo would fail with '
      'a misleading missing-`cc` error.',
    );
  }
  final clangTriple = switch (code.targetArchitecture) {
    Architecture.arm64 => 'aarch64-linux-android',
    Architecture.arm => 'armv7a-linux-androideabi',
    Architecture.x64 => 'x86_64-linux-android',
    Architecture.riscv64 => 'riscv64-linux-android',
    _ => throw UnsupportedError(
      'No NDK clang wrapper for ${code.targetArchitecture}',
    ),
  };
  final api = code.android.targetNdkApi;
  final extension = Platform.isWindows ? '.cmd' : '';
  return compiler.resolve('$clangTriple$api-clang$extension');
}
