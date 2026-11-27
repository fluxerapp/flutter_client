import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/desktop/tray/desktop_tray.dart';
import 'package:fluxer_app/core/desktop/window/desktop_relaunch.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_picker.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_style.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

class VoiceScreenSharePickerPermissionPrompt extends ConsumerWidget {
  const VoiceScreenSharePickerPermissionPrompt({
    required this.access,
    super.key,
  });

  final ScreenSharePickerAccess access;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (access == ScreenSharePickerAccess.checking) {
      return VoiceScreenSharePickerState(
        leading: const FluxerLoadingSpinner(),
        body: l10n.voiceScreenSharePickerCheckingPermission,
      );
    }
    final String productName = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.productName),
    );
    final bool relaunch = access == ScreenSharePickerAccess.relaunchRequired;
    return VoiceScreenSharePickerState(
      leading: PhosphorIcon(
        PhosphorIconsRegular.monitor,
        size: kScreenSharePickerStateIconSize,
        color: context.colors.textSecondary,
      ),
      heading: relaunch
          ? l10n.voiceScreenSharePickerPermissionWaiting
          : l10n.voiceScreenSharePickerPermissionRequired,
      body: relaunch
          ? l10n.voiceScreenSharePickerPermissionRelaunchBody(productName)
          : l10n.voiceScreenSharePickerPermissionBody(productName),
      actions: <Widget>[
        FluxerButton.primary(
          label: l10n.systemPermissionSettingsOpenSettings,
          fitContent: true,
          onPressed: () =>
              unawaited(macPermissions.openSettings(MacPermissionKind.screen)),
        ),
        if (relaunch)
          FluxerButton.secondary(
            label: l10n.macPermissionRelaunchToApply,
            fitContent: true,
            onPressed: () =>
                unawaited(relaunchDesktopApp(quit: DesktopTray.quit)),
          ),
      ],
    );
  }
}
