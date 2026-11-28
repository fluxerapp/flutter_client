import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo_format.dart';
import 'package:fluxer_app/features/input/domain/keybind_resolution.dart';
import 'package:fluxer_app/features/input/providers/keybind_preferences_provider.dart';

class KeybindMenuShortcut {
  const KeybindMenuShortcut({required this.label, this.activationKey});

  final String label;
  final String? activationKey;
}

Map<KeybindAction, KeybindMenuShortcut> watchKeybindMenuShortcuts(
  WidgetRef ref,
) {
  final KeybindPreferencesState preferences = ref.watch(
    keybindPreferencesProvider,
  );
  final List<DefaultKeybind> entries = resolveEffectiveKeybinds(
    defaults: buildDefaultKeybinds(),
    customKeybinds: preferences.customKeybinds,
    disableBuiltinKeybinds: preferences.disableBuiltinKeybinds,
  );
  final Map<KeybindAction, KeybindMenuShortcut> shortcuts =
      <KeybindAction, KeybindMenuShortcut>{};
  for (final DefaultKeybind entry in entries) {
    if (shortcuts.containsKey(entry.action) || entry.combo.key.isEmpty) {
      continue;
    }
    final String label = formatKeybindComboLabel(entry.combo);
    if (label.isEmpty) {
      continue;
    }
    shortcuts[entry.action] = KeybindMenuShortcut(
      label: label,
      activationKey: keybindComboActivationKey(entry.combo),
    );
  }
  return shortcuts;
}

String formatKeybindComboLabel(KeybindCombo combo) {
  final List<String> chips = formatKeybindComboChips(combo);
  return chips.join(isMacOsKeybindPlatform ? '' : '+');
}

String? keybindComboActivationKey(KeybindCombo combo) {
  if (combo.ctrlOrMeta ||
      combo.ctrl ||
      combo.meta ||
      combo.alt ||
      combo.shift ||
      combo.key.length != 1) {
    return null;
  }
  return combo.key;
}
