import 'package:drift/drift.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/auth_sessions.dart';

part 'auth_session_dao.g.dart';

@DriftAccessor(tables: [AuthSessions])
class AuthSessionDao extends DatabaseAccessor<FluxerDatabase>
    with _$AuthSessionDaoMixin {
  AuthSessionDao(super.attachedDatabase);

  Future<List<AuthSession>> getAllSessions() => (select(
    authSessions,
  )..orderBy([(t) => OrderingTerm.desc(t.lastActive)])).get();

  Future<AuthSession?> getSession(String userId) => (select(
    authSessions,
  )..where((t) => t.userId.equals(userId))).getSingleOrNull();

  Future<AuthSession?> getActiveSession() =>
      (select(authSessions)
            ..where((t) => t.isValid.equals(true))
            ..orderBy([(t) => OrderingTerm.desc(t.lastActive)])
            ..limit(1))
          .getSingleOrNull();

  Future<void> saveSessionMetadata({
    required String userId,
    String? username,
    String? discriminator,
    String? avatar,
    String? instanceSnapshotJson,
  }) => into(authSessions).insertOnConflictUpdate(
    AuthSessionsCompanion.insert(
      userId: userId,
      username: Value(username),
      discriminator: Value(discriminator),
      avatar: Value(avatar),
      instanceSnapshotJson: Value(instanceSnapshotJson),
      isValid: const Value(true),
      lastActive: Value(DateTime.now()),
    ),
  );

  Future<String?> getInstanceSnapshotJson(String userId) async {
    final AuthSession? session = await getSession(userId);
    return session?.instanceSnapshotJson;
  }

  Future<void> updateInstanceSnapshotJson({
    required String userId,
    required String instanceSnapshotJson,
  }) => (update(authSessions)..where((t) => t.userId.equals(userId))).write(
    AuthSessionsCompanion(instanceSnapshotJson: Value(instanceSnapshotJson)),
  );

  Future<void> touchSession(String userId) =>
      (update(authSessions)..where((t) => t.userId.equals(userId))).write(
        AuthSessionsCompanion(
          isValid: const Value(true),
          lastActive: Value(DateTime.now()),
        ),
      );

  Future<void> updateUserData({
    required String userId,
    required String? username,
    required String? discriminator,
    required String? avatar,
  }) => (update(authSessions)..where((t) => t.userId.equals(userId))).write(
    AuthSessionsCompanion(
      username: Value(username),
      discriminator: Value(discriminator),
      avatar: Value(avatar),
    ),
  );

  Future<void> markInvalid(String userId) =>
      (update(authSessions)..where((t) => t.userId.equals(userId))).write(
        const AuthSessionsCompanion(isValid: Value(false)),
      );

  Future<void> removeSession(String userId) =>
      (delete(authSessions)..where((t) => t.userId.equals(userId))).go();

  Future<bool> _hasLegacyTokenColumn() async {
    final List<QueryRow> columns = await customSelect(
      'PRAGMA table_info(auth_sessions)',
      readsFrom: <TableInfo<Table, Object?>>{},
    ).get();
    return columns.any((QueryRow row) => row.read<String>('name') == 'token');
  }

  Future<List<({String userId, String token})>> getLegacyTokens() async {
    if (!await _hasLegacyTokenColumn()) {
      return <({String userId, String token})>[];
    }
    final List<QueryRow> rows = await customSelect('''
      SELECT user_id, token
      FROM auth_sessions
      WHERE token IS NOT NULL AND token != ''
      ''', readsFrom: <TableInfo<Table, Object?>>{}).get();
    return rows
        .map(
          (QueryRow row) => (
            userId: row.read<String>('user_id'),
            token: row.read<String>('token'),
          ),
        )
        .toList();
  }

  Future<void> clearLegacyTokens() async {
    if (!await _hasLegacyTokenColumn()) {
      return;
    }
    await customStatement('''
      UPDATE auth_sessions
      SET token = ''
      WHERE token IS NOT NULL AND token != ''
      ''');
  }

  Future<void> dropLegacyTokenColumnIfPresent() async {
    if (!await _hasLegacyTokenColumn()) {
      return;
    }
    await customStatement('ALTER TABLE auth_sessions DROP COLUMN token');
  }
}
