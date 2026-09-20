import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/guilds/utils/leave_guild_action.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

class DeleteCommunityFlow {
  DeleteCommunityFlow._();

  static Future<void> confirmAndDelete(
    BuildContext context,
    WidgetRef ref, {
    required String guildId,
  }) async {
    if (ref
        .read(instanceRuntimeConfigProvider)
        .isStockCommunityGuild(guildId)) {
      talker.info('[Guild] Delete skipped for stock community guild');
      return;
    }

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String title = l10n.guildSettingsDeleteCommunity;
    final String description = l10n.guildSettingsDeleteCommunityConfirm;
    final bool? confirmed = isMobileLayout(context)
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
      await deleteGuildAndCleanup(ref, guildId);
    } on Object catch (error, stack) {
      talker.error('[Guild] Failed to delete community', error, stack);
      toast.show(
        FluxerToast(
          message: userFacingErrorMessage(
            error,
            l10n.guildSettingsDeleteCommunityFailed,
          ),
          variant: FluxerToastVariant.danger,
        ),
      );
      return;
    }

    toast.show(
      FluxerToast(
        message: l10n.guildSettingsCommunityDeleted,
        variant: FluxerToastVariant.success,
      ),
    );
    if (!context.mounted) {
      return;
    }
    final GoRouter router = GoRouter.of(context);
    if (ModalRoute.of(context) is PopupRoute) {
      Navigator.of(context).pop();
    }
    router.go(RoutePaths.me);
  }
}
