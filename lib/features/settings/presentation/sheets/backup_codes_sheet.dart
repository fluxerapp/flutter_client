import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BackupCodesSheet extends ConsumerStatefulWidget {
  const BackupCodesSheet({required this.codes, super.key});

  final List<MfaBackupCodesResponseBackupCodes> codes;

  static Future<void> showWithCodes(
    BuildContext context,
    WidgetRef ref, {
    required List<MfaBackupCodesResponseBackupCodes> codes,
  }) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).backupCodesTitle,
      useRootNavigator: true,
      builder: (_, _) => BackupCodesSheet(codes: codes),
    );
  }

  static Future<void> showView(BuildContext context, WidgetRef ref) async {
    try {
      final client = ref.read(fluxerClientProvider);
      final response = await client.users.getBackupCodesMfa(
        body: const MfaBackupCodesRequest(regenerate: false),
      );

      if (context.mounted) {
        await showWithCodes(context, ref, codes: response.backupCodes);
      }
    } on DioException {
      // TODO(M0n7y5): Show error toast.
    }
  }

  @override
  ConsumerState<BackupCodesSheet> createState() => _BackupCodesSheetState();
}

class _BackupCodesSheetState extends ConsumerState<BackupCodesSheet> {
  bool _acknowledged = false;

  void _copyToClipboard() {
    final codesText = widget.codes.map((c) => c.code).join('\n');
    unawaited(Clipboard.setData(ClipboardData(text: codesText)));

    final l10n = FluxerLocalizations.of(context);
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.backupCodesCopied,
            variant: FluxerToastVariant.success,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FluxerWarningAlert(
            variant: FluxerAlertVariant.danger,
            message: l10n.backupCodesWarning,
          ),
          const SizedBox(height: 20),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.codes.map((code) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: colors.backgroundSecondaryAlt,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  code.code,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w500,
                    color: code.consumed
                        ? colors.textPrimaryMuted
                        : colors.textPrimary,
                    decoration: code.consumed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              FluxerButton.secondary(
                onPressed: _copyToClipboard,
                label: l10n.backupCodesCopy,
                icon: PhosphorIconsRegular.clipboardText,
                size: FluxerButtonSize.small,
                fitContent: true,
              ),
            ],
          ),
          const SizedBox(height: 24),

          FluxerCheckbox(
            value: _acknowledged,
            onChanged: (v) => setState(() => _acknowledged = v ?? false),
            label: l10n.backupCodesAcknowledge,
          ),
          SizedBox(height: layout.s4),

          FluxerButton.primary(
            onPressed: _acknowledged ? () => Navigator.of(context).pop() : null,
            label: l10n.backupCodesDone,
          ),
        ],
      ),
    );
  }
}
