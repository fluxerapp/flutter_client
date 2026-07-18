import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/gateway.dart';

class MemberListDriftSync {
  MemberListDriftSync(this._database);

  final db.FluxerDatabase _database;

  Future<void> syncFromListUpdate({
    required String guildId,
    required int memberCount,
    required int onlineCount,
    required List<MemberListOp> ops,
    required bool Function(List<int>? range) isValidRange,
  }) async {
    final List<db.UsersCompanion> userCompanions = <db.UsersCompanion>[];
    final List<db.MembersCompanion> memberCompanions = <db.MembersCompanion>[];
    final List<
      ({String userId, String status, String? customStatus, bool mobile})
    >
    presenceUpdates =
        <({String userId, String status, String? customStatus, bool mobile})>[];
    for (final MemberListOp op in ops) {
      if (op.op != 'SYNC' || !isValidRange(op.range)) {
        continue;
      }
      final List<MemberListItem>? items = op.items;
      if (items == null) {
        continue;
      }
      for (final MemberListItem item in items) {
        final MemberListMember? listMember = item.member;
        if (listMember == null) {
          continue;
        }
        userCompanions.add(userFromPartialSdk(listMember.member.user));
        memberCompanions.add(
          memberCompanionFromSdk(listMember.member, guildId: guildId),
        );
        final String? status = listMember.status;
        if (status != null && status.isNotEmpty) {
          presenceUpdates.add((
            userId: listMember.member.user.id,
            status: status,
            customStatus: listMember.customStatus,
            mobile: listMember.mobile,
          ));
        }
      }
    }
    await _database.transaction(() async {
      if (userCompanions.isNotEmpty) {
        await _database.userDao.upsertUsers(userCompanions);
      }
      if (memberCompanions.isNotEmpty) {
        await _database.memberDao.upsertMembers(memberCompanions);
      }
      if (presenceUpdates.isNotEmpty) {
        await _database.userDao.updateUserPresencesBatch(presenceUpdates);
      }
      await _database.guildDao.updateServerCounts(
        guildId,
        memberCount: memberCount,
        onlineCount: onlineCount,
      );
    });
  }
}
