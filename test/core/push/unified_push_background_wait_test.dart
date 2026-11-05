import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_background_native.dart';

void main() {
  const Duration quiet = Duration(seconds: 2);

  test('finishes after the quiet period with no messages', () {
    fakeAsync((FakeAsync async) {
      final UnifiedPushBackgroundWork work = UnifiedPushBackgroundWork();
      final List<int> finishes = <int>[];
      unawaited(
        runUnifiedPushBackgroundUntilIdle(
          work,
          finish: (int handled) async {
            finishes.add(handled);
            return true;
          },
        ),
      );
      async.elapse(quiet);
      expect(finishes, <int>[0]);
    });
  });

  test('waits for every message in a burst', () {
    fakeAsync((FakeAsync async) {
      final UnifiedPushBackgroundWork work = UnifiedPushBackgroundWork();
      final List<int> finishes = <int>[];
      unawaited(
        runUnifiedPushBackgroundUntilIdle(
          work,
          finish: (int handled) async {
            finishes.add(handled);
            return true;
          },
        ),
      );
      work
        ..messageStarted()
        ..messageStarted()
        ..messageStarted()
        ..messageFinished();
      async.elapse(quiet * 5);
      expect(finishes, isEmpty);
      work
        ..messageFinished()
        ..messageFinished();
      async.elapse(quiet);
      expect(finishes, <int>[3]);
    });
  });

  test('a message during the quiet period restarts the wait', () {
    fakeAsync((FakeAsync async) {
      final UnifiedPushBackgroundWork work = UnifiedPushBackgroundWork();
      final List<int> finishes = <int>[];
      unawaited(
        runUnifiedPushBackgroundUntilIdle(
          work,
          finish: (int handled) async {
            finishes.add(handled);
            return true;
          },
        ),
      );
      async.elapse(const Duration(seconds: 1));
      work.messageStarted();
      async.elapse(quiet);
      expect(finishes, isEmpty);
      work.messageFinished();
      async.elapse(quiet);
      expect(finishes, <int>[1]);
    });
  });

  test('keeps waiting when native still has undelivered messages', () {
    fakeAsync((FakeAsync async) {
      final UnifiedPushBackgroundWork work = UnifiedPushBackgroundWork();
      final List<int> finishes = <int>[];
      var done = false;
      unawaited(
        runUnifiedPushBackgroundUntilIdle(
          work,
          finish: (int handled) async {
            finishes.add(handled);
            return handled >= 1;
          },
        ).then((_) => done = true),
      );
      async.elapse(quiet);
      expect(finishes, <int>[0]);
      expect(done, isFalse);
      work
        ..messageStarted()
        ..messageFinished();
      async.elapse(quiet);
      expect(finishes, <int>[0, 1]);
      expect(done, isTrue);
    });
  });
}
