import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/domain/member.dart' as domain;
import 'package:fluxer_dart/export.dart';

class _FakeFluxerClient extends FluxerClient {
  _FakeFluxerClient() : super(Dio());
}

void main() {
  group('MemberRepository.searchMembersForAutocomplete', () {
    test('searches only scoped user ids', () async {
      final FluxerDatabase database = FluxerDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(database.close);
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
  });
}
