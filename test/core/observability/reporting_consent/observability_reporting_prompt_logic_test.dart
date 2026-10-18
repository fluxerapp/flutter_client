import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_prompt_logic.dart';

void main() {
  group('shouldPromptForObservabilityReporting', () {
    test('prompts after a foreground crash when reporting is off', () {
      expect(
        shouldPromptForObservabilityReporting(
          reportingAvailable: true,
          reportingEnabled: false,
          promptDismissed: false,
          hadForegroundCrash: true,
        ),
        isTrue,
      );
    });

    test('does not prompt when reporting is unavailable', () {
      expect(
        shouldPromptForObservabilityReporting(
          reportingAvailable: false,
          reportingEnabled: false,
          promptDismissed: false,
          hadForegroundCrash: true,
        ),
        isFalse,
      );
    });

    test('does not prompt when reporting is already enabled', () {
      expect(
        shouldPromptForObservabilityReporting(
          reportingAvailable: true,
          reportingEnabled: true,
          promptDismissed: false,
          hadForegroundCrash: true,
        ),
        isFalse,
      );
    });

    test('does not prompt when permanently dismissed', () {
      expect(
        shouldPromptForObservabilityReporting(
          reportingAvailable: true,
          reportingEnabled: false,
          promptDismissed: true,
          hadForegroundCrash: true,
        ),
        isFalse,
      );
    });

    test('does not prompt without a detected crash', () {
      expect(
        shouldPromptForObservabilityReporting(
          reportingAvailable: true,
          reportingEnabled: false,
          promptDismissed: false,
          hadForegroundCrash: false,
        ),
        isFalse,
      );
    });
  });

  group('observabilityReportingPromptIsMobilePlatform', () {
    test('is false in the Flutter test binding', () {
      expect(observabilityReportingPromptIsMobilePlatform(), isFalse);
    });
  });
}
