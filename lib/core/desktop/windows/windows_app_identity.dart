import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:path/path.dart' as p;

const String _kFallbackAppUserModelId = 'com.fluxer.oxygen';

String windowsAppUserModelId() {
  try {
    final int Function(Pointer<Pointer<Utf16>>) getAumid =
        DynamicLibrary.open('shell32.dll').lookupFunction<
          Int32 Function(Pointer<Pointer<Utf16>>),
          int Function(Pointer<Pointer<Utf16>>)
        >('GetCurrentProcessExplicitAppUserModelID');
    final void Function(Pointer<Void>) free = DynamicLibrary.open('ole32.dll')
        .lookupFunction<
          Void Function(Pointer<Void>),
          void Function(Pointer<Void>)
        >('CoTaskMemFree');
    final Pointer<Pointer<Utf16>> out = calloc<Pointer<Utf16>>();
    try {
      final int result = getAumid(out);
      final Pointer<Utf16> value = out.value;
      if (result != 0 || value == nullptr) {
        return _kFallbackAppUserModelId;
      }
      try {
        final String aumid = value.toDartString();
        return aumid.isEmpty ? _kFallbackAppUserModelId : aumid;
      } finally {
        free(value.cast<Void>());
      }
    } finally {
      calloc.free(out);
    }
  } on Object {
    return _kFallbackAppUserModelId;
  }
}

@visibleForTesting
String windowsNotificationActivatorGuidFor(AppBuildEnvironment environment) {
  return switch (environment) {
    AppBuildEnvironment.stable => '02357f68-878d-4d1b-b915-7d7a1ac79a85',
    AppBuildEnvironment.beta => 'cf76e165-0ed0-487c-8407-b8a97ec391b8',
    AppBuildEnvironment.canary => 'aedd64c1-83b4-409d-bd12-ba4f98d0ff36',
  };
}

@visibleForTesting
String windowsAppDisplayNameFor(AppBuildEnvironment environment) {
  return switch (environment) {
    AppBuildEnvironment.stable => 'Fluxer Oxygen',
    AppBuildEnvironment.beta => 'Fluxer Oxygen Beta',
    AppBuildEnvironment.canary => 'Fluxer Oxygen Canary',
  };
}

String windowsNotificationActivatorGuid() =>
    windowsNotificationActivatorGuidFor(AppBuildConfig.environment);

String windowsAppDisplayName() =>
    windowsAppDisplayNameFor(AppBuildConfig.environment);

String? windowsNotificationIconPath() {
  final String path = p.join(
    p.dirname(Platform.resolvedExecutable),
    'data',
    'flutter_assets',
    'assets',
    'images',
    'app_icon.png',
  );
  return File(path).existsSync() ? path : null;
}
