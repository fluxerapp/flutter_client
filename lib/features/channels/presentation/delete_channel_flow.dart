import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_settings_tab.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

class DeleteChannelFlow {
  DeleteChannelFlow._();

  static Future<void> confirmAndDelete(
    BuildContext context,
    WidgetRef ref, {
    required Channel channel,
    VoidCallback? onDeleted,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String title = channelSettingsDeleteLabel(l10n, channel: channel);
    final String description = channel.isCategory
        ? l10n.channelSettingsDeleteCategoryConfirm(channel.name)
        : l10n.channelSettingsDeleteChannelConfirm(channel.name);
    final bool isMobile = isMobileLayout(context);
    final bool? confirmed = isMobile
        ? await FluxerConfirmSheet.show(
            context,
            title: title,
            description: description,
            confirmLabel: title,
            isDanger: true,
            onConfirm: () {},
          )
        : await FluxerConfirmModal.show(
            context,
            title: title,
            description: description,
            confirmLabel: title,
            isDanger: true,
            onConfirm: () {},
          );
    if (confirmed != true || !context.mounted) {
      return;
    }
    final toast = ref.read(toastProvider.notifier);
    try {
      await ref
          .read(fluxerClientProvider)
          .channels
          .deleteChannel(
            channelId: channel.id,
            body: const SudoVerificationSchema(),
          );
      if (!context.mounted) {
        return;
      }
      onDeleted?.call();
      if (context.mounted) {
        Navigator.of(context).maybePop();
      }
      toast.show(
        FluxerToast(message: title, variant: FluxerToastVariant.success),
      );
    } on Object {
      toast.show(
        const FluxerToast(
          message: 'Failed to delete channel',
          variant: FluxerToastVariant.danger,
        ),
      );
    }
  }
}
