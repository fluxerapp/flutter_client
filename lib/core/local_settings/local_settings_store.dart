import 'dart:async';
import 'dart:convert';

import 'package:fluxer_app/core/database/daos/local_settings_dao.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/local_settings/local_setting_id.dart';
import 'package:fluxer_app/core/local_settings/local_setting_key.dart';
import 'package:fluxer_app/core/local_settings/local_settings_legacy_import.dart';
import 'package:fluxer_app/core/talker.dart';

const Duration kLocalSettingsWriteDelay = Duration(milliseconds: 300);

class LocalSettingsStore {
  LocalSettingsStore(this._database);

  final FluxerDatabase Function() _database;
  final Map<LocalSettingId, String> _values = <LocalSettingId, String>{};
  final Map<LocalSettingId, String?> _pending = <LocalSettingId, String?>{};
  LocalSettingsDao? _dao;
  Timer? _writeTimer;
  Future<void> _writes = Future<void>.value();

  bool get isPersistent => _dao != null;

  Future<void> load() async {
    if (isPersistent) {
      return;
    }
    try {
      final FluxerDatabase database = _database();
      Map<LocalSettingId, String> stored = await database.localSettingsDao
          .loadAll();
      if (!stored.containsKey(kLocalSettingsLegacyImportId) &&
          await _importLegacy(database)) {
        stored = await database.localSettingsDao.loadAll();
      }
      for (final MapEntry<LocalSettingId, String> entry in stored.entries) {
        if (!_pending.containsKey(entry.key)) {
          _values[entry.key] = entry.value;
        }
      }
      _dao = database.localSettingsDao;
    } on Object catch (error, stackTrace) {
      talker.error('[LocalSettings] Load failed', error, stackTrace);
      return;
    }
    _scheduleWrite();
  }

  Future<bool> _importLegacy(FluxerDatabase database) async {
    try {
      await importLegacyLocalSettings(database);
      return true;
    } on Object catch (error, stackTrace) {
      talker.error('[LocalSettings] Import failed', error, stackTrace);
      return false;
    }
  }

  T read<T>(DeviceSettingKey<T> key) => _read(key, deviceSettingId(key));

  T readAccount<T>(AccountSettingKey<T> key, {required String userId}) =>
      _read(key, accountSettingId(key, userId));

  void write<T>(DeviceSettingKey<T> key, T value) =>
      _write(deviceSettingId(key), jsonEncode(key.codec.encode(value)));

  void writeAccount<T>(
    AccountSettingKey<T> key,
    T value, {
    required String userId,
  }) => _write(
    accountSettingId(key, userId),
    jsonEncode(key.codec.encode(value)),
  );

  void removeAccount(
    AccountSettingKey<Object?> key, {
    required String userId,
  }) => _write(accountSettingId(key, userId), null);

  Future<void> flush() {
    _writeTimer?.cancel();
    _writeTimer = null;
    return _writes = _writes.then((_) => _writePending());
  }

  void dispose() {
    _writeTimer?.cancel();
    _writeTimer = null;
  }

  T _read<T>(LocalSettingKey<T> key, LocalSettingId id) {
    final String? raw = _values[id];
    if (raw == null) {
      return key.defaultValue;
    }
    try {
      return key.codec.decode(jsonDecode(raw)) ?? key.defaultValue;
    } on Object {
      return key.defaultValue;
    }
  }

  void _write(LocalSettingId id, String? raw) {
    if (_values[id] == raw) {
      return;
    }
    if (raw == null) {
      _values.remove(id);
    } else {
      _values[id] = raw;
    }
    _pending[id] = raw;
    _scheduleWrite();
  }

  void _scheduleWrite() {
    if (!isPersistent || _pending.isEmpty) {
      return;
    }
    _writeTimer ??= Timer(kLocalSettingsWriteDelay, () => unawaited(flush()));
  }

  Future<void> _writePending() async {
    final LocalSettingsDao? dao = _dao;
    if (dao == null || _pending.isEmpty) {
      return;
    }
    final Map<LocalSettingId, String?> changes =
        Map<LocalSettingId, String?>.of(_pending);
    _pending.clear();
    try {
      await dao.apply(changes);
    } on Object catch (error, stackTrace) {
      talker.error('[LocalSettings] Write failed', error, stackTrace);
      for (final MapEntry<LocalSettingId, String?> change in changes.entries) {
        _pending.putIfAbsent(change.key, () => change.value);
      }
    }
  }
}
