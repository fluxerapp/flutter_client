import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';

void main() {
  group('GuildMemberChunkWaiter', () {
    test('beginRequest ignores unscoped and stale chunk notifications', () {
      final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();
      final int firstRequest = waiter.beginRequest('g1');
      waiter.notifyChunk('g1', userIds: <String>['unscoped']);
      expect(waiter.lastChunkUserIds('g1'), isEmpty);
      expect(waiter.activeRequestId('g1'), firstRequest);

      final int secondRequest = waiter.beginRequest('g1');
      expect(waiter.lastChunkUserIds('g1'), isEmpty);
      waiter.notifyChunk(
        'g1',
        userIds: <String>['fresh'],
        requestId: secondRequest,
      );
      expect(waiter.lastChunkUserIds('g1'), <String>['fresh']);
      expect(waiter.activeRequestId('g1'), isNull);
      waiter.notifyChunk(
        'g1',
        userIds: <String>['old'],
        requestId: secondRequest - 1,
      );
      expect(waiter.lastChunkUserIds('g1'), <String>['fresh']);
    });

    test('waitForChunk completes when matching chunk arrives', () async {
      final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();
      final int requestId = waiter.beginRequest('g1');
      final Future<void> pending = waiter.waitForChunk(
        'g1',
        requestId: requestId,
      );
      waiter.notifyChunk('g1', userIds: <String>['u1'], requestId: requestId);
      await pending;
      expect(waiter.lastChunkUserIds('g1'), <String>['u1']);
      expect(waiter.activeRequestId('g1'), isNull);
    });

    test('nonce helpers round-trip request ids', () {
      expect(GuildMemberChunkWaiter.nonceFor(42), '42');
      expect(GuildMemberChunkWaiter.requestIdFromNonce('42'), 42);
      expect(GuildMemberChunkWaiter.requestIdFromNonce(null), isNull);
      expect(GuildMemberChunkWaiter.requestIdFromNonce(''), isNull);
      expect(GuildMemberChunkWaiter.requestIdFromNonce('abc'), isNull);
    });

    test('unscoped chunks still complete waits without beginRequest', () async {
      final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();
      final Future<void> pending = waiter.waitForChunk('g1');
      waiter.notifyChunk('g1', userIds: <String>['u1']);
      await pending;
      expect(waiter.lastChunkUserIds('g1'), <String>['u1']);
    });
  });
}
