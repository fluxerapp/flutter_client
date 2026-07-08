import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/domain/member.dart' as domain;
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

class _FakeFluxerClient extends FluxerClient {
  _FakeFluxerClient() : super(Dio());
}

void main() {
  group('MemberRepository.searchMembersForAutocomplete', () {
    test('searches only scoped user ids', () async {
      final FluxerDatabase database = openTestDatabase();
      await database.memberDao.upsertMember(
        MembersCompanion.insert(userId: 'alice', guildId: 'g1'),
      );
      await database.memberDao.upsertMember(
        MembersCompanion.insert(userId: 'bob', guildId: 'g1'),
      );
      await database.userDao.upsertUser(
        UsersCompanion.insert(id: 'alice', username: 'alice'),
      );
      await database.userDao.upsertUser(
        UsersCompanion.insert(id: 'bob', username: 'bob'),
      );
      final MemberRepository repository = MemberRepository(
        _FakeFluxerClient(),
        database,
      );
      final List<domain.Member> hits = await repository
          .searchMembersForAutocomplete(
            guildId: 'g1',
            query: 'ali',
            scopeUserIds: <String>['alice', 'bob'],
          );
      expect(hits.length, 1);
      expect(hits.single.id, 'alice');
    });

    test('matches account global name when guild nick is set', () async {
      final FluxerDatabase database = openTestDatabase();
      await database.memberDao.upsertMember(
        MembersCompanion.insert(
          userId: 'alice',
          guildId: 'g1',
          nick: const Value('Admin'),
        ),
      );
      await database.userDao.upsertUser(
        UsersCompanion.insert(
          id: 'alice',
          username: 'alice123',
          globalName: const Value('Alice'),
        ),
      );
      final MemberRepository repository = MemberRepository(
        _FakeFluxerClient(),
        database,
      );
      final List<domain.Member> hits = await repository
          .searchMembersForAutocomplete(
            guildId: 'g1',
            query: 'alice',
            scopeUserIds: <String>['alice'],
          );
      expect(hits.single.globalName, 'Alice');
      expect(hits.single.nickname, 'Admin');
    });
  });

  group('MemberRepository cache helpers', () {
    test(
      'isGuildMemberCacheComplete compares cached rows to member count',
      () async {
        final FluxerDatabase database = openTestDatabase();
        await database.guildDao.upsertServer(
          ServersCompanion.insert(
            id: 'g1',
            name: 'Guild',
            memberCount: const Value(2),
          ),
        );
        await database.memberDao.upsertMember(
          MembersCompanion.insert(userId: 'u1', guildId: 'g1'),
        );
        final MemberRepository repository = MemberRepository(
          _FakeFluxerClient(),
          database,
        );
        expect(await repository.isGuildMemberCacheComplete('g1'), isFalse);
        await database.memberDao.upsertMember(
          MembersCompanion.insert(userId: 'u2', guildId: 'g1'),
        );
        expect(await repository.isGuildMemberCacheComplete('g1'), isTrue);
      },
    );

    test('getCachedMembersForGuild returns all cached members', () async {
      final FluxerDatabase database = openTestDatabase();
      await database.memberDao.upsertMember(
        MembersCompanion.insert(userId: 'u1', guildId: 'g1'),
      );
      await database.memberDao.upsertMember(
        MembersCompanion.insert(userId: 'u2', guildId: 'g1'),
      );
      await database.userDao.upsertUser(
        UsersCompanion.insert(id: 'u1', username: 'one'),
      );
      await database.userDao.upsertUser(
        UsersCompanion.insert(id: 'u2', username: 'two'),
      );
      final MemberRepository repository = MemberRepository(
        _FakeFluxerClient(),
        database,
      );
      final List<domain.Member> members = await repository
          .getCachedMembersForGuild('g1');
      expect(members.length, 2);
    });
  });
}
