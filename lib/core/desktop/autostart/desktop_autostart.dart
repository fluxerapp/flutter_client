import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fluxer_app/core/desktop/windows/windows_app_identity.dart';
import 'package:fluxer_app/core/desktop/windows/windows_registry.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:path/path.dart' as p;

const String kDesktopAutostartLaunchArg = '--autostart';
const String _kLinuxApplicationId = 'com.fluxer.oxygen';
const String _kWindowsRunKey = r'Software\Microsoft\Windows\CurrentVersion\Run';
const MethodChannel _macPlatformChannel = MethodChannel(
  'fluxer_app/desktop_platform',
);

final class DesktopAutostart {
  const DesktopAutostart._();

  static bool _launchedAtLogin = false;

  static bool get launchedAtLogin => _launchedAtLogin;

  static Future<void> resolveLaunch(List<String> args) async {
    if (args.contains(kDesktopAutostartLaunchArg)) {
      _launchedAtLogin = true;
      return;
    }
    if (Platform.isMacOS) {
      try {
        _launchedAtLogin =
            await _macPlatformChannel.invokeMethod<bool>(
              'wasLaunchedAtLogin',
            ) ??
            false;
      } on Object {
        _launchedAtLogin = false;
      }
    }
  }

  static bool get isSupported {
    if (Platform.isLinux) {
      return !Platform.environment.containsKey('FLATPAK_ID');
    }
    return Platform.isMacOS || Platform.isWindows;
  }

  static Future<bool> isEnabled() async {
    try {
      if (Platform.isMacOS) {
        return await _macPlatformChannel.invokeMethod<bool>(
              'autostartIsEnabled',
            ) ??
            false;
      }
      if (Platform.isWindows) {
        return readCurrentUserRegistryString(
              _kWindowsRunKey,
              windowsAppUserModelId(),
            )?.contains(Platform.resolvedExecutable) ??
            false;
      }
      if (Platform.isLinux) {
        return File(_linuxEntryPath()).existsSync();
      }
    } on Object catch (error, stackTrace) {
      talker.warning('[Autostart] Status check failed', error, stackTrace);
    }
    return false;
  }

  static Future<bool> setEnabled({required bool enabled}) async {
    try {
      if (Platform.isMacOS) {
        await _macPlatformChannel.invokeMethod<void>(
          'autostartSetEnabled',
          <String, Object?>{'enabled': enabled},
        );
      } else if (Platform.isWindows) {
        _setWindows(enabled: enabled);
      } else if (Platform.isLinux) {
        await _setLinux(enabled: enabled);
      }
    } on Object catch (error, stackTrace) {
      talker.warning('[Autostart] Update failed', error, stackTrace);
    }
    return await isEnabled();
  }

  static void _setWindows({required bool enabled}) {
    if (enabled) {
      writeCurrentUserRegistryString(
        _kWindowsRunKey,
        windowsAppUserModelId(),
        '"${Platform.resolvedExecutable}" $kDesktopAutostartLaunchArg',
      );
    } else {
      deleteCurrentUserRegistryValue(_kWindowsRunKey, windowsAppUserModelId());
    }
  }

  static String _linuxAutostartDir() {
    final String? xdgConfigHome = Platform.environment['XDG_CONFIG_HOME'];
    final String base = xdgConfigHome != null && xdgConfigHome.isNotEmpty
        ? xdgConfigHome
        : p.join(Platform.environment['HOME'] ?? '', '.config');
    return p.join(base, 'autostart');
  }

  static String _linuxEntryPath() =>
      p.join(_linuxAutostartDir(), '$_kLinuxApplicationId.desktop');

  static String _quoteExec(String value) {
    final String escaped = value
        .replaceAll(r'\', r'\\')
        .replaceAll('"', r'\"')
        .replaceAll(r'$', r'\$')
        .replaceAll('`', r'\`');
    return '"$escaped"';
  }

  static Future<void> _setLinux({required bool enabled}) async {
    final File entry = File(_linuxEntryPath());
    if (!enabled) {
      if (entry.existsSync()) {
        await entry.delete();
      }
      return;
    }
    final String executable =
        Platform.environment['APPIMAGE'] ?? Platform.resolvedExecutable;
    await entry.parent.create(recursive: true);
    await entry.writeAsString(
      <String>[
        '[Desktop Entry]',
        'Type=Application',
        'Name=${windowsAppDisplayName()}',
        'Exec=${_quoteExec(executable)} $kDesktopAutostartLaunchArg',
        'TryExec=$executable',
        'Terminal=false',
        'Categories=Network;InstantMessaging;',
        'StartupWMClass=$_kLinuxApplicationId',
        'X-GNOME-Autostart-enabled=true',
        'StartupNotify=false',
        '',
      ].join('\n'),
    );
  }
}
