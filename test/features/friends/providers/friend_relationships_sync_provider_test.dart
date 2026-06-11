import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
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
  test('syncs relationships when gateway becomes ready', () async {
    final repo = _RecordingFriendRepository();
    final container = ProviderContainer(
      overrides: [friendRepositoryProvider.overrideWithValue(repo)],
    );
    addTearDown(container.dispose);

    container.read(friendRelationshipsSyncProvider);
    expect(repo.syncCallCount, 0);

    container.read(gatewayReadyProvider.notifier).setReady();
    await Future<void>.delayed(Duration.zero);

    expect(repo.syncCallCount, 1);
  });

  test('syncs immediately when gateway is already ready', () async {
    final repo = _RecordingFriendRepository();
    final container = ProviderContainer(
      overrides: [friendRepositoryProvider.overrideWithValue(repo)],
    );
    addTearDown(container.dispose);

    container.read(gatewayReadyProvider.notifier).setReady();
    container.read(friendRelationshipsSyncProvider);
    await Future<void>.delayed(Duration.zero);

    expect(repo.syncCallCount, 1);
  });
}
