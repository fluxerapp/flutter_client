import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/fcm/fcm_sync_coalescing.dart';

void main() {
  group('fcmSyncShouldRunAnotherPass', () {
    test('runs again when a sync was requested during the in-flight pass', () {
      expect(
        fcmSyncShouldRunAnotherPass(syncAgain: true, mounted: true),
        isTrue,
      );
    });

    test('stops when nothing was coalesced', () {
      expect(
        fcmSyncShouldRunAnotherPass(syncAgain: false, mounted: true),
        isFalse,
      );
    });

    test('stops when the provider was disposed', () {
      expect(
        fcmSyncShouldRunAnotherPass(syncAgain: true, mounted: false),
        isFalse,
      );
    });
  });
}
