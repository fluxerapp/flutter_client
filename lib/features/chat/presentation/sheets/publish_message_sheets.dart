import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/announcement_follow.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

String? formatRetryWait(FluxerLocalizations l10n, int? retryAfterMs) {
  if (retryAfterMs == null || retryAfterMs <= 0) {
    return null;
  }
  final int seconds = (retryAfterMs / 1000).ceil();
  if (seconds < 60) {
    return l10n.durationSeconds(seconds);
  }
  return l10n.durationMinutes((seconds / 60).ceil());
}

Future<bool> confirmPublishMessage(BuildContext context) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final bool? confirmed = await FluxerConfirmSheet.show(
    context,
    title: l10n.chatMessagePublishConfirmTitle,
    description: l10n.chatMessagePublishConfirmBody,
    confirmLabel: l10n.chatMessagePublish,
  );
  return confirmed ?? false;
}

Future<bool> confirmPublishedMessageEdit(BuildContext context) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final bool? confirmed = await FluxerConfirmSheet.show(
    context,
    title: l10n.chatMessageEditPublishedTitle,
    description: l10n.chatMessageEditPublishedBody,
    confirmLabel: l10n.chatMessageEditPublishedSave,
  );
  return confirmed ?? false;
}

Future<void> publishMessage({
  required WidgetRef ref,
  required BuildContext context,
  required Message message,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  if (message.isCrossposted) {
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.chatMessageAlreadyPublished,
            variant: FluxerToastVariant.warning,
          ),
        );
    return;
  }
  final bool confirmed = await confirmPublishMessage(context);
  if (!confirmed || !context.mounted) {
    return;
  }
  try {
    await ref
        .read(messageRepositoryProvider)
        .crosspostMessage(channelId: message.channelId, messageId: message.id);
    if (!context.mounted) {
      return;
    }
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.chatMessagePublishedToast,
            variant: FluxerToastVariant.success,
          ),
        );
  } on DioException catch (error) {
    if (!context.mounted) {
      return;
    }
    final String? code = apiErrorCodeFromDioException(error);
    if (code == kMessageAlreadyCrossposted) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.chatMessageAlreadyPublished,
              variant: FluxerToastVariant.warning,
            ),
          );
      return;
    }
    if (code == kMessageCrosspostRateLimited) {
      await showPublishLimitSheet(
        context,
        retryAfterMs: retryAfterMsFromDioException(error),
      );
      return;
    }
    await _showPublishFailed(context, l10n, error);
  }
}

Future<void> showPublishLimitSheet(
  BuildContext context, {
  required int? retryAfterMs,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String? wait = formatRetryWait(l10n, retryAfterMs);
  return FluxerModal.show<void>(
    context,
    title: l10n.chatMessagePublishLimitTitle,
    centered: true,
    builder: (BuildContext dialogContext, VoidCallback close) {
      return Text(
        wait == null
            ? l10n.chatMessagePublishLimitUnknown
            : l10n.chatMessagePublishLimitBody(wait),
        style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
      );
    },
    actionsBuilder: (void Function([void]) pop) => <Widget>[
      FluxerButton.primary(onPressed: () => pop(), label: l10n.uiConfirm),
    ],
  );
}

Future<void> showPublishedEditLimitSheet(
  BuildContext context, {
  required int? retryAfterMs,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String? wait = formatRetryWait(l10n, retryAfterMs);
  return FluxerModal.show<void>(
    context,
    title: l10n.chatMessageEditLimitTitle,
    centered: true,
    builder: (BuildContext dialogContext, VoidCallback close) {
      return Text(
        wait == null
            ? l10n.chatMessageEditLimitUnknown
            : l10n.chatMessageEditLimitBody(wait),
        style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
      );
    },
    actionsBuilder: (void Function([void]) pop) => <Widget>[
      FluxerButton.primary(onPressed: () => pop(), label: l10n.uiConfirm),
    ],
  );
}

Future<void> _showPublishFailed(
  BuildContext context,
  FluxerLocalizations l10n,
  DioException error,
) {
  return FluxerModal.show<void>(
    context,
    title: l10n.chatMessagePublishFailedTitle,
    centered: true,
    builder: (BuildContext dialogContext, VoidCallback close) {
      return Text(
        userFacingErrorMessage(error, l10n.chatMessagePublishFailedBody),
        style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
      );
    },
    actionsBuilder: (void Function([void]) pop) => <Widget>[
      FluxerButton.primary(onPressed: () => pop(), label: l10n.uiConfirm),
    ],
  );
}
