import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class UserAccessibilityKeyboardSection extends ConsumerWidget {
  const UserAccessibilityKeyboardSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final appearance = ref.watch(appearancePreferencesProvider);
    final appearanceNotifier = ref.read(appearancePreferencesProvider.notifier);

    return FluxerSettingsSection(
      sectionId: 'keyboard',
      title: l10n.accessibilityKeyboardGroupTitle,
      children: [
        FluxerSettingsSwitchGroup(
          children: [
            FluxerSettingsSwitchItem.grouped(
              label: l10n.accessibilityShowTextareaFocusRingLabel,
              value: appearance.showTextareaFocusRing,
              onChanged: (value) => unawaited(
                appearanceNotifier.setShowTextareaFocusRing(value: value),
              ),
            ),
            FluxerSettingsSwitchItem.grouped(
              label: l10n.accessibilityEscapeExitsKeyboardModeLabel,
              value: appearance.escapeExitsKeyboardMode,
              onChanged: (value) => unawaited(
                appearanceNotifier.setEscapeExitsKeyboardMode(value: value),
              ),
            ),
            FluxerSettingsSwitchItem.grouped(
              label: l10n.accessibilityShowContextMenuShortcutsLabel,
              value: appearance.showContextMenuShortcuts,
              onChanged: (value) => unawaited(
                appearanceNotifier.setShowContextMenuShortcuts(value: value),
              ),
            ),
            FluxerSettingsSwitchItem.grouped(
              label: l10n.accessibilityConfirmBeforeStartingCallsLabel,
              value: appearance.confirmBeforeStartingCalls,
              onChanged: (value) => unawaited(
                appearanceNotifier.setConfirmBeforeStartingCalls(value: value),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
