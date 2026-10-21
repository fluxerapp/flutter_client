import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/fcm/fcm_sync_coalescing.dart';
import 'package:fluxer_app/core/push/push_sync_retry.dart';

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

  group('pushSyncRetryDelay', () {
    test('backs off and then stops', () {
      expect(pushSyncRetryDelay(1), const Duration(seconds: 5));
      expect(pushSyncRetryDelay(4), const Duration(seconds: 20));
      expect(pushSyncRetryDelay(0), isNull);
      expect(pushSyncRetryDelay(5), isNull);
    });
  });

  group('PushSyncRetry', () {
    test('keeps only the latest schedule', () {
      fakeAsync((FakeAsync async) {
        final PushSyncRetry retry = PushSyncRetry();
        var runs = 0;
        retry
          ..schedule(() => runs += 1)
          ..schedule(() => runs += 1);
        async.elapse(const Duration(seconds: 5));
        expect(runs, 0);
        async.elapse(const Duration(seconds: 5));
        expect(runs, 1);
      });
    });

    test('success cancels a pending retry', () {
      fakeAsync((FakeAsync async) {
        final PushSyncRetry retry = PushSyncRetry();
        var runs = 0;
        retry
          ..schedule(() => runs += 1)
          ..succeeded();
        async.elapse(const Duration(seconds: 20));
        expect(runs, 0);
      });
    });

    test('a later external attempt starts a fresh budget', () {
      fakeAsync((FakeAsync async) {
        final PushSyncRetry retry = PushSyncRetry();
        var runs = 0;
        for (var attempt = 0; attempt < pushSyncRetryLimit; attempt++) {
          retry.schedule(() => runs += 1);
        }
        retry.schedule(() => runs += 1);
        async.elapse(const Duration(seconds: 60));
        expect(runs, 0);
        retry
          ..beginExternalAttempt()
          ..schedule(() => runs += 1);
        async.elapse(const Duration(seconds: 5));
        expect(runs, 1);
      });
    });
  });
}
