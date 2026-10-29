import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const MethodChannel _uploadKeepAliveChannel = MethodChannel(
  'fluxer_app/upload_keep_alive',
);

class UploadKeepAlive {
  static int _active = 0;
  static bool _lifecycleHooked = false;

  void begin({required String notificationTitle}) {
    _ensureAndroidLifecycleHook();
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

  static void ensureAndroidResumeSync() {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    _ensureAndroidLifecycleHook();
    releaseNativeIfIdle();
  }

  @visibleForTesting
  static void releaseNativeIfIdle() {
    if (_active != 0) {
      return;
    }
    _invokePlatform('stop', null);
  }

  @visibleForTesting
  static void resetForTest() {
    _active = 0;
    _lifecycleHooked = false;
  }

  static void _ensureAndroidLifecycleHook() {
    if (_lifecycleHooked || defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    _lifecycleHooked = true;
    WidgetsBinding.instance.addObserver(_UploadKeepAliveLifecycleObserver());
  }

  void _invoke(String method, Object? arguments) {
    _invokePlatform(method, arguments);
  }

  static void _invokePlatform(String method, Object? arguments) {
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

class _UploadKeepAliveLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      UploadKeepAlive.releaseNativeIfIdle();
    }
  }
}
