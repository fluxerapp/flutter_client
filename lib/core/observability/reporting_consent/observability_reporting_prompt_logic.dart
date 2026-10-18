import 'dart:io';

bool observabilityReportingPromptIsMobilePlatform() {
  return Platform.isIOS || Platform.isAndroid;
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
