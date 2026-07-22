import 'dart:async';

import 'package:visibility_detector/visibility_detector.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  VisibilityDetectorController.instance.updateInterval = Duration.zero;
  await testMain();
}
