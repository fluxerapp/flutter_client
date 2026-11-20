import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/callkit/incoming_call_actions.dart';

void main() {
  test('answering from the lock screen counts as P2P consent', () {
    expect(
      shouldTreatSystemCallAnswerAsP2pConsent(
        answeredFromSystemCallUi: true,
        isForeground: false,
      ),
      isTrue,
    );
  });

  test('an answer with the app open still shows the consent sheet', () {
    expect(
      shouldTreatSystemCallAnswerAsP2pConsent(
        answeredFromSystemCallUi: true,
        isForeground: true,
      ),
      isFalse,
    );
    expect(
      shouldTreatSystemCallAnswerAsP2pConsent(
        answeredFromSystemCallUi: false,
        isForeground: false,
      ),
      isFalse,
    );
  });
}
