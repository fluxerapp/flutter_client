import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;

typedef PresenceUpdateRecord = ({
  String userId,
  String status,
  String? customStatus,
  bool mobile,
});

@immutable
class UserPresence {
  const UserPresence({
    required this.status,
    this.customStatus,
    this.mobile = false,
  });

  UserPresence.fromRecord(PresenceUpdateRecord record)
    : status = record.status,
      customStatus = record.customStatus,
      mobile = record.mobile;

  final String status;
  final String? customStatus;
  final bool mobile;

  bool get isEmpty => status == 'offline' && customStatus == null && !mobile;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPresence &&
          other.status == status &&
          other.customStatus == customStatus &&
          other.mobile == mobile;

  @override
  int get hashCode => Object.hash(status, customStatus, mobile);
}

class PresenceStore {
  final Map<String, UserPresence> _byUserId = <String, UserPresence>{};
  final Map<String, Set<VoidCallback>> _listeners =
      <String, Set<VoidCallback>>{};

  UserPresence? operator [](String userId) => _byUserId[userId];

  void set(
    String userId, {
    required String status,
    String? customStatus,
    bool mobile = false,
  }) => applyAll(<PresenceUpdateRecord>[
    (
      userId: userId,
      status: status,
      customStatus: customStatus,
      mobile: mobile,
    ),
  ]);

  void applyAll(Iterable<PresenceUpdateRecord> records) {
    final Set<String> changed = <String>{};
    for (final PresenceUpdateRecord record in records) {
      final UserPresence next = UserPresence.fromRecord(record);
      final UserPresence? current = _byUserId[record.userId];
      if (next.isEmpty) {
        if (current != null) {
          _byUserId.remove(record.userId);
          changed.add(record.userId);
        }
        continue;
      }
      if (current != next) {
        _byUserId[record.userId] = next;
        changed.add(record.userId);
      }
    }
    _notify(changed);
  }

  void replaceAll(Iterable<PresenceUpdateRecord> records) {
    final Map<String, UserPresence> next = <String, UserPresence>{};
    for (final PresenceUpdateRecord record in records) {
      final UserPresence presence = UserPresence.fromRecord(record);
      if (presence.isEmpty) {
        next.remove(record.userId);
      } else {
        next[record.userId] = presence;
      }
    }
    final Set<String> changed = <String>{
      for (final MapEntry<String, UserPresence> entry in next.entries)
        if (_byUserId[entry.key] != entry.value) entry.key,
      for (final String userId in _byUserId.keys)
        if (!next.containsKey(userId)) userId,
    };
    _byUserId
      ..clear()
      ..addAll(next);
    _notify(changed);
  }

  VoidCallback listen(String userId, VoidCallback listener) {
    final Set<VoidCallback> listeners = _listeners.putIfAbsent(
      userId,
      () => <VoidCallback>{},
    )..add(listener);
    return () {
      listeners.remove(listener);
      if (listeners.isEmpty && identical(_listeners[userId], listeners)) {
        _listeners.remove(userId);
      }
    };
  }

  void _notify(Set<String> changed) {
    for (final String userId in changed) {
      final Set<VoidCallback>? listeners = _listeners[userId];
      if (listeners == null) {
        continue;
      }
      for (final VoidCallback listener in List<VoidCallback>.of(listeners)) {
        listener();
      }
    }
  }
}

final Expando<PresenceStore> _storesByDatabase = Expando<PresenceStore>(
  'presence',
);

PresenceStore presenceStoreFor(db.FluxerDatabase database) =>
    _storesByDatabase[database] ??= PresenceStore();
