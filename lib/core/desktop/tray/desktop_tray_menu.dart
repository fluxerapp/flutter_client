import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/desktop/tray/desktop_tray_actions.dart';
import 'package:fluxer_app/core/desktop/tray/desktop_tray_state.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/profile/domain/presence_status_labels.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/status_change_sheet.dart';
import 'package:fluxer_app/features/profile/providers/user_status_service.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:tray_manager/tray_manager.dart';

Menu buildDesktopTrayMenu({
  required DesktopTrayMenuState state,
  required String visibilityLabel,
  required VoidCallback onToggleWindow,
  required DesktopTrayActions actions,
}) {
  final _MenuBuilder builder = _MenuBuilder();
  builder
    ..item(builder.root, visibilityLabel, onToggleWindow)
    ..accountSection(state, actions)
    ..voiceSection(state, actions)
    ..appSection(state, actions);
  return Menu(items: builder.root);
}

class _MenuBuilder {
  final List<MenuItem> root = <MenuItem>[];

  void item(
    List<MenuItem> target,
    String label,
    VoidCallback onClick, {
    bool? checked,
  }) {
    void onItemClick(MenuItem _) => _runMenuAction(onClick);
    target.add(
      checked == null
          ? MenuItem(label: label, onClick: onItemClick)
          : MenuItem.checkbox(
              label: label,
              checked: checked,
              onClick: onItemClick,
            ),
    );
  }

  List<MenuItem> submenu(String label) {
    final List<MenuItem> items = <MenuItem>[];
    root.add(
      MenuItem.submenu(
        label: label,
        submenu: Menu(items: items),
      ),
    );
    return items;
  }

  void separator(List<MenuItem> target) {
    target.add(MenuItem.separator());
  }

  void accountSection(DesktopTrayMenuState state, DesktopTrayActions actions) {
    if (!state.signedIn) {
      return;
    }
    final FluxerLocalizations l10n = state.l10n;
    item(root, l10n.desktopTrayOpenSettings, actions.openSettings);
    separator(root);
    final List<MenuItem> statusMenu = submenu(l10n.desktopTrayStatus);
    for (final PresenceStatus status in kSelectablePresenceStatuses) {
      final String value = status.json ?? 'online';
      item(
        statusMenu,
        presenceStatusLabel(value, l10n),
        () => actions.setStatus(status),
        checked: state.presenceStatus == value,
      );
    }
    if (state.accounts.isEmpty) {
      return;
    }
    final List<MenuItem> accountsMenu = submenu(l10n.desktopTrayAccounts);
    for (final DesktopTrayAccount account in state.accounts) {
      item(
        accountsMenu,
        account.label,
        () => unawaited(actions.switchAccount(account.userId)),
        checked: account.isCurrent,
      );
    }
    separator(accountsMenu);
    item(accountsMenu, l10n.accountManageTitle, actions.openAccountSwitcher);
  }

  void voiceSection(DesktopTrayMenuState state, DesktopTrayActions actions) {
    if (!state.inVoice) {
      return;
    }
    final FluxerLocalizations l10n = state.l10n;
    final String? channelLabel = state.voiceChannelLabel;
    separator(root);
    item(
      root,
      state.selfMute ? l10n.desktopTrayUnmuteMic : l10n.desktopTrayMuteMic,
      actions.toggleMute,
    );
    item(
      root,
      state.selfDeaf ? l10n.desktopTrayUndeafen : l10n.desktopTrayDeafen,
      actions.toggleDeafen,
    );
    item(
      root,
      channelLabel == null
          ? l10n.desktopTrayDisconnectVoice
          : l10n.desktopTrayDisconnectFrom(channelLabel),
      actions.disconnectVoice,
    );
  }

  void appSection(DesktopTrayMenuState state, DesktopTrayActions actions) {
    final FluxerLocalizations l10n = state.l10n;
    separator(root);
    if (state.updaterEnabled) {
      if (state.updateAvailable) {
        item(
          root,
          l10n.desktopTrayUpdateNow(state.productName),
          actions.applyUpdate,
        );
      }
      item(root, l10n.desktopTrayCheckForUpdates, actions.checkForUpdates);
    }
    item(
      root,
      l10n.desktopTrayCopyBuildInfo,
      () => unawaited(actions.copyBuildInfo()),
    );
    separator(root);
    item(
      root,
      l10n.desktopTrayRestart(state.productName),
      () => unawaited(actions.restart()),
    );
    item(root, l10n.desktopTrayQuit(state.productName), actions.quit);
  }
}

void _runMenuAction(VoidCallback action) {
  void run() {
    try {
      action();
    } on Object catch (error, stackTrace) {
      talker.error('[DesktopTray] Menu action failed', error, stackTrace);
    }
  }

  if (Platform.isLinux) {
    Timer(const Duration(milliseconds: 25), run);
  } else {
    Timer.run(run);
  }
}
