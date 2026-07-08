import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';

void main() {
  group('GuildMemberChunkWaiter', () {
    test('beginRequest ignores stale chunk notifications', () async {
      final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();
      waiter.beginRequest('g1');
      waiter.notifyChunk('g1', userIds: <String>['stale']);
      final int secondRequest = waiter.beginRequest('g1');
      expect(waiter.lastChunkUserIds('g1'), isEmpty);
      waiter.notifyChunk(
        'g1',
        userIds: <String>['fresh'],
        requestId: secondRequest,
      );
      expect(waiter.lastChunkUserIds('g1'), <String>['fresh']);
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
    });
  });
}
