import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/users.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<FluxerDatabase> with _$UserDaoMixin {
  UserDao(super.attachedDatabase);

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

  Future<void> deleteUser(String id) =>
      (delete(users)..where((u) => u.id.equals(id))).go();

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
    await batch((Batch b) {
      for (final ({
            String userId,
            String status,
            String? customStatus,
            bool mobile,
          })
          entry
          in updates) {
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
  }

  Future<void> clearAll() => delete(users).go();
}
