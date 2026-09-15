import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_immunity_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_blocked_provider.g.dart';

@riverpod
Stream<bool> isSlowmodeBlocked(Ref ref, String channelId) {
  if (channelId.isEmpty) {
    return Stream<bool>.value(false);
  }
  var disposed = false;
  Timer? waitTimer;
  Completer<void>? waitDone;
  ref
    ..onDispose(() {
      disposed = true;
      waitTimer?.cancel();
      waitTimer = null;
      final Completer<void>? pending = waitDone;
      waitDone = null;
      if (pending != null && !pending.isCompleted) {
        pending.complete();
      }
    })
    ..watch(slowmodeTrackerProvider);
  final tracker = ref.read(slowmodeTrackerProvider.notifier);
  final db = ref.watch(fluxerDatabaseProvider);
  final Future<bool> immune = ref.watch(
    isSlowmodeImmuneProvider(channelId).future,
  );

  return _watchSlowmodeBlocked(
    channelId: channelId,
    db: db,
    tracker: tracker,
    immune: immune,
    isDisposed: () => disposed,
    wait: (Duration duration) {
      waitTimer?.cancel();
      final Completer<void> done = Completer<void>();
      waitDone = done;
      waitTimer = Timer(duration, () {
        waitTimer = null;
        if (waitDone == done) {
          waitDone = null;
        }
        if (!done.isCompleted) {
          done.complete();
        }
      });
      return done.future;
    },
  );
}

Stream<bool> _watchSlowmodeBlocked({
  required String channelId,
  required FluxerDatabase db,
  required SlowmodeTracker tracker,
  required Future<bool> immune,
  required bool Function() isDisposed,
  required Future<void> Function(Duration duration) wait,
}) async* {
  final channel = await db.channelDao.getChannelById(channelId);
  if (isDisposed()) {
    return;
  }
  final rate = channel?.rateLimitPerUser ?? 0;
  final bool isImmune = await immune;
  if (isDisposed()) {
    return;
  }
  if (rate <= 0 || isImmune) {
    yield false;
    return;
  }
  Duration remaining() => tracker.remainingFor(channelId, rate);
  bool? lastBlocked;
  while (!isDisposed()) {
    final Duration waitFor = remaining();
    final bool blocked = waitFor > Duration.zero;
    if (lastBlocked != blocked) {
      lastBlocked = blocked;
      yield blocked;
    }
    if (!blocked) {
      return;
    }
    await wait(waitFor);
  }
}
