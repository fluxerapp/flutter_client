import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_prompt_provider.dart';

void main() {
  test('beginPresentation only runs once until endPresentation', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    final ObservabilityReportingPrompt notifier = container.read(
      observabilityReportingPromptProvider.notifier,
    );
    notifier.requestPrompt();
    expect(container.read(observabilityReportingPromptProvider), isTrue);

    expect(notifier.beginPresentation(), isTrue);
    expect(container.read(observabilityReportingPromptProvider), isFalse);
    expect(notifier.isPresentationInFlight, isTrue);
    expect(notifier.beginPresentation(), isFalse);

    notifier.endPresentation();
    expect(notifier.isPresentationInFlight, isFalse);
  });
}
