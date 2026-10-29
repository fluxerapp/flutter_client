import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:fluxer_app/core/observability/observability_reporting_provider.dart';
import 'package:fluxer_app/core/observability/reporting_consent/app_foreground_session_bootstrap_provider.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_prompt_logic.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_prompt_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loadObservabilityReportingPrompt(
  ProviderContainer container,
) async {
  if (!observabilityReportingPromptIsMobilePlatform()) {
    return;
  }
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  container
      .read(observabilityReportingPromptDismissedProvider.notifier)
      .restoreFromPreferences(preferences);
  final FluxerObservability observability = container.read(
    fluxerObservabilityProvider,
  );
  final bool reportingAvailable =
      AppBuildConfig.hasObservabilityConfig &&
      observabilityReportingIsAvailable(observability);
  final bool reportingEnabled =
      preferences.getBool(kObservabilityReportingEnabledKey) ?? false;
  final bool promptDismissed = container.read(
    observabilityReportingPromptDismissedProvider,
  );
  final bool hadForegroundCrash = container
      .read(appForegroundSessionBootstrapProvider)
      .hadForegroundCrash;
  if (!shouldPromptForObservabilityReporting(
    reportingAvailable: reportingAvailable,
    reportingEnabled: reportingEnabled,
    promptDismissed: promptDismissed,
    hadForegroundCrash: hadForegroundCrash,
  )) {
    return;
  }
  container.read(observabilityReportingPromptProvider.notifier).requestPrompt();
}

Future<void> recordObservabilityReportingConsentSheetResult({
  required ObservabilityReporting reporting,
  required ObservabilityReportingPromptDismissed dismissed,
  required bool? optedIn,
}) async {
  if (optedIn ?? false) {
    await reporting.setEnabled(value: true);
    return;
  }
  if (optedIn == false) {
    await dismissed.dismissPermanently();
  }
}
