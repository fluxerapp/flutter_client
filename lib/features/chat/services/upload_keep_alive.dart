import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const MethodChannel _uploadKeepAliveChannel = MethodChannel(
  'fluxer_app/upload_keep_alive',
);

class UploadKeepAlive {
  int _active = 0;

  void begin({required String notificationTitle}) {
    _active += 1;
    _invoke('start', <String, Object>{'title': notificationTitle});
  }

  void end() {
    if (_active == 0) {
      return;
    }
    _active -= 1;
    if (_active == 0) {
      _invoke('stop', null);
    }
  }

  void _invoke(String method, Object? arguments) {
    if (defaultTargetPlatform != TargetPlatform.android &&
        defaultTargetPlatform != TargetPlatform.iOS) {
      return;
    }
    unawaited(
      _uploadKeepAliveChannel
          .invokeMethod<void>(method, arguments)
          .catchError((Object _) {}),
    );
  }
}
