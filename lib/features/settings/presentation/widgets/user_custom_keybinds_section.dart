import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/presentation/keybind_recorder.dart';
import 'package:fluxer_app/features/input/providers/keybind_preferences_provider.dart';
import 'package:fluxer_app/features/input/utils/keybind_action_labels.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Set<KeybindAction> _kUnassignableActions = <KeybindAction>{
  KeybindAction.dndStart,
  KeybindAction.dndMoveUp,
  KeybindAction.dndMoveDown,
  KeybindAction.dndDrop,
  KeybindAction.dndCancel,
};

List<KeybindAction> assignableKeybindActions() => KeybindAction.values
    .where((KeybindAction action) => !_kUnassignableActions.contains(action))
    .toList(growable: false);

class UserCustomKeybindsSection extends ConsumerWidget {
  const UserCustomKeybindsSection({required this.searchQuery, super.key});

  final String searchQuery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final KeybindPreferencesState preferences = ref.watch(
      keybindPreferencesProvider,
    );
    final KeybindPreferences notifier = ref.read(
      keybindPreferencesProvider.notifier,
    );
    final String query = searchQuery.trim().toLowerCase();
    final List<CustomKeybindEntry> entries = preferences.customKeybinds
        .where((CustomKeybindEntry entry) => !entry.isBuiltinDisableMarker)
        .where((CustomKeybindEntry entry) {
          if (query.isEmpty) {
            return true;
          }
          final KeybindAction? action = entry.resolvedAction;
          return action != null &&
              keybindActionLabel(l10n, action).toLowerCase().contains(query);
        })
        .toList(growable: false);
    final layout = context.layout;
    return FluxerSettingsSection(
      title: l10n.keybindsCustomSectionTitle,
      description: l10n.keybindsCustomSectionDescription,
      isFirst: true,
      children: [
        for (final CustomKeybindEntry entry in entries) ...[
          _CustomKeybindRow(entry: entry),
          SizedBox(height: layout.s3),
        ],
        Align(
          alignment: Alignment.centerLeft,
          child: FluxerButton.secondary(
            size: FluxerButtonSize.compact,
            fitContent: true,
            icon: PhosphorIconsBold.plus,
            label: l10n.keybindsAddKeybind,
            onPressed: () => unawaited(notifier.addCustomKeybind()),
          ),
        ),
        SizedBox(height: layout.s4),
        FluxerSettingsSwitchItem(
          label: l10n.keybindsDisableBuiltinLabel,
          description: l10n.keybindsDisableBuiltinDescription,
          value: preferences.disableBuiltinKeybinds,
          onChanged: (bool value) =>
              unawaited(notifier.setDisableBuiltinKeybinds(value: value)),
        ),
        FluxerSettingsSwitchItem(
          label: l10n.keybindsSyncAcrossDevicesLabel,
          description: l10n.keybindsSyncAcrossDevicesDescription,
          value: preferences.syncAcrossDevices,
          onChanged: (bool value) =>
              unawaited(notifier.setSyncAcrossDevices(value: value)),
        ),
      ],
    );
  }
}

class _CustomKeybindRow extends ConsumerWidget {
  const _CustomKeybindRow({required this.entry});

  final CustomKeybindEntry entry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final KeybindPreferences notifier = ref.read(
      keybindPreferencesProvider.notifier,
    );
    final layout = context.layout;
    final KeybindAction? action = entry.resolvedAction;
    return Container(
      padding: EdgeInsets.all(layout.s3),
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: layout.radiusMd,
      ),
      child: Wrap(
        spacing: layout.s3,
        runSpacing: layout.s2,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SizedBox(
            width: 240,
            child: FluxerSelect<KeybindAction>(
              value: action,
              hint: l10n.keybindsChooseAction,
              searchHint: l10n.keybindsSearchShortcuts,
              items: [
                for (final KeybindAction option in assignableKeybindActions())
                  FluxerSelectItem<KeybindAction>(
                    value: option,
                    label: keybindActionLabel(l10n, option),
                  ),
              ],
              onChanged: (KeybindAction value) => unawaited(
                notifier.updateCustomKeybind(
                  entry.copyWith(action: keybindActionId(value)),
                ),
              ),
            ),
          ),
          KeybindRecorder(
            combo: entry.combo,
            onChanged: (StoredKeybindCombo combo) => unawaited(
              notifier.updateCustomKeybind(entry.copyWith(combo: combo)),
            ),
          ),
          FluxerToggleSwitch(
            value: entry.enabled,
            onChanged: (bool value) => unawaited(
              notifier.updateCustomKeybind(entry.copyWith(enabled: value)),
            ),
          ),
          FluxerButton.ghost(
            size: FluxerButtonSize.compact,
            isSquare: true,
            icon: PhosphorIconsBold.trash,
            semanticLabel: l10n.keybindsRemoveKeybind,
            onPressed: () => unawaited(notifier.removeCustomKeybind(entry.id)),
          ),
        ],
      ),
    );
  }
}
