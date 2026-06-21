import 'package:fluxer_fcm/fcm_background_handler_policy.dart';
import 'package:test/test.dart';

void main() {
  group('shouldDisplayFcmBackgroundLocalNotification', () {
    test('always displays from the background isolate', () {
      expect(shouldDisplayFcmBackgroundLocalNotification(), isTrue);
    });
  });
}
