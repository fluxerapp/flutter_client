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

  bool beginPresentation() {
    if (_presentationInFlight) {
      return false;
    }
    _presentationInFlight = true;
    state = false;
    return true;
  }

  void endPresentation() {
    _presentationInFlight = false;
  }

  bool get isPresentationInFlight => _presentationInFlight;
}
