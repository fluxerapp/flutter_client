import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/l10n/api_locale.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/moderation/data/report_flow_repository.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow_walk.dart';
import 'package:fluxer_app/features/moderation/domain/report_restriction.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_checklist.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_option_list.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_parts.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_summary.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_target_preview.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_thank_you.dart';
import 'package:fluxer_app/features/moderation/providers/report_flow_provider.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_confirmation_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

class ReportFlowSheet extends ConsumerStatefulWidget {
  const ReportFlowSheet({required this.target, required this.close, super.key});

  final IarContext target;
  final VoidCallback close;

  @override
  ConsumerState<ReportFlowSheet> createState() => _ReportFlowSheetState();
}

class _ReportFlowSheetState extends ConsumerState<ReportFlowSheet> {
  ReportFlowWalk? _walk;
  bool _submitting = false;
  ReportFlowSubmitException? _submitError;
  bool _blocking = false;
  bool _blocked = false;
  late final bool _blockedAtOpen;
  final ScrollController _scrollController = ScrollController();
  Object? _shownStep;

  @override
  void initState() {
    super.initState();
    final String? blockUserId = widget.target.blockableUserId;
    _blockedAtOpen =
        blockUserId != null &&
        ref.read(blockedUserIdsProvider).contains(blockUserId);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showStepFromTop(Object step) {
    if (step == _shownStep) {
      return;
    }
    _shownStep = step;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  ReportFlowBlockTarget? _blockTarget(String? currentUserId) {
    final String? userId = widget.target.blockableUserId;
    if (userId == null || userId == currentUserId || _blockedAtOpen) {
      return null;
    }
    return ReportFlowBlockTarget(
      userId: userId,
      name: switch (widget.target) {
        IarMessageContext(:final message) => message.authorName,
        IarUserContext(:final displayName) => displayName,
      },
    );
  }

  String _locale(BuildContext context) =>
      apiLocaleFromFlutterLocale(Localizations.localeOf(context)).json ??
      'en-US';

  ReportFlowWalk _walkFor(ReportFlow flow) {
    final ReportFlowWalk? current = _walk;
    if (current != null && identical(current.flow, flow)) {
      return current;
    }
    return ReportFlowWalk.start(flow);
  }

  void _update(ReportFlowWalk next) {
    setState(() {
      _walk = next;
      _submitError = null;
    });
  }

  void _choose(ReportFlowWalk walk, ReportFlowOption option) {
    if (option.outcome.type == ReportFlowOutcomeType.link) {
      final String? url = option.outcome.url;
      if (url != null) {
        unawaited(
          handleExternalLinkTap(
            context,
            reportFlowLinkUrl(url, widget.target),
            skipWarning: true,
          ),
        );
      }
      return;
    }
    _update(walk.chooseOption(option.id));
  }

  void _showToast(String message, FluxerToastVariant variant) {
    ref
        .read(toastProvider.notifier)
        .show(FluxerToast(message: message, variant: variant));
  }

  ReportRestriction? get _rejectedRestriction =>
      switch (_submitError?.failure) {
        ReportFlowSubmitFailure.accountUnclaimed => ReportRestriction.unclaimed,
        ReportFlowSubmitFailure.emailVerificationRequired =>
          ReportRestriction.unverified,
        _ => null,
      };

  void _resolveRestriction(ReportRestriction restriction) {
    switch (restriction) {
      case ReportRestriction.unclaimed:
        unawaited(ClaimAccountSheet.show(context, ref));
      case ReportRestriction.unverified:
        unawaited(UserSettingsModal.show(context, openSecuritySection: true));
    }
  }

  Future<void> _submit(ReportFlowWalk walk, String locale) async {
    if (_submitting) {
      return;
    }
    if (getReportRestriction(ref.read(userSettingsViewModelProvider)) != null) {
      return;
    }
    setState(() {
      _submitting = true;
      _submitError = null;
    });
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ReportFlowRepository repository = ref.read(
      reportFlowRepositoryProvider,
    );
    try {
      switch (widget.target) {
        case IarMessageContext(:final message):
          await repository.submitMessage(
            channelId: message.channelId,
            messageId: message.id,
            revisionHash: walk.flow.revisionHash,
            steps: walk.steps,
            locale: locale,
          );
        case IarUserContext(:final userId, :final guildId):
          await repository.submitUser(
            userId: userId,
            guildId: guildId,
            revisionHash: walk.flow.revisionHash,
            steps: walk.steps,
            locale: locale,
          );
      }
      if (mounted) {
        _update(walk.markSent());
      }
    } on ReportFlowSubmitException catch (error) {
      if (!mounted) {
        return;
      }
      switch (error.failure) {
        case ReportFlowSubmitFailure.outdated:
          ref.invalidate(
            reportFlowProvider(
              targetType: widget.target.targetType,
              locale: locale,
            ),
          );
          setState(() => _walk = null);
          _showToast(l10n.reportFlowOutdated, FluxerToastVariant.warning);
        case ReportFlowSubmitFailure.alreadyReported:
        case ReportFlowSubmitFailure.rateLimited:
        case ReportFlowSubmitFailure.accountUnclaimed:
        case ReportFlowSubmitFailure.emailVerificationRequired:
        case ReportFlowSubmitFailure.rejected:
        case ReportFlowSubmitFailure.generic:
          talker.warning('[ReportFlow] submit failed: $error');
          setState(() => _submitError = error);
      }
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  Future<void> _block(ReportFlowBlockTarget target) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool confirmed = await UserProfileConfirmationSheet.show(
      context,
      title: l10n.userProfileBlockConfirmTitle,
      description: l10n.userProfileBlockConfirmDescription(target.name),
      primaryLabel: l10n.userProfileBlockUser,
      primaryVariant: FluxerButtonVariant.dangerPrimary,
    );
    if (!confirmed || !mounted) {
      return;
    }
    setState(() => _blocking = true);
    try {
      await ref.read(friendRepositoryProvider).blockUser(target.userId);
      if (mounted) {
        setState(() => _blocked = true);
      }
    } on Object catch (error, stack) {
      talker.error('[ReportFlow] block failed', error, stack);
      if (mounted) {
        _showToast(l10n.userProfileActionFailed, FluxerToastVariant.danger);
      }
    } finally {
      if (mounted) {
        setState(() => _blocking = false);
      }
    }
  }

  String? _submitNote(FluxerLocalizations l10n) {
    final ReportFlowSubmitException? error = _submitError;
    if (error == null) {
      return null;
    }
    return switch (error.failure) {
      ReportFlowSubmitFailure.alreadyReported => switch (widget.target) {
        IarMessageContext() => l10n.reportFlowAlreadyReported,
        IarUserContext() => l10n.reportFlowAlreadyReportedProfile,
      },
      ReportFlowSubmitFailure.rateLimited => l10n.reportFlowRateLimited,
      ReportFlowSubmitFailure.rejected =>
        error.apiMessage ?? l10n.reportFlowSubmitFailed,
      ReportFlowSubmitFailure.accountUnclaimed ||
      ReportFlowSubmitFailure.emailVerificationRequired => null,
      ReportFlowSubmitFailure.outdated ||
      ReportFlowSubmitFailure.generic => l10n.reportFlowSubmitFailed,
    };
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final String locale = _locale(context);
    final AsyncValue<ReportFlow> flowAsync = ref.watch(
      reportFlowProvider(targetType: widget.target.targetType, locale: locale),
    );
    final ReportFlow? flow = flowAsync.value;
    final ReportFlowWalk? walk = flow == null ? null : _walkFor(flow);
    final ReportRestriction? restriction = ref.watch(
      userSettingsViewModelProvider.select(getReportRestriction),
    );

    final String loadingTitle = switch (widget.target) {
      IarMessageContext() => l10n.reportFlowTitleMessage,
      IarUserContext() => l10n.reportFlowTitleUserProfile,
    };

    final Widget content;
    final Widget? footer;
    final Object step;
    if (walk != null) {
      content = _walkContent(context, walk, restriction);
      footer = _footer(walk, locale, restriction);
      step = walk.depth;
    } else if (flowAsync.hasError && !flowAsync.isLoading) {
      content = _header(context, loadingTitle, null, <Widget>[
        Text(
          l10n.reportFlowLoadFailed,
          textAlign: TextAlign.center,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: layout.s4),
        FluxerButton.secondary(
          label: l10n.reportFlowTryAgain,
          onPressed: () => ref.invalidate(
            reportFlowProvider(
              targetType: widget.target.targetType,
              locale: locale,
            ),
          ),
        ),
      ]);
      footer = null;
      step = 'error';
    } else {
      content = _header(context, loadingTitle, null, <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: layout.s6),
          child: Center(
            child: FluxerLoadingSpinner(color: context.colors.textSecondary),
          ),
        ),
      ]);
      footer = null;
      step = 'loading';
    }
    _showStepFromTop((step, walk?.screenId, walk?.phase));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.only(bottom: layout.s2),
            child: FluxerSteppedCarousel<Object>(
              step: step,
              steps: <Object>[
                'loading',
                'error',
                for (int depth = 0; depth <= (walk?.depth ?? 0) + 1; depth++)
                  depth,
              ],
              child: content,
            ),
          ),
        ),
        ?footer,
      ],
    );
  }

  Widget _header(
    BuildContext context,
    String title,
    String? subtitle,
    List<Widget> body,
  ) {
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        FluxerBottomSheetHeader(
          title: title,
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: context.textStyles.bodySmall.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
        ),
        SizedBox(height: layout.s4),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: body,
          ),
        ),
      ],
    );
  }

  Widget _walkContent(
    BuildContext context,
    ReportFlowWalk walk,
    ReportRestriction? restriction,
  ) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    switch (walk.phase) {
      case ReportFlowPhase.screen:
        final ReportFlowScreen screen = walk.screen;
        return _header(context, screen.title, screen.subtitle, <Widget>[
          ..._screenBody(context, walk, screen),
        ]);
      case ReportFlowPhase.summary:
        final ReportRestriction? shownRestriction =
            restriction ?? _rejectedRestriction;
        return _header(
          context,
          l10n.reportFlowSummaryTitle,
          l10n.reportFlowSummarySubtitle,
          <Widget>[
            ReportFlowSummary(
              target: widget.target,
              categoryLabels: walk.categoryLabels,
              urgent: walk.showsUrgentBanner,
              guidelinesUrl: walk.flow.guidelinesUrl,
              note: _submitNote(l10n),
            ),
            if (shownRestriction != null) ...[
              SizedBox(height: layout.s4),
              _ReportFlowAccountNotice(
                restriction: shownRestriction,
                onResolve: () => _resolveRestriction(shownRestriction),
              ),
            ],
          ],
        );
      case ReportFlowPhase.notice:
        final ReportFlowNotice? notice = walk.notice;
        return _header(context, notice?.title ?? '', null, <Widget>[
          Text(
            notice?.body ?? '',
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ]);
      case ReportFlowPhase.thanks:
        final String? currentUserId = ref.watch(currentUserIdProvider);
        final ReportFlowBlockTarget? blockTarget = _blockTarget(currentUserId);
        final bool blockedNow =
            _blocked ||
            (blockTarget != null &&
                ref.watch(blockedUserIdsProvider).contains(blockTarget.userId));
        final String thanksTitle = walk.reportSent
            ? l10n.reportFlowThankYouTitle
            : l10n.reportFlowThankYouNoReportTitle;
        return _header(context, thanksTitle, null, <Widget>[
          ReportFlowThankYou(
            reportSent: walk.reportSent,
            endedOnStartScreen: walk.endedOnStartScreen,
            productName: ref.watch(
              instanceRuntimeConfigProvider.select(
                (config) => config.productName,
              ),
            ),
            blockTarget: blockTarget,
            blocked: blockedNow,
            blocking: _blocking,
            onBlock: () {
              if (blockTarget != null) {
                unawaited(_block(blockTarget));
              }
            },
          ),
          SizedBox(height: layout.s2),
        ]);
    }
  }

  List<Widget> _screenBody(
    BuildContext context,
    ReportFlowWalk walk,
    ReportFlowScreen screen,
  ) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final IarContext target = widget.target;
    final List<Widget> parts = <Widget>[];
    void add(Widget part) {
      if (parts.isNotEmpty) {
        parts.add(SizedBox(height: layout.s4));
      }
      parts.add(part);
    }

    if (walk.isAtStart && target is IarMessageContext) {
      add(ReportFlowTargetPreview(target: target));
    }
    if (walk.isAtStart &&
        target is IarUserContext &&
        screen.kind == ReportFlowScreenKind.info) {
      add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ReportFlowSectionHeading(l10n.reportFlowSelectedUser),
            ReportFlowUserCard(user: target),
          ],
        ),
      );
    }
    if (screen.urgent) {
      add(const ReportFlowUrgentBanner());
    }
    final ReportFlowChecklist? checklist = screen.checklist;
    if (checklist != null) {
      add(
        ReportFlowChecklistView(
          checklist: checklist,
          checked: walk.checkedItems,
          onToggle: (String itemId) => _update(walk.toggleItem(itemId)),
        ),
      );
    } else if (screen.options.isNotEmpty) {
      final String? heading = screen.optionsHeading;
      add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (heading != null) ReportFlowSectionHeading(heading),
            ReportFlowOptionList(
              options: screen.options,
              onChoose: (ReportFlowOption option) => _choose(walk, option),
            ),
          ],
        ),
      );
    }
    return parts;
  }

  Widget? _footer(
    ReportFlowWalk walk,
    String locale,
    ReportRestriction? restriction,
  ) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final Widget back = FluxerButton.secondary(
      key: const ValueKey<String>('report-flow-back'),
      label: l10n.reportFlowBack,
      onPressed: _submitting ? null : () => _update(walk.back()),
    );
    Widget pair(Widget first, Widget second) => Row(
      children: [
        Expanded(child: first),
        SizedBox(width: layout.s3),
        Expanded(child: second),
      ],
    );
    final Widget done = FluxerButton.primary(
      key: const ValueKey<String>('report-flow-done'),
      label: l10n.reportFlowDone,
      onPressed: widget.close,
    );

    final Widget? child;
    switch (walk.phase) {
      case ReportFlowPhase.screen:
        switch (walk.screen.kind) {
          case ReportFlowScreenKind.choice:
            child = walk.canGoBack ? back : null;
          case ReportFlowScreenKind.checklist:
            final Widget next = FluxerButton.primary(
              key: const ValueKey<String>('report-flow-next'),
              label: l10n.reportFlowNext,
              onPressed: walk.canContinueChecklist
                  ? () => _update(walk.continueChecklist())
                  : null,
            );
            child = walk.canGoBack ? pair(back, next) : next;
          case ReportFlowScreenKind.info:
            final Widget next = FluxerButton.primary(
              key: const ValueKey<String>('report-flow-next'),
              label: l10n.reportFlowNext,
              onPressed: () => _update(walk.continueInfo()),
            );
            child = walk.canGoBack ? pair(back, next) : next;
        }
      case ReportFlowPhase.summary:
        final ReportFlowSubmitFailure? failure = _submitError?.failure;
        child = pair(
          back,
          failure == ReportFlowSubmitFailure.alreadyReported ||
                  failure == ReportFlowSubmitFailure.rejected
              ? done
              : FluxerButton.dangerPrimary(
                  key: const ValueKey<String>('report-flow-submit'),
                  label: l10n.reportFlowSubmit,
                  isLoading: _submitting,
                  onPressed: _submitting || restriction != null
                      ? null
                      : () => unawaited(_submit(walk, locale)),
                ),
        );
      case ReportFlowPhase.notice:
      case ReportFlowPhase.thanks:
        child = done;
    }
    return child == null ? null : FluxerBottomSheetFooter(child: child);
  }
}

class _ReportFlowAccountNotice extends StatelessWidget {
  const _ReportFlowAccountNotice({
    required this.restriction,
    required this.onResolve,
  });

  final ReportRestriction restriction;
  final VoidCallback onResolve;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    return Container(
      key: const ValueKey<String>('report-flow-account-notice'),
      padding: EdgeInsets.all(layout.s3),
      decoration: BoxDecoration(
        color: colors.backgroundSecondaryAlt,
        borderRadius: layout.radiusLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            liveRegion: true,
            child: Text(
              l10n.reportFlowAccountSetupRequired,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ),
          SizedBox(height: layout.s3),
          FluxerButton.secondary(
            key: const ValueKey<String>('report-flow-account-setup'),
            label: switch (restriction) {
              ReportRestriction.unclaimed => l10n.claimAccount,
              ReportRestriction.unverified =>
                l10n.channelComposerBarrierVerifyEmail,
            },
            size: FluxerButtonSize.small,
            fitContent: true,
            onPressed: onResolve,
          ),
        ],
      ),
    );
  }
}
