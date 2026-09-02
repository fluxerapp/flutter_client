import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:permission_handler/permission_handler.dart';

class SystemPermissionSettingsPrompt {
  SystemPermissionSettingsPrompt._();

  static Future<void> show(
    BuildContext context, {
    required SystemPermissionKind kind,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String productName = ProviderScope.containerOf(
      context,
    ).read(instanceRuntimeConfigProvider).productName;
    return FluxerModal.show<void>(
      context,
      title: l10n.systemPermissionSettingsTitle,
      centered: true,
      builder: (BuildContext dialogContext, VoidCallback close) {
        final textStyles = dialogContext.textStyles;
        return Text(
          messageForKind(l10n, kind, productName: productName),
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
    SystemPermissionKind kind, {
    required String productName,
  }) {
    switch (kind) {
      case SystemPermissionKind.microphone:
        return l10n.systemPermissionMicrophoneMessage(productName);
      case SystemPermissionKind.camera:
        return l10n.systemPermissionCameraMessage(productName);
      case SystemPermissionKind.photos:
        return l10n.systemPermissionPhotosMessage(productName);
      case SystemPermissionKind.notifications:
        return l10n.systemPermissionNotificationsMessage(productName);
    }
  }
}
