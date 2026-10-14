import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/mobile_composer_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer/guild_composer_barrier_l10n.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/messaging_paused_help_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kBarrierPaddingX = 10;
const double _kBarrierPaddingY = 13;
const double _kBarrierSidePadding = 4;
const double _kBarrierIconSize = 22;
const double _kBarrierLineHeight = 22;

class ChannelComposerBarrier extends ConsumerStatefulWidget {
  const ChannelComposerBarrier({required this.access, super.key});

  final GuildComposerAccess access;

  @override
  ConsumerState<ChannelComposerBarrier> createState() =>
      _ChannelComposerBarrierState();
}

class _ChannelComposerBarrierState
    extends ConsumerState<ChannelComposerBarrier> {
  Timer? _countdownTimer;
  Duration? _remaining;

  @override
  void initState() {
    super.initState();
    _remaining = widget.access.timeRemaining;
    _ensureCountdownTimer();
  }

  @override
  void didUpdateWidget(ChannelComposerBarrier oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.access.timeRemaining != widget.access.timeRemaining) {
      _remaining = widget.access.timeRemaining;
      _ensureCountdownTimer();
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _ensureCountdownTimer() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    final Duration? remaining = _remaining;
    if (remaining == null || remaining <= Duration.zero) {
      return;
    }
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!mounted) {
        return;
      }
      final Duration? current = _remaining;
      if (current == null) {
        return;
      }
      final Duration next = current - const Duration(seconds: 1);
      if (next <= Duration.zero) {
        timer.cancel();
        _countdownTimer = null;
      }
      setState(() {
        _remaining = next <= Duration.zero ? Duration.zero : next;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final GuildComposerBlockReason? reason = widget.access.reason;
    if (reason == null) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String message = guildComposerBarrierMessage(l10n, reason);
    final Widget? action = _buildAction(context, l10n, reason);
    final Duration? remaining = _remaining;
    final Widget? countdown = remaining != null && remaining > Duration.zero
        ? Container(
            height: WideComposerLayout.actionButtonExtent,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: context.colors.backgroundSecondaryAlt,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              formatComposerBarrierCountdown(remaining),
              style: context.textStyles.codeText.copyWith(
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.w600,
                color: context.colors.textPrimary,
                fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
              ),
            ),
          )
        : null;
    final Widget? trailing = action ?? countdown;
    final bool mobile = isMobileLayout(context);
    final double safeAreaBottom = MediaQuery.paddingOf(context).bottom;
    final Widget icon = PhosphorIcon(
      _iconForReason(reason),
      size: _kBarrierIconSize,
      color: context.colors.textPrimaryMuted,
    );
    final Widget text = Text(
      message,
      style: context.textStyles.bodySmall.copyWith(
        color: context.colors.textTertiary,
        height: _kBarrierLineHeight / 14,
      ),
    );
    if (mobile) {
      final double safeBarHeight =
          safeAreaBottom - MobileComposerLayout.bottomGap;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              MobileComposerLayout.sideInset,
              MobileComposerLayout.topInset,
              MobileComposerLayout.sideInset,
              MobileComposerLayout.bottomGap,
            ),
            child: MobileComposerBar(
              child: Padding(
                padding: MobileComposerLayout.rowPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: MobileComposerLayout.buttonExtent,
                      height: MobileComposerLayout.sendExtent,
                      child: Center(child: icon),
                    ),
                    const SizedBox(
                      width:
                          MobileComposerLayout.attachGap +
                          MobileComposerLayout.textInsetX,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: MobileComposerLayout.textInsetY,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            text,
                            if (trailing != null) ...<Widget>[
                              const SizedBox(
                                height: MobileComposerLayout.trailingGap,
                              ),
                              trailing,
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (safeBarHeight > 0) SizedBox(height: safeBarHeight),
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ColoredBox(
          color: context.colors.backgroundSecondaryLighter,
          child: Padding(
            padding: const EdgeInsets.all(WideComposerLayout.boxInset),
            child: WideComposerFloatingBox(
              focused: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: _kBarrierPaddingX,
                  vertical: _kBarrierPaddingY,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _kBarrierSidePadding,
                      ),
                      child: SizedBox.square(
                        dimension: WideComposerLayout.actionButtonExtent,
                        child: Center(child: icon),
                      ),
                    ),
                    const SizedBox(width: WideComposerLayout.denseColumnGap),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top:
                              (WideComposerLayout.actionButtonExtent -
                                  _kBarrierLineHeight) /
                              2,
                        ),
                        child: text,
                      ),
                    ),
                    if (trailing != null) ...<Widget>[
                      const SizedBox(width: WideComposerLayout.denseColumnGap),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: _kBarrierSidePadding,
                        ),
                        child: trailing,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        if (safeAreaBottom > 0)
          ColoredBox(
            color: context.colors.backgroundSecondaryLighter,
            child: SizedBox(height: safeAreaBottom, width: double.infinity),
          ),
      ],
    );
  }

  IconData _iconForReason(GuildComposerBlockReason reason) {
    return switch (reason) {
      GuildComposerBlockReason.accountLimited => PhosphorIconsFill.info,
      GuildComposerBlockReason.guildSendDisabled =>
        PhosphorIconsFill.warningCircle,
      GuildComposerBlockReason.timedOut => PhosphorIconsFill.timer,
      GuildComposerBlockReason.unclaimedAccount =>
        PhosphorIconsFill.shieldWarning,
      GuildComposerBlockReason.unverifiedEmail =>
        PhosphorIconsFill.envelopeSimple,
      GuildComposerBlockReason.accountTooNew ||
      GuildComposerBlockReason.notMemberLongEnough => PhosphorIconsFill.clock,
    };
  }

  Widget? _buildAction(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildComposerBlockReason reason,
  ) {
    return switch (reason) {
      GuildComposerBlockReason.accountLimited =>
        ref.watch(
              instanceRuntimeConfigProvider.select(
                (config) => config.selfHosted,
              ),
            )
            ? null
            : FluxerButton.primary(
                label: l10n.messagingPausedTextDidNotGoThrough,
                size: FluxerButtonSize.compact,
                fitContent: true,
                onPressed: () => MessagingPausedHelpSheet.show(context),
              ),
      GuildComposerBlockReason.unclaimedAccount => FluxerButton.primary(
        label: l10n.claimAccount,
        size: FluxerButtonSize.compact,
        fitContent: true,
        onPressed: () => ClaimAccountSheet.show(context, ref),
      ),
      GuildComposerBlockReason.unverifiedEmail => FluxerButton.primary(
        label: l10n.channelComposerBarrierVerifyEmail,
        size: FluxerButtonSize.compact,
        fitContent: true,
        onPressed: () =>
            UserSettingsModal.show(context, openSecuritySection: true),
      ),
      GuildComposerBlockReason.guildSendDisabled ||
      GuildComposerBlockReason.timedOut ||
      GuildComposerBlockReason.accountTooNew ||
      GuildComposerBlockReason.notMemberLongEnough => null,
    };
  }
}
