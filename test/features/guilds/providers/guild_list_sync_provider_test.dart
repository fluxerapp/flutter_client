import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
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
  test('syncs guilds when gateway becomes ready', () async {
    final repo = _RecordingGuildRepository();
    final container = ProviderContainer(
      overrides: [guildRepositoryProvider.overrideWithValue(repo)],
    );
    addTearDown(container.dispose);

    container.read(guildListSyncProvider);
    expect(repo.syncCallCount, 0);

    container.read(gatewayReadyProvider.notifier).setReady();
    await Future<void>.delayed(Duration.zero);

    expect(repo.syncCallCount, 1);
  });

  test('syncs immediately when gateway is already ready', () async {
    final repo = _RecordingGuildRepository();
    final container = ProviderContainer(
      overrides: [guildRepositoryProvider.overrideWithValue(repo)],
    );
    addTearDown(container.dispose);

    container.read(gatewayReadyProvider.notifier).setReady();
    container.read(guildListSyncProvider);
    await Future<void>.delayed(Duration.zero);

    expect(repo.syncCallCount, 1);
  });
}
