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

const int _statusRadioGroup = 1;
const int _accountRadioGroup = 2;

class DesktopTrayMenu {
  DesktopTrayMenu._(this.menu, this.visibilityItem, this._disposers);

  final Menu menu;
  final MenuItem? visibilityItem;
  final List<VoidCallback> _disposers;

  void disposeLater() {
    Timer.run(() {
      for (final VoidCallback dispose in _disposers) {
        dispose();
      }
    });
  }

  static DesktopTrayMenu? build({
    required DesktopTrayMenuState state,
    required String visibilityLabel,
    required VoidCallback onToggleWindow,
    required DesktopTrayActions actions,
  }) {
    final Menu? menu = Menu.create();
    if (menu == null) {
      return null;
    }
    final _MenuBuilder builder = _MenuBuilder(menu);
    final MenuItem? visibilityItem = builder.item(
      menu,
      visibilityLabel,
      onToggleWindow,
    );
    builder
      ..accountSection(state, actions)
      ..voiceSection(state, actions)
      ..appSection(state, actions);
    return DesktopTrayMenu._(menu, visibilityItem, builder.disposers);
  }
}

class _MenuBuilder {
  _MenuBuilder(this.root) : disposers = <VoidCallback>[root.dispose];

  final Menu root;
  final List<VoidCallback> disposers;

  MenuItem? item(
    Menu target,
    String label,
    VoidCallback onClick, {
    int? radioGroup,
    bool checked = false,
  }) {
    final MenuItem? item = MenuItem.createWithLabelAndType(
      label,
      radioGroup == null ? MenuItemType.normal : MenuItemType.radio,
    );
    if (item == null) {
      return null;
    }
    if (radioGroup != null) {
      item
        ..radioGroup = radioGroup
        ..state = checked ? MenuItemState.checked : MenuItemState.unchecked;
    }
    item.addListener((MenuEvent event) {
      if (event is MenuItemClickedEvent) {
        _runMenuAction(onClick);
      }
    });
    target.addItem(item);
    disposers.add(item.dispose);
    return item;
  }

  Menu? submenu(String label) {
    final Menu? submenu = Menu.create();
    final MenuItem? item = MenuItem.createWithLabelAndType(
      label,
      MenuItemType.submenu,
    );
    if (submenu == null || item == null) {
      submenu?.dispose();
      item?.dispose();
      return null;
    }
    item.submenu = submenu;
    root.addItem(item);
    disposers
      ..add(item.dispose)
      ..add(submenu.dispose);
    return submenu;
  }

  void accountSection(DesktopTrayMenuState state, DesktopTrayActions actions) {
    if (!state.signedIn) {
      return;
    }
    final FluxerLocalizations l10n = state.l10n;
    item(root, l10n.desktopTrayOpenSettings, actions.openSettings);
    root.addSeparator();
    final Menu? statusMenu = submenu(l10n.desktopTrayStatus);
    if (statusMenu != null) {
      for (final PresenceStatus status in kSelectablePresenceStatuses) {
        final String value = status.json ?? 'online';
        item(
          statusMenu,
          presenceStatusLabel(value, l10n),
          () => actions.setStatus(status),
          radioGroup: _statusRadioGroup,
          checked: state.presenceStatus == value,
        );
      }
    }
    if (state.accounts.isEmpty) {
      return;
    }
    final Menu? accountsMenu = submenu(l10n.desktopTrayAccounts);
    if (accountsMenu == null) {
      return;
    }
    for (final DesktopTrayAccount account in state.accounts) {
      item(
        accountsMenu,
        account.label,
        () => unawaited(actions.switchAccount(account.userId)),
        radioGroup: _accountRadioGroup,
        checked: account.isCurrent,
      );
    }
    accountsMenu.addSeparator();
    item(accountsMenu, l10n.accountManageTitle, actions.openAccountSwitcher);
  }

  void voiceSection(DesktopTrayMenuState state, DesktopTrayActions actions) {
    if (!state.inVoice) {
      return;
    }
    final FluxerLocalizations l10n = state.l10n;
    final String? channelLabel = state.voiceChannelLabel;
    root.addSeparator();
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
    root.addSeparator();
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
    root.addSeparator();
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
