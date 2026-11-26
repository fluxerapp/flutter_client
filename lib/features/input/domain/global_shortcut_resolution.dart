import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_binding.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';

const Set<KeybindAction> kGlobalKeybindActions = <KeybindAction>{
  KeybindAction.voiceToggleMute,
  KeybindAction.voiceToggleDeafen,
  KeybindAction.voicePushToTalk,
  KeybindAction.voicePushToTalkPriority,
  KeybindAction.voicePushToMute,
  KeybindAction.voicePriorityVad,
  KeybindAction.voiceToggleVad,
  KeybindAction.voiceToggleVideo,
  KeybindAction.voiceDisconnect,
};

const Set<KeybindAction> kGlobalDefaultKeybindActions = <KeybindAction>{
  KeybindAction.voiceToggleMute,
  KeybindAction.voiceToggleDeafen,
};

bool isGlobalCustomKeybind(CustomKeybindEntry entry) {
  final KeybindAction? action = entry.resolvedAction;
  return action != null &&
      kGlobalKeybindActions.contains(action) &&
      (entry.combo.global ?? true);
}

List<GlobalShortcutBinding> resolveGlobalShortcutBindings({
  required List<DefaultKeybind> defaults,
  required List<CustomKeybindEntry> customKeybinds,
  required bool disableBuiltinKeybinds,
  required bool isMacOS,
}) {
  final Set<KeybindAction> overridden = <KeybindAction>{};
  final List<GlobalShortcutBinding> bindings = <GlobalShortcutBinding>[];

  void add(GlobalShortcutBinding? binding) {
    if (binding != null && !bindings.any(binding.hasSameCombo)) {
      bindings.add(binding);
    }
  }

  for (final CustomKeybindEntry entry in customKeybinds) {
    final KeybindAction? action = entry.resolvedAction;
    if (action == null) {
      continue;
    }
    if (entry.isBuiltinDisableMarker) {
      overridden.add(action);
      continue;
    }
    if (!entry.isActive) {
      continue;
    }
    overridden.add(action);
    if (isGlobalCustomKeybind(entry)) {
      add(
        GlobalShortcutBinding.fromStored(
          sourceId: entry.id,
          action: action,
          combo: entry.combo,
          isMacOS: isMacOS,
        ),
      );
    }
  }
  if (disableBuiltinKeybinds) {
    return bindings;
  }
  for (final DefaultKeybind entry in defaults) {
    if (kGlobalDefaultKeybindActions.contains(entry.action) &&
        !overridden.contains(entry.action)) {
      add(
        GlobalShortcutBinding.fromCombo(
          sourceId: 'default:${entry.action.name}',
          action: entry.action,
          combo: entry.combo,
          isMacOS: isMacOS,
        ),
      );
    }
  }
  return bindings;
}
