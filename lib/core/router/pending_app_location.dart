import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const Duration kPendingAppLocationClearDelay = Duration(seconds: 5);

const String _kPendingAppLocationKey = 'pending_app_location';

abstract interface class PendingAppLocationStore {
  Future<String?> read();

  Future<void> write(String location);

  Future<void> clear();
}

class _SharedPreferencesPendingAppLocationStore
    implements PendingAppLocationStore {
  @override
  Future<String?> read() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? value = preferences.getString(_kPendingAppLocationKey);
    if (value == null || value.isEmpty) {
      return null;
    }
    return value;
  }

  @override
  Future<void> write(String location) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_kPendingAppLocationKey, location);
  }

  @override
  Future<void> clear() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(_kPendingAppLocationKey);
  }
}

class PendingAppLocation {
  PendingAppLocation({
    PendingAppLocationStore? store,
    this._clearDelay = kPendingAppLocationClearDelay,
  }) : _store = store ?? _SharedPreferencesPendingAppLocationStore();

  static PendingAppLocation instance = PendingAppLocation();

  final PendingAppLocationStore _store;
  final Duration _clearDelay;
  Timer? _clearTimer;
  bool _taken = false;
  bool _disposed = false;

  Future<String?> take() async {
    if (_taken) {
      return null;
    }
    _taken = true;
    try {
      return await _store.read();
    } on Object {
      return null;
    }
  }

  Future<void> mark(String location) async {
    _clearTimer?.cancel();
    await _tryWrite(location);
    if (_disposed) {
      return;
    }
    _clearTimer = Timer(_clearDelay, () {
      unawaited(clear());
    });
  }

  Future<void> clear() async {
    _clearTimer?.cancel();
    _clearTimer = null;
    await _tryClear();
  }

  void dispose() {
    _disposed = true;
    _clearTimer?.cancel();
    _clearTimer = null;
  }

  Future<void> _tryWrite(String location) async {
    try {
      await _store.write(location);
    } on Object {
      return;
    }
  }

  Future<void> _tryClear() async {
    try {
      await _store.clear();
    } on Object {
      return;
    }
  }
}
