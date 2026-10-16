import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_registry.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_engine.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart';
import 'package:fluxer_app/core/synced_preferences/fields/favorites_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/core/synced_preferences/synced_theme_hydration.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/custom_theme_css.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'synced_preferences_store.g.dart';

const Duration _kRecentAckWindow = Duration(seconds: 60);
const int _kRateLimitMaxAttempts = 6;
const int _kRateLimitBackoffCapMs = 60000;
const int _kRateLimitRetryAfterMinMs = 250;

Duration syncedPreferencesRateLimitRetryDelay({
  required int attempt,
  int? retryAfterMs,
}) {
  if (retryAfterMs != null && retryAfterMs > 0) {
    return Duration(
      milliseconds: retryAfterMs.clamp(
        _kRateLimitRetryAfterMinMs,
        _kRateLimitBackoffCapMs,
      ),
    );
  }
  final int exp = attempt.clamp(1, _kRateLimitMaxAttempts);
  return Duration(
    milliseconds: (1000 * (1 << exp)).clamp(0, _kRateLimitBackoffCapMs),
  );
}

@Riverpod(keepAlive: true)
SyncedPreferencesStore syncedPreferencesStore(Ref ref) {
  final store = SyncedPreferencesStore(ref)..registerDefaultAdapters();
  ref.onDispose(store.dispose);
  return store;
}

class SyncedPreferencesStore {
  SyncedPreferencesStore(this._ref);

  final Ref _ref;
  final Map<SyncedPreferenceField, SyncedFieldAdapter<Object?>> _adapters = {};
  String _wireBlob = '';
  String _lastKnownGoodWire = '';
  pb.SyncedPreferences _local = SyncedPreferencesEngine.createEmpty();
  pb.SyncedPreferences _wire = SyncedPreferencesEngine.createEmpty();
  pb.SyncedPreferences? _hydrateBaselineWire;
  bool _hasHydrated = false;
  final StreamController<void> _hydrations = StreamController<void>.broadcast();
  bool _hasServerSnapshot = false;
  bool _isApplyingRemote = false;
  bool _isPushInFlight = false;
  bool _pendingPush = false;
  final Set<SyncedPreferenceField> _dirtyFields = {};
  final Set<SyncedPreferenceField> _inFlightFields = {};
  pb.SyncedPreferences? _inFlightSnapshot;
  final Map<SyncedPreferenceField, DateTime> _recentlyAckedUntil = {};
  Timer? _pushTimer;
  Duration? _pushTimerDelay;
  Timer? _pushRetryTimer;
  Set<SyncedPreferenceField> _restoredDirtyFields = {};
  int _pushGeneration = 0;
  int _pushRetryAttempts = 0;

  bool get hasHydrated => _hasHydrated;

  Stream<void> get hydrations => _hydrations.stream;

  void registerDefaultAdapters() {
    registerDefaultSyncedFieldAdapters(
      registerAdapter: registerAdapter,
      ref: _ref,
      readSyncedLocalFavorites: _readSyncedLocalFavorites,
    );
  }

  void registerAdapter<T>(SyncedFieldAdapter<T> adapter) {
    _adapters[adapter.field] = adapter as SyncedFieldAdapter<Object?>;
  }

  void dispose() {
    unawaited(_hydrations.close());
    _cancelScheduledWork();
    _pushGeneration++;
    _pendingPush = false;
  }

  void reset() {
    _cancelScheduledWork();
    _wireBlob = '';
    _lastKnownGoodWire = '';
    _local = SyncedPreferencesEngine.createEmpty();
    _wire = SyncedPreferencesEngine.createEmpty();
    _hydrateBaselineWire = null;
    _hasHydrated = false;
    _hasServerSnapshot = false;
    _isApplyingRemote = false;
    _isPushInFlight = false;
    _pendingPush = false;
    _dirtyFields.clear();
    _inFlightFields.clear();
    _inFlightSnapshot = null;
    _recentlyAckedUntil.clear();
    _restoredDirtyFields = {};
    _pushGeneration++;
    _pushRetryAttempts = 0;
  }

  void markSessionChanging() {}

  void markDirty(SyncedPreferenceField field) {
    _dirtyFields.add(field);
    _persistDirtyFields();
    if (_pushRetryTimer?.isActive ?? false) {
      return;
    }
    _pushRetryAttempts = 0;
    _pushRetryTimer?.cancel();
    _pushRetryTimer = null;
    scheduleFlush();
  }

  void scheduleFlush() {
    _pendingPush = true;
    if (_isApplyingRemote) {
      return;
    }
    _startPushTimer();
  }

  Duration _pushDebounce() {
    var delay = const Duration(milliseconds: 500);
    for (final field in _dirtyFields) {
      final Duration? fieldDelay = _adapters[field]?.pushDebounce;
      if (fieldDelay != null && fieldDelay > delay) {
        delay = fieldDelay;
      }
    }
    return delay;
  }

  void _startPushTimer() {
    _pushTimer?.cancel();
    final Duration delay = _pushDebounce();
    _pushTimerDelay = delay;
    _pushTimer = Timer(delay, () {
      if (!_ref.mounted) {
        return;
      }
      unawaited(_flushPush());
    });
  }

  Future<void> hydrateFromUserSettings(
    UserSettingsResponse settings, {
    SyncedThemeCustomizationApplier? themeCustomizationApplier,
    bool fromCache = false,
  }) async {
    final encoded = settings.syncedPreferences;
    if (!fromCache) {
      _hasServerSnapshot = true;
    }
    if (_hasHydrated && encoded.isEmpty) {
      _flushPendingPush();
      return;
    }
    _wireBlob = encoded;
    final decodeStatus = await _decodeIncoming(encoded);
    if (decodeStatus == _DecodeStatus.failure) {
      if (!fromCache) {
        await _attemptBoundedRepair(encoded);
      }
      _hasHydrated = true;
      _flushPendingPush();
      return;
    }
    final incoming = decodeStatus == _DecodeStatus.empty
        ? SyncedPreferencesEngine.createEmpty()
        : SyncedPreferencesEngine.decode(encoded);
    final wasFirstHydrate = !_hasHydrated;
    if (wasFirstHydrate) {
      await _restorePersistedDirtyFields();
    }
    final protectedFields = _protectedFields(wasFirstHydrate: wasFirstHydrate);
    final recentlyAcked = _recentlyAckedFields();
    final mergeResult = SyncedPreferencesEngine.mergeIncoming(
      local: _local,
      wire: _wire,
      incoming: incoming,
      protectedFields: protectedFields,
      recentlyAckedFields: recentlyAcked,
      inFlight: _inFlightSnapshot,
      syncInFlight: _isPushInFlight,
    );
    for (final field in mergeResult.dirtyFields) {
      _dirtyFields.add(field);
    }
    final previousWire = _wire;
    _wire = mergeResult.wire;
    _local = mergeResult.merged;
    if (encoded.isNotEmpty && decodeStatus == _DecodeStatus.success) {
      _lastKnownGoodWire = encoded;
    }
    _hydrateBaselineWire = previousWire;
    try {
      await _reconcileRegisteredFields(
        incoming: incoming,
        wasFirstHydrate: wasFirstHydrate,
        protectedFields: protectedFields,
        recentlyAckedFields: recentlyAcked,
      );
    } finally {
      _hydrateBaselineWire = null;
    }
    if (encoded.isNotEmpty && decodeStatus == _DecodeStatus.success) {
      await _clearStaleDirtyForAbsentServerFields(incoming: incoming);
    }
    await _applyMergedAccessibilityTheme(
      themeCustomizationApplier: themeCustomizationApplier,
    );
    _hasHydrated = true;
    _restoredDirtyFields = {};
    _persistDirtyFields();
    _flushPendingPush();
    if (!_hydrations.isClosed) {
      _hydrations.add(null);
    }
  }

  Future<void> _restorePersistedDirtyFields() async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final List<String> names = await _ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .getSyncedPreferencesDirtyFields(userId);
    final restored = <SyncedPreferenceField>{
      for (final name in names)
        if (SyncedPreferenceField.values.asNameMap()[name]
            case final SyncedPreferenceField field
            when _adapters[field]?.keepsUnpushedEditsAcrossLaunches ?? false)
          field,
    };
    _restoredDirtyFields = restored;
    _dirtyFields.addAll(restored);
  }

  void _persistDirtyFields() {
    if (!_hasHydrated) {
      return;
    }
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final List<String> names = [for (final field in _dirtyFields) field.name]
      ..sort();
    unawaited(
      _ref
          .read(fluxerDatabaseProvider)
          .userPreferencesDao
          .setSyncedPreferencesDirtyFields(userId, names)
          .catchError((Object error, StackTrace stackTrace) {
            talker.warning(
              '[SyncedPreferences] Failed to persist dirty fields: $error',
            );
          }),
    );
  }

  Future<void> _applyMergedAccessibilityTheme({
    SyncedThemeCustomizationApplier? themeCustomizationApplier,
  }) async {
    final SyncedThemeCustomizationApplier apply =
        themeCustomizationApplier ??
        _ref
            .read(themePreferenceProvider.notifier)
            .applySyncedThemeCustomization;
    final bool accessibilityDirty = _dirtyFields.contains(
      SyncedPreferenceField.accessibility,
    );
    final ThemePreferenceState themePrefs = _ref.read(themePreferenceProvider);
    if (_local.hasAccessibility()) {
      final accessibility = _local.accessibility;
      final String? mergedCss = accessibility.hasCustomThemeCss()
          ? normalizeCustomThemeCss(accessibility.customThemeCss)
          : null;
      if (mergedCss != null || accessibility.hasSaturationFactor()) {
        await applyThemeCustomizationFromAccessibilityProto(
          accessibility,
          apply,
          skipCustomThemeCss: accessibilityDirty,
        );
        return;
      }
    }
    if (accessibilityDirty || !themePrefs.syncThemeColorsFromThemeStudio) {
      return;
    }
    final String? wireCss = normalizeCustomThemeCss(readWireCustomThemeCss());
    if (wireCss == null) {
      return;
    }
    await apply(
      customThemeCss: wireCss,
      updateSaturationFactor: false,
      updateCustomThemeCss: true,
    );
  }

  Future<void> _reconcileRegisteredFields({
    required pb.SyncedPreferences incoming,
    required bool wasFirstHydrate,
    required Set<SyncedPreferenceField> protectedFields,
    required Set<SyncedPreferenceField> recentlyAckedFields,
  }) async {
    for (final entry in _adapters.entries) {
      final field = entry.key;
      final adapter = entry.value;
      final local = await adapter.readLocalValue();
      final remote = adapter.readFromProto(incoming);
      final hasLocal = adapter.hasLocalData(local);
      final hasRemote = remote != null && adapter.hasRemoteData(remote);
      final isProtected = protectedFields.contains(field);
      final isRecentlyAcked = recentlyAckedFields.contains(field);
      if (!isProtected && !_dirtyFields.contains(field)) {
        if (remote != null) {
          if (isRecentlyAcked &&
              adapter.ignoreAckedRemoteShrink(local, remote)) {
            _restoreAckedFieldFromBaseline(adapter, local);
            continue;
          }
          if (isRecentlyAcked && adapter.mergeAckedInbound(local, remote)) {
            final target = adapter.mergeForMigration(
              local: local,
              remote: remote,
            );
            if (!_statesEqual(adapter, local, target)) {
              await _applyAdapterRemote(adapter, target);
            }
            if (!_statesEqual(adapter, target, remote)) {
              _dirtyFields.add(field);
              scheduleFlush();
            } else {
              _dirtyFields.remove(field);
            }
          } else {
            final target = adapter.mergeRemote(local: local, remote: remote);
            if (!_statesEqual(adapter, local, target)) {
              await _applyAdapterRemote(adapter, target);
            }
            if (_statesEqual(adapter, target, remote)) {
              _dirtyFields.remove(field);
            } else {
              _dirtyFields.add(field);
              scheduleFlush();
            }
          }
        } else if (hasLocal && encodedIsEmpty()) {
          _dirtyFields.add(field);
          scheduleFlush();
        } else {
          await _applyOmittedFieldClear(adapter: adapter, local: local);
        }
        continue;
      }
      if (wasFirstHydrate &&
          field == SyncedPreferenceField.sound &&
          _dirtyFields.contains(field)) {
        continue;
      }
      if (isProtected) {
        if (remote != null &&
            adapter.hasInboundUpdatesWhileProtected(local, remote)) {
          final target = adapter.mergeProtectedInbound(
            local: local,
            remote: remote,
            baseline: adapter.readFromProto(_hydrateBaselineWire ?? _wire),
          );
          if (!_statesEqual(adapter, local, target)) {
            await _applyAdapterRemote(adapter, target);
          }
        } else if (!_dirtyFields.contains(field) &&
            adapter.clearedRemoteValue() != null) {
          if (remote != null) {
            if (!_statesEqual(adapter, local, remote)) {
              await _applyAdapterRemote(adapter, remote);
            }
          } else {
            await _applyOmittedFieldClear(adapter: adapter, local: local);
          }
        }
        continue;
      }
      if (wasFirstHydrate &&
          hasLocal &&
          hasRemote &&
          !_statesEqual(adapter, local, remote)) {
        final target = adapter.mergeForMigration(local: local, remote: remote);
        if (!_statesEqual(adapter, local, target)) {
          await _applyAdapterRemote(adapter, target);
        }
        if (!_statesEqual(adapter, target, remote)) {
          _dirtyFields.add(field);
          scheduleFlush();
        } else {
          _dirtyFields.remove(field);
        }
        continue;
      }
      if (!hasLocal && !hasRemote) {
        _dirtyFields.remove(field);
        continue;
      }
      if (_statesEqual(adapter, local, remote ?? local)) {
        _dirtyFields.remove(field);
        continue;
      }
      if (hasLocal && !hasRemote) {
        if (encodedIsEmpty()) {
          _dirtyFields.add(field);
          scheduleFlush();
        }
        continue;
      }
      if (remote != null) {
        await _applyAdapterRemote(adapter, remote);
        _dirtyFields.remove(field);
      }
    }
  }

  bool encodedIsEmpty() => _wireBlob.isEmpty;

  Future<void> _applyOmittedFieldClear({
    required SyncedFieldAdapter<Object?> adapter,
    required Object? local,
  }) async {
    if (!adapter.hasLocalData(local) || encodedIsEmpty()) {
      return;
    }
    final cleared = adapter.clearedRemoteValue();
    if (cleared == null || _statesEqual(adapter, local, cleared)) {
      return;
    }
    await _applyAdapterRemote(adapter, cleared);
  }

  void _restoreAckedFieldFromBaseline(
    SyncedFieldAdapter<Object?> adapter,
    Object? local,
  ) {
    final baseline = _hydrateBaselineWire;
    if (baseline == null) {
      return;
    }
    _wire = SyncedPreferencesEngine.copyField(
      target: _wire,
      source: baseline,
      field: adapter.field,
    );
    _local = _applyAdapterToProto(_local, adapter, local, wire: baseline);
  }

  FavoritesLocalState? _readSyncedLocalFavorites() {
    final adapter = _adapters[SyncedPreferenceField.favorites];
    if (adapter is! FavoritesSyncedField) {
      return null;
    }
    return adapter.readFromProto(_hydrateBaselineWire ?? _wire);
  }

  Future<void> _clearStaleDirtyForAbsentServerFields({
    required pb.SyncedPreferences incoming,
  }) async {
    for (final field in List<SyncedPreferenceField>.from(_dirtyFields)) {
      if (_inFlightFields.contains(field)) {
        continue;
      }
      final adapter = _adapters[field];
      if (adapter == null) {
        continue;
      }
      if (adapter.readFromProto(incoming) != null) {
        continue;
      }
      if (adapter.hasLocalData(await adapter.readLocalValue())) {
        continue;
      }
      _dirtyFields.remove(field);
    }
  }

  String? readWireCustomThemeCss() {
    if (_wireBlob.isEmpty) {
      return null;
    }
    try {
      final synced = SyncedPreferencesEngine.decodeLenient(_wireBlob);
      if (!synced.hasAccessibility() ||
          !synced.accessibility.hasCustomThemeCss()) {
        return null;
      }
      return synced.accessibility.customThemeCss;
    } on Object {
      return null;
    }
  }

  Future<_DecodeStatus> _decodeIncoming(String encoded) async {
    if (encoded.isEmpty) {
      return _DecodeStatus.empty;
    }
    try {
      SyncedPreferencesEngine.decode(encoded);
      return _DecodeStatus.success;
    } on SyncedPreferencesDecodeException {
      return _DecodeStatus.failure;
    }
  }

  Future<void> _attemptBoundedRepair(String encoded) async {
    if (_lastKnownGoodWire.isEmpty) {
      final foreignCount = SyncedPreferencesWireCodec.countForeignFields(
        encoded,
      );
      if (foreignCount == 0) {
        talker.warning(
          '[SyncedPreferences] Decode failed with no foreign fields; skipping repair',
        );
        return;
      }
    }
    final favoritesAdapter = _adapters[SyncedPreferenceField.favorites];
    if (favoritesAdapter is! FavoritesSyncedField) {
      return;
    }
    final local = await favoritesAdapter.readLocalValue();
    if (!favoritesAdapter.hasLocalData(local) ||
        !favoritesAdapter.verifyRoundtrip(local)) {
      return;
    }
    try {
      final repairWire = _encodeAdapterField(
        favoritesAdapter,
        local,
        currentWire: _lastKnownGoodWire.isEmpty ? encoded : _lastKnownGoodWire,
      );
      if (!SyncedPreferencesWireCodec.verifyWirePreservesForeignFields(
        before: encoded,
        after: repairWire,
        replacedFieldNumber: SyncedPreferenceField.favorites.fieldNumber,
      )) {
        return;
      }
      final client = _ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(
          syncedPreferences: JsonNullable.of(repairWire),
        ),
      );
      _wireBlob = repairWire;
      _lastKnownGoodWire = repairWire;
      talker.info('[SyncedPreferences] Repaired favorites field on wire');
    } on Object catch (error, stackTrace) {
      talker.error(
        '[SyncedPreferences] Bounded repair failed',
        error,
        stackTrace,
      );
    }
  }

  Future<void> _flushPush() async {
    if (!_ref.mounted) {
      return;
    }
    if (_isApplyingRemote) {
      _pendingPush = true;
      return;
    }
    if (!_hasServerSnapshot) {
      _pendingPush = true;
      return;
    }
    if (_isPushInFlight) {
      _pendingPush = true;
      return;
    }
    final generation = ++_pushGeneration;
    _isPushInFlight = true;
    pb.SyncedPreferences? inFlightSnapshot;
    try {
      final changedFields = await _changedRegisteredFields();
      if (!_ref.mounted) {
        return;
      }
      if (changedFields.isEmpty) {
        _dirtyFields.clear();
        _persistDirtyFields();
        _pendingPush = false;
        return;
      }
      final fieldsInRequest = changedFields
          .where(_dirtyFields.contains)
          .toList();
      if (fieldsInRequest.isEmpty) {
        _pendingPush = false;
        return;
      }
      _inFlightFields
        ..clear()
        ..addAll(fieldsInRequest);
      inFlightSnapshot = await _buildLocalSnapshot();
      _inFlightSnapshot = inFlightSnapshot;
      if (!_ref.mounted) {
        return;
      }
      final encoded = await _encodeLocalSnapshot(
        inFlightSnapshot,
        fieldsToEncode: fieldsInRequest,
      );
      if (!_ref.mounted || encoded.isEmpty) {
        return;
      }
      for (final field in fieldsInRequest) {
        if (!_ref.mounted) {
          return;
        }
        final adapter = _adapters[field];
        if (adapter == null) {
          continue;
        }
        final local = await adapter.readLocalValue();
        if (!adapter.verifyRoundtrip(local)) {
          talker.error(
            '[SyncedPreferences] Roundtrip unstable for ${field.name}, push skipped',
          );
          return;
        }
      }
      if (generation != _pushGeneration || !_ref.mounted) {
        return;
      }
      final client = _ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(
          syncedPreferences: JsonNullable.of(encoded),
        ),
      );
      if (generation != _pushGeneration || !_ref.mounted) {
        return;
      }
      _wireBlob = encoded;
      _lastKnownGoodWire = encoded;
      _wire = SyncedPreferencesEngine.decode(encoded);
      _local = inFlightSnapshot;
      _dirtyFields.removeAll(fieldsInRequest);
      final stillChanged = await _changedRegisteredFields();
      _dirtyFields.addAll(stillChanged);
      _pendingPush = _dirtyFields.isNotEmpty;
      _persistDirtyFields();
      _markFieldsAcked(fieldsInRequest);
      _pushRetryAttempts = 0;
      talker.debug(
        '[SyncedPreferences] Pushed ${fieldsInRequest.length} field(s) '
        '(${encoded.length} bytes, '
        '${SyncedPreferencesWireCodec.countForeignFields(encoded)}'
        'foreign fields)',
      );
    } on SyncedPreferencesWireEncodeException catch (error, stackTrace) {
      talker.error('[SyncedPreferences] Wire encode failed', error, stackTrace);
      _pendingPush = false;
    } on Object catch (error, stackTrace) {
      if (isTransientNetworkError(error)) {
        talker.warning('[SyncedPreferences] Push failed, will retry: $error');
      } else {
        talker.error('[SyncedPreferences] Push failed', error, stackTrace);
      }
      _schedulePushRetry(error);
    } finally {
      _isPushInFlight = false;
      _inFlightFields.clear();
      _inFlightSnapshot = null;
      if (_ref.mounted) {
        _flushPendingPush();
      }
    }
  }

  Future<List<SyncedPreferenceField>> _changedRegisteredFields() async {
    final wire = _wireBlob.isEmpty
        ? SyncedPreferencesEngine.createEmpty()
        : SyncedPreferencesEngine.decodeLenient(_wireBlob);
    final changed = <SyncedPreferenceField>[];
    for (final entry in _adapters.entries) {
      if (!_ref.mounted) {
        return changed;
      }
      final adapter = entry.value;
      final local = await adapter.readLocalValue();
      final remote = adapter.readFromProto(wire);
      if (remote == null) {
        if (adapter.hasLocalData(local)) {
          changed.add(entry.key);
        }
        continue;
      }
      if (!_statesEqual(adapter, local, remote)) {
        changed.add(entry.key);
      }
    }
    return changed;
  }

  Future<pb.SyncedPreferences> _buildLocalSnapshot() async {
    final wire = _wireBlob.isEmpty
        ? SyncedPreferencesEngine.createEmpty()
        : SyncedPreferencesEngine.decodeLenient(_wireBlob);
    var snapshot = wire;
    for (final entry in _adapters.entries) {
      if (!_ref.mounted) {
        return snapshot;
      }
      final adapter = entry.value;
      final Object? local = await adapter.readLocalValue();
      snapshot = _applyAdapterToProto(snapshot, adapter, local, wire: wire);
    }
    _local = snapshot;
    return snapshot;
  }

  Future<String> _encodeLocalSnapshot(
    pb.SyncedPreferences snapshot, {
    required Iterable<SyncedPreferenceField> fieldsToEncode,
  }) async {
    final wire = _wireBlob.isEmpty
        ? SyncedPreferencesEngine.createEmpty()
        : SyncedPreferencesEngine.decodeLenient(_wireBlob);
    final fieldMessages = <int, Uint8List>{};
    final fieldWireTypes = <int, int>{};
    for (final field in fieldsToEncode) {
      if (!_ref.mounted) {
        return '';
      }
      final adapter = _adapters[field];
      if (adapter == null) {
        continue;
      }
      final Object? local = await adapter.readLocalValue();
      fieldMessages[adapter.fieldNumber] = _buildPushValueBytes(
        adapter,
        local,
        wire: wire,
      );
      fieldWireTypes[adapter.fieldNumber] = adapter.fieldPushWireType;
    }
    return SyncedPreferencesWireCodec.encodeSnapshotIntoWire(
      currentWire: _wireBlob.isEmpty ? null : _wireBlob,
      fieldMessages: fieldMessages,
      fieldWireTypes: fieldWireTypes,
    );
  }

  String _encodeAdapterField(
    SyncedFieldAdapter<Object?> adapter,
    Object? local, {
    required String? currentWire,
  }) {
    final wire = currentWire == null || currentWire.isEmpty
        ? SyncedPreferencesEngine.createEmpty()
        : SyncedPreferencesEngine.decodeLenient(currentWire);
    return SyncedPreferencesWireCodec.encodeFieldIntoWire(
      currentWire: currentWire,
      fieldNumber: adapter.fieldNumber,
      fieldMessageBytes: _buildPushValueBytes(adapter, local, wire: wire),
      fieldWireType: adapter.fieldPushWireType,
    );
  }

  Uint8List _buildPushValueBytes(
    SyncedFieldAdapter<Object?> adapter,
    Object? local, {
    required pb.SyncedPreferences wire,
  }) {
    if (adapter.fieldPushWireType != 2) {
      return adapter.encodePushValueBytes(local);
    }
    final wireSubMessage = adapter.readWireSubMessage(wire);
    return adapter
        .toProtoMessageForPush(local, wireSubMessage: wireSubMessage)
        .writeToBuffer();
  }

  pb.SyncedPreferences _applyAdapterToProto(
    pb.SyncedPreferences target,
    SyncedFieldAdapter<Object?> adapter,
    Object? local, {
    required pb.SyncedPreferences wire,
  }) {
    final fieldOnly = SyncedPreferencesEngine.decode(
      SyncedPreferencesWireCodec.encodeFieldIntoWire(
        currentWire: null,
        fieldNumber: adapter.fieldNumber,
        fieldMessageBytes: _buildPushValueBytes(adapter, local, wire: wire),
        fieldWireType: adapter.fieldPushWireType,
      ),
    );
    return SyncedPreferencesEngine.copyField(
      target: target,
      source: fieldOnly,
      field: adapter.field,
    );
  }

  Future<void> _applyAdapterRemote(
    SyncedFieldAdapter<Object?> adapter,
    Object? value,
  ) async {
    _isApplyingRemote = true;
    try {
      await adapter.applyRemote(value);
      final local = await adapter.readLocalValue();
      final wire = _wireBlob.isEmpty
          ? SyncedPreferencesEngine.createEmpty()
          : SyncedPreferencesEngine.decodeLenient(_wireBlob);
      _local = _applyAdapterToProto(_local, adapter, local, wire: wire);
    } finally {
      _isApplyingRemote = false;
      _flushPendingPush();
    }
  }

  bool _statesEqual(SyncedFieldAdapter<Object?> adapter, Object? a, Object? b) {
    return adapter.statesEqual(a, b);
  }

  Set<SyncedPreferenceField> _protectedFields({required bool wasFirstHydrate}) {
    if (wasFirstHydrate) {
      return {..._restoredDirtyFields};
    }
    final protected = <SyncedPreferenceField>{..._dirtyFields};
    if (_isPushInFlight) {
      protected.addAll(_inFlightFields);
    }
    if (_pushTimer?.isActive ?? false) {
      protected.addAll(_dirtyFields);
    }
    return protected;
  }

  Set<SyncedPreferenceField> _recentlyAckedFields() {
    final now = DateTime.now();
    final active = <SyncedPreferenceField>{};
    final expired = <SyncedPreferenceField>[];
    for (final entry in _recentlyAckedUntil.entries) {
      if (entry.value.isAfter(now)) {
        active.add(entry.key);
      } else {
        expired.add(entry.key);
      }
    }
    for (final field in expired) {
      _recentlyAckedUntil.remove(field);
    }
    return active;
  }

  void _markFieldsAcked(Iterable<SyncedPreferenceField> fields) {
    final expiresAt = DateTime.now().add(_kRecentAckWindow);
    for (final field in fields) {
      if (_dirtyFields.contains(field)) {
        continue;
      }
      _recentlyAckedUntil[field] = expiresAt;
    }
  }

  void _flushPendingPush() {
    if (!_pendingPush ||
        _isApplyingRemote ||
        _isPushInFlight ||
        (_pushRetryTimer?.isActive ?? false)) {
      return;
    }
    scheduleFlush();
  }

  void _schedulePushRetry(Object error) {
    _pushTimer?.cancel();
    _pushTimer = null;
    _pushRetryTimer?.cancel();
    if (_pushRetryAttempts >= _kRateLimitMaxAttempts) {
      _pendingPush = false;
      _pushRetryTimer = null;
      return;
    }
    _pendingPush = true;
    _pushRetryAttempts = (_pushRetryAttempts + 1).clamp(
      1,
      _kRateLimitMaxAttempts,
    );
    final int? retryAfterMs = error is DioException && _isRateLimitError(error)
        ? retryAfterMsFromDioException(error)
        : null;
    final delay = syncedPreferencesRateLimitRetryDelay(
      attempt: _pushRetryAttempts,
      retryAfterMs: retryAfterMs,
    );
    _pushRetryTimer = Timer(delay, () {
      if (!_ref.mounted) {
        return;
      }
      unawaited(_flushPush());
    });
  }

  void _cancelScheduledWork() {
    _pushTimer?.cancel();
    _pushTimer = null;
    _pushRetryTimer?.cancel();
    _pushRetryTimer = null;
  }

  @visibleForTesting
  Duration? get scheduledPushDelayForTest =>
      (_pushTimer?.isActive ?? false) ? _pushTimerDelay : null;

  @visibleForTesting
  void triggerDebouncedPushForTest() {
    _pushTimer?.cancel();
    _pushTimer = null;
    if (!_ref.mounted) {
      return;
    }
    unawaited(_flushPush());
  }

  @visibleForTesting
  void triggerPushRetryForTest() {
    _pushRetryTimer?.cancel();
    _pushRetryTimer = null;
    if (!_ref.mounted) {
      return;
    }
    unawaited(_flushPush());
  }

  @visibleForTesting
  bool get hasDebouncedPushScheduledForTest => _pushTimer?.isActive ?? false;

  @visibleForTesting
  bool get hasPushRetryScheduledForTest => _pushRetryTimer?.isActive ?? false;

  bool _isRateLimitError(Object error) {
    if (error is DioException) {
      return error.response?.statusCode == 429;
    }
    return false;
  }
}

enum _DecodeStatus { empty, success, failure }
