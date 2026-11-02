import 'dart:io';

import 'package:flutter/services.dart';

const MethodChannel _voiceTaskRemovedChannel = MethodChannel(
  'fluxer_app/voice_task_removed',
);

Future<void> syncAndroidVoiceTaskRemovedWatcher({required bool active}) async {
  if (!Platform.isAndroid) {
    return;
  }
  try {
    await _voiceTaskRemovedChannel.invokeMethod<void>(
      'setTaskRemovedWatcherActive',
      <String, Object>{'active': active},
    );
  } on Object {
    return;
  }
}
