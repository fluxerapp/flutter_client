import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_dom_codes.dart';

@immutable
sealed class GlobalShortcutTrigger {
  const GlobalShortcutTrigger();
}

class KeyShortcutTrigger extends GlobalShortcutTrigger {
  const KeyShortcutTrigger(this.code);

  final String code;

  @override
  bool operator ==(Object other) =>
      other is KeyShortcutTrigger && other.code == code;

  @override
  int get hashCode => code.hashCode;
}

class MouseShortcutTrigger extends GlobalShortcutTrigger {
  const MouseShortcutTrigger(this.button);

  final int button;

  @override
  bool operator ==(Object other) =>
      other is MouseShortcutTrigger && other.button == button;

  @override
  int get hashCode => button.hashCode;
}

class ModifierShortcutTrigger extends GlobalShortcutTrigger {
  const ModifierShortcutTrigger(this.modifiers, {this.bothSides = false});

  final Set<KeybindModifier> modifiers;
  final bool bothSides;

  @override
  bool operator ==(Object other) =>
      other is ModifierShortcutTrigger &&
      setEquals(other.modifiers, modifiers) &&
      other.bothSides == bothSides;

  @override
  int get hashCode =>
      Object.hash(Object.hashAllUnordered(modifiers), bothSides);
}

@immutable
class GlobalShortcutBinding {
  const GlobalShortcutBinding({
    required this.sourceId,
    required this.action,
    required this.trigger,
    this.modifiers = const <KeybindModifier>{},
  });

  static GlobalShortcutBinding? fromStored({
    required String sourceId,
    required KeybindAction action,
    required StoredKeybindCombo combo,
    required bool isMacOS,
  }) {
    if (combo.gamepadButton != null || !combo.hasTriggerInput) {
      return null;
    }
    final Set<KeybindModifier> modifiers = <KeybindModifier>{
      if (combo.ctrl || (!isMacOS && combo.ctrlOrMeta)) KeybindModifier.ctrl,
      if (combo.alt) KeybindModifier.alt,
      if (combo.shift) KeybindModifier.shift,
      if (combo.meta || (isMacOS && combo.ctrlOrMeta)) KeybindModifier.meta,
    };
    final int? mouseButton = combo.mouseButton;
    if (mouseButton != null) {
      return GlobalShortcutBinding(
        sourceId: sourceId,
        action: action,
        trigger: MouseShortcutTrigger(mouseButton),
        modifiers: modifiers,
      );
    }
    final String? storedCode = combo.code;
    final String? code = storedCode != null && storedCode.isNotEmpty
        ? storedCode
        : usLayoutKeyToDomCode(combo.key);
    if (combo.modifierOnly) {
      final KeybindModifier? own = modifierForDomCode(code);
      final Set<KeybindModifier> held = <KeybindModifier>{...modifiers, ?own};
      if (held.isEmpty) {
        return null;
      }
      return GlobalShortcutBinding(
        sourceId: sourceId,
        action: action,
        trigger: ModifierShortcutTrigger(
          held,
          bothSides: combo.bothSides && held.length == 1,
        ),
        modifiers: modifiers,
      );
    }
    if (code == null) {
      return null;
    }
    return GlobalShortcutBinding(
      sourceId: sourceId,
      action: action,
      trigger: KeyShortcutTrigger(code),
      modifiers: modifiers,
    );
  }

  static GlobalShortcutBinding? fromCombo({
    required String sourceId,
    required KeybindAction action,
    required KeybindCombo combo,
    required bool isMacOS,
  }) => fromStored(
    sourceId: sourceId,
    action: action,
    combo: const StoredKeybindCombo().withTrigger(combo),
    isMacOS: isMacOS,
  );

  final String sourceId;
  final KeybindAction action;
  final GlobalShortcutTrigger trigger;
  final Set<KeybindModifier> modifiers;

  bool hasSameCombo(GlobalShortcutBinding other) =>
      other.action == action &&
      other.trigger == trigger &&
      setEquals(other.modifiers, modifiers);

  @override
  bool operator ==(Object other) =>
      other is GlobalShortcutBinding &&
      other.sourceId == sourceId &&
      hasSameCombo(other);

  @override
  int get hashCode => Object.hash(
    sourceId,
    action,
    trigger,
    Object.hashAllUnordered(modifiers),
  );
}
