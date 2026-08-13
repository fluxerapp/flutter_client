import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

void main() {
  test('dedupeUsersCompanionsById keeps the last companion per user id', () {
    final List<UsersCompanion> deduped =
        dedupeUsersCompanionsById(<UsersCompanion>[
          UsersCompanion.insert(id: 'user-1', username: 'first'),
          UsersCompanion.insert(id: 'user-1', username: 'second'),
          UsersCompanion.insert(id: 'user-2', username: 'other'),
        ]);

    expect(deduped, hasLength(2));
    expect(
      deduped
          .singleWhere((UsersCompanion user) => user.id.value == 'user-1')
          .username
          .value,
      'second',
    );
  });

  test('upsertGuildMembersFromSdk writes users and members in batch', () async {
    final FluxerDatabase database = openTestDatabase();
    final GuildMemberResponse sdk = GuildMemberResponse.fromJson(
      <String, Object?>{
        'user': <String, Object?>{
          'id': 'user-1',
          'username': 'alice',
          'discriminator': '0000',
          'global_name': 'Global Alice',
          'avatar': null,
          'avatar_color': null,
          'flags': 0,
        },
        'nick': 'Guild Alice',
        'roles': <Object?>[],
        'joined_at': '2026-01-01T00:00:00.000Z',
        'mute': false,
        'deaf': false,
      },
    );

    await upsertGuildMembersFromSdk(database, 'guild-1', <GuildMemberResponse>[
      sdk,
    ]);

    final User? user = await database.userDao.getUserById('user-1');
    final Member? member = await database.memberDao.getMemberByUserId(
      'user-1',
      'guild-1',
    );
    expect(user?.username, 'alice');
    expect(member?.nick, 'Guild Alice');
  });

  test('upsertGuildMembersFromSdk writes a full chunk in one batch', () async {
    final FluxerDatabase database = openTestDatabase();
    final List<GuildMemberResponse> chunk = <GuildMemberResponse>[
      for (int i = 0; i < 25; i++)
        GuildMemberResponse.fromJson(<String, Object?>{
          'user': <String, Object?>{
            'id': 'user-$i',
            'username': 'user$i',
            'discriminator': '0000',
            'global_name': 'User $i',
            'avatar': null,
            'avatar_color': null,
            'flags': 0,
          },
          'nick': 'Nick $i',
          'roles': <Object?>[],
          'joined_at': '2026-01-01T00:00:00.000Z',
          'mute': false,
          'deaf': false,
        }),
    ];

    await upsertGuildMembersFromSdk(database, 'guild-1', chunk);

    expect(await database.memberDao.countMembers('guild-1'), 25);
    expect(await database.userDao.getUserById('user-0'), isNotNull);
    expect(await database.userDao.getUserById('user-24'), isNotNull);
    final Member? last = await database.memberDao.getMemberByUserId(
      'user-24',
      'guild-1',
    );
    expect(last?.nick, 'Nick 24');
  });
}
