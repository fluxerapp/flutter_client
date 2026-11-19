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
          .distinct()
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

  Future<void> upsertUserIfChanged(UsersCompanion user) =>
      upsertUsersIfChanged(<UsersCompanion>[user]);

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

  Future<void> clearAll() => delete(users).go();
}
