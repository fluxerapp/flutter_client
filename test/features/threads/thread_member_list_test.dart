import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_member_list_provider.dart';
import 'package:fluxer_dart/gateway.dart';

class _NoGuildSync extends GuildSync {
  @override
  void syncIfNeeded(String guildId, {bool force = false}) {}
}

class _FakeConnection extends Fake implements GatewayConnection {
  final List<LazyRequestSubscription?> sent = <LazyRequestSubscription?>[];

  @override
  GatewayState get state => GatewayState.connected;

  @override
  void sendLazyRequest({
    required Map<String, LazyRequestSubscription> subscriptions,
  }) {
    sent.add(subscriptions['g1']);
  }
}

void main() {
  test(
    'a fresh READY on the same connection resubscribes the open thread',
    () async {
      final _FakeConnection connection = _FakeConnection();
      final ProviderContainer container = ProviderContainer(
        overrides: [
          gatewayConnectionProvider.overrideWithValue(connection),
          guildSyncProvider.overrideWith(_NoGuildSync.new),
        ],
      );
      addTearDown(container.dispose);
      final ProviderSubscription<void> sub = container.listen<void>(
        threadMemberListSubscriptionProvider('g1', 't1'),
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);
      await Future<void>.delayed(Duration.zero);
      final LazyRequestSubscription? first = connection.sent.single;
      expect(first?.threadMemberLists, <String>['t1']);
      expect(first?.threads, isTrue);
      expect(first?.active, isTrue);
      expect(first?.sync, isTrue);

      container.read(threadMemberListsProvider.notifier).clearAll();
      container.read(gatewayFullRecoveryProvider.notifier).bump();
      await Future<void>.delayed(Duration.zero);
      expect(connection.sent, hasLength(2));
      expect(connection.sent.last?.threadMemberLists, <String>['t1']);
    },
  );

  test('switching threads keeps the new subscription in the guild set', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    final ThreadMemberLists lists = container.read(
      threadMemberListsProvider.notifier,
    );

    expect(lists.subscribe('g1', 'a'), <String>['a']);
    expect(lists.subscribe('g1', 'b'), unorderedEquals(<String>['a', 'b']));
    expect(lists.subscribe('g2', 'c'), <String>['c']);
    expect(lists.unsubscribe('g1', 'a'), <String>['b']);
    expect(lists.unsubscribe('g1', 'b'), isEmpty);
    expect(lists.unsubscribe('g1', 'b'), isEmpty);
    expect(lists.subscribe('g2', 'd'), unorderedEquals(<String>['c', 'd']));
  });
}
