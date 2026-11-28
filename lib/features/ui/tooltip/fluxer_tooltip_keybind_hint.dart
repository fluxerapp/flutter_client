import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo_format.dart';
import 'package:fluxer_app/features/input/domain/keybind_resolution.dart';
import 'package:fluxer_app/features/input/providers/keybind_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/keybind_hint/fluxer_keybind_hint.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class FluxerTooltipKeybindHint extends ConsumerWidget {
  const FluxerTooltipKeybindHint({this.action, this.combo, super.key});

  final KeybindAction? action;
  final KeybindCombo? combo;

  static const double gap = 6;

  KeybindCombo? _resolveCombo(WidgetRef ref) {
    final KeybindCombo? explicit = combo;
    if (explicit != null) {
      return explicit;
    }
    final KeybindAction? target = action;
    if (target == null) {
      return null;
    }
    final KeybindPreferencesState preferences = ref.watch(
      keybindPreferencesProvider,
    );
    final List<DefaultKeybind> entries = resolveEffectiveKeybinds(
      defaults: buildDefaultKeybinds(),
      customKeybinds: preferences.customKeybinds,
      disableBuiltinKeybinds: preferences.disableBuiltinKeybinds,
    );
    for (final DefaultKeybind entry in entries) {
      if (entry.action == target) {
        return entry.combo;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hidden = ref.watch(
      appearancePreferencesProvider.select(
        (AppearancePreferencesState state) => state.hideKeyboardHints,
      ),
    );
    final KeybindCombo? resolved = hidden || !usesDesktopPointerUi(context)
        ? null
        : _resolveCombo(ref);
    if (resolved == null || resolved.key.isEmpty) {
      return const SizedBox.shrink();
    }
    final List<String> keys = formatKeybindComboChips(resolved);
    if (keys.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: gap),
      child: FluxerKeybindHint(keys: keys),
    );
  }
}

class FluxerTooltipWithKeybind extends StatelessWidget {
  const FluxerTooltipWithKeybind({
    required this.label,
    this.action,
    this.combo,
    super.key,
  });

  final String label;
  final KeybindAction? action;
  final KeybindCombo? combo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(label, textAlign: TextAlign.center),
        FluxerTooltipKeybindHint(action: action, combo: combo),
      ],
    );
  }
}
