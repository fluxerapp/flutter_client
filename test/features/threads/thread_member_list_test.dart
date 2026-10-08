import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_member_list_provider.dart';
import 'package:fluxer_dart/gateway.dart';

class _FakeConnection extends Fake implements GatewayConnection {
  final List<List<String>?> sent = <List<String>?>[];

  @override
  GatewayState get state => GatewayState.connected;

  @override
  void sendLazyRequest({
    required Map<String, LazyRequestSubscription> subscriptions,
  }) {
    sent.add(subscriptions['g1']?.threadMemberLists);
  }
}

void main() {
  test(
    'a fresh READY on the same connection resubscribes the open thread',
    () async {
      final _FakeConnection connection = _FakeConnection();
      final ProviderContainer container = ProviderContainer(
        overrides: [gatewayConnectionProvider.overrideWithValue(connection)],
      );
      addTearDown(container.dispose);
      final ThreadsGate gate = container.read(threadsGateProvider);
      container.read(threadGuildGateProvider);
      gate.apply('g1', active: true);
      final ProviderSubscription<void> sub = container.listen<void>(
        threadMemberListSubscriptionProvider('g1', 't1'),
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(sub.close);
      await Future<void>.delayed(Duration.zero);
      expect(connection.sent, <List<String>?>[
        <String>['t1'],
      ]);

      gate
        ..resetConnection()
        ..apply('g1', active: true);
      container.read(threadMemberListsProvider.notifier).clearAll();
      container.read(gatewayFullRecoveryProvider.notifier).bump();
      await Future<void>.delayed(Duration.zero);
      expect(connection.sent, <List<String>?>[
        <String>['t1'],
        <String>['t1'],
      ]);
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

  test('clearing one guild keeps the lists of other guilds', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(threadMemberListsProvider.notifier)
      ..subscribe('g1', 'a')
      ..subscribe('g2', 'b')
      ..apply(
        const ThreadMemberListUpdateEvent(
          guildId: 'g1',
          threadId: 'a',
          members: <ThreadMemberEntry>[],
        ),
      )
      ..apply(
        const ThreadMemberListUpdateEvent(
          guildId: 'g2',
          threadId: 'b',
          members: <ThreadMemberEntry>[],
        ),
      )
      ..clearGuild('g1');
    expect(container.read(threadMemberListsProvider).keys, <String>['b']);
  });
}
