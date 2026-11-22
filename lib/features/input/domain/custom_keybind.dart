import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';

enum VoiceTransmitMode {
  voiceActivity('voice_activity'),
  pushToTalk('voice_push_to_talk');

  const VoiceTransmitMode(this.id);

  final String id;

  static VoiceTransmitMode fromId(String? id) {
    for (final VoiceTransmitMode mode in values) {
      if (mode.id == id) {
        return mode;
      }
    }
    return VoiceTransmitMode.voiceActivity;
  }
}

const int kDefaultPushToTalkReleaseDelayMs = 20;
const int kMinPushToTalkReleaseDelayMs = 20;
const int kMaxPushToTalkReleaseDelayMs = 2000;
const List<int> kPushToTalkReleaseDelayOptions = <int>[
  20,
  100,
  250,
  500,
  1000,
  1500,
  2000,
];

int clampPushToTalkReleaseDelay(int value) =>
    value.clamp(kMinPushToTalkReleaseDelayMs, kMaxPushToTalkReleaseDelayMs);

const Map<KeybindAction, String> _kActionIdOverrides = <KeybindAction, String>{
  KeybindAction.voiceToggleVideo: 'voice_toggle_camera',
};

String keybindActionId(KeybindAction action) {
  final String? override = _kActionIdOverrides[action];
  if (override != null) {
    return override;
  }
  final StringBuffer buffer = StringBuffer();
  final String name = action.name;
  for (int i = 0; i < name.length; i++) {
    final String char = name[i];
    final bool upper = char.toUpperCase() == char && char.toLowerCase() != char;
    final bool digit = int.tryParse(char) != null;
    final bool previousDigit = i > 0 && int.tryParse(name[i - 1]) != null;
    if ((upper || (digit && !previousDigit)) && i > 0) {
      buffer.write('_');
    }
    buffer.write(char.toLowerCase());
  }
  return buffer.toString();
}

KeybindAction? keybindActionFromId(String? id) {
  if (id == null || id.isEmpty) {
    return null;
  }
  for (final KeybindAction action in KeybindAction.values) {
    if (keybindActionId(action) == id) {
      return action;
    }
  }
  return null;
}

@immutable
class StoredKeybindCombo {
  const StoredKeybindCombo({
    this.key = '',
    this.code,
    this.ctrlOrMeta = false,
    this.ctrl = false,
    this.alt = false,
    this.shift = false,
    this.meta = false,
    this.global,
    this.enabled,
    this.modifierOnly = false,
    this.bothSides = false,
    this.mouseButton,
    this.gamepadButton,
  });

  final String key;
  final String? code;
  final bool ctrlOrMeta;
  final bool ctrl;
  final bool alt;
  final bool shift;
  final bool meta;
  final bool? global;
  final bool? enabled;
  final bool modifierOnly;
  final bool bothSides;
  final int? mouseButton;
  final int? gamepadButton;

  bool get hasTriggerInput =>
      key.isNotEmpty ||
      (code?.isNotEmpty ?? false) ||
      mouseButton != null ||
      gamepadButton != null;

  KeybindCombo toKeybindCombo() => KeybindCombo(
    key: key,
    code: code,
    ctrlOrMeta: ctrlOrMeta,
    ctrl: ctrl,
    alt: alt,
    shift: shift,
    meta: meta,
  );

  StoredKeybindCombo withTrigger(KeybindCombo combo) => StoredKeybindCombo(
    key: combo.key,
    code: combo.code,
    ctrlOrMeta: combo.ctrlOrMeta,
    ctrl: combo.ctrl,
    alt: combo.alt,
    shift: combo.shift,
    meta: combo.meta,
    global: global,
    enabled: enabled,
  );

  StoredKeybindCombo cleared() =>
      StoredKeybindCombo(global: global, enabled: enabled);

  Map<String, Object?> toJson() => <String, Object?>{
    'key': key,
    'code': ?code,
    'ctrlOrMeta': ctrlOrMeta,
    'ctrl': ctrl,
    'alt': alt,
    'shift': shift,
    'meta': meta,
    'global': ?global,
    'enabled': ?enabled,
    'modifierOnly': modifierOnly,
    'bothSides': bothSides,
    'mouseButton': ?mouseButton,
    'gamepadButton': ?gamepadButton,
  };

  factory StoredKeybindCombo.fromJson(Object? json) {
    if (json is! Map) {
      return const StoredKeybindCombo();
    }
    return StoredKeybindCombo(
      key: json['key'] as String? ?? '',
      code: json['code'] as String?,
      ctrlOrMeta: json['ctrlOrMeta'] == true,
      ctrl: json['ctrl'] == true,
      alt: json['alt'] == true,
      shift: json['shift'] == true,
      meta: json['meta'] == true,
      global: json['global'] as bool?,
      enabled: json['enabled'] as bool?,
      modifierOnly: json['modifierOnly'] == true,
      bothSides: json['bothSides'] == true,
      mouseButton: (json['mouseButton'] as num?)?.toInt(),
      gamepadButton: (json['gamepadButton'] as num?)?.toInt(),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is StoredKeybindCombo &&
      other.key == key &&
      other.code == code &&
      other.ctrlOrMeta == ctrlOrMeta &&
      other.ctrl == ctrl &&
      other.alt == alt &&
      other.shift == shift &&
      other.meta == meta &&
      other.global == global &&
      other.enabled == enabled &&
      other.modifierOnly == modifierOnly &&
      other.bothSides == bothSides &&
      other.mouseButton == mouseButton &&
      other.gamepadButton == gamepadButton;

  @override
  int get hashCode => Object.hash(
    key,
    code,
    ctrlOrMeta,
    ctrl,
    alt,
    shift,
    meta,
    global,
    enabled,
    modifierOnly,
    bothSides,
    mouseButton,
    gamepadButton,
  );
}

@immutable
class CustomKeybindEntry {
  const CustomKeybindEntry({
    required this.id,
    required this.action,
    required this.combo,
    this.enabled = true,
  });

  final String id;
  final String? action;
  final StoredKeybindCombo combo;
  final bool enabled;

  KeybindAction? get resolvedAction => keybindActionFromId(action);

  bool get isBuiltinDisableMarker => action != null && combo.enabled == false;

  bool get isActive =>
      action != null &&
      enabled &&
      !isBuiltinDisableMarker &&
      combo.hasTriggerInput;

  CustomKeybindEntry copyWith({
    String? action,
    bool clearAction = false,
    StoredKeybindCombo? combo,
    bool? enabled,
  }) {
    return CustomKeybindEntry(
      id: id,
      action: clearAction ? null : action ?? this.action,
      combo: combo ?? this.combo,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
    'id': id,
    'action': action,
    'combo': combo.toJson(),
    'enabled': enabled,
  };

  static CustomKeybindEntry? fromJson(Object? json) {
    if (json is! Map) {
      return null;
    }
    final Object? id = json['id'];
    if (id is! String || id.isEmpty) {
      return null;
    }
    return CustomKeybindEntry(
      id: id,
      action: json['action'] as String?,
      combo: StoredKeybindCombo.fromJson(json['combo']),
      enabled: json['enabled'] as bool? ?? true,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is CustomKeybindEntry &&
      other.id == id &&
      other.action == action &&
      other.combo == combo &&
      other.enabled == enabled;

  @override
  int get hashCode => Object.hash(id, action, combo, enabled);
}

@immutable
class SyncedKeybindSettings {
  const SyncedKeybindSettings({
    this.customKeybinds = const <CustomKeybindEntry>[],
    this.transmitMode = VoiceTransmitMode.voiceActivity,
    this.pushToTalkReleaseDelayMs = kDefaultPushToTalkReleaseDelayMs,
  });

  final List<CustomKeybindEntry> customKeybinds;
  final VoiceTransmitMode transmitMode;
  final int pushToTalkReleaseDelayMs;

  @override
  bool operator ==(Object other) =>
      other is SyncedKeybindSettings &&
      listEquals(other.customKeybinds, customKeybinds) &&
      other.transmitMode == transmitMode &&
      other.pushToTalkReleaseDelayMs == pushToTalkReleaseDelayMs;

  @override
  int get hashCode => Object.hash(
    Object.hashAll(customKeybinds),
    transmitMode,
    pushToTalkReleaseDelayMs,
  );
}
