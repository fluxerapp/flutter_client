import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/friends/data/friend_repository.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/friends/providers/friend_relationships_sync_provider.dart';

class _RecordingFriendRepository implements FriendRepository {
  int syncCallCount = 0;
  Completer<void>? gate;

  @override
  Future<List<Friend>> getRelationships() async {
    syncCallCount++;
    final Completer<void>? pending = gate;
    if (pending != null) {
      await pending.future;
    }
    return const [];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  test('syncs relationships immediately after READY', () {
    fakeAsync((async) {
      final repo = _RecordingFriendRepository();
      final container =
          ProviderContainer(
              overrides: [friendRepositoryProvider.overrideWithValue(repo)],
            )
            ..read(friendRelationshipsSyncProvider)
            ..read(gatewayFullRecoveryProvider.notifier).bump();
      async.flushMicrotasks();
      expect(repo.syncCallCount, 1);
      container.dispose();
    });
  });

  test('READY bumps during a fetch run one more sync after', () {
    fakeAsync((async) {
      final repo = _RecordingFriendRepository()..gate = Completer<void>();
      final container =
          ProviderContainer(
              overrides: [friendRepositoryProvider.overrideWithValue(repo)],
            )
            ..read(friendRelationshipsSyncProvider)
            ..read(gatewayFullRecoveryProvider.notifier).bump();
      async.flushMicrotasks();
      expect(repo.syncCallCount, 1);

      container.read(gatewayFullRecoveryProvider.notifier).bump();
      container.read(gatewayFullRecoveryProvider.notifier).bump();
      repo.gate!.complete();
      async.flushMicrotasks();

      expect(repo.syncCallCount, 2);
      container.dispose();
    });
  });

  test('does not sync on a light resume recovery', () {
    fakeAsync((async) {
      final repo = _RecordingFriendRepository();
      final container =
          ProviderContainer(
              overrides: [friendRepositoryProvider.overrideWithValue(repo)],
            )
            ..read(friendRelationshipsSyncProvider)
            ..read(gatewaySessionRecoveryProvider.notifier).bump();
      async.flushMicrotasks();

      expect(repo.syncCallCount, 0);
      container.dispose();
    });
  });

  test('schedules the sweep when session already recovered', () {
    fakeAsync((async) {
      final repo = _RecordingFriendRepository();
      final container = ProviderContainer(
        overrides: [friendRepositoryProvider.overrideWithValue(repo)],
      );

      container.read(gatewayFullRecoveryProvider.notifier).bump();
      container.read(friendRelationshipsSyncProvider);
      async.flushMicrotasks();

      expect(repo.syncCallCount, 1);
      container.dispose();
    });
  });
}
