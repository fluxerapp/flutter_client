import 'package:flutter_test/flutter_test.dart';
import '../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

void main() {
  late FluxerDatabase database;

  setUp(() {
    database = openTestDatabase();
  });

  group('MemberDao', () {
    test('countMembers returns cached row count', () async {
      await database.memberDao.upsertMember(
        MembersCompanion.insert(userId: 'u1', guildId: 'g1'),
      );
      await database.memberDao.upsertMember(
        MembersCompanion.insert(userId: 'u2', guildId: 'g1'),
      );
      expect(await database.memberDao.countMembers('g1'), 2);
    });

    test('getMembersByUserIds returns only requested rows', () async {
      await database.memberDao.upsertMember(
        MembersCompanion.insert(userId: 'u1', guildId: 'g1'),
      );
      await database.memberDao.upsertMember(
        MembersCompanion.insert(userId: 'u2', guildId: 'g1'),
      );
      final List<Member> rows = await database.memberDao.getMembersByUserIds(
        'g1',
        <String>['u2'],
      );
      expect(rows.length, 1);
      expect(rows.single.userId, 'u2');
    });

    test(
      'evictStaleMembers removes oldest rows outside protected set',
      () async {
        for (int i = 0; i < 5; i++) {
          await database.memberDao.upsertMember(
            MembersCompanion.insert(userId: 'u$i', guildId: 'g1'),
          );
        }
        await database.memberDao.evictStaleMembers(
          guildId: 'g1',
          protectedUserIds: <String>{'u4'},
          maxMembers: 3,
        );
        expect(await database.memberDao.countMembers('g1'), 3);
        final Member? kept = await database.memberDao.getMemberByUserId(
          'u4',
          'g1',
        );
        expect(kept, isNotNull);
      },
    );
  });
}
