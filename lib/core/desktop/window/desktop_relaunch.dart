import 'dart:io';

import 'package:fluxer_app/core/talker.dart';

bool _relaunching = false;

Future<bool> _startDesktopAppInstance() async {
  try {
    if (Platform.isMacOS) {
      final String bundlePath = File(
        Platform.resolvedExecutable,
      ).parent.parent.parent.path;
      await Process.start('/usr/bin/open', <String>[
        '-n',
        bundlePath,
      ], mode: ProcessStartMode.detached);
    } else {
      await Process.start(
        Platform.resolvedExecutable,
        const <String>[],
        mode: ProcessStartMode.detached,
      );
    }
    return true;
  } on Object catch (error, stackTrace) {
    talker.warning('[Desktop] Failed to relaunch', error, stackTrace);
    return false;
  }
}

Future<void> relaunchDesktopApp({required void Function() quit}) async {
  if (_relaunching) {
    return;
  }
  _relaunching = true;
  if (!await _startDesktopAppInstance()) {
    _relaunching = false;
    return;
  }
  quit();
}
