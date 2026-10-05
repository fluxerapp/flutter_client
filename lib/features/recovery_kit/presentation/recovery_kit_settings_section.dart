import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/recovery_kit/domain/recovery_kit.dart';
import 'package:fluxer_app/features/recovery_kit/presentation/recovery_kit_sheet.dart';
import 'package:fluxer_app/features/recovery_kit/providers/recovery_kit_providers.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_subsection.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:fluxer_dart/export.dart';

bool isSudoCancellation(Object error) {
  if (error is! DioException || error.response?.statusCode != 403) {
    return false;
  }
  final Object? data = error.response?.data;
  return data is Map && data['code'] == 'SUDO_MODE_REQUIRED';
}

class RecoveryKitSettingsSubsection extends ConsumerStatefulWidget {
  const RecoveryKitSettingsSubsection({super.key});

  @override
  ConsumerState<RecoveryKitSettingsSubsection> createState() =>
      _RecoveryKitSettingsSubsectionState();
}

class _RecoveryKitSettingsSubsectionState
    extends ConsumerState<RecoveryKitSettingsSubsection> {
  bool _creating = false;

  Future<void> _create({required bool replacing}) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (replacing) {
      final bool? confirmed = await FluxerConfirmSheet.show(
        context,
        title: l10n.recoveryKitReplaceTitle,
        description: l10n.recoveryKitReplaceDescription,
        confirmLabel: l10n.recoveryKitCreateNew,
      );
      if (confirmed != true || !mounted) {
        return;
      }
    }
    setState(() => _creating = true);
    try {
      final RecoveryKit kit = await ref
          .read(pendingRecoveryKitProvider.notifier)
          .create(
            reason: replacing
                ? RecoveryKitReason.replaced
                : RecoveryKitReason.created,
          );
      if (mounted) {
        await RecoveryKitSheet.show(context, kit);
      }
    } on Exception catch (e) {
      if (isSudoCancellation(e)) {
        return;
      }
      talker.warning('[RecoveryKitSettings] Create failed: $e');
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.recoveryKitCreateFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    } finally {
      if (mounted) {
        setState(() => _creating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<RecoveryKitStatusResponse> status = ref.watch(
      recoveryKitStatusProvider,
    );
    final RecoveryKitStatusResponse? value = status.value;
    final bool hasKit = value?.hasRecoveryKit ?? false;
    final DateTime? createdAt = value?.createdAt;

    return FluxerSettingsSubsection(
      title: l10n.recoveryKitSectionTitle,
      description: l10n.recoveryKitSectionDescription,
      children: [
        if (value != null && !hasKit)
          FluxerWarningAlert(message: l10n.recoveryKitNone)
        else if (createdAt != null)
          Text(
            l10n.recoveryKitCreatedRelative(relativeTime(createdAt, l10n)),
            style: context.textStyles.bodySmall,
          ),
        FluxerButton.primary(
          onPressedAsync: value == null || _creating
              ? null
              : () => _create(replacing: hasKit),
          label: hasKit ? l10n.recoveryKitCreateNew : l10n.recoveryKitCreate,
          isLoading: _creating,
          size: FluxerButtonSize.small,
        ),
      ],
    );
  }
}
