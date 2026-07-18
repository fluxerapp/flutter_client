import 'package:flutter/material.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

class SystemPermissionSettingsPrompt {
  SystemPermissionSettingsPrompt._();

  static Future<void> show(
    BuildContext context, {
    required SystemPermissionKind kind,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerModal.show<void>(
      context,
      title: l10n.systemPermissionSettingsTitle,
      centered: true,
      builder: (BuildContext dialogContext, VoidCallback close) {
        final textStyles = dialogContext.textStyles;
        return Text(
          messageForKind(l10n, kind),
          style: textStyles.bodySmall.copyWith(height: 1.4),
          textAlign: TextAlign.center,
        );
      },
      actionsBuilder: (void Function([void]) pop) => <Widget>[
        FluxerButton.primary(
          onPressed: () async {
            await openAppSettings();
            pop();
          },
          label: l10n.systemPermissionSettingsOpenSettings,
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(onPressed: () => pop(), label: l10n.cancel),
      ],
    );
  }

  static String messageForKind(
    FluxerLocalizations l10n,
    SystemPermissionKind kind,
  ) {
    switch (kind) {
      case SystemPermissionKind.microphone:
        return l10n.systemPermissionMicrophoneMessage;
      case SystemPermissionKind.camera:
        return l10n.systemPermissionCameraMessage;
      case SystemPermissionKind.notifications:
        return l10n.systemPermissionNotificationsMessage;
    }
  }
}
