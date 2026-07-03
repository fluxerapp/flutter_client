import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_background_notification_tap_hooks.dart';

void main() {
  tearDown(FcmBackgroundNotificationTapHooks.resetForTesting);

  test('handleTap invokes configured callback', () {
    final List<String?> actualPayloads = <String?>[];
    FcmBackgroundNotificationTapHooks.onTap = (String? payloadJson) {
      actualPayloads.add(payloadJson);
    };
    FcmBackgroundNotificationTapHooks.handleTap('{"url":"/channels/@me/1/2"}');
    expect(actualPayloads, <String?>['{"url":"/channels/@me/1/2"}']);
  });

  test('handleTap is a no-op when callback is unset', () {
    FcmBackgroundNotificationTapHooks.resetForTesting();
    expect(
      () => FcmBackgroundNotificationTapHooks.handleTap('{}'),
      returnsNormally,
    );
  });
}
