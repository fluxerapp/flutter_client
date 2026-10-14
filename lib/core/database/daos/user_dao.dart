import 'dart:math' as math;

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/users.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<FluxerDatabase> with _$UserDaoMixin {
  UserDao(super.attachedDatabase);

  static const int _presenceLookupChunkSize = 500;

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
    await batch((b) {
      for (final user in userList) {
        b.insert(users, user, onConflict: DoUpdate((_) => user));
      }
    });
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
      for (var i = 0; i < userIds.length; i += _presenceLookupChunkSize) {
        final chunk = userIds.sublist(
          i,
          math.min(i + _presenceLookupChunkSize, userIds.length),
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
