import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_settings.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_modal.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal_slot.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

enum MediaPermissionBlockedKind { microphone, camera, screen }

final FluxerModalSlot _blockedModalSlot = FluxerModalSlot();

Future<bool> handleMediaPermissionBlocked(
  MediaPermissionBlockedKind kind,
) async {
  if (macPermissions.isSupported) {
    final MacPermissionKind macKind = switch (kind) {
      MediaPermissionBlockedKind.microphone => MacPermissionKind.microphone,
      MediaPermissionBlockedKind.camera => MacPermissionKind.camera,
      MediaPermissionBlockedKind.screen => MacPermissionKind.screen,
    };
    final MacPermissionStatus status = await macPermissions.refreshKind(
      macKind,
    );
    if (status == MacPermissionStatus.granted) {
      return false;
    }
    unawaited(showMacPermissionModal(macKind));
    return true;
  }
  if (defaultTargetPlatform != TargetPlatform.windows &&
      defaultTargetPlatform != TargetPlatform.linux) {
    return false;
  }
  final BuildContext? context = rootNavigatorKey.currentContext;
  if (context == null || !context.mounted) {
    return false;
  }
  unawaited(
    _blockedModalSlot.show(
      () => showMediaPermissionBlockedModal(context, kind: kind),
    ),
  );
  return true;
}

Future<void> showMediaPermissionBlockedModal(
  BuildContext context, {
  required MediaPermissionBlockedKind kind,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String productName = ProviderScope.containerOf(
    context,
    listen: false,
  ).read(instanceRuntimeConfigProvider).productName;
  final SystemPermissionKind? settingsKind =
      defaultTargetPlatform == TargetPlatform.windows
      ? switch (kind) {
          MediaPermissionBlockedKind.microphone =>
            SystemPermissionKind.microphone,
          MediaPermissionBlockedKind.camera => SystemPermissionKind.camera,
          MediaPermissionBlockedKind.screen => null,
        }
      : null;
  return FluxerModal.show<void>(
    context,
    useRootNavigator: true,
    centered: true,
    title: switch (kind) {
      MediaPermissionBlockedKind.microphone =>
        l10n.mediaPermissionBlockedMicrophoneTitle,
      MediaPermissionBlockedKind.camera =>
        l10n.mediaPermissionBlockedCameraTitle,
      MediaPermissionBlockedKind.screen =>
        l10n.mediaPermissionBlockedScreenTitle,
    },
    builder: (BuildContext dialogContext, VoidCallback close) =>
        FluxerModalSlotScope(
          slot: _blockedModalSlot,
          child: Text(switch (kind) {
            MediaPermissionBlockedKind.microphone =>
              l10n.mediaPermissionBlockedMicrophoneBody(productName),
            MediaPermissionBlockedKind.camera =>
              l10n.mediaPermissionBlockedCameraBody(productName),
            MediaPermissionBlockedKind.screen =>
              l10n.mediaPermissionBlockedScreenBody(productName),
          }, style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4)),
        ),
    actionsBuilder: (void Function([void]) pop) => <Widget>[
      if (settingsKind != null) ...<Widget>[
        FluxerButton.primary(
          label: l10n.systemPermissionSettingsOpenSettings,
          onPressed: () {
            unawaited(openSystemPermissionSettings(settingsKind));
            pop();
          },
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(label: l10n.cancel, onPressed: () => pop()),
      ] else
        FluxerButton.primary(label: l10n.okay, onPressed: () => pop()),
    ],
  );
}
