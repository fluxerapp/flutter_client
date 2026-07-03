import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_system_notification_cancel_hooks.dart';

void main() {
  tearDown(FcmSystemNotificationCancelHooks.resetForTesting);

  test('tryCancelDuplicates invokes configured handler', () async {
    final List<int> excludeIds = <int>[];
    final List<List<String>> messageIdSets = <List<String>>[];
    FcmSystemNotificationCancelHooks.cancelDuplicates =
        ({
          required Iterable<String> messageIds,
          required int excludeNotificationId,
        }) async {
          messageIdSets.add(messageIds.toList());
          excludeIds.add(excludeNotificationId);
        };
    await FcmSystemNotificationCancelHooks.tryCancelDuplicates(
      messageIds: <String>['gcm-1', 'msg-9'],
      excludeNotificationId: 42,
    );
    expect(messageIdSets, <List<String>>[
      <String>['gcm-1', 'msg-9'],
    ]);
    expect(excludeIds, <int>[42]);
  });

  test('tryCancelDuplicates is a no-op when handler is unset', () async {
    FcmSystemNotificationCancelHooks.resetForTesting();
    await expectLater(
      FcmSystemNotificationCancelHooks.tryCancelDuplicates(
        messageIds: <String>['msg-1'],
        excludeNotificationId: 1,
      ),
      completes,
    );
  });
}
