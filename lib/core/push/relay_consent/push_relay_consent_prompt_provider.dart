import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_relay_consent_prompt_provider.g.dart';

@Riverpod(keepAlive: true)
class PushRelayConsentPrompt extends _$PushRelayConsentPrompt {
  bool _presentationInFlight = false;
  final Set<String> _userIds = <String>{};

  @override
  bool build() => false;

  void requestPrompt({required String userId}) {
    if (_presentationInFlight) {
      return;
    }
    _userIds.add(userId);
    state = true;
  }

  Set<String>? beginPresentation() {
    if (_presentationInFlight) {
      return null;
    }
    _presentationInFlight = true;
    state = false;
    final Set<String> userIds = Set<String>.of(_userIds);
    _userIds.clear();
    return userIds;
  }

  void endPresentation() {
    _presentationInFlight = false;
  }

  bool get isPresentationInFlight => _presentationInFlight;
}
