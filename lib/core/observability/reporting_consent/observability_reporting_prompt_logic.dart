import 'package:flutter/foundation.dart';

bool observabilityReportingPromptIsMobilePlatform() {
  return defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;
}

bool shouldPromptForObservabilityReporting({
  required bool reportingAvailable,
  required bool reportingEnabled,
  required bool promptDismissed,
  required bool hadForegroundCrash,
}) {
  if (!reportingAvailable) {
    return false;
  }
  if (reportingEnabled) {
    return false;
  }
  if (promptDismissed) {
    return false;
  }
  return hadForegroundCrash;
}
