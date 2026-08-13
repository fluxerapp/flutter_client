import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/defaults_shortcut_display_kind.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';

List<String> formatKeybindComboChips(KeybindCombo combo) {
  final List<String> chips = <String>[];
  final bool isMacOS = isMacOsKeybindPlatform;

  if (combo.ctrlOrMeta) {
    chips.add(isMacOS ? '⌘' : 'Ctrl');
  } else {
    if (combo.ctrl) {
      chips.add('Ctrl');
    }
    if (combo.meta) {
      chips.add('⌘');
    }
  }
  if (combo.alt) {
    chips.add(isMacOS ? '⌥' : 'Alt');
  }
  if (combo.shift) {
    chips.add(isMacOS ? '⇧' : 'Shift');
  }

  final String keyLabel = _formatKeyLabel(combo.key);
  if (keyLabel.isNotEmpty) {
    chips.add(keyLabel);
  }
  return chips;
}

List<String> formatDefaultKeybindChips({
  required KeybindCombo combo,
  required DefaultsShortcutDisplayKind displayKind,
}) {
  switch (displayKind) {
    case DefaultsShortcutDisplayKind.anyKey:
      return const <String>['ANY KEY'];
    case DefaultsShortcutDisplayKind.spaceOrEnter:
      return const <String>['Space', 'Enter'];
    case DefaultsShortcutDisplayKind.normal:
      return formatKeybindComboChips(combo);
  }
}

String _formatKeyLabel(String key) {
  switch (key) {
    case ' ':
      return 'Space';
    case 'ArrowUp':
      return '↑';
    case 'ArrowDown':
      return '↓';
    case 'ArrowLeft':
      return '←';
    case 'ArrowRight':
      return '→';
    case 'PageUp':
      return 'PgUp';
    case 'PageDown':
      return 'PgDn';
    case 'Backspace':
      return '⌫';
    case 'Enter':
      return 'Enter';
    case 'Escape':
      return 'Esc';
    case 'Tab':
      return 'Tab';
    case '/':
      return '/';
    case ',':
      return ',';
    case '[':
      return '[';
    case ']':
      return ']';
    case '=':
      return '=';
    case '-':
      return '-';
    case '`':
      return '`';
    case '+':
      return '+';
    default:
      if (key.length == 1) {
        return key.toUpperCase();
      }
      return key;
  }
}
