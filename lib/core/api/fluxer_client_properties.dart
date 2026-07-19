import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app_runtime_info.dart';

const int fluxerClientPropertiesSchemaVersion = 1;

const String fluxerClientRuntimeFlutter = 'flutter';

const String fluxerBrowserName = 'fluxer';

class FluxerClientProperties {
  const FluxerClientProperties({
    required this.schemaVersion,
    required this.clientPlatform,
    required this.clientRuntime,
    required this.os,
    required this.browser,
    required this.device,
    required this.locale,
    required this.systemLocale,
    required this.userAgent,
    this.clientVersion,
    this.releaseChannel,
    this.osVersion,
    this.browserVersion,
    this.architecture,
    this.buildTimestamp,
    this.buildSha,
    this.buildNumber,
    this.desktopAppVersion,
    this.desktopAppChannel,
    this.desktopArch,
    this.desktopOs,
  });

  final int schemaVersion;
  final String clientPlatform;
  final String clientRuntime;
  final String? clientVersion;
  final String? releaseChannel;
  final String os;
  final String? osVersion;
  final String browser;
  final String? browserVersion;
  final String device;
  final String? architecture;
  final String locale;
  final String systemLocale;
  final String userAgent;
  final String? buildTimestamp;
  final String? buildSha;
  final int? buildNumber;
  final String? desktopAppVersion;
  final String? desktopAppChannel;
  final String? desktopArch;
  final String? desktopOs;

  Map<String, dynamic> toFullJson() {
    return <String, dynamic>{
      'schema_version': schemaVersion,
      'client_platform': clientPlatform,
      'client_runtime': clientRuntime,
      'client_version': clientVersion,
      'release_channel': releaseChannel,
      'os': os,
      'os_version': osVersion,
      'browser': browser,
      'browser_version': browserVersion,
      'device': device,
      'architecture': architecture,
      'locale': locale,
      'system_locale': systemLocale,
      'user_agent': userAgent,
      'build_timestamp': buildTimestamp,
      'build_sha': buildSha,
      'build_number': buildNumber,
      'desktop_app_version': desktopAppVersion,
      'desktop_app_channel': desktopAppChannel,
      'desktop_arch': desktopArch,
      'desktop_os': desktopOs,
    };
  }
}

String mapAppBuildEnvironmentToReleaseChannel(AppBuildEnvironment environment) {
  return switch (environment) {
    AppBuildEnvironment.stable => 'stable',
    AppBuildEnvironment.beta => 'beta',
    AppBuildEnvironment.canary => 'canary',
  };
}

String resolveClientPlatform(
  TargetPlatform targetPlatform, {
  bool mobileFormFactor = false,
}) {
  switch (targetPlatform) {
    case TargetPlatform.android:
      return 'android';
    case TargetPlatform.iOS:
      return 'ios';
    case TargetPlatform.linux:
      return mobileFormFactor ? 'linux' : 'desktop';
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
    case TargetPlatform.fuchsia:
      return 'desktop';
  }
}

String resolveDeviceClass(
  TargetPlatform targetPlatform, {
  bool mobileFormFactor = false,
}) {
  switch (targetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.iOS:
      return 'mobile';
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
    case TargetPlatform.fuchsia:
      return mobileFormFactor ? 'mobile' : 'desktop';
  }
}

String normalizeFluxerOperatingSystem() {
  final String raw = Platform.operatingSystem.toLowerCase();
  return switch (raw) {
    'android' => 'android',
    'ios' => 'ios',
    'macos' => 'macos',
    'linux' => 'linux',
    'windows' => 'windows',
    _ => 'unknown',
  };
}

String? normalizeOptionalString(String? value) {
  final String? trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }
  return trimmed;
}

String buildFluxerClientUserAgent({
  required String clientPlatform,
  required String? clientVersion,
  required String? releaseChannel,
}) {
  final String clientName = switch (clientPlatform) {
    'android' => 'Fluxer Android',
    'ios' => 'Fluxer iOS',
    'linux' => 'Fluxer Linux',
    'desktop' => 'Fluxer Desktop',
    'client' => 'Fluxer Client',
    _ => 'Fluxer Client',
  };
  final String? version = normalizeOptionalString(clientVersion);
  final String? channel = normalizeOptionalString(releaseChannel);
  if (version != null && channel != null) {
    return '$clientName/$version ($channel)';
  }
  if (version != null) {
    return '$clientName/$version';
  }
  if (channel != null) {
    return '$clientName ($channel)';
  }
  return clientName;
}

String? mapAbiToFluxerArchitecture() {
  try {
    final String label = Abi.current().toString().toLowerCase();
    if (label.contains('arm64') || label.contains('aarch64')) {
      return 'arm64';
    }
    if (label.contains('arm')) {
      return 'arm';
    }
    if (label.contains('x64') ||
        label.contains('amd64') ||
        label.contains('x86_64')) {
      return 'x64';
    }
    if (label.contains('ia32') ||
        label.contains('i386') ||
        label.contains('i686') ||
        label.contains('x86')) {
      return 'x86';
    }
    return 'unknown';
  } on Object {
    return null;
  }
}

Map<String, dynamic> toClientPropertiesWireMap(
  FluxerClientProperties properties,
) {
  return <String, dynamic>{
    'schema_version': properties.schemaVersion,
    'os': properties.os,
    'os_version': properties.osVersion,
    'browser': properties.browser,
    'browser_version': properties.browserVersion,
    'device': properties.device,
    'locale': properties.locale,
    'system_locale': properties.systemLocale,
    'client_platform': properties.clientPlatform,
    'client_runtime': properties.clientRuntime,
    'client_version': properties.clientVersion,
    'release_channel': properties.releaseChannel,
    'user_agent': properties.userAgent,
  };
}

String encodeFluxerClientPropertiesHeader(Map<String, dynamic> wireMap) {
  return base64Encode(utf8.encode(jsonEncode(wireMap)));
}

FluxerClientProperties buildFluxerClientProperties({
  AppRuntimeInfo? runtimeInfo,
}) {
  final TargetPlatform target = defaultTargetPlatform;
  final bool mobileFormFactor = isFluxerRuntimeMobileFormFactor;
  final String clientPlatform = resolveClientPlatform(
    target,
    mobileFormFactor: mobileFormFactor,
  );
  final AppBuildEnvironment environment =
      runtimeInfo?.environment ?? AppBuildConfig.environment;
  final String releaseChannel = mapAppBuildEnvironmentToReleaseChannel(
    environment,
  );
  final String? clientVersion = normalizeOptionalString(
    runtimeInfo?.releaseVersion,
  );
  final String userAgent = buildFluxerClientUserAgent(
    clientPlatform: clientPlatform,
    clientVersion: clientVersion,
    releaseChannel: releaseChannel,
  );
  final int? parsedBuildNumber = int.tryParse(runtimeInfo?.buildNumber ?? '');
  return FluxerClientProperties(
    schemaVersion: fluxerClientPropertiesSchemaVersion,
    clientPlatform: clientPlatform,
    clientRuntime: fluxerClientRuntimeFlutter,
    os: normalizeFluxerOperatingSystem(),
    browser: fluxerBrowserName,
    device: resolveDeviceClass(target, mobileFormFactor: mobileFormFactor),
    locale: PlatformDispatcher.instance.locale.toLanguageTag(),
    systemLocale: Platform.localeName,
    userAgent: userAgent,
    clientVersion: clientVersion,
    releaseChannel: releaseChannel,
    osVersion: normalizeOptionalString(Platform.operatingSystemVersion),
    browserVersion: clientVersion,
    architecture: mapAbiToFluxerArchitecture(),
    buildNumber: parsedBuildNumber,
  );
}
