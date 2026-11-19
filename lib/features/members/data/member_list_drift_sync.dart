import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/gateway/presence_store.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/gateway.dart';

class MemberListDriftSync {
  MemberListDriftSync(this._database);

  final db.FluxerDatabase _database;

  Future<void> syncFromListUpdate({
    required String guildId,
    required List<MemberListOp> ops,
    required bool Function(List<int>? range) isValidRange,
  }) async {
    final Map<String, MemberListMember> latestByUserId =
        <String, MemberListMember>{};
    for (final MemberListOp op in ops) {
      if (op.op != 'SYNC' || !isValidRange(op.range)) {
        continue;
      }
      for (final MemberListItem item in op.items ?? const <MemberListItem>[]) {
        final MemberListMember? listMember = item.member;
        if (listMember != null) {
          latestByUserId[listMember.member.user.id] = listMember;
        }
      }
    }
    if (latestByUserId.isEmpty) {
      return;
    }
    final List<PresenceUpdateRecord> presenceUpdates = <PresenceUpdateRecord>[
      for (final MemberListMember listMember in latestByUserId.values)
        if (listMember.status case final String status when status.isNotEmpty)
          (
            userId: listMember.member.user.id,
            status: status,
            customStatus: listMember.customStatus,
            mobile: listMember.mobile,
          ),
    ];
    presenceStoreFor(_database).applyAll(presenceUpdates);
    await _database.transaction(() async {
      await _database.userDao.upsertUsersIfChanged(<db.UsersCompanion>[
        for (final MemberListMember listMember in latestByUserId.values)
          userFromPartialSdk(listMember.member.user),
      ]);
      await _database.memberDao
          .upsertGuildMembersIfChanged(guildId, <db.MembersCompanion>[
            for (final MemberListMember listMember in latestByUserId.values)
              memberCompanionFromSdk(listMember.member, guildId: guildId),
          ]);
    });
  }
}
