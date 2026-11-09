import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/app_lock/app_lock_biometric_authenticator.dart';
import 'package:fluxer_app/core/app_lock/app_lock_controller.dart';
import 'package:fluxer_app/features/app_lock/presentation/app_lock_biometric_label.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/app_lock_sheet.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_configure_row.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class AppLockSettingsRow extends ConsumerStatefulWidget {
  const AppLockSettingsRow({super.key});

  @override
  ConsumerState<AppLockSettingsRow> createState() => _AppLockSettingsRowState();
}

class _AppLockSettingsRowState extends ConsumerState<AppLockSettingsRow> {
  late final Future<List<AppLockBiometricKind>> _kinds = ref
      .read(appLockControllerProvider.notifier)
      .availableBiometricKinds();

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FutureBuilder<List<AppLockBiometricKind>>(
      future: _kinds,
      builder:
          (
            BuildContext context,
            AsyncSnapshot<List<AppLockBiometricKind>> snapshot,
          ) {
            final String? biometricLabel = appLockBiometricLabel(
              l10n,
              snapshot.data ?? const <AppLockBiometricKind>[],
            );
            return FluxerSettingsConfigureRow(
              title: l10n.appLockSettingTitle,
              description: biometricLabel == null
                  ? l10n.appLockRowDescription
                  : l10n.appLockRowDescriptionWithBiometric(biometricLabel),
              configureLabel: l10n.appLockConfigure,
              onConfigure: () => showAppLockSheet(context),
            );
          },
    );
  }
}
