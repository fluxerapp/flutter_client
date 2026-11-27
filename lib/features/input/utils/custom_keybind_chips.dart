import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo_format.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String _mouseButtonLabel(FluxerLocalizations l10n, int button) =>
    switch (button) {
      0 => l10n.keybindMouseButtonLeft,
      1 => l10n.keybindMouseButtonMiddle,
      2 => l10n.keybindMouseButtonRight,
      3 => l10n.keybindMouseButtonBack,
      4 => l10n.keybindMouseButtonForward,
      _ => l10n.keybindMouseButtonNumber(button),
    };

List<String> formatCustomKeybindChips(
  FluxerLocalizations l10n,
  KeybindCombo combo,
) {
  final int? mouseButton = combo.mouseButton;
  if (mouseButton == null) {
    return formatKeybindComboChips(combo);
  }
  return <String>[
    ...formatKeybindModifierChips(combo),
    _mouseButtonLabel(l10n, mouseButton),
  ];
}
