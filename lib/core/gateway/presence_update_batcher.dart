import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/platform/fluxer_platform.dart';

const Duration kPresenceUpdateBatchDelay = Duration(milliseconds: 500);

bool get isFluxerMobileClient => isFluxerMobileOs;

String? _companionNullableString(Value<String?> value, String? fallback) =>
    value.present ? value.value : fallback;

String _companionString(Value<String> value, String fallback) =>
    value.present ? value.value : fallback;

bool _companionBool(Value<bool> value, {required bool fallback}) =>
    value.present ? value.value : fallback;

int? _companionInt(Value<int?> value, int? fallback) =>
    value.present ? value.value : fallback;

typedef PresenceUpdateRecord = ({
  String userId,
  String status,
  String? customStatus,
  bool mobile,
});

class PresenceUpdateBatcher {
  PresenceUpdateBatcher({
    required this._database,
    required this._currentUserId,
    this._batchDelay = kPresenceUpdateBatchDelay,
  });

  final db.FluxerDatabase _database;
  final String? _currentUserId;
  final Duration _batchDelay;

  final Map<String, PresenceUpdateRecord> _pending =
      <String, PresenceUpdateRecord>{};
  final Map<String, db.UsersCompanion> _pendingUsers =
      <String, db.UsersCompanion>{};
  Timer? _flushTimer;
  bool _disposed = false;

  void enqueue({
    required String userId,
    required String status,
    String? customStatus,
    bool mobile = false,
    db.UsersCompanion? user,
  }) {
    if (_disposed) {
      return;
    }
    if (userId == _currentUserId) {
      unawaited(() async {
        if (user != null) {
          final db.User? existing = await _database.userDao.getUserById(userId);
          if (existing == null || !_profileCompanionMatches(existing, user)) {
            await _database.userDao.upsertUser(user);
          }
        }
        await _database.userDao.updateUserPresence(
          userId,
          status: status,
          customStatus: customStatus,
          mobile: isFluxerMobileClient,
        );
      }());
      return;
    }
    if (user != null) {
      _pendingUsers[userId] = user;
    }
    _pending[userId] = (
      userId: userId,
      status: status,
      customStatus: customStatus,
      mobile: mobile,
    );
    _scheduleFlush();
  }

  Future<void> flush() async {
    if (_pending.isEmpty) {
      return;
    }
    final List<PresenceUpdateRecord> updates = _pending.values.toList();
    final List<db.UsersCompanion> users = _pendingUsers.values.toList();
    _pending.clear();
    _pendingUsers.clear();
    _flushTimer?.cancel();
    _flushTimer = null;
    final List<db.UsersCompanion> changedUsers = await _profileUsersToUpsert(
      users,
    );
    if (changedUsers.isNotEmpty) {
      await _database.userDao.upsertUsers(changedUsers);
    }
    await _database.userDao.updateUserPresencesBatch(updates);
  }

  Future<List<db.UsersCompanion>> _profileUsersToUpsert(
    List<db.UsersCompanion> users,
  ) async {
    if (users.isEmpty) {
      return users;
    }
    final List<db.UsersCompanion> changed = <db.UsersCompanion>[];
    for (final db.UsersCompanion user in users) {
      if (!user.id.present) {
        changed.add(user);
        continue;
      }
      final db.User? existing = await _database.userDao.getUserById(
        user.id.value,
      );
      if (existing == null || !_profileCompanionMatches(existing, user)) {
        changed.add(user);
      }
    }
    return changed;
  }

  bool _profileCompanionMatches(db.User existing, db.UsersCompanion companion) {
    return existing.username ==
            _companionString(companion.username, existing.username) &&
        existing.globalName ==
            _companionNullableString(
              companion.globalName,
              existing.globalName,
            ) &&
        existing.avatar ==
            _companionNullableString(companion.avatar, existing.avatar) &&
        existing.avatarColor ==
            _companionInt(companion.avatarColor, existing.avatarColor) &&
        existing.accentColor ==
            _companionInt(companion.accentColor, existing.accentColor) &&
        existing.banner ==
            _companionNullableString(companion.banner, existing.banner) &&
        existing.bio == _companionNullableString(companion.bio, existing.bio) &&
        existing.pronouns ==
            _companionNullableString(companion.pronouns, existing.pronouns) &&
        existing.bot == _companionBool(companion.bot, fallback: existing.bot) &&
        existing.system ==
            _companionBool(companion.system, fallback: existing.system);
  }

  void dispose() {
    _disposed = true;
    _flushTimer?.cancel();
    _flushTimer = null;
    _pending.clear();
    _pendingUsers.clear();
  }

  void _scheduleFlush() {
    _flushTimer ??= Timer(_batchDelay, () {
      _flushTimer = null;
      unawaited(flush());
    });
  }
}
