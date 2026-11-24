import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/providers/keybind_preferences_provider.dart';

class KeybindsSyncedField
    extends ProtoSyncedFieldAdapter<SyncedKeybindSettings, pb.KeybindSettings> {
  KeybindsSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.keybinds;

  @override
  SyncedKeybindSettings readLocal() {
    return _ref.read(keybindPreferencesProvider.notifier).readSyncedLocal();
  }

  @override
  Future<void> applyRemote(SyncedKeybindSettings value) async {
    await _ref.read(keybindPreferencesProvider.notifier).applySynced(value);
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasKeybinds();

  @override
  pb.KeybindSettings readSubMessage(pb.SyncedPreferences message) {
    return message.keybinds;
  }

  @override
  SyncedKeybindSettings fromProto(pb.KeybindSettings proto) {
    return SyncedKeybindSettings(
      customKeybinds: proto.customKeybinds
          .map(_entryFromProto)
          .toList(growable: false),
      transmitMode: VoiceTransmitMode.fromId(proto.transmitMode),
      pushToTalkReleaseDelayMs: proto.hasPushToTalkReleaseDelayMs()
          ? clampPushToTalkReleaseDelay(proto.pushToTalkReleaseDelayMs)
          : kDefaultPushToTalkReleaseDelayMs,
    );
  }

  CustomKeybindEntry _entryFromProto(pb.CustomKeybind proto) {
    final pb.KeybindCombo combo = proto.combo;
    return CustomKeybindEntry(
      id: proto.id,
      action: proto.hasAction() && proto.action.isNotEmpty
          ? proto.action
          : null,
      enabled: proto.enabled,
      combo: proto.hasCombo()
          ? StoredKeybindCombo(
              key: combo.key,
              code: combo.code.isEmpty ? null : combo.code,
              ctrlOrMeta: combo.ctrlOrMeta,
              ctrl: combo.ctrl,
              alt: combo.alt,
              shift: combo.shift,
              meta: combo.meta,
              global: combo.hasGlobal() ? combo.global : null,
              enabled: combo.hasEnabled() ? combo.enabled : null,
              modifierOnly: combo.modifierOnly,
              bothSides: combo.bothSides,
              mouseButton: combo.hasMouseButton() ? combo.mouseButton : null,
              gamepadButton: combo.hasGamepadButton()
                  ? combo.gamepadButton
                  : null,
            )
          : const StoredKeybindCombo(enabled: true, global: true),
    );
  }

  pb.CustomKeybind _entryToProto(CustomKeybindEntry entry) {
    final StoredKeybindCombo combo = entry.combo;
    final pb.KeybindCombo protoCombo = pb.KeybindCombo(
      key: combo.key,
      ctrlOrMeta: combo.ctrlOrMeta,
      ctrl: combo.ctrl,
      alt: combo.alt,
      shift: combo.shift,
      meta: combo.meta,
      modifierOnly: combo.modifierOnly,
      bothSides: combo.bothSides,
    );
    if (combo.code case final String code when code.isNotEmpty) {
      protoCombo.code = code;
    }
    if (combo.global case final bool global) {
      protoCombo.global = global;
    }
    if (combo.enabled case final bool enabled) {
      protoCombo.enabled = enabled;
    }
    if (combo.mouseButton case final int button) {
      protoCombo.mouseButton = button;
    }
    if (combo.gamepadButton case final int button) {
      protoCombo.gamepadButton = button;
    }
    final pb.CustomKeybind proto = pb.CustomKeybind(
      id: entry.id,
      combo: protoCombo,
      enabled: entry.enabled,
    );
    if (entry.action case final String action) {
      proto.action = action;
    }
    return proto;
  }

  @override
  void writeProto(pb.KeybindSettings proto, SyncedKeybindSettings local) {
    proto
      ..customKeybinds.clear()
      ..customKeybinds.addAll(local.customKeybinds.map(_entryToProto))
      ..transmitMode = local.transmitMode.id;
    if (local.pushToTalkReleaseDelayMs == kDefaultPushToTalkReleaseDelayMs) {
      proto.clearPushToTalkReleaseDelayMs();
    } else {
      proto.pushToTalkReleaseDelayMs = local.pushToTalkReleaseDelayMs;
    }
  }

  @override
  pb.KeybindSettings createEmptyProto() => pb.KeybindSettings();

  @override
  pb.SyncedPreferences wrapProto(pb.KeybindSettings proto) {
    return pb.SyncedPreferences(keybinds: proto);
  }

  @override
  bool statesEqual(SyncedKeybindSettings a, SyncedKeybindSettings b) {
    return a == b;
  }
}
