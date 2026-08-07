import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_engine.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart';
import 'package:fluxer_app/core/synced_preferences/fields/accessibility_overrides_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/accessibility_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/favorites_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/guild_folders_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/local_spam_overrides_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/member_list_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/nagbar_dismissals_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/privacy_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/search_engines_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/sidebar_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/sound_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/unread_channels_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/voice_prompts_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/core/synced_preferences/synced_theme_hydration.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/custom_theme_css.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'synced_preferences_store.g.dart';

const Duration _kSyncDebounce = Duration(milliseconds: 500);
const Duration _kRecentAckWindow = Duration(seconds: 60);
const Duration _kRateLimitBaseDelay = Duration(seconds: 5);
const int _kRateLimitMaxAttempts = 6;

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
  bool _hasHydrated = false;
  bool _isApplyingRemote = false;
  bool _isPushInFlight = false;
  bool _pendingPush = false;
  final Set<SyncedPreferenceField> _dirtyFields = {};
  final Set<SyncedPreferenceField> _inFlightFields = {};
  pb.SyncedPreferences? _inFlightSnapshot;
  final Map<SyncedPreferenceField, DateTime> _recentlyAckedUntil = {};
  Timer? _pushTimer;
  Timer? _rateLimitTimer;
  int _pushGeneration = 0;
  int _rateLimitAttempts = 0;

  void registerDefaultAdapters() {
    registerAdapter(FavoritesSyncedField(_ref));
    registerAdapter(AccessibilitySyncedField(_ref));
    registerAdapter(AccessibilityOverridesSyncedField(_ref));
    registerAdapter(SearchEnginesSyncedField(_ref));
    registerAdapter(SidebarSyncedField(_ref));
    registerAdapter(PrivacySyncedField(_ref));
    registerAdapter(MemberListSyncedField(_ref));
    registerAdapter(UnreadChannelsSyncedField(_ref));
    registerAdapter(VoicePromptsSyncedField(_ref));
    registerAdapter(SoundSyncedField(_ref));
    registerAdapter(GuildFoldersSyncedField(_ref));
    registerAdapter(LocalSpamOverridesSyncedField(_ref));
    registerAdapter(NagbarDismissalsSyncedField(_ref));
  }

  void registerAdapter<T>(SyncedFieldAdapter<T> adapter) {
    _adapters[adapter.field] = adapter as SyncedFieldAdapter<Object?>;
  }

  void dispose() {
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
    _hasHydrated = false;
    _isApplyingRemote = false;
    _isPushInFlight = false;
    _pendingPush = false;
    _dirtyFields.clear();
    _inFlightFields.clear();
    _inFlightSnapshot = null;
    _recentlyAckedUntil.clear();
    _pushGeneration++;
    _rateLimitAttempts = 0;
  }

  void markSessionChanging() {}

  void markDirty(SyncedPreferenceField field) {
    _dirtyFields.add(field);
    scheduleFlush();
  }

  void scheduleFlush() {
    _pendingPush = true;
    if (_isApplyingRemote) {
      return;
    }
    _pushTimer?.cancel();
    _pushTimer = Timer(_kSyncDebounce, () {
      if (!_ref.mounted) {
        return;
      }
      unawaited(_flushPush());
    });
  }

  Future<void> hydrateFromUserSettings(
    UserSettingsResponse settings, {
    SyncedThemeCustomizationApplier? themeCustomizationApplier,
  }) async {
    final encoded = settings.syncedPreferences;
    _wireBlob = encoded;
    final decodeStatus = await _decodeIncoming(encoded);
    if (decodeStatus == _DecodeStatus.failure) {
      await _attemptBoundedRepair(encoded);
      _hasHydrated = true;
      _flushPendingPush();
      return;
    }
    final incoming = decodeStatus == _DecodeStatus.empty
        ? SyncedPreferencesEngine.createEmpty()
        : SyncedPreferencesEngine.decode(encoded);
    final wasFirstHydrate = !_hasHydrated;
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
    _wire = mergeResult.wire;
    _local = mergeResult.merged;
    if (encoded.isNotEmpty && decodeStatus == _DecodeStatus.success) {
      _lastKnownGoodWire = encoded;
    }
    await _reconcileRegisteredFields(
      incoming: incoming,
      wasFirstHydrate: wasFirstHydrate,
      protectedFields: protectedFields,
    );
    if (encoded.isNotEmpty && decodeStatus == _DecodeStatus.success) {
      _clearStaleDirtyForAbsentServerFields(incoming: incoming);
    }
    await _applyMergedAccessibilityTheme(
      themeCustomizationApplier: themeCustomizationApplier,
    );
    _hasHydrated = true;
    _flushPendingPush();
  }

  Future<void> _applyMergedAccessibilityTheme({
    SyncedThemeCustomizationApplier? themeCustomizationApplier,
  }) async {
    final SyncedThemeCustomizationApplier apply =
        themeCustomizationApplier ??
        _ref
            .read(themePreferenceProvider.notifier)
            .applySyncedThemeCustomization;
    if (_local.hasAccessibility()) {
      final accessibility = _local.accessibility;
      final String? mergedCss = accessibility.hasCustomThemeCss()
          ? normalizeCustomThemeCss(accessibility.customThemeCss)
          : null;
      if (mergedCss != null || accessibility.hasSaturationFactor()) {
        await applyThemeCustomizationFromAccessibilityProto(
          accessibility,
          apply,
        );
        return;
      }
    }
    final String? wireCss = normalizeCustomThemeCss(readWireCustomThemeCss());
    if (wireCss == null) {
      return;
    }
    await apply(customThemeCss: wireCss, updateSaturationFactor: false);
  }

  Future<void> _reconcileRegisteredFields({
    required pb.SyncedPreferences incoming,
    required bool wasFirstHydrate,
    required Set<SyncedPreferenceField> protectedFields,
  }) async {
    for (final entry in _adapters.entries) {
      final field = entry.key;
      final adapter = entry.value;
      final local = await adapter.readLocalValue();
      final remote = adapter.readFromProto(incoming);
      final hasLocal = adapter.hasLocalData(local);
      final hasRemote = remote != null && adapter.hasRemoteData(remote);
      final isProtected = protectedFields.contains(field);
      if (!isProtected && !_dirtyFields.contains(field)) {
        if (remote != null) {
          if (!_statesEqual(adapter, local, remote)) {
            await _applyAdapterRemote(adapter, remote);
          }
          _dirtyFields.remove(field);
        } else if (hasLocal && encodedIsEmpty()) {
          _dirtyFields.add(field);
          scheduleFlush();
        }
        continue;
      }
      if (isProtected && !wasFirstHydrate) {
        if (remote != null &&
            adapter.hasInboundUpdatesWhileProtected(local, remote)) {
          final target = adapter.mergeForMigration(
            local: local,
            remote: remote,
          );
          if (!_statesEqual(adapter, local, target)) {
            await _applyAdapterRemote(adapter, target);
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

  void _clearStaleDirtyForAbsentServerFields({
    required pb.SyncedPreferences incoming,
  }) {
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
        body: UserSettingsUpdateRequest(syncedPreferences: repairWire),
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
    if (!_hasHydrated) {
      _deferPush();
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
      final encoded = await _encodeLocalSnapshot(inFlightSnapshot);
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
        body: UserSettingsUpdateRequest(syncedPreferences: encoded),
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
      _markFieldsAcked(fieldsInRequest);
      _rateLimitAttempts = 0;
      talker.debug(
        '[SyncedPreferences] Pushed ${fieldsInRequest.length} field(s) '
        '(${encoded.length} bytes, '
        '${SyncedPreferencesWireCodec.countForeignFields(encoded)}'
        'foreign fields)',
      );
    } on SyncedPreferencesWireEncodeException catch (error, stackTrace) {
      talker.error('[SyncedPreferences] Wire encode failed', error, stackTrace);
    } on Object catch (error, stackTrace) {
      if (_isRateLimitError(error)) {
        _scheduleRateLimitRetry();
        talker.warning('[SyncedPreferences] Push rate-limited, will retry');
        return;
      }
      talker.error('[SyncedPreferences] Push failed', error, stackTrace);
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

  Future<String> _encodeLocalSnapshot(pb.SyncedPreferences snapshot) async {
    final wire = _wireBlob.isEmpty
        ? SyncedPreferencesEngine.createEmpty()
        : SyncedPreferencesEngine.decodeLenient(_wireBlob);
    final fieldMessages = <int, Uint8List>{};
    for (final entry in _adapters.entries) {
      if (!_ref.mounted) {
        return '';
      }
      final adapter = entry.value;
      final Object? local = await adapter.readLocalValue();
      fieldMessages[adapter.fieldNumber] = _buildProtoForPush(
        adapter,
        local,
        wire: wire,
      ).writeToBuffer();
    }
    return SyncedPreferencesWireCodec.encodeSnapshotIntoWire(
      currentWire: _wireBlob.isEmpty ? null : _wireBlob,
      fieldMessages: fieldMessages,
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
      fieldMessageBytes: _buildProtoForPush(
        adapter,
        local,
        wire: wire,
      ).writeToBuffer(),
    );
  }

  $pb.GeneratedMessage _buildProtoForPush(
    SyncedFieldAdapter<Object?> adapter,
    Object? local, {
    required pb.SyncedPreferences wire,
  }) {
    final wireSubMessage = adapter.readWireSubMessage(wire);
    return adapter.toProtoMessageForPush(local, wireSubMessage: wireSubMessage);
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
        fieldMessageBytes: _buildProtoForPush(
          adapter,
          local,
          wire: wire,
        ).writeToBuffer(),
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
      return {};
    }
    final protected = <SyncedPreferenceField>{..._dirtyFields};
    if (_isPushInFlight) {
      protected.addAll(_inFlightFields);
    }
    if (_pushTimer?.isActive ?? false) {
      protected.addAll(_dirtyFields);
    }
    protected.addAll(_recentlyAckedFields());
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
    if (!_pendingPush || _isApplyingRemote || _isPushInFlight) {
      return;
    }
    scheduleFlush();
  }

  void _deferPush() {
    _pendingPush = true;
    _pushTimer?.cancel();
    _pushTimer = Timer(_kSyncDebounce, () {
      if (!_ref.mounted) {
        return;
      }
      unawaited(_flushPush());
    });
  }

  void _scheduleRateLimitRetry() {
    _pendingPush = true;
    _pushTimer?.cancel();
    _rateLimitTimer?.cancel();
    _rateLimitAttempts = (_rateLimitAttempts + 1).clamp(
      1,
      _kRateLimitMaxAttempts,
    );
    final delay = Duration(
      milliseconds:
          _kRateLimitBaseDelay.inMilliseconds *
          (1 << (_rateLimitAttempts - 1).clamp(0, 4)),
    );
    _rateLimitTimer = Timer(delay, () {
      if (!_ref.mounted) {
        return;
      }
      unawaited(_flushPush());
    });
  }

  void _cancelScheduledWork() {
    _pushTimer?.cancel();
    _pushTimer = null;
    _rateLimitTimer?.cancel();
    _rateLimitTimer = null;
  }

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
  void triggerRateLimitRetryForTest() {
    _rateLimitTimer?.cancel();
    _rateLimitTimer = null;
    if (!_ref.mounted) {
      return;
    }
    unawaited(_flushPush());
  }

  bool _isRateLimitError(Object error) {
    if (error is DioException) {
      return error.response?.statusCode == 429;
    }
    return false;
  }
}

enum _DecodeStatus { empty, success, failure }
