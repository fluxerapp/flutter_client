import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/gateway/presence_store.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';

const Duration kPresenceUpdateBatchDelay = Duration(milliseconds: 500);

bool get isFluxerMobileClient => isFluxerMobileOs;

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

  PresenceStore get _store => presenceStoreFor(_database);

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
      _store.set(
        userId,
        status: status,
        customStatus: customStatus,
        mobile: isFluxerMobileClient,
      );
      if (user != null) {
        unawaited(
          _database.userDao.upsertUsersIfChanged(<db.UsersCompanion>[user]),
        );
      }
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
    _store.applyAll(updates);
    if (users.isNotEmpty) {
      await _database.userDao.upsertUsersIfChanged(users);
    }
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
