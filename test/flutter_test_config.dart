import 'dart:async';
import 'dart:io';

import 'package:visibility_detector/visibility_detector.dart';

import 'helpers/test_http_overrides.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  HttpOverrides.global = TestHttpOverrides();
  VisibilityDetectorController.instance.updateInterval = Duration.zero;
  await testMain();
}
