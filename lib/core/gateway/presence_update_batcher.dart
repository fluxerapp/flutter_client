import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/platform/fluxer_platform.dart';

const Duration kPresenceUpdateBatchDelay = Duration(milliseconds: 500);

bool get isFluxerMobileClient => isFluxerMobileOs;

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
          await _database.userDao.upsertUser(user);
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
    await _database.userDao.upsertUsers(users);
    await _database.userDao.updateUserPresencesBatch(updates);
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
