import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/providers/app_runtime_info.dart';

Future<String> resolveDeviceModelName() async {
  final DeviceInfoPlugin plugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo info = await plugin.androidInfo;
      return '${info.manufacturer} ${info.model}'.trim();
    }
    if (Platform.isIOS) {
      final IosDeviceInfo info = await plugin.iosInfo;
      return info.utsname.machine;
    }
    if (Platform.isMacOS) {
      final MacOsDeviceInfo info = await plugin.macOsInfo;
      return info.model;
    }
    if (Platform.isWindows) {
      final WindowsDeviceInfo info = await plugin.windowsInfo;
      return info.productName;
    }
    if (Platform.isLinux) {
      final LinuxDeviceInfo info = await plugin.linuxInfo;
      return info.name;
    }
  } on Object {
    return '';
  }
  return '';
}

Future<String> resolveOsVersionLabel() async {
  final DeviceInfoPlugin plugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo info = await plugin.androidInfo;
      return info.version.release;
    }
    if (Platform.isIOS) {
      final IosDeviceInfo info = await plugin.iosInfo;
      return info.systemVersion;
    }
    if (Platform.isMacOS) {
      final MacOsDeviceInfo info = await plugin.macOsInfo;
      return '${info.majorVersion}.${info.minorVersion}.${info.patchVersion}';
    }
    if (Platform.isWindows) {
      final WindowsDeviceInfo info = await plugin.windowsInfo;
      return '${info.majorVersion}.${info.minorVersion}';
    }
    if (Platform.isLinux) {
      final LinuxDeviceInfo info = await plugin.linuxInfo;
      final String version = info.version?.trim() ?? '';
      if (version.isNotEmpty) {
        return version;
      }
    }
  } on Object {
    return normalizeOsVersion(Platform.operatingSystemVersion);
  }
  return normalizeOsVersion(Platform.operatingSystemVersion);
}

String formatPushProviderLabel(PushProviderKind provider) {
  return switch (provider) {
    PushProviderKind.firebaseMessaging => 'fcm',
    PushProviderKind.unifiedPush => 'unifiedpush',
    PushProviderKind.apple => 'apns',
  };
}

String capitalizeChannel(String channel) {
  if (channel.isEmpty) {
    return channel;
  }
  return '${channel[0].toUpperCase()}${channel.substring(1)}';
}

String formatOsDisplayName(String os) {
  return switch (os) {
    'ios' => 'iOS',
    'android' => 'Android',
    'macos' => 'macOS',
    'linux' => 'Linux',
    'windows' => 'Windows',
    _ => os.isEmpty ? 'Unknown' : os,
  };
}

String normalizeOsVersion(String raw) {
  final String trimmed = raw.trim();
  if (trimmed.startsWith('Version ')) {
    final int buildParen = trimmed.indexOf(' (');
    if (buildParen == -1) {
      return trimmed.substring('Version '.length);
    }
    return trimmed.substring('Version '.length, buildParen);
  }
  return trimmed;
}

String normalizeSystemLocale(String locale) {
  return locale.replaceAll('_', '-');
}

String resolveDartVersionLabel() {
  const String? dartVersion = FlutterVersion.dartVersion;
  if (dartVersion != null && dartVersion.isNotEmpty) {
    return dartVersion;
  }
  final String platformVersion = Platform.version;
  final int space = platformVersion.indexOf(' ');
  if (space == -1) {
    return platformVersion;
  }
  return platformVersion.substring(0, space);
}

String resolveFlutterVersionLabel() {
  const String? flutterVersion = FlutterVersion.version;
  if (flutterVersion != null && flutterVersion.isNotEmpty) {
    return flutterVersion;
  }
  return 'unknown';
}

String formatAppDiagnosticClipboardText(AppRuntimeInfo info) {
  final FluxerClientProperties properties = buildFluxerClientProperties(
    runtimeInfo: info,
  );
  final String channel = capitalizeChannel(
    properties.releaseChannel ?? info.environment.name,
  );
  final String osLabel = formatOsDisplayName(properties.os);
  final String osVersionRaw = info.osVersionLabel.trim().isNotEmpty
      ? info.osVersionLabel
      : (properties.osVersion ?? Platform.operatingSystemVersion);
  final String osVersion = normalizeOsVersion(osVersionRaw);
  final String? architecture = properties.architecture;
  final String osPart = architecture != null && architecture.isNotEmpty
      ? '$osLabel $osVersion ($architecture)'
      : '$osLabel $osVersion';
  final String locale = normalizeSystemLocale(properties.systemLocale);
  final String deviceModel = info.deviceModelLabel.trim();
  final String deviceSegment = deviceModel.isEmpty
      ? ''
      : ', Device $deviceModel';
  final String push = formatPushProviderLabel(info.pushProvider);
  final String flutter = resolveFlutterVersionLabel();
  final String dart = resolveDartVersionLabel();
  final int? betaNum = AppBuildConfig.betaNumber;

  // Include the Github pre-release beta tag
  if (channel.toLowerCase().contains('beta') && betaNum != null) {
    return 'Version ${info.releaseVersion}, Beta $betaNum, Channel $channel, Build ${info.buildNumber}, $osPart'
        '$deviceSegment, Locale $locale, Push $push, Flutter $flutter, Dart $dart';
  }

  return 'Version ${info.releaseVersion}, Channel $channel, Build ${info.buildNumber}, $osPart'
      '$deviceSegment, Locale $locale, Push $push, Flutter $flutter, Dart $dart';
}
