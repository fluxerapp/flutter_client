import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/editable_focus_behavior.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_section.dart';

const Set<KeybindAction> kHoldKeybindActions = <KeybindAction>{
  KeybindAction.voicePushToTalk,
  KeybindAction.voicePushToMute,
  KeybindAction.voicePushToTalkPriority,
  KeybindAction.voicePriorityVad,
};

bool _hasCommandModifier(StoredKeybindCombo combo) =>
    combo.ctrlOrMeta || combo.ctrl || combo.meta || combo.alt;

List<DefaultKeybind> resolveEffectiveKeybinds({
  required List<DefaultKeybind> defaults,
  required List<CustomKeybindEntry> customKeybinds,
  required bool disableBuiltinKeybinds,
}) {
  final Map<KeybindAction, DefaultKeybind> defaultsByAction =
      <KeybindAction, DefaultKeybind>{
        for (final DefaultKeybind entry in defaults) entry.action: entry,
      };
  final Set<KeybindAction> overridden = <KeybindAction>{};
  final List<DefaultKeybind> customEntries = <DefaultKeybind>[];
  for (final CustomKeybindEntry custom in customKeybinds) {
    final KeybindAction? action = custom.resolvedAction;
    if (action == null) {
      continue;
    }
    if (custom.isBuiltinDisableMarker) {
      overridden.add(action);
      continue;
    }
    if (!custom.isActive) {
      continue;
    }
    overridden.add(action);
    final DefaultKeybind? base = defaultsByAction[action];
    final bool hold = kHoldKeybindActions.contains(action);
    customEntries.add(
      DefaultKeybind(
        action: action,
        combo: custom.combo.toKeybindCombo(),
        section: base?.section ?? KeybindSection.misc,
        requiresKeyboardMode: base?.requiresKeyboardMode ?? false,
        requiresMessageFocus: base?.requiresMessageFocus ?? false,
        editableFocusBehavior: hold || _hasCommandModifier(custom.combo)
            ? EditableFocusBehavior.allow
            : base?.editableFocusBehavior,
        conflictPriority: (base?.conflictPriority ?? 0) + 1,
      ),
    );
  }
  return <DefaultKeybind>[
    ...customEntries,
    if (!disableBuiltinKeybinds)
      for (final DefaultKeybind entry in defaults)
        if (!overridden.contains(entry.action)) entry,
  ];
}
