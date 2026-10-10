import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';

void main() {
  group('GuildMemberChunkWaiter', () {
    test('resolves with the users of the chunk echoing its nonce', () async {
      final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();
      late final String nonce;
      final Future<List<String>?> result = waiter.request(
        send: (String value) => nonce = value,
      );

      waiter.notifyChunk(
        nonce: nonce,
        chunkCount: 1,
        userIds: <String>['u1', 'u2'],
      );

      expect(await result, <String>['u1', 'u2']);
    });

    test('gives every request its own nonce', () async {
      final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();
      final List<String> nonces = <String>[];
      final Future<List<String>?> first = waiter.request(send: nonces.add);
      final Future<List<String>?> second = waiter.request(send: nonces.add);

      expect(nonces.toSet(), hasLength(2));
      waiter
        ..notifyChunk(
          nonce: nonces[1],
          chunkCount: 1,
          userIds: <String>['second'],
        )
        ..notifyChunk(
          nonce: nonces[0],
          chunkCount: 1,
          userIds: <String>['first'],
        );

      expect(await first, <String>['first']);
      expect(await second, <String>['second']);
    });

    test('waits for every chunk of a split response', () async {
      final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();
      late final String nonce;
      bool completed = false;
      final Future<List<String>?> result = waiter
          .request(send: (String value) => nonce = value)
          .whenComplete(() => completed = true);

      waiter.notifyChunk(nonce: nonce, chunkCount: 2, userIds: <String>['u1']);
      await pumpEventQueue();
      expect(completed, isFalse);

      waiter.notifyChunk(nonce: nonce, chunkCount: 2, userIds: <String>['u2']);

      expect(await result, <String>['u1', 'u2']);
    });

    test(
      'ignores chunks of other requests and chunks without a nonce',
      () async {
        final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();
        final Future<List<String>?> result = waiter.request(
          send: (_) {},
          timeout: const Duration(milliseconds: 50),
        );

        waiter
          ..notifyChunk(nonce: 'other', chunkCount: 1, userIds: <String>['x'])
          ..notifyChunk(nonce: null, chunkCount: 1, userIds: <String>['y']);

        expect(await result, isNull);
      },
    );

    test('resolves with null when no reply arrives', () async {
      final GuildMemberChunkWaiter waiter = GuildMemberChunkWaiter();

      expect(
        await waiter.request(
          send: (_) {},
          timeout: const Duration(milliseconds: 20),
        ),
        isNull,
      );
    });
  });
}
