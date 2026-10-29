import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/observability_reporting_provider.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_prompt_coordinator.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_prompt_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  test('decline on the consent sheet is persisted', () async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    await recordObservabilityReportingConsentSheetResult(
      reporting: container.read(observabilityReportingProvider.notifier),
      dismissed: container.read(
        observabilityReportingPromptDismissedProvider.notifier,
      ),
      optedIn: false,
    );

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    expect(
      preferences.getBool(kObservabilityReportingPromptDismissedKey),
      isTrue,
    );
    expect(
      container.read(observabilityReportingPromptDismissedProvider),
      isTrue,
    );
  });

  test('dismissing without a choice does not persist', () async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    await recordObservabilityReportingConsentSheetResult(
      reporting: container.read(observabilityReportingProvider.notifier),
      dismissed: container.read(
        observabilityReportingPromptDismissedProvider.notifier,
      ),
      optedIn: null,
    );

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    expect(
      preferences.getBool(kObservabilityReportingPromptDismissedKey),
      isNull,
    );
  });
}
