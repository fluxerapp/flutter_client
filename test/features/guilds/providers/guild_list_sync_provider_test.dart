import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_sync_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';

class _RecordingGuildRepository implements GuildRepository {
  int syncCallCount = 0;

  @override
  Future<void> syncServers() async {
    syncCallCount++;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  test('syncs guilds after the post-READY sweep delay', () {
    fakeAsync((async) {
      final repo = _RecordingGuildRepository();
      final container =
          ProviderContainer(
              overrides: [guildRepositoryProvider.overrideWithValue(repo)],
            )
            ..read(guildListSyncProvider)
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
      final repo = _RecordingGuildRepository();
      final container =
          ProviderContainer(
              overrides: [guildRepositoryProvider.overrideWithValue(repo)],
            )
            ..read(guildListSyncProvider)
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
      final repo = _RecordingGuildRepository();
      final container =
          ProviderContainer(
              overrides: [guildRepositoryProvider.overrideWithValue(repo)],
            )
            ..read(guildListSyncProvider)
            ..read(gatewaySessionRecoveryProvider.notifier).bump();
      async.elapse(kFullRecoverySweepDelay * 2);

      expect(repo.syncCallCount, 0);
      container.dispose();
    });
  });

  test('schedules the sweep when session already recovered', () {
    fakeAsync((async) {
      final repo = _RecordingGuildRepository();
      final container = ProviderContainer(
        overrides: [guildRepositoryProvider.overrideWithValue(repo)],
      );

      container.read(gatewayFullRecoveryProvider.notifier).bump();
      container.read(guildListSyncProvider);
      async.elapse(kFullRecoverySweepDelay);

      expect(repo.syncCallCount, 1);
      container.dispose();
    });
  });
}
