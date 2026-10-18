import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'observability_reporting_prompt_provider.g.dart';

const String kObservabilityReportingPromptDismissedKey =
    'observability_reporting_prompt_dismissed';

@Riverpod(keepAlive: true)
class ObservabilityReportingPromptDismissed
    extends _$ObservabilityReportingPromptDismissed {
  @override
  bool build() => false;

  Future<void> load() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    state =
        preferences.getBool(kObservabilityReportingPromptDismissedKey) ?? false;
  }

  Future<void> dismissPermanently() async {
    state = true;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(kObservabilityReportingPromptDismissedKey, true);
  }
}

@Riverpod(keepAlive: true)
class ObservabilityReportingPrompt extends _$ObservabilityReportingPrompt {
  bool _presentationInFlight = false;

  @override
  bool build() => false;

  void requestPrompt() {
    if (_presentationInFlight || state) {
      return;
    }
    state = true;
  }

  void beginPresentation() {
    _presentationInFlight = true;
    state = false;
  }

  void endPresentation() {
    _presentationInFlight = false;
  }
}
