import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'helpers/recording_asset_channel.dart';
import 'helpers/test_http_overrides.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  HttpOverrides.global = TestHttpOverrides();
  VisibilityDetectorController.instance.updateInterval = Duration.zero;
  WidgetController.hitTestWarningShouldBeFatal = true;
  final void Function(String) driftPrint = driftRuntimeOptions.debugPrint;
  driftRuntimeOptions.debugPrint = (String message) {
    driftPrint(message);
    if (message.startsWith('WARNING (drift)')) {
      Zone.current.handleUncaughtError(StateError(message), StackTrace.current);
    }
  };
  setUp(_failSpriteSheetLoads);
  await testMain();
}

void _failSpriteSheetLoads() {
  if (BindingBase.debugBindingType() == null ||
      ServicesBinding.instance.defaultBinaryMessenger
          is! TestDefaultBinaryMessenger) {
    return;
  }
  RecordingAssetChannel.install().respond = (String key) =>
      key.startsWith('assets/emoji-sprites/')
      ? Future<ByteData?>.value()
      : null;
}
