import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'keybind_preferences_provider.g.dart';

@immutable
class KeybindPreferencesState {
  const KeybindPreferencesState({
    this.customKeybinds = const <CustomKeybindEntry>[],
    this.transmitMode = VoiceTransmitMode.voiceActivity,
    this.pushToTalkReleaseDelayMs = kDefaultPushToTalkReleaseDelayMs,
    this.syncAcrossDevices = false,
    this.disableBuiltinKeybinds = false,
  });

  final List<CustomKeybindEntry> customKeybinds;
  final VoiceTransmitMode transmitMode;
  final int pushToTalkReleaseDelayMs;
  final bool syncAcrossDevices;
  final bool disableBuiltinKeybinds;

  bool get isPushToTalk => transmitMode == VoiceTransmitMode.pushToTalk;

  SyncedKeybindSettings get synced => SyncedKeybindSettings(
    customKeybinds: customKeybinds,
    transmitMode: transmitMode,
    pushToTalkReleaseDelayMs: pushToTalkReleaseDelayMs,
  );

  List<CustomKeybindEntry> entriesFor(KeybindAction action) {
    final String id = keybindActionId(action);
    return customKeybinds
        .where((CustomKeybindEntry entry) => entry.action == id)
        .toList(growable: false);
  }

  CustomKeybindEntry? primaryFor(KeybindAction action) {
    for (final CustomKeybindEntry entry in entriesFor(action)) {
      if (!entry.isBuiltinDisableMarker) {
        return entry;
      }
    }
    return null;
  }

  bool isBuiltinDisabled(KeybindAction action) => entriesFor(
    action,
  ).any((CustomKeybindEntry entry) => entry.isBuiltinDisableMarker);

  KeybindPreferencesState copyWith({
    List<CustomKeybindEntry>? customKeybinds,
    VoiceTransmitMode? transmitMode,
    int? pushToTalkReleaseDelayMs,
    bool? syncAcrossDevices,
    bool? disableBuiltinKeybinds,
  }) {
    return KeybindPreferencesState(
      customKeybinds: customKeybinds ?? this.customKeybinds,
      transmitMode: transmitMode ?? this.transmitMode,
      pushToTalkReleaseDelayMs:
          pushToTalkReleaseDelayMs ?? this.pushToTalkReleaseDelayMs,
      syncAcrossDevices: syncAcrossDevices ?? this.syncAcrossDevices,
      disableBuiltinKeybinds:
          disableBuiltinKeybinds ?? this.disableBuiltinKeybinds,
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
    'customKeybinds': customKeybinds
        .map((CustomKeybindEntry entry) => entry.toJson())
        .toList(),
    'transmitMode': transmitMode.id,
    'pushToTalkReleaseDelayMs': pushToTalkReleaseDelayMs,
    'syncAcrossDevices': syncAcrossDevices,
    'disableBuiltinKeybinds': disableBuiltinKeybinds,
  };

  factory KeybindPreferencesState.fromJson(Object? json) {
    if (json is! Map) {
      return const KeybindPreferencesState();
    }
    final Object? rawEntries = json['customKeybinds'];
    return KeybindPreferencesState(
      customKeybinds: rawEntries is List
          ? rawEntries
                .map(CustomKeybindEntry.fromJson)
                .whereType<CustomKeybindEntry>()
                .toList(growable: false)
          : const <CustomKeybindEntry>[],
      transmitMode: VoiceTransmitMode.fromId(json['transmitMode'] as String?),
      pushToTalkReleaseDelayMs: clampPushToTalkReleaseDelay(
        (json['pushToTalkReleaseDelayMs'] as num?)?.round() ??
            kDefaultPushToTalkReleaseDelayMs,
      ),
      syncAcrossDevices: json['syncAcrossDevices'] == true,
      disableBuiltinKeybinds: json['disableBuiltinKeybinds'] == true,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is KeybindPreferencesState &&
      listEquals(other.customKeybinds, customKeybinds) &&
      other.transmitMode == transmitMode &&
      other.pushToTalkReleaseDelayMs == pushToTalkReleaseDelayMs &&
      other.syncAcrossDevices == syncAcrossDevices &&
      other.disableBuiltinKeybinds == disableBuiltinKeybinds;

  @override
  int get hashCode => Object.hash(
    Object.hashAll(customKeybinds),
    transmitMode,
    pushToTalkReleaseDelayMs,
    syncAcrossDevices,
    disableBuiltinKeybinds,
  );
}

@Riverpod(keepAlive: true)
class KeybindPreferences extends _$KeybindPreferences {
  SyncedKeybindSettings? _remote;

  @override
  KeybindPreferencesState build() {
    final Map<String, Object?> json = ref
        .watch(localSettingsStoreProvider)
        .read(LocalSettingKeys.keybindPreferences);
    try {
      return KeybindPreferencesState.fromJson(json);
    } on Object {
      return const KeybindPreferencesState();
    }
  }

  KeybindPreferencesState _withSynced(
    KeybindPreferencesState base,
    SyncedKeybindSettings synced,
  ) {
    return base.copyWith(
      customKeybinds: synced.customKeybinds,
      transmitMode: synced.transmitMode,
      pushToTalkReleaseDelayMs: synced.pushToTalkReleaseDelayMs,
    );
  }

  SyncedKeybindSettings readSyncedLocal() {
    if (state.syncAcrossDevices || _remote == null) {
      return state.synced;
    }
    return _remote!;
  }

  Future<void> applySynced(SyncedKeybindSettings value) async {
    _remote = value;
    if (state.syncAcrossDevices) {
      state = _withSynced(state, value);
      _persist();
    }
  }

  Future<void> _commit(KeybindPreferencesState next) async {
    state = next;
    if (next.syncAcrossDevices) {
      ref.markSyncedDirty(SyncedPreferenceField.keybinds);
    }
    _persist();
  }

  void _persist() => ref
      .read(localSettingsStoreProvider)
      .write(LocalSettingKeys.keybindPreferences, state.toJson());

  Future<void> setTransmitMode(VoiceTransmitMode mode) =>
      _commit(state.copyWith(transmitMode: mode));

  Future<void> toggleTransmitMode() => setTransmitMode(
    state.isPushToTalk
        ? VoiceTransmitMode.voiceActivity
        : VoiceTransmitMode.pushToTalk,
  );

  Future<void> setPushToTalkReleaseDelay(int value) => _commit(
    state.copyWith(
      pushToTalkReleaseDelayMs: clampPushToTalkReleaseDelay(value),
    ),
  );

  Future<void> setSyncAcrossDevices({required bool value}) async {
    if (value && _remote != null && _remote!.customKeybinds.isNotEmpty) {
      await _commit(
        _withSynced(state, _remote!).copyWith(syncAcrossDevices: true),
      );
      return;
    }
    await _commit(state.copyWith(syncAcrossDevices: value));
  }

  Future<void> setDisableBuiltinKeybinds({required bool value}) =>
      _commit(state.copyWith(disableBuiltinKeybinds: value));

  Future<void> addCustomKeybind() {
    return _commit(
      state.copyWith(
        customKeybinds: <CustomKeybindEntry>[
          ...state.customKeybinds,
          CustomKeybindEntry(
            id: const Uuid().v4(),
            action: null,
            combo: const StoredKeybindCombo(),
          ),
        ],
      ),
    );
  }

  Future<void> updateCustomKeybind(CustomKeybindEntry entry) {
    return _commit(
      state.copyWith(
        customKeybinds: <CustomKeybindEntry>[
          for (final CustomKeybindEntry existing in state.customKeybinds)
            if (existing.id == entry.id) entry else existing,
        ],
      ),
    );
  }

  Future<void> removeCustomKeybind(String id) {
    return _commit(
      state.copyWith(
        customKeybinds: state.customKeybinds
            .where((CustomKeybindEntry entry) => entry.id != id)
            .toList(growable: false),
      ),
    );
  }

  Future<void> setPrimaryCombo(
    KeybindAction action,
    StoredKeybindCombo combo,
  ) async {
    final CustomKeybindEntry? primary = state.primaryFor(action);
    if (primary != null) {
      await updateCustomKeybind(primary.copyWith(combo: combo, enabled: true));
      return;
    }
    await _commit(
      state.copyWith(
        customKeybinds: <CustomKeybindEntry>[
          ...state.customKeybinds,
          CustomKeybindEntry(
            id: const Uuid().v4(),
            action: keybindActionId(action),
            combo: combo,
          ),
        ],
      ),
    );
  }

  Future<void> setBuiltinDisabled(
    KeybindAction action, {
    required bool disabled,
  }) async {
    final String id = keybindActionId(action);
    final List<CustomKeybindEntry> next = <CustomKeybindEntry>[
      for (final CustomKeybindEntry entry in state.customKeybinds)
        if (!(entry.action == id && entry.isBuiltinDisableMarker)) entry,
      if (disabled)
        CustomKeybindEntry(
          id: const Uuid().v4(),
          action: id,
          combo: const StoredKeybindCombo(enabled: false),
        ),
    ];
    await _commit(state.copyWith(customKeybinds: next));
  }
}
