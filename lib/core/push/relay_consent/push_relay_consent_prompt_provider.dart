import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_relay_consent_prompt_provider.g.dart';

@Riverpod(keepAlive: true)
class PushRelayConsentPrompt extends _$PushRelayConsentPrompt {
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
