import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_relay_consent_prompt_provider.g.dart';

@Riverpod(keepAlive: true)
class PushRelayConsentPrompt extends _$PushRelayConsentPrompt {
  @override
  bool build() => false;

  void requestPrompt() {
    state = true;
  }

  void clearRequest() {
    state = false;
  }
}
