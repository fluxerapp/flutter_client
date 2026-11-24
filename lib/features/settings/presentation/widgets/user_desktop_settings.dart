import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/autostart/desktop_autostart.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/preferences/desktop_behavior_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class UserDesktopSettings extends ConsumerStatefulWidget {
  const UserDesktopSettings({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<UserDesktopSettings> createState() =>
      _UserDesktopSettingsState();
}

class _UserDesktopSettingsState extends ConsumerState<UserDesktopSettings> {
  bool _autostartEnabled = false;
  bool _autostartBusy = true;

  @override
  void initState() {
    super.initState();
    unawaited(_loadAutostart());
  }

  Future<void> _loadAutostart() async {
    final bool enabled = await DesktopAutostart.isEnabled();
    if (!mounted) {
      return;
    }
    setState(() {
      _autostartEnabled = enabled;
      _autostartBusy = false;
    });
  }

  Future<void> _setAutostart(bool value) async {
    setState(() => _autostartBusy = true);
    final bool enabled = await DesktopAutostart.setEnabled(enabled: value);
    if (!mounted) {
      return;
    }
    setState(() {
      _autostartEnabled = enabled;
      _autostartBusy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final DesktopBehaviorPreferencesState preferences = ref.watch(
      desktopBehaviorPreferencesProvider,
    );
    final DesktopBehaviorPreferences notifier = ref.read(
      desktopBehaviorPreferencesProvider.notifier,
    );
    final bool isMac = Platform.isMacOS;
    final bool isWindows = Platform.isWindows;
    final bool isLinux = Platform.isLinux;

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            title: l10n.desktopSettingsWindowSectionTitle,
            isFirst: true,
            children: [
              if (DesktopAutostart.isSupported)
                FluxerSettingsSwitchItem(
                  label: l10n.desktopSettingsLaunchAtLogin,
                  value: _autostartEnabled,
                  enabled: !_autostartBusy,
                  onChanged: (value) => unawaited(_setAutostart(value)),
                ),
              if (DesktopAutostart.isSupported)
                FluxerSettingsSwitchItem(
                  label: l10n.desktopSettingsStartMinimized,
                  description: isMac
                      ? l10n.desktopSettingsStartMinimizedMenuBarDescription
                      : l10n.desktopSettingsStartMinimizedTrayDescription,
                  value: preferences.storedStartMinimized,
                  enabled: _autostartEnabled && preferences.showTrayIcon,
                  onChanged: (value) =>
                      unawaited(notifier.setStartMinimized(value: value)),
                ),
              FluxerSettingsSwitchItem(
                label: l10n.desktopSettingsRememberWindowState,
                value: preferences.rememberWindowState,
                onChanged: (value) =>
                    unawaited(notifier.setRememberWindowState(value: value)),
              ),
              FluxerSettingsSwitchItem(
                label: isMac
                    ? l10n.desktopSettingsShowMenuBarIcon
                    : l10n.desktopSettingsShowTrayIcon,
                value: preferences.showTrayIcon,
                onChanged: (value) => notifier.setShowTrayIcon(value: value),
              ),
              if (!isMac)
                FluxerSettingsSwitchItem(
                  label: l10n.desktopSettingsColoredTrayIcon,
                  description: l10n.desktopSettingsColoredTrayIconDescription,
                  value: preferences.coloredTrayIcon,
                  enabled: preferences.showTrayIcon,
                  onChanged: (value) =>
                      unawaited(notifier.setColoredTrayIcon(value: value)),
                ),
              if (isLinux)
                FluxerSettingsSwitchItem(
                  label: l10n.desktopSettingsUnreadLauncherBadge,
                  description:
                      l10n.desktopSettingsUnreadLauncherBadgeDescription,
                  value: preferences.unreadLauncherBadge,
                  onChanged: (value) =>
                      unawaited(notifier.setUnreadLauncherBadge(value: value)),
                ),
              if (isWindows)
                FluxerSettingsSwitchItem(
                  label: l10n.desktopSettingsDarkTaskbarBadge,
                  description: l10n.desktopSettingsDarkTaskbarBadgeDescription,
                  value: preferences.darkTaskbarBadge,
                  onChanged: (value) =>
                      unawaited(notifier.setDarkTaskbarBadge(value: value)),
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
              if (!isMac)
                FluxerSettingsSwitchItem(
                  label: l10n.desktopSettingsUseNativeTitleBar,
                  description: l10n.desktopSettingsRestartRequiredDescription,
                  value: preferences.useNativeTitleBar,
                  onChanged: (value) =>
                      unawaited(notifier.setUseNativeTitleBar(value: value)),
                ),
            ],
          ),
          if (!isMac)
            FluxerSettingsSection(
              title: l10n.desktopSettingsTrayIconColorTitle,
              description: preferences.coloredTrayIcon
                  ? l10n.desktopSettingsTrayIconColorColoredNotice
                  : null,
              children: [
                FluxerRadioGroup<MonochromeTrayIconTone>(
                  value: preferences.monochromeTrayIconTone,
                  onChanged: (value) =>
                      unawaited(notifier.setMonochromeTrayIconTone(value)),
                  items: [
                    FluxerRadioItem(
                      value: MonochromeTrayIconTone.auto,
                      label: l10n.desktopSettingsTrayIconColorAuto,
                      description:
                          l10n.desktopSettingsTrayIconColorAutoDescription,
                      enabled:
                          preferences.showTrayIcon &&
                          !preferences.coloredTrayIcon,
                    ),
                    FluxerRadioItem(
                      value: MonochromeTrayIconTone.white,
                      label: l10n.desktopSettingsTrayIconColorWhite,
                      enabled:
                          preferences.showTrayIcon &&
                          !preferences.coloredTrayIcon,
                    ),
                    FluxerRadioItem(
                      value: MonochromeTrayIconTone.black,
                      label: l10n.desktopSettingsTrayIconColorBlack,
                      enabled:
                          preferences.showTrayIcon &&
                          !preferences.coloredTrayIcon,
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
