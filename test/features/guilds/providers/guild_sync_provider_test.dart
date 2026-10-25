import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_dart/gateway.dart';

class _FakeConnection extends Fake implements GatewayConnection {
  GatewayState current = GatewayState.connected;
  final List<String> syncedGuildIds = <String>[];

  @override
  GatewayState get state => current;

  @override
  void sendLazyRequest({
    required Map<String, LazyRequestSubscription> subscriptions,
  }) {
    syncedGuildIds.addAll(subscriptions.keys);
  }
}

class _FakeMemberRepository extends Fake implements MemberRepository {}

void main() {
  late _FakeConnection connection;
  late ProviderContainer container;

  setUp(() {
    connection = _FakeConnection();
    container = ProviderContainer(
      overrides: [
        gatewayConnectionProvider.overrideWithValue(connection),
        memberRepositoryProvider.overrideWithValue(_FakeMemberRepository()),
      ],
    );
    addTearDown(container.dispose);
  });

  test('sync requested before the socket connects is sent after READY', () {
    final GuildSync guildSync = container.read(guildSyncProvider.notifier);
    connection.current = GatewayState.connecting;
    guildSync.syncIfNeeded('g1');
    expect(connection.syncedGuildIds, isEmpty);

    connection.current = GatewayState.connected;
    guildSync
      ..clearAll()
      ..flushPending();

    expect(connection.syncedGuildIds, <String>['g1']);
  });

  test('own member resync is sent when the guild was already synced', () {
    final GuildSync guildSync = container.read(guildSyncProvider.notifier)
      ..syncIfNeeded('g1')
      ..requestOwnMemberSync('g1');

    expect(guildSync.state, <String>{'g1'});
    expect(connection.syncedGuildIds, <String>['g1', 'g1']);
  });

  test('repeated own member requests send one resync', () {
    container.read(guildSyncProvider.notifier)
      ..requestOwnMemberSync('g1')
      ..requestOwnMemberSync('g1');

    expect(connection.syncedGuildIds, <String>['g1']);
  });

  test('own member lost again after being seen sends another resync', () {
    container.read(guildSyncProvider.notifier)
      ..requestOwnMemberSync('g1')
      ..ownMemberPresent('g1')
      ..requestOwnMemberSync('g1');

    expect(connection.syncedGuildIds, <String>['g1', 'g1']);
  });
}
