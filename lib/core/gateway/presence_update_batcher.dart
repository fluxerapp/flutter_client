import 'dart:async';
import 'dart:io';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;

const Duration kPresenceUpdateBatchDelay = Duration(milliseconds: 500);

bool get isFluxerMobileClient => Platform.isAndroid || Platform.isIOS;

typedef PresenceUpdateRecord = ({
  String userId,
  String status,
  String? customStatus,
  bool mobile,
});

/// Coalesces high-frequency `PRESENCE_UPDATE` events into a single Drift
/// batch write per [kPresenceUpdateBatchDelay] window.
class PresenceUpdateBatcher {
  PresenceUpdateBatcher({
    required db.FluxerDatabase database,
    required String? currentUserId,
    Duration batchDelay = kPresenceUpdateBatchDelay,
  }) : _database = database,
       _currentUserId = currentUserId,
       _batchDelay = batchDelay;

  final db.FluxerDatabase _database;
  final String? _currentUserId;
  final Duration _batchDelay;

  final Map<String, PresenceUpdateRecord> _pending =
      <String, PresenceUpdateRecord>{};
  Timer? _flushTimer;
  bool _disposed = false;

  void enqueue({
    required String userId,
    required String status,
    String? customStatus,
    bool mobile = false,
  }) {
    if (_disposed) {
      return;
    }
    if (userId == _currentUserId) {
      unawaited(
        _database.userDao.updateUserPresence(
          userId,
          status: status,
          customStatus: customStatus,
          mobile: isFluxerMobileClient,
        ),
      );
      return;
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
    _pending.clear();
    _flushTimer?.cancel();
    _flushTimer = null;
    await _database.userDao.updateUserPresencesBatch(updates);
  }

  void dispose() {
    _disposed = true;
    _flushTimer?.cancel();
    _flushTimer = null;
    _pending.clear();
  }

  void _scheduleFlush() {
    _flushTimer ??= Timer(_batchDelay, () {
      _flushTimer = null;
      unawaited(flush());
    });
  }
}
