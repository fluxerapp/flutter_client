import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

GuildMemberResponse _member(String userId) =>
    GuildMemberResponse.fromJson(<String, Object?>{
      'user': <String, Object?>{
        'id': userId,
        'username': 'user-$userId',
        'discriminator': '0001',
        'global_name': null,
        'avatar': null,
        'avatar_color': null,
        'flags': 0,
      },
      'roles': <String>[],
      'joined_at': '2026-01-01T00:00:00.000Z',
      'mute': false,
      'deaf': false,
    });

void main() {
  test(
    'GUILD_MEMBERS_CHUNK reports its nonce, chunk count and users',
    () async {
      final FluxerDatabase database = openTestDatabase();
      final List<
        ({String guildId, List<String> userIds, int count, String? nonce})
      >
      chunks =
          <
            ({String guildId, List<String> userIds, int count, String? nonce})
          >[];
      final List<(String, List<String>)> seen = <(String, List<String>)>[];
      final GatewayEventHandler handler = GatewayEventHandler(
        database: database,
        onMembersChunk:
            (
              String guildId,
              List<String> userIds, {
              required int chunkCount,
              String? nonce,
            }) {
              chunks.add((
                guildId: guildId,
                userIds: userIds,
                count: chunkCount,
                nonce: nonce,
              ));
            },
        onGuildMembersSeen: (String guildId, List<String> userIds) {
          seen.add((guildId, userIds));
        },
      );

      await handler.handle(
        GuildMembersChunkEvent(
          guildId: 'g1',
          members: <GuildMemberResponse>[_member('u1')],
          chunkIndex: 0,
          chunkCount: 2,
          nonce: '7',
        ),
      );
      await pumpEventQueue();

      expect(chunks, hasLength(1));
      expect(chunks.single.guildId, 'g1');
      expect(chunks.single.userIds, <String>['u1']);
      expect(chunks.single.count, 2);
      expect(chunks.single.nonce, '7');
      expect(seen, hasLength(1));
      expect(seen.single.$1, 'g1');
      expect(seen.single.$2, <String>['u1']);
      expect(await database.memberDao.getMemberByUserId('u1', 'g1'), isNotNull);
    },
  );

  test('GUILD_MEMBER_ADD reports the user as a member', () async {
    final FluxerDatabase database = openTestDatabase();
    final List<(String, List<String>)> seen = <(String, List<String>)>[];
    final GatewayEventHandler handler = GatewayEventHandler(
      database: database,
      onGuildMembersSeen: (String guildId, List<String> userIds) {
        seen.add((guildId, userIds));
      },
    );

    await handler.handle(
      GuildMemberAddEvent(guildId: 'g1', member: _member('u2')),
    );
    await pumpEventQueue();

    expect(seen, hasLength(1));
    expect(seen.single.$1, 'g1');
    expect(seen.single.$2, <String>['u2']);
  });
}
