import 'dart:async';
import 'dart:convert';

import 'package:cryptography/cryptography.dart' show Sha256;
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
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

const int _kRateLimitMaxAttempts = 6;
const int _kConflictMaxRetries = 3;
const int _kPendingEchoLimit = 8;
const String _kSyncedPreferencesConflictCode = 'SYNCED_PREFERENCES_CONFLICT';
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
  int _hydratesInFlight = 0;
  bool _isPushInFlight = false;
  bool _pendingPush = false;
  final Set<SyncedPreferenceField> _dirtyFields = {};
  final Set<SyncedPreferenceField> _inFlightFields = {};
  pb.SyncedPreferences? _inFlightSnapshot;
  final List<({String base, String acked})> _pendingEchoes = [];
  Timer? _pushTimer;
  Duration? _pushTimerDelay;
  Timer? _pushRetryTimer;
  Set<SyncedPreferenceField> _restoredDirtyFields = {};
  int _pushGeneration = 0;
  int _pushRetryAttempts = 0;
  int _conflictRetries = 0;
  int _accountGeneration = 0;

  bool get hasHydrated => _hasHydrated;

  int get accountGeneration => _accountGeneration;

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
    _hydratesInFlight = 0;
    _isPushInFlight = false;
    _pendingPush = false;
    _dirtyFields.clear();
    _inFlightFields.clear();
    _inFlightSnapshot = null;
    _pendingEchoes.clear();
    _restoredDirtyFields = {};
    _pushGeneration++;
    _pushRetryAttempts = 0;
    _conflictRetries = 0;
    _accountGeneration++;
  }

  void markSessionChanging() {}

  void markDirty(SyncedPreferenceField field) {
    _dirtyFields.add(field);
    _persistDirtyFields();
    if (_pushRetryTimer?.isActive ?? false) {
      return;
    }
    _pushRetryAttempts = 0;
    _conflictRetries = 0;
    _pushRetryTimer?.cancel();
    _pushRetryTimer = null;
    scheduleFlush();
  }

  void scheduleFlush() {
    _pendingPush = true;
    if (_hydratesInFlight > 0) {
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
    int? accountGeneration,
  }) async {
    final int generation = accountGeneration ?? _accountGeneration;
    if (generation != _accountGeneration) {
      return;
    }
    _hydratesInFlight++;
    try {
      await _hydrate(
        settings.syncedPreferences,
        generation: generation,
        themeCustomizationApplier: themeCustomizationApplier,
        fromCache: fromCache,
      );
    } finally {
      if (generation == _accountGeneration) {
        _hydratesInFlight--;
        _flushPendingPush();
      }
    }
  }

  bool _isStale(int generation) =>
      generation != _accountGeneration || !_ref.mounted;

  Future<void> _hydrate(
    String encoded, {
    required int generation,
    required SyncedThemeCustomizationApplier? themeCustomizationApplier,
    required bool fromCache,
  }) async {
    if (_hasHydrated && _isStaleSnapshot(encoded)) {
      return;
    }
    if (!fromCache) {
      _hasServerSnapshot = true;
    }
    if (_hasHydrated && encoded.isEmpty) {
      return;
    }
    _wireBlob = encoded;
    final decodeStatus = _decodeIncoming(encoded);
    if (decodeStatus == _DecodeStatus.failure) {
      if (!fromCache) {
        await _attemptBoundedRepair(encoded, generation: generation);
        if (_isStale(generation)) {
          return;
        }
      }
      _hasHydrated = true;
      return;
    }
    final incoming = decodeStatus == _DecodeStatus.empty
        ? SyncedPreferencesEngine.createEmpty()
        : SyncedPreferencesEngine.decode(encoded);
    final wasFirstHydrate = !_hasHydrated;
    if (wasFirstHydrate) {
      final Set<SyncedPreferenceField> restored =
          await _readPersistedDirtyFields();
      if (_isStale(generation)) {
        return;
      }
      _restoredDirtyFields = restored;
      _dirtyFields.addAll(restored);
    }
    final protectedFields = _protectedFields(wasFirstHydrate: wasFirstHydrate);
    final mergeResult = SyncedPreferencesEngine.mergeIncoming(
      local: _local,
      incoming: incoming,
      protectedFields: protectedFields,
      inFlight: _inFlightSnapshot,
      syncInFlight: _isPushInFlight,
    );
    for (final field in mergeResult.dirtyFields) {
      _dirtyFields.add(field);
    }
    final previousWire = _wire;
    _wire = incoming;
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
        protectedBaselineWire: wasFirstHydrate && fromCache
            ? incoming
            : previousWire,
        generation: generation,
      );
    } finally {
      if (generation == _accountGeneration) {
        _hydrateBaselineWire = null;
      }
    }
    if (_isStale(generation)) {
      return;
    }
    if (encoded.isNotEmpty && decodeStatus == _DecodeStatus.success) {
      await _clearStaleDirtyForAbsentServerFields(
        incoming: incoming,
        generation: generation,
      );
      if (_isStale(generation)) {
        return;
      }
    }
    await _applyMergedAccessibilityTheme(
      themeCustomizationApplier: themeCustomizationApplier,
    );
    if (_isStale(generation)) {
      return;
    }
    _hasHydrated = true;
    _restoredDirtyFields = {};
    _persistDirtyFields();
    if (!_hydrations.isClosed) {
      _hydrations.add(null);
    }
  }

  Future<Set<SyncedPreferenceField>> _readPersistedDirtyFields() async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return {};
    }
    final List<String> names = await _ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .getSyncedPreferencesDirtyFields(userId);
    return {
      for (final name in names)
        if (SyncedPreferenceField.values.asNameMap()[name]
            case final SyncedPreferenceField field
            when _adapters[field]?.keepsUnpushedEditsAcrossLaunches ?? false)
          field,
    };
  }

  Future<void> _persistSyncedPreferencesToUserSettingsCache(
    String encoded,
  ) async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    try {
      final dao = _ref.read(fluxerDatabaseProvider).userSettingsDao;
      final row = await dao.getSettings(userId);
      final Map<String, dynamic> merged = row == null
          ? <String, dynamic>{}
          : Map<String, dynamic>.from(
              jsonDecode(row.data) as Map<String, dynamic>,
            );
      merged['synced_preferences'] = encoded;
      await dao.upsertSettings(
        UserSettingsTableCompanion(
          userId: Value(userId),
          data: Value(jsonEncode(merged)),
        ),
      );
    } on Object catch (error, stackTrace) {
      talker.warning(
        '[SyncedPreferences] Failed to cache wire in user settings',
        error,
        stackTrace,
      );
    }
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
          skipCustomThemeCss:
              accessibilityDirty || !themePrefs.syncThemeColorsToThemeStudio,
        );
        return;
      }
    }
    if (accessibilityDirty ||
        !themePrefs.syncThemeColorsFromThemeStudio ||
        !themePrefs.syncThemeColorsToThemeStudio) {
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
    required pb.SyncedPreferences protectedBaselineWire,
    required int generation,
  }) async {
    for (final entry in _adapters.entries) {
      final field = entry.key;
      final adapter = entry.value;
      final local = await adapter.readLocalValue();
      if (_isStale(generation)) {
        return;
      }
      final remote = adapter.readFromProto(incoming);
      final hasLocal = adapter.hasLocalData(local);
      final hasRemote = remote != null && adapter.hasRemoteData(remote);
      final isProtected = protectedFields.contains(field);
      if (!isProtected && !_dirtyFields.contains(field)) {
        if (remote != null) {
          final target = adapter.mergeRemote(local: local, remote: remote);
          if (!_statesEqual(adapter, local, target)) {
            await _applyAdapterRemote(adapter, target, generation: generation);
          }
          if (_statesEqual(adapter, target, remote)) {
            _dirtyFields.remove(field);
          } else {
            _dirtyFields.add(field);
            scheduleFlush();
          }
        } else if (hasLocal && encodedIsEmpty()) {
          _dirtyFields.add(field);
          scheduleFlush();
        } else {
          await _applyOmittedFieldClear(
            adapter: adapter,
            local: local,
            generation: generation,
          );
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
            baseline: adapter.readFromProto(protectedBaselineWire),
          );
          if (!_statesEqual(adapter, local, target)) {
            await _applyAdapterRemote(adapter, target, generation: generation);
          }
        } else if (!_dirtyFields.contains(field) &&
            adapter.clearedRemoteValue() != null) {
          if (remote != null) {
            if (!_statesEqual(adapter, local, remote)) {
              await _applyAdapterRemote(
                adapter,
                remote,
                generation: generation,
              );
            }
          } else {
            await _applyOmittedFieldClear(
              adapter: adapter,
              local: local,
              generation: generation,
            );
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
          await _applyAdapterRemote(adapter, target, generation: generation);
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
        await _applyAdapterRemote(adapter, remote, generation: generation);
        _dirtyFields.remove(field);
      }
    }
  }

  bool encodedIsEmpty() => _wireBlob.isEmpty;

  Future<void> _applyOmittedFieldClear({
    required SyncedFieldAdapter<Object?> adapter,
    required Object? local,
    required int generation,
  }) async {
    if (!adapter.hasLocalData(local) || encodedIsEmpty()) {
      return;
    }
    final cleared = adapter.clearedRemoteValue();
    if (cleared == null || _statesEqual(adapter, local, cleared)) {
      return;
    }
    await _applyAdapterRemote(adapter, cleared, generation: generation);
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
    required int generation,
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
      final Object? local = await adapter.readLocalValue();
      if (_isStale(generation)) {
        return;
      }
      if (adapter.hasLocalData(local)) {
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

  _DecodeStatus _decodeIncoming(String encoded) {
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

  Future<void> _attemptBoundedRepair(
    String encoded, {
    required int generation,
  }) async {
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
    if (_isStale(generation) ||
        !favoritesAdapter.hasLocalData(local) ||
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
      final String baseHash = await syncedPreferencesBaseHash(encoded);
      if (_isStale(generation)) {
        return;
      }
      final client = _ref.read(fluxerClientProvider);
      final UserSettingsResponse response = await client.users
          .updateCurrentUserSettings(
            body: UserSettingsUpdateRequest(
              syncedPreferences: JsonNullable.of(repairWire),
              syncedPreferencesBaseHash: baseHash,
            ),
          );
      if (_isStale(generation)) {
        return;
      }
      _wireBlob = response.syncedPreferences;
      _lastKnownGoodWire = response.syncedPreferences;
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
    if (_hydratesInFlight > 0 || !_hasServerSnapshot || _isPushInFlight) {
      _pendingPush = true;
      return;
    }
    final generation = ++_pushGeneration;
    final int accountGeneration = _accountGeneration;
    _isPushInFlight = true;
    var conflicted = false;
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
      final String baseWire = _wireBlob;
      inFlightSnapshot = await _buildLocalSnapshot();
      _inFlightSnapshot = inFlightSnapshot;
      if (!_ref.mounted) {
        return;
      }
      final encoded = await _encodeLocalSnapshot(
        baseWire: baseWire,
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
      final String baseHash = await syncedPreferencesBaseHash(baseWire);
      if (generation != _pushGeneration || !_ref.mounted) {
        return;
      }
      final client = _ref.read(fluxerClientProvider);
      final UserSettingsResponse response = await client.users
          .updateCurrentUserSettings(
            body: UserSettingsUpdateRequest(
              syncedPreferences: JsonNullable.of(encoded),
              syncedPreferencesBaseHash: baseHash,
            ),
          );
      if (generation != _pushGeneration || !_ref.mounted) {
        return;
      }
      final String acked = response.syncedPreferences;
      if (_wireBlob != acked) {
        _pendingEchoes.add((base: baseWire, acked: acked));
        if (_pendingEchoes.length > _kPendingEchoLimit) {
          _pendingEchoes.removeAt(0);
        }
      }
      _wireBlob = acked;
      if (acked.isNotEmpty) {
        _lastKnownGoodWire = acked;
      }
      _wire = acked.isEmpty
          ? SyncedPreferencesEngine.createEmpty()
          : SyncedPreferencesEngine.decode(acked);
      final pb.SyncedPreferences latestLocal = await _buildLocalSnapshot();
      if (!_ref.mounted) {
        return;
      }
      _local = latestLocal;
      _dirtyFields.removeAll(fieldsInRequest);
      await _persistSyncedPreferencesToUserSettingsCache(acked);
      final List<SyncedPreferenceField> stillChanged =
          await _changedRegisteredFields();
      _dirtyFields.addAll(stillChanged.where(fieldsInRequest.contains));
      _pendingPush = _dirtyFields.isNotEmpty;
      _persistDirtyFields();
      _pushRetryAttempts = 0;
      _conflictRetries = 0;
      final fieldNames = fieldsInRequest.map((field) => field.name).join(', ');
      talker.debug(
        '[SyncedPreferences] Pushed ${fieldsInRequest.length} field(s) '
        '[$fieldNames] (${encoded.length} bytes, '
        '${SyncedPreferencesWireCodec.countForeignFields(encoded)} '
        'foreign fields)',
      );
    } on SyncedPreferencesWireEncodeException catch (error, stackTrace) {
      talker.error('[SyncedPreferences] Wire encode failed', error, stackTrace);
      _pendingPush = false;
    } on Object catch (error, stackTrace) {
      if (_isSyncedPreferencesConflict(error)) {
        talker.warning(
          '[SyncedPreferences] Push conflicted with a newer server snapshot',
        );
        conflicted = true;
        return;
      }
      if (isTransientNetworkError(error)) {
        talker.warning('[SyncedPreferences] Push failed, will retry: $error');
      } else {
        talker.error('[SyncedPreferences] Push failed', error, stackTrace);
      }
      _schedulePushRetry(error);
    } finally {
      if (accountGeneration == _accountGeneration) {
        _isPushInFlight = false;
        _inFlightFields.clear();
        _inFlightSnapshot = null;
      }
      if (conflicted && accountGeneration == _accountGeneration) {
        unawaited(_resolveConflict(accountGeneration));
      } else if (_ref.mounted) {
        _flushPendingPush();
      }
    }
  }

  Future<void> _resolveConflict(int accountGeneration) async {
    if (_conflictRetries >= _kConflictMaxRetries) {
      talker.warning(
        '[SyncedPreferences] Giving up after $_conflictRetries conflicts',
      );
      _pendingPush = false;
      return;
    }
    _conflictRetries++;
    _pendingPush = true;
    try {
      final UserSettingsResponse settings = await _ref
          .read(fluxerClientProvider)
          .users
          .getCurrentUserSettings();
      if (_isStale(accountGeneration)) {
        return;
      }
      await hydrateFromUserSettings(
        settings,
        accountGeneration: accountGeneration,
      );
    } on Object catch (error, stackTrace) {
      if (_isStale(accountGeneration)) {
        return;
      }
      talker.warning(
        '[SyncedPreferences] Refetch after conflict failed',
        error,
        stackTrace,
      );
      _schedulePushRetry(error);
    }
  }

  bool _isSyncedPreferencesConflict(Object error) =>
      error is DioException &&
      error.response?.statusCode == 409 &&
      apiErrorCodeFromDioException(error) == _kSyncedPreferencesConflictCode;

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

  Future<String> _encodeLocalSnapshot({
    required String baseWire,
    required Iterable<SyncedPreferenceField> fieldsToEncode,
  }) async {
    final wire = baseWire.isEmpty
        ? SyncedPreferencesEngine.createEmpty()
        : SyncedPreferencesEngine.decodeLenient(baseWire);
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
      currentWire: baseWire.isEmpty ? null : baseWire,
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
    Object? value, {
    required int generation,
  }) async {
    await adapter.applyRemote(value);
    final local = await adapter.readLocalValue();
    if (_isStale(generation)) {
      return;
    }
    final wire = _wireBlob.isEmpty
        ? SyncedPreferencesEngine.createEmpty()
        : SyncedPreferencesEngine.decodeLenient(_wireBlob);
    _local = _applyAdapterToProto(_local, adapter, local, wire: wire);
  }

  bool _statesEqual(SyncedFieldAdapter<Object?> adapter, Object? a, Object? b) {
    return _adapterValuesEqual(adapter, a, b);
  }

  bool _adapterValuesEqual(
    SyncedFieldAdapter<Object?> adapter,
    Object? a,
    Object? b,
  ) {
    if (a == null && b == null) {
      return true;
    }
    if (a == null || b == null) {
      return false;
    }
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

  bool _isStaleSnapshot(String encoded) {
    final int echoIndex = _pendingEchoes.indexWhere(
      (push) => push.acked == encoded,
    );
    if (echoIndex >= 0) {
      _pendingEchoes.removeRange(0, echoIndex + 1);
      return encoded != _wireBlob;
    }
    if (_pendingEchoes.any((push) => push.base == encoded)) {
      return true;
    }
    _pendingEchoes.clear();
    return false;
  }

  void _flushPendingPush() {
    if (!_pendingPush ||
        _hydratesInFlight > 0 ||
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

Future<String> syncedPreferencesBaseHash(String encoded) async {
  final hash = await Sha256().hash(
    encoded.isEmpty ? [] : base64Decode(encoded),
  );
  return [
    for (final int byte in hash.bytes) byte.toRadixString(16).padLeft(2, '0'),
  ].join();
}

enum _DecodeStatus { empty, success, failure }
