import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/preferences/desktop_behavior_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class UserDesktopSettings extends ConsumerWidget {
  const UserDesktopSettings({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final DesktopBehaviorPreferencesState preferences = ref.watch(
      desktopBehaviorPreferencesProvider,
    );
    final DesktopBehaviorPreferences notifier = ref.read(
      desktopBehaviorPreferencesProvider.notifier,
    );
    final bool isMac = Platform.isMacOS;

    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            title: l10n.desktopSettingsWindowSectionTitle,
            isFirst: true,
            children: [
              FluxerSettingsSwitchItem(
                label: isMac
                    ? l10n.desktopSettingsShowMenuBarIcon
                    : l10n.desktopSettingsShowTrayIcon,
                value: preferences.showTrayIcon,
                onChanged: (value) => notifier.setShowTrayIcon(value: value),
              ),
              FluxerSettingsSwitchItem(
                label: isMac
                    ? l10n.desktopSettingsMinimizeToMenuBar
                    : l10n.desktopSettingsMinimizeToTray,
                value: preferences.minimizeToTray,
                enabled: preferences.showTrayIcon,
                onChanged: (value) => notifier.setMinimizeToTray(value: value),
              ),
              FluxerSettingsSwitchItem(
                label: isMac
                    ? l10n.desktopSettingsCloseToMenuBar
                    : l10n.desktopSettingsCloseToTray,
                value: preferences.closeToTray,
                enabled: preferences.showTrayIcon,
                onChanged: (value) => notifier.setCloseToTray(value: value),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
