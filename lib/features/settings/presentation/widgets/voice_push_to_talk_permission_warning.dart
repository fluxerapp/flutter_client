import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_labels.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_modal.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

class VoicePushToTalkPermissionWarning extends ConsumerWidget {
  const VoicePushToTalkPermissionWarning({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String permissionName = macPermissionName(
      l10n,
      MacPermissionKind.inputMonitoring,
    );
    final String productName = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.productName),
    );
    return FluxerWarningAlert(
      message: l10n.audioAndVideoPushToTalkPermissionLimited(
        productName,
        permissionName,
      ),
      actions: <Widget>[
        FluxerButton.primary(
          size: FluxerButtonSize.small,
          fitContent: true,
          label: l10n.audioAndVideoEnablePlatformPermission(permissionName),
          onPressed: () => unawaited(
            showMacPermissionModal(MacPermissionKind.inputMonitoring),
          ),
        ),
      ],
    );
  }
}
