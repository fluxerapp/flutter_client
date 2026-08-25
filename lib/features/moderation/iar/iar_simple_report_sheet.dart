import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/moderation/iar/iar_copy.dart';
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/features/moderation/iar/iar_message_preview.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

/// Opens the simple single-screen mobile message-report sheet for [iarContext]:
/// pick one reason, send, then toast and close. Returns when dismissed.
///
/// The mobile flow; the multi-step `showIarReportSheet` is kept for desktop.
Future<void> showSimpleIarReportSheet(
  BuildContext context, {
  required IarContext iarContext,
}) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerBottomSheet.show<void>(
    context,
    title: switch (iarContext) {
      IarMessageContext() => l10n.iarReportMessageTitle,
      IarUserContext() => l10n.iarReportUserTitle,
      IarGuildContext() => l10n.iarReportGuildTitle,
    },
    builder: (sheetContext, close) =>
        _SimpleIarReportBody(iarContext: iarContext, close: close),
  );
}

class _SimpleIarReportBody extends ConsumerStatefulWidget {
  const _SimpleIarReportBody({required this.iarContext, required this.close});

  final IarContext iarContext;
  final VoidCallback close;

  @override
  ConsumerState<_SimpleIarReportBody> createState() =>
      _SimpleIarReportBodyState();
}

class _SimpleIarReportBodyState extends ConsumerState<_SimpleIarReportBody> {
  IarRuleReason? _selectedReason;
  bool _submitting = false;

  void _showToast(
    String message, {
    FluxerToastVariant variant = FluxerToastVariant.info,
  }) {
    ref
        .read(toastProvider.notifier)
        .show(FluxerToast(message: message, variant: variant));
  }

  Future<void> _submit(FluxerLocalizations l10n) async {
    if (_submitting) {
      return;
    }
    final reason = _selectedReason;
    if (reason == null) {
      return;
    }
    setState(() => _submitting = true);
    try {
      switch (widget.iarContext) {
        case IarMessageContext(:final message):
          await ref
              .read(fluxerClientProvider)
              .reports
              .reportMessage(
                body: ReportMessageRequest(
                  channelId: message.channelId,
                  messageId: message.id,
                  category: iarReasonToMessageCategory(reason),
                ),
              );
        case IarUserContext(:final userId, :final guildId):
          await ref
              .read(fluxerClientProvider)
              .reports
              .reportUser(
                body: ReportUserRequest(
                  userId: userId,
                  category: iarReasonToUserCategory(reason),
                  guildId: guildId,
                ),
              );
        case IarGuildContext(:final guildId, :final inviteCode):
          await ref
              .read(fluxerClientProvider)
              .reports
              .reportGuild(
                body: ReportGuildRequest(
                  guildId: guildId,
                  category: iarReasonToGuildCategory(reason),
                  inviteCode: inviteCode,
                ),
              );
      }
      if (!mounted) {
        return;
      }
      _showToast(l10n.iarReportSentToast, variant: FluxerToastVariant.success);
      widget.close();
    } on Object catch (error, stack) {
      if (!mounted) {
        return;
      }
      switch (classifyIarReportFailure(error)) {
        case IarReportFailure.alreadyReported:
          talker.debug('[IAR] Message already reported by this reporter');
          _showToast(l10n.iarAlreadyReportedBody);
          widget.close();
        case IarReportFailure.rateLimited:
          _showToast(
            l10n.iarRateLimitedToast,
            variant: FluxerToastVariant.warning,
          );
        case IarReportFailure.generic:
          talker.error('[IAR] Failed to submit report', error, stack);
          _showToast(
            l10n.iarCouldntSendToast,
            variant: FluxerToastVariant.danger,
          );
      }
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;

    final options = switch (widget.iarContext) {
      IarMessageContext() => iarFlatMessageReasonSelectOptions(l10n),
      IarUserContext() => iarFlatUserReasonSelectOptions(l10n),
      IarGuildContext() => iarFlatGuildReasonSelectOptions(l10n),
    };
    final routingNote = iarChildSafetyRoutingNote(l10n, _selectedReason);
    final safetyNote = iarSpecialSafetyNote(l10n, _selectedReason);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                IarPreview(context: widget.iarContext),
                SizedBox(height: layout.s4),
                FluxerSelect<IarRuleReason>(
                  label: l10n.iarReasonStepTitle,
                  hint: l10n.iarReasonSelectHint,
                  value: _selectedReason,
                  items: options,
                  enableSearch: false,
                  stretch: true,
                  scrollableSheet: true,
                  onChanged: (value) => setState(() => _selectedReason = value),
                ),
                if (routingNote != null) ...[
                  SizedBox(height: layout.s3),
                  _InlineNote(text: routingNote),
                ],
                if (safetyNote != null) ...[
                  SizedBox(height: layout.s2),
                  _InlineNote(text: safetyNote),
                ],
              ],
            ),
          ),
        ),
        FluxerBottomSheetFooter(
          child: FluxerButton.primary(
            onPressed: (_submitting || _selectedReason == null)
                ? null
                : () => unawaited(_submit(l10n)),
            isLoading: _submitting,
            label: l10n.iarSendReportButton,
          ),
        ),
      ],
    );
  }
}

class _InlineNote extends StatelessWidget {
  const _InlineNote({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    return Container(
      padding: EdgeInsets.all(layout.s3),
      decoration: BoxDecoration(
        color: colors.backgroundSecondaryAlt,
        borderRadius: layout.radiusLg,
      ),
      child: Text(
        text,
        style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
      ),
    );
  }
}
