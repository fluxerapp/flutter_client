import 'dart:async';

import 'package:flutter/foundation.dart';

const Duration _kFcmBackgroundHandlerBudget = Duration(seconds: 25);

Future<void> runFcmBackgroundWithinBudget(
  Future<void> Function() work, {
  Duration budget = _kFcmBackgroundHandlerBudget,
}) async {
  try {
    await work().timeout(budget);
  } on TimeoutException {
    if (kDebugMode) {
      debugPrint('[FCM] background handler exceeded ${budget.inSeconds}s');
    }
  } on Object catch (error, stackTrace) {
    if (kDebugMode) {
      debugPrint('[FCM] background handler failed: $error\n$stackTrace');
    }
  }
}
