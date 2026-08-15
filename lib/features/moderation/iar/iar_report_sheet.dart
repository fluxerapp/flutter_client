// IAR report bottom sheet: full 5-step parity with the web `IARModal`.
//
// Steps in order: path -> category -> reason -> success (the platform path)
// or path -> guidance (the community/preference paths). The sheet header
// stays mounted; the body swaps via a simple `IndexedStack`-free conditional
// render. We use a single `FluxerBottomSheet.show<void>` and manage step
// state inside a `ConsumerStatefulWidget`.

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/'
    'delete_message_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/utils/message_link.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/utils/leave_guild_action.dart';
import 'package:fluxer_app/features/moderation/iar/iar_action_card.dart';
import 'package:fluxer_app/features/moderation/iar/iar_copy.dart';
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/features/moderation/iar/iar_message_preview.dart';
import 'package:fluxer_app/features/moderation/iar/iar_resolved_context.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

/// Opens the multi-step IAR sheet (path → category → reason → success) for
/// [iarContext]. Returns when the sheet is dismissed.
///
/// Retained for the planned desktop IAR UI. Mobile message reports now use the
/// simpler single-screen `showSimpleIarReportSheet`, so this has no caller yet.
Future<void> showIarReportSheet(
  BuildContext context, {
  required IarContext iarContext,
}) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerBottomSheet.show<void>(
    context,
    title: l10n.iarReportMessageTitle,
    builder: (sheetContext, close) =>
        _IarReportBody(iarContext: iarContext, close: close),
  );
}

class _IarReportBody extends ConsumerStatefulWidget {
  const _IarReportBody({required this.iarContext, required this.close});

  final IarContext iarContext;
  final VoidCallback close;

  @override
  ConsumerState<_IarReportBody> createState() => _IarReportBodyState();
}

class _IarReportBodyState extends ConsumerState<_IarReportBody> {
  IarStep _step = IarStep.path;
  IarPrimaryPath? _selectedPath;
  IarRuleCategory? _selectedCategory;
  IarRuleReason? _selectedReason;
  bool _submitting = false;
  bool _alreadyReported = false;

  void _showToast(
    String message, {
    FluxerToastVariant variant = FluxerToastVariant.info,
  }) {
    ref
        .read(toastProvider.notifier)
        .show(FluxerToast(message: message, variant: variant));
  }

  void _goBack() {
    switch (_step) {
      case IarStep.path:
        widget.close();
      case IarStep.category:
      case IarStep.guidance:
        setState(() => _step = IarStep.path);
      case IarStep.reason:
        setState(() {
          _selectedReason = null;
          _step = IarStep.category;
        });
      case IarStep.success:
        widget.close();
    }
  }

  void _onPrimary(FluxerLocalizations l10n) {
    switch (_step) {
      case IarStep.path:
        if (_selectedPath == null) {
          _showToast(
            l10n.iarPickAnOptionToast,
            variant: FluxerToastVariant.warning,
          );
          return;
        }
        switch (_selectedPath!) {
          case IarPrimaryPath.platform:
            setState(() => _step = IarStep.category);
          case IarPrimaryPath.community:
          case IarPrimaryPath.preference:
            setState(() => _step = IarStep.guidance);
        }
      case IarStep.category:
        if (_selectedCategory == null) {
          _showToast(
            l10n.iarPickAnOptionToast,
            variant: FluxerToastVariant.warning,
          );
          return;
        }
        setState(() {
          _selectedReason = null;
          _step = IarStep.reason;
        });
      case IarStep.reason:
        unawaited(_submit(l10n));
      case IarStep.guidance:
      case IarStep.success:
        widget.close();
    }
  }

  Future<void> _submit(FluxerLocalizations l10n) async {
    if (_submitting) {
      return;
    }
    final reason = _selectedReason;
    if (reason == null) {
      _showToast(l10n.iarPickARuleToast, variant: FluxerToastVariant.warning);
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
        case IarGuildContext():
          throw UnsupportedError(
            'Guild reports use showSimpleIarReportSheet, not the multi-step flow.',
          );
      }
      if (mounted) {
        setState(() => _step = IarStep.success);
      }
    } on Object catch (error, stack) {
      if (!mounted) {
        return;
      }
      switch (classifyIarReportFailure(error)) {
        case IarReportFailure.alreadyReported:
          talker.debug('[IAR] Message already reported by this reporter');
          setState(() {
            _alreadyReported = true;
            _step = IarStep.success;
          });
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

  // ---------------------------------------------------------------------
  // Action card handlers
  // ---------------------------------------------------------------------

  Future<void> _handleBlockUser(
    BuildContext sheetContext,
    FluxerLocalizations l10n,
    IarReportedUser user,
  ) async {
    final confirmed = await FluxerConfirmSheet.show(
      sheetContext,
      title: l10n.iarActionBlockUserTitle,
      description: l10n.iarBlockUserConfirmDescription(user.displayName),
      confirmLabel: l10n.iarActionBlockUserButton,
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true || !mounted) {
      return;
    }
    try {
      await ref.read(friendRepositoryProvider).blockUser(user.id);
    } on Object catch (error, stack) {
      talker.error('[IAR] Failed to block user', error, stack);
      if (mounted) {
        _showToast(
          l10n.iarBlockUserFailedToast,
          variant: FluxerToastVariant.danger,
        );
      }
    }
  }

  Future<void> _handleCopyMessageLink(
    String channelId,
    String messageId,
    String? guildId,
  ) async {
    final link = messageLink(
      channelId: channelId,
      messageId: messageId,
      guildId: guildId,
      webAppBase: InstanceEndpoints.webApp,
    );
    await copyToClipboard(context: context, value: link);
  }

  Future<void> _handleCloseDm(
    BuildContext sheetContext,
    FluxerLocalizations l10n,
    String dmChannelId,
    String displayName,
  ) async {
    final confirmed = await FluxerConfirmSheet.show(
      sheetContext,
      title: l10n.iarCloseDmConfirmTitle,
      description: l10n.iarCloseDmConfirmDescription(displayName),
      confirmLabel: l10n.iarActionCloseDmButton,
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true || !mounted) {
      return;
    }
    final ok = await ref
        .read(dmViewModelProvider.notifier)
        .closeDmChannel(dmChannelId);
    if (!mounted) {
      return;
    }
    if (!ok) {
      _showToast(
        l10n.iarCloseDmFailedToast,
        variant: FluxerToastVariant.danger,
      );
      return;
    }
    _showToast(
      l10n.iarCloseDmSuccessToast,
      variant: FluxerToastVariant.success,
    );
    widget.close();
    if (sheetContext.mounted) {
      sheetContext.go(RoutePaths.me);
    }
  }

  Future<void> _handleLeaveCommunity(
    BuildContext sheetContext,
    FluxerLocalizations l10n,
    String guildId,
  ) async {
    final confirmed = await FluxerConfirmSheet.show(
      sheetContext,
      title: l10n.iarActionLeaveCommunityTitle,
      description: l10n.iarActionLeaveCommunityDescription,
      confirmLabel: l10n.iarActionLeaveCommunityButton,
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true || !mounted) {
      return;
    }
    try {
      await ref
          .read(fluxerClientProvider)
          .guilds
          .leaveGuild(guildId: guildId, body: const SudoVerificationSchema());
      await removeGuildLocallyAndEvict(ref, guildId);
    } on Object catch (error, stack) {
      talker.error('[IAR] Failed to leave guild', error, stack);
      if (mounted) {
        _showToast(
          l10n.iarLeaveCommunityFailedToast,
          variant: FluxerToastVariant.danger,
        );
      }
      return;
    }
    if (!mounted) {
      return;
    }
    widget.close();
    if (sheetContext.mounted) {
      sheetContext.go(RoutePaths.me);
    }
  }

  Future<void> _handleDeleteMessage(BuildContext sheetContext) async {
    final ctx = widget.iarContext;
    if (ctx is! IarMessageContext) {
      return;
    }
    await showDeleteMessageConfirmSheet(
      sheetContext,
      ref,
      message: ctx.message,
      guildId: ctx.guildId,
    );
  }

  Future<void> _handleBanUser(BuildContext sheetContext, String guildId) async {
    widget.close();
    if (sheetContext.mounted) {
      await sheetContext.push(
        RoutePaths.guildSettingsPath(guildId, tab: 'bans'),
      );
    }
  }

  Future<void> _handleOpenSettings(BuildContext sheetContext) async {
    await UserSettingsModal.show(sheetContext);
  }

  // ---------------------------------------------------------------------
  // Card list
  // ---------------------------------------------------------------------

  List<IarActionCardConfig> _buildActionCards({
    required BuildContext sheetContext,
    required FluxerLocalizations l10n,
    required IarResolvedContext resolved,
    required bool includeModerationActions,
  }) {
    final ctx = widget.iarContext;
    final reportedUser = resolved.reportedUser;
    final cards = <IarActionCardConfig>[];

    if (reportedUser != null && !resolved.isReportedUserBlocked) {
      cards.add(
        IarActionCardConfig(
          id: 'block-user',
          title: l10n.iarActionBlockUserTitle,
          description: l10n.iarActionBlockUserDescription,
          label: l10n.iarActionBlockUserButton,
          style: IarActionCardButtonStyle.dangerSecondary,
          onPressed: () =>
              unawaited(_handleBlockUser(sheetContext, l10n, reportedUser)),
        ),
      );
    }

    if (ctx is IarMessageContext && resolved.hasCommunityContext) {
      cards.add(
        IarActionCardConfig(
          id: 'copy-message-link',
          title: l10n.iarActionCopyMessageLinkTitle,
          description: l10n.iarActionCopyMessageLinkDescription,
          label: l10n.iarActionCopyMessageLinkButton,
          onPressed: () => unawaited(
            _handleCopyMessageLink(
              ctx.message.channelId,
              ctx.message.id,
              ctx.guildId,
            ),
          ),
        ),
      );
    }

    final dmChannelId = resolved.dmChannelId;
    if (dmChannelId != null && resolved.isFocusedOnDmWithUser) {
      cards.add(
        IarActionCardConfig(
          id: 'close-dm',
          title: l10n.iarActionCloseDmTitle,
          description: l10n.iarActionCloseDmDescription,
          label: l10n.iarActionCloseDmButton,
          style: IarActionCardButtonStyle.dangerSecondary,
          onPressed: () => unawaited(
            _handleCloseDm(
              sheetContext,
              l10n,
              dmChannelId,
              resolved.dmDisplayName,
            ),
          ),
        ),
      );
    }

    final leaveGuildId = resolved.leaveableGuildId;
    if (leaveGuildId != null && !resolved.isLeaveableGuildOwner) {
      cards.add(
        IarActionCardConfig(
          id: 'leave-community',
          title: l10n.iarActionLeaveCommunityTitle,
          description: l10n.iarActionLeaveCommunityDescription,
          label: l10n.iarActionLeaveCommunityButton,
          style: IarActionCardButtonStyle.dangerSecondary,
          onPressed: () => unawaited(
            _handleLeaveCommunity(sheetContext, l10n, leaveGuildId),
          ),
        ),
      );
    }

    if (includeModerationActions && resolved.canDeleteReportedMessage) {
      cards.add(
        IarActionCardConfig(
          id: 'delete-message',
          title: l10n.iarActionDeleteMessageTitle,
          description: l10n.iarActionDeleteMessageDescription,
          label: l10n.iarActionDeleteMessageButton,
          style: IarActionCardButtonStyle.dangerSecondary,
          onPressed: () => unawaited(_handleDeleteMessage(sheetContext)),
        ),
      );
    }

    if (includeModerationActions && resolved.canBanReportedUser) {
      final banGuildId = resolved.banGuildId;
      if (banGuildId != null) {
        cards.add(
          IarActionCardConfig(
            id: 'ban-user',
            title: l10n.iarActionBanUserTitle,
            description: l10n.iarActionBanUserDescription,
            label: l10n.iarActionBanUserButton,
            style: IarActionCardButtonStyle.dangerSecondary,
            onPressed: () =>
                unawaited(_handleBanUser(sheetContext, banGuildId)),
          ),
        );
      }
    }

    // Mobile only surfaces a single settings entry today. Both DM settings
    // and call settings would land on the same Privacy Dashboard page, so we
    // render only the DM-settings card to avoid two identical CTAs.
    if (ctx is IarMessageContext) {
      cards.add(
        IarActionCardConfig(
          id: 'dm-settings',
          title: l10n.iarActionDmSettingsTitle,
          description: l10n.iarActionDmSettingsDescription,
          label: l10n.iarActionOpenButton,
          onPressed: () => unawaited(_handleOpenSettings(sheetContext)),
        ),
      );
    }

    return cards;
  }

  // ---------------------------------------------------------------------
  // Step renderers
  // ---------------------------------------------------------------------

  Widget _renderPathStep(
    BuildContext sheetContext,
    FluxerLocalizations l10n,
    IarResolvedContext resolved,
  ) {
    final options = iarPrimaryPathOptions(l10n, widget.iarContext, resolved);
    final layout = sheetContext.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        IarPreview(context: widget.iarContext),
        SizedBox(height: layout.s4),
        FluxerRadioGroup<IarPrimaryPath>(
          value: _selectedPath,
          items: options,
          onChanged: (value) => setState(() => _selectedPath = value),
        ),
      ],
    );
  }

  Widget _renderCategoryStep(
    BuildContext sheetContext,
    FluxerLocalizations l10n,
  ) {
    final options = iarCategoryOptions(l10n);
    final layout = sheetContext.layout;
    final textStyles = sheetContext.textStyles;
    final colors = sheetContext.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.iarCategoryStepTitle,
          style: textStyles.heading.copyWith(color: colors.textPrimary),
        ),
        SizedBox(height: layout.s2),
        IarPreview(context: widget.iarContext),
        SizedBox(height: layout.s4),
        FluxerRadioGroup<IarRuleCategory>(
          value: _selectedCategory,
          items: options,
          onChanged: (value) => setState(() => _selectedCategory = value),
        ),
      ],
    );
  }

  Widget _renderReasonStep(
    BuildContext sheetContext,
    FluxerLocalizations l10n,
  ) {
    final options = iarMessageReasonOptions(l10n, _selectedCategory);
    final routingNote = iarChildSafetyRoutingNote(l10n, _selectedReason);
    final safetyNote = iarSpecialSafetyNote(l10n, _selectedReason);
    final layout = sheetContext.layout;
    final textStyles = sheetContext.textStyles;
    final colors = sheetContext.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.iarReasonStepTitle,
          style: textStyles.heading.copyWith(color: colors.textPrimary),
        ),
        SizedBox(height: layout.s2),
        IarPreview(context: widget.iarContext),
        SizedBox(height: layout.s4),
        FluxerRadioGroup<IarRuleReason>(
          value: _selectedReason,
          items: options,
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
    );
  }

  Widget _renderGuidanceStep(
    BuildContext sheetContext,
    FluxerLocalizations l10n,
    IarResolvedContext resolved,
  ) {
    final cards = _buildActionCards(
      sheetContext: sheetContext,
      l10n: l10n,
      resolved: resolved,
      includeModerationActions: false,
    );
    return IarActionCardList(cards: cards);
  }

  Widget _renderSuccessStep(
    BuildContext sheetContext,
    FluxerLocalizations l10n,
    IarResolvedContext resolved,
  ) {
    final cards = _buildActionCards(
      sheetContext: sheetContext,
      l10n: l10n,
      resolved: resolved,
      includeModerationActions: true,
    );
    final layout = sheetContext.layout;
    final textStyles = sheetContext.textStyles;
    final colors = sheetContext.colors;
    final successTitle = _alreadyReported
        ? l10n.iarAlreadyReportedTitle
        : l10n.iarSuccessTitle;
    final successBody = _alreadyReported
        ? l10n.iarAlreadyReportedBody
        : l10n.iarSuccessBody;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          successTitle,
          style: textStyles.heading.copyWith(color: colors.textPrimary),
        ),
        SizedBox(height: layout.s2),
        Text(
          successBody,
          style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
        ),
        if (cards.isNotEmpty) ...[
          SizedBox(height: layout.s4),
          IarActionCardList(cards: cards),
        ],
      ],
    );
  }

  // ---------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final resolved = resolveIarContext(ref, l10n, widget.iarContext);

    final Widget body = switch (_step) {
      IarStep.path => _renderPathStep(context, l10n, resolved),
      IarStep.category => _renderCategoryStep(context, l10n),
      IarStep.reason => _renderReasonStep(context, l10n),
      IarStep.guidance => _renderGuidanceStep(context, l10n, resolved),
      IarStep.success => _renderSuccessStep(context, l10n, resolved),
    };

    final layout = context.layout;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (!didPop) {
          _goBack();
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s2),
              child: body,
            ),
          ),
          _IarFooter(
            step: _step,
            submitting: _submitting,
            onBack: _goBack,
            onPrimary: () => _onPrimary(l10n),
          ),
        ],
      ),
    );
  }
}

class _IarFooter extends StatelessWidget {
  const _IarFooter({
    required this.step,
    required this.submitting,
    required this.onBack,
    required this.onPrimary,
  });

  final IarStep step;
  final bool submitting;
  final VoidCallback onBack;
  final VoidCallback onPrimary;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final showBack = step != IarStep.success;
    final primaryLabel = switch (step) {
      IarStep.path => l10n.iarContinueButton,
      IarStep.category => l10n.iarContinueButton,
      IarStep.reason => l10n.iarSendReportButton,
      IarStep.guidance => l10n.iarDoneButton,
      IarStep.success => l10n.iarDoneButton,
    };

    return FluxerBottomSheetFooter(
      child: Row(
        children: [
          if (showBack) ...[
            Expanded(
              child: FluxerButton.secondary(
                onPressed: submitting ? null : onBack,
                label: l10n.iarBackButton,
              ),
            ),
            SizedBox(width: layout.s3),
          ],
          Expanded(
            flex: showBack ? 1 : 2,
            child: FluxerButton.primary(
              onPressed: submitting ? null : onPrimary,
              isLoading: submitting && step == IarStep.reason,
              label: primaryLabel,
            ),
          ),
        ],
      ),
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
