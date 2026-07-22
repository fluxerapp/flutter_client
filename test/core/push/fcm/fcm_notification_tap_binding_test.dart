import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/fcm/fcm_tap_binding_host.dart';
import 'package:fluxer_app/core/push/services/firebase_messaging_push_service.dart';

void main() {
  test('OSS stub tap host ignores callback registration', () {
    const FcmTapBindingHost host = FirebaseMessagingPushService.tapHost;
    var callbackCount = 0;
    host
      ..setNotificationTapCallback((Map<String, String> payload) {
        callbackCount++;
      })
      ..setNotificationTapCallback(null);
    expect(callbackCount, 0);
  });
}
