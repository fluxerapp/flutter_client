import 'dart:math' as math;

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/bulk_upsert.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/users.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<FluxerDatabase> with _$UserDaoMixin {
  UserDao(super.attachedDatabase);

  static const int _idLookupChunkSize = 500;

  Future<User?> getUserById(String id) =>
      (select(users)..where((u) => u.id.equals(id))).getSingleOrNull();

  Future<List<User>> getUsersByIds(List<String> ids) {
    if (ids.isEmpty) {
      return Future.value([]);
    }
    return (select(users)..where((u) => u.id.isIn(ids))).get();
  }

  Stream<User?> watchUserById(String id) =>
      (select(users)..where((u) => u.id.equals(id)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Stream<List<User>> watchUsersByIds(List<String> ids) {
    if (ids.isEmpty) {
      return Stream<List<User>>.value(const <User>[]);
    }
    return (select(
      users,
    )..where((u) => u.id.isIn(ids))).watch().suppressDriftCancellation;
  }

  Future<void> upsertUser(UsersCompanion user) =>
      into(users).insertOnConflictUpdate(user);

  Future<void> upsertUsers(List<UsersCompanion> userList) async {
    if (userList.isEmpty) {
      return;
    }
    await batch((Batch b) => batchUpsert(b, attachedDatabase, users, userList));
  }

  Future<void> upsertUsersIfChanged(Iterable<UsersCompanion> userList) async {
    final Map<String, UsersCompanion> latestById = <String, UsersCompanion>{
      for (final UsersCompanion user in userList)
        if (user.id.present) user.id.value: user,
    };
    if (latestById.isEmpty) {
      return;
    }
    final List<String> ids = latestById.keys.toList();
    final Map<String, User> stored = <String, User>{};
    for (var i = 0; i < ids.length; i += _idLookupChunkSize) {
      for (final User row in await getUsersByIds(
        ids.sublist(i, math.min(i + _idLookupChunkSize, ids.length)),
      )) {
        stored[row.id] = row;
      }
    }
    await upsertUsers(<UsersCompanion>[
      for (final MapEntry<String, UsersCompanion> entry in latestById.entries)
        if (rowDiffersFromStored(
          attachedDatabase,
          entry.value,
          stored[entry.key],
        ))
          entry.value,
    ]);
  }

  Future<void> updateUserMentionFlags(String id, int? mentionFlags) =>
      (update(users)..where((u) => u.id.equals(id))).write(
        UsersCompanion(mentionFlags: Value(mentionFlags)),
      );

  Future<void> updateUserPresence(
    String id, {
    required String status,
    String? customStatus,
    bool? mobile,
  }) => (update(users)..where((u) => u.id.equals(id))).write(
    UsersCompanion(
      status: Value(status),
      customStatus: Value(customStatus),
      mobile: mobile == null ? const Value.absent() : Value(mobile),
    ),
  );

  Future<void> updateUserPresencesBatch(
    List<({String userId, String status, String? customStatus, bool mobile})>
    updates,
  ) async {
    if (updates.isEmpty) {
      return;
    }
    await transaction(() async {
      final latestByUserId = {for (final entry in updates) entry.userId: entry};
      final userIds = latestByUserId.keys.toList();
      final stored =
          <String, ({String status, String? customStatus, bool mobile})>{};
      for (var i = 0; i < userIds.length; i += _idLookupChunkSize) {
        final chunk = userIds.sublist(
          i,
          math.min(i + _idLookupChunkSize, userIds.length),
        );
        final rows =
            await (selectOnly(users)
                  ..addColumns([
                    users.id,
                    users.status,
                    users.customStatus,
                    users.mobile,
                  ])
                  ..where(users.id.isIn(chunk)))
                .get();
        for (final row in rows) {
          stored[row.read(users.id)!] = (
            status: row.read(users.status)!,
            customStatus: row.read(users.customStatus),
            mobile: row.read(users.mobile)!,
          );
        }
      }
      final changed = latestByUserId.values.where((entry) {
        final current = stored[entry.userId];
        return current != null &&
            (current.status != entry.status ||
                current.customStatus != entry.customStatus ||
                current.mobile != entry.mobile);
      }).toList();
      if (changed.isEmpty) {
        return;
      }
      await batch((Batch b) {
        for (final entry in changed) {
          b.update(
            users,
            UsersCompanion(
              status: Value(entry.status),
              customStatus: Value(entry.customStatus),
              mobile: Value(entry.mobile),
            ),
            where: (u) => u.id.equals(entry.userId),
          );
        }
      });
    });
  }

  Future<void> resetPresences() => update(users).write(
    const UsersCompanion(
      status: Value('offline'),
      customStatus: Value(null),
      mobile: Value(false),
    ),
  );

  Future<void> clearAll() => delete(users).go();
}
