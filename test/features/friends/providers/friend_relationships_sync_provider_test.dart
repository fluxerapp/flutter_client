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

  @override
  Future<List<Friend>> getRelationships() async {
    syncCallCount++;
    return const [];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  test('syncs relationships after the post-READY sweep delay', () {
    fakeAsync((async) {
      final repo = _RecordingFriendRepository();
      final container =
          ProviderContainer(
              overrides: [friendRepositoryProvider.overrideWithValue(repo)],
            )
            ..read(friendRelationshipsSyncProvider)
            ..read(gatewayFullRecoveryProvider.notifier).bump();
      async.elapse(kFullRecoverySweepDelay - const Duration(seconds: 1));
      expect(
        repo.syncCallCount,
        0,
        reason: 'the sweep must wait out the first channel open after READY',
      );

      async.elapse(const Duration(seconds: 1));
      expect(repo.syncCallCount, 1);
      container.dispose();
    });
  });

  test('bumps during a pending sweep collapse into one sync', () {
    fakeAsync((async) {
      final repo = _RecordingFriendRepository();
      final container =
          ProviderContainer(
              overrides: [friendRepositoryProvider.overrideWithValue(repo)],
            )
            ..read(friendRelationshipsSyncProvider)
            ..read(gatewayFullRecoveryProvider.notifier).bump();
      async.elapse(const Duration(seconds: 1));
      container.read(gatewayFullRecoveryProvider.notifier).bump();
      async.elapse(kFullRecoverySweepDelay * 2);

      expect(repo.syncCallCount, 1);
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
      async.elapse(kFullRecoverySweepDelay * 2);

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
      async.elapse(kFullRecoverySweepDelay);

      expect(repo.syncCallCount, 1);
      container.dispose();
    });
  });
}
