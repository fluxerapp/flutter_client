import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/build/app_diagnostic_clipboard_text.dart';
import 'package:fluxer_app/core/desktop/updater/oxygen_update_provider.dart';
import 'package:fluxer_app/core/desktop/window/desktop_relaunch.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/account_switcher_sheet.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_status_service.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';

class DesktopTrayActions {
  DesktopTrayActions(
    this._container, {
    required this.showWindow,
    required this.quit,
  });

  final ProviderContainer _container;
  final VoidCallback showWindow;
  final VoidCallback quit;

  void openSettings() {
    final BuildContext? context = _shownRootContext();
    if (context != null) {
      unawaited(UserSettingsModal.show(context));
    }
  }

  void openAccountSwitcher() {
    final BuildContext? context = _shownRootContext();
    if (context != null) {
      unawaited(AccountSwitcherSheet.show(context));
    }
  }

  void setStatus(PresenceStatus status) {
    unawaited(
      _container
          .read(userStatusServiceProvider)
          .setPresenceStatus(status: status)
          .catchError((Object error) {
            talker.warning('[DesktopTray] Failed to set status: $error');
          }),
    );
  }

  Future<void> switchAccount(String userId) async {
    showWindow();
    if (userId == _container.read(currentUserIdProvider)) {
      return;
    }
    try {
      await _container
          .read(accountManagerProvider.notifier)
          .switchToAccount(userId, ignoreIfPending: true);
    } on Object catch (error) {
      talker.warning('[DesktopTray] Account switch failed: $error');
      openAccountSwitcher();
    }
  }

  void toggleMute() {
    unawaited(_container.read(voiceSessionProvider.notifier).toggleSelfMute());
  }

  void toggleDeafen() {
    unawaited(
      _container.read(voiceSessionProvider.notifier).toggleSelfDeafen(),
    );
  }

  void disconnectVoice() {
    unawaited(_container.read(voiceSessionProvider.notifier).leaveVoice());
  }

  void applyUpdate() {
    unawaited(_container.read(oxygenUpdateProvider.notifier).applyUpdate());
  }

  void checkForUpdates() {
    unawaited(
      _container
          .read(oxygenUpdateProvider.notifier)
          .checkForUpdates(force: true),
    );
  }

  Future<void> copyBuildInfo() async {
    try {
      final AppRuntimeInfo info = await _container.read(
        appRuntimeInfoProvider.future,
      );
      await Clipboard.setData(
        ClipboardData(text: formatAppDiagnosticClipboardText(info)),
      );
    } on Object catch (error) {
      talker.warning('[DesktopTray] Failed to copy build info: $error');
    }
  }

  Future<void> restart() => relaunchDesktopApp(quit: quit);

  BuildContext? _shownRootContext() {
    showWindow();
    final BuildContext? context = rootNavigatorKey.currentContext;
    if (context == null || !context.mounted) {
      return null;
    }
    return context;
  }
}
