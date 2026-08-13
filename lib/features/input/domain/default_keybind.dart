import 'package:fluxer_app/features/input/domain/defaults_shortcut_display_kind.dart';
import 'package:fluxer_app/features/input/domain/editable_focus_behavior.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_section.dart';

class DefaultKeybind {
  const DefaultKeybind({
    required this.action,
    required this.combo,
    required this.section,
    this.requiresKeyboardMode = false,
    this.requiresMessageFocus = false,
    this.informationalOnly = false,
    this.hideFromDefaults = false,
    this.defaultsShortcutDisplayKind = DefaultsShortcutDisplayKind.normal,
    this.editableFocusBehavior,
    this.conflictPriority = 0,
  });

  final KeybindAction action;
  final KeybindCombo combo;
  final KeybindSection section;
  final bool requiresKeyboardMode;
  final bool requiresMessageFocus;
  final bool informationalOnly;
  final bool hideFromDefaults;
  final DefaultsShortcutDisplayKind defaultsShortcutDisplayKind;
  final EditableFocusBehavior? editableFocusBehavior;
  final int conflictPriority;
}
