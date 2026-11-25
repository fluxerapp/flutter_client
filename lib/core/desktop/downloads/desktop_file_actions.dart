import 'dart:io';

import 'package:dbus/dbus.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/desktop/windows/windows_file_reveal.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';

const MethodChannel _macPlatformChannel = MethodChannel(
  'fluxer_app/desktop_platform',
);

Future<void> openDesktopFile(String filePath) async {
  await launchUrl(Uri.file(filePath), mode: LaunchMode.externalApplication);
}

Future<void> revealDesktopFile(String filePath) async {
  if (Platform.isMacOS) {
    await _macPlatformChannel.invokeMethod<void>('revealFile', <String, String>{
      'path': filePath,
    });
    return;
  }
  final bool revealed = Platform.isWindows
      ? revealWindowsFile(filePath)
      : await _revealLinuxFile(filePath);
  if (!revealed) {
    await openDesktopFile(p.dirname(filePath));
  }
}

Future<bool> _revealLinuxFile(String filePath) async {
  final DBusClient client = DBusClient.session();
  try {
    await DBusRemoteObject(
      client,
      name: 'org.freedesktop.FileManager1',
      path: DBusObjectPath('/org/freedesktop/FileManager1'),
    ).callMethod('org.freedesktop.FileManager1', 'ShowItems', <DBusValue>[
      DBusArray.string(<String>[Uri.file(filePath).toString()]),
      const DBusString(''),
    ], replySignature: DBusSignature(''));
    return true;
  } on Object {
    return false;
  } finally {
    await client.close();
  }
}
