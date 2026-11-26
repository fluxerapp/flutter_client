import 'package:fluxer_app/features/input/domain/global_shortcut_binding.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_dom_codes.dart';

enum GlobalShortcutPhase { press, release }

class GlobalShortcutTransition {
  const GlobalShortcutTransition({
    required this.sourceId,
    required this.action,
    required this.phase,
  });

  final String sourceId;
  final KeybindAction action;
  final GlobalShortcutPhase phase;

  @override
  String toString() => '$sourceId:${phase.name}';
}

class GlobalShortcutKeyEvent {
  const GlobalShortcutKeyEvent({
    required this.down,
    required this.keycode,
    required this.code,
    this.modifiers = const <KeybindModifier>{},
  });

  final bool down;
  final int keycode;
  final String? code;
  final Set<KeybindModifier> modifiers;
}

class GlobalShortcutMouseEvent {
  const GlobalShortcutMouseEvent({
    required this.down,
    required this.button,
    this.modifiers = const <KeybindModifier>{},
  });

  final bool down;
  final int button;
  final Set<KeybindModifier> modifiers;
}

sealed class _Press {
  const _Press();
}

class _KeyPress extends _Press {
  const _KeyPress(this.keycode);

  final int keycode;
}

class _MousePress extends _Press {
  const _MousePress(this.button);

  final int button;
}

class _ModifierPress extends _Press {
  const _ModifierPress();
}

class GlobalShortcutMatcher {
  final Map<String, GlobalShortcutBinding> _bindings =
      <String, GlobalShortcutBinding>{};
  final Map<String, _Press> _pressed = <String, _Press>{};
  final Set<String> _heldModifierCodes = <String>{};

  List<GlobalShortcutTransition> setBindings(
    Iterable<GlobalShortcutBinding> next,
  ) {
    final Map<String, GlobalShortcutBinding> nextBindings =
        <String, GlobalShortcutBinding>{};
    for (final GlobalShortcutBinding binding in next) {
      nextBindings.putIfAbsent(binding.sourceId, () => binding);
    }
    final List<GlobalShortcutTransition> released =
        <GlobalShortcutTransition>[];
    for (final String sourceId in _pressed.keys.toList()) {
      final GlobalShortcutBinding? previous = _bindings[sourceId];
      if (previous != null && previous == nextBindings[sourceId]) {
        continue;
      }
      _release(sourceId, released);
    }
    _bindings
      ..clear()
      ..addAll(nextBindings);
    return released;
  }

  List<GlobalShortcutTransition> handleKey(
    GlobalShortcutKeyEvent event, {
    bool releaseOnly = false,
  }) {
    final String? heldCode = modifierForDomCode(event.code) == null
        ? null
        : event.code;
    _reconcileModifiers(event.modifiers, event.down ? heldCode : null);
    if (!event.down) {
      _heldModifierCodes.remove(heldCode);
      final List<GlobalShortcutTransition> transitions =
          <GlobalShortcutTransition>[];
      for (final MapEntry<String, _Press> entry in _pressed.entries.toList()) {
        final _Press press = entry.value;
        if (press is _KeyPress && press.keycode == event.keycode) {
          _release(entry.key, transitions);
        }
      }
      _releaseUnsatisfiedModifiers(transitions);
      return transitions;
    }
    final List<GlobalShortcutTransition> transitions =
        <GlobalShortcutTransition>[];
    _releaseUnsatisfiedModifiers(transitions);
    final Set<String> satisfiedBefore = <String>{
      for (final GlobalShortcutBinding binding in _bindings.values)
        if (_isModifierTriggerSatisfied(binding.trigger)) binding.sourceId,
    };
    if (heldCode != null) {
      _heldModifierCodes.add(heldCode);
    }
    if (releaseOnly) {
      return transitions;
    }
    for (final GlobalShortcutBinding binding in _bindings.values) {
      if (_pressed.containsKey(binding.sourceId)) {
        continue;
      }
      switch (binding.trigger) {
        case ModifierShortcutTrigger():
          if (!satisfiedBefore.contains(binding.sourceId) &&
              _isModifierTriggerSatisfied(binding.trigger)) {
            _press(binding, const _ModifierPress(), transitions);
          }
        case KeyShortcutTrigger(:final String code):
          if (code == event.code &&
              _modifiersMatch(binding.modifiers, event.modifiers)) {
            _press(binding, _KeyPress(event.keycode), transitions);
          }
        case MouseShortcutTrigger():
          break;
      }
    }
    return transitions;
  }

  List<GlobalShortcutTransition> handleMouse(
    GlobalShortcutMouseEvent event, {
    bool releaseOnly = false,
  }) {
    _reconcileModifiers(event.modifiers, null);
    final List<GlobalShortcutTransition> transitions =
        <GlobalShortcutTransition>[];
    _releaseUnsatisfiedModifiers(transitions);
    if (!event.down) {
      for (final MapEntry<String, _Press> entry in _pressed.entries.toList()) {
        final _Press press = entry.value;
        if (press is _MousePress && press.button == event.button) {
          _release(entry.key, transitions);
        }
      }
      return transitions;
    }
    if (releaseOnly) {
      return transitions;
    }
    for (final GlobalShortcutBinding binding in _bindings.values) {
      final GlobalShortcutTrigger trigger = binding.trigger;
      if (trigger is MouseShortcutTrigger &&
          trigger.button == event.button &&
          !_pressed.containsKey(binding.sourceId) &&
          _modifiersMatch(binding.modifiers, event.modifiers)) {
        _press(binding, _MousePress(event.button), transitions);
      }
    }
    return transitions;
  }

  List<GlobalShortcutTransition> releaseAll() {
    final List<GlobalShortcutTransition> transitions =
        <GlobalShortcutTransition>[];
    for (final String sourceId in _pressed.keys.toList()) {
      _release(sourceId, transitions);
    }
    _heldModifierCodes.clear();
    return transitions;
  }

  bool _modifiersMatch(
    Set<KeybindModifier> expected,
    Set<KeybindModifier> actual,
  ) =>
      expected.isEmpty ||
      (expected.length == actual.length && expected.containsAll(actual));

  void _press(
    GlobalShortcutBinding binding,
    _Press press,
    List<GlobalShortcutTransition> transitions,
  ) {
    _pressed[binding.sourceId] = press;
    transitions.add(
      GlobalShortcutTransition(
        sourceId: binding.sourceId,
        action: binding.action,
        phase: GlobalShortcutPhase.press,
      ),
    );
  }

  void _release(String sourceId, List<GlobalShortcutTransition> transitions) {
    _pressed.remove(sourceId);
    final GlobalShortcutBinding? binding = _bindings[sourceId];
    if (binding != null) {
      transitions.add(
        GlobalShortcutTransition(
          sourceId: sourceId,
          action: binding.action,
          phase: GlobalShortcutPhase.release,
        ),
      );
    }
  }

  void _reconcileModifiers(Set<KeybindModifier> active, String? pressingCode) {
    for (final MapEntry<KeybindModifier, (String, String)> entry
        in kModifierDomCodes.entries) {
      if (active.contains(entry.key)) {
        continue;
      }
      for (final String code in <String>[entry.value.$1, entry.value.$2]) {
        if (code != pressingCode) {
          _heldModifierCodes.remove(code);
        }
      }
    }
  }

  void _releaseUnsatisfiedModifiers(
    List<GlobalShortcutTransition> transitions,
  ) {
    for (final MapEntry<String, _Press> entry in _pressed.entries.toList()) {
      if (entry.value is! _ModifierPress) {
        continue;
      }
      final GlobalShortcutTrigger? trigger = _bindings[entry.key]?.trigger;
      if (trigger == null || !_isModifierTriggerSatisfied(trigger)) {
        _release(entry.key, transitions);
      }
    }
  }

  bool _isModifierTriggerSatisfied(GlobalShortcutTrigger trigger) {
    if (trigger is! ModifierShortcutTrigger) {
      return false;
    }
    return trigger.modifiers.every((KeybindModifier modifier) {
      final (String left, String right) = kModifierDomCodes[modifier]!;
      final bool leftHeld = _heldModifierCodes.contains(left);
      final bool rightHeld = _heldModifierCodes.contains(right);
      return trigger.bothSides ? leftHeld && rightHeld : leftHeld || rightHeld;
    });
  }
}
